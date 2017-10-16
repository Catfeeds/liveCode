<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Home\Controller;
use Common\Controller\CommonController;
/**
 * 支付宝控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用模块名
 * 
 */
class AlipaysController extends CommonController {
    /**
     * 初始化
     */
    private $aliPayConfig;
    public function _initialize() {
        if (!session('user_auth.uid')) {
            $this->error('请先登录', U('Home/User/login'));
        }
        $this->aliPayConfig = array();
        $m = D('Payments');
        $this->aliPayConfig = $m->getPayment("alipays");
    }
    
    /**
     * 生成支付代码
     */
    public function getAlipaysUrl(){
        $payObj       = I("payObj/s");
        $m            = D('order');
        $obj          = array();
        $data         = array();
        $orderAmount  = 0;
        $out_trade_no = "";
        $subject      = "";
        $data         = $m->checkOrderPay();

        if($data["status"]==1){
            //订单信息
            $obj["orderId"]     = I("orderId/d");
            $obj["userId"]      = (int)session('user_auth.uid');
            $order              = $m->getPayOrder($obj);
            $orderAmount        = $order["needPay"];
            $out_trade_no       = $order["orderNo"]."_".$obj["userId"];
            $extra_common_param = $payObj."@".$obj["userId"]."@0";
        }
        
        if($data["status"]==1){
            $return_url = U("home/alipays/response","",true,true);
            $notify_url = U("home/alipays/aliNotify","",true,true);
            $parameter = array(
                    'extra_common_param'=> $extra_common_param,
                    'service'           => 'create_direct_pay_by_user',
                    'partner'           => $this->aliPayConfig['parterID'],
                    '_input_charset'    => "utf-8",
                    'notify_url'        => $notify_url,
                    'return_url'        => $return_url,
                    /* 业务参数 */
                    'subject'           => '支付套餐费用'.$orderAmount.'元',
                    'body'              => '支付订单费用',
                    'out_trade_no'      => $out_trade_no,
                    'total_fee'         => $orderAmount,
                    'quantity'          => 1,
                    'payment_type'      => 1,
                    /* 物流参数 */
                    'logistics_type'    => 'EXPRESS',
                    'logistics_fee'     => 0,
                    'logistics_payment' => 'BUYER_PAY_AFTER_RECEIVE',
                    /* 买卖双方信息 */
                    'seller_email'      => $this->aliPayConfig['payAccount']
                    /* RSA签名 */
            );

            ksort($parameter);
            reset($parameter);
            $param = '';
            $sign  = '';
            foreach ($parameter AS $key => $val){
                $param .= "$key=" .urlencode($val). "&";
                $sign  .= "$key=$val&";
            }
            $param = substr($param, 0, -1);
            $sign  = substr($sign, 0, -1). $this->aliPayConfig['parterKey'];            
            $url = 'https://mapi.alipay.com/gateway.do?'.$param. '&sign='.md5($sign).'&sign_type=MD5';
            $data["url"] = $url;
        }

        $this->success('',$data['url']);
    }

    /**
     * 支付结果同步回调
     */
    function response(){
        $m = new M();
        $request = $_GET;
        unset($request['_URL_']);
        $payRes = self::notify($request);
        if($payRes['status']){
            $extras = explode("@",$_GET['extra_common_param']);
            if($extras[0]=="recharge"){//充值
                $this->redirect(url("home/logmoneys/shopmoneys"));
            }else{
                $this->redirect(url("home/orders/waitReceive"));
            }
            
        }else{
            $this->error('支付失败');
        }
    }
    
    /**
     * 支付结果异步回调
     */
    function aliNotify(){
        $m = new OM();
        $request = $_POST;
        $payRes = self::notify($request);
        if($payRes['status']){
            
            $extras = explode("@",$_POST['extra_common_param']);
            $rs = array();
            if($extras[0]=="recharge"){//充值
                $targetId = (int)$extras [1];
                $targetType = (int)$extras [2];
                $obj = array ();
                $obj["trade_no"] = $_POST['trade_no'];
                $obj["out_trade_no"] = $_POST["out_trade_no"];;
                $obj["targetId"] = $targetId;
                $obj["targetType"] = $targetType;
                $obj["total_fee"] = $_POST['total_fee'];
                $obj["payFrom"] = 'alipays';
                // 支付成功业务逻辑
                $m = new LM();
                $rs = $m->complateRecharge ( $obj );
            }else{
                //商户订单号
                $obj = array();
                $tradeNo = explode("_",$_POST['out_trade_no']);
                $obj["trade_no"] = $_POST['trade_no'];
                $obj["out_trade_no"] = $tradeNo[0];
                $obj["total_fee"] = $_POST['total_fee'];
                    
                $obj["userId"] = $extras[1];
                $obj["isBatch"] = $extras[2];
                $obj["payFrom"] = 'alipays';
                //支付成功业务逻辑
                $rs = $m->complatePay($obj);
            }
            
            if($rs["status"]==1){
                echo 'success';
            }else{
                echo 'fail';
            }
        }else{
            echo 'fail';
        }
    }
    
    /**
     * 支付回调接口
     */
    function notify($request){
        $returnRes = array('info'=>'','status'=>false);
        $request = $this->argSort($request);
        // 检查数字签名是否正确 
        $isSign = $this->getSignVeryfy($request);
        if (!$isSign){//签名验证失败
            $returnRes['info'] = '签名验证失败';
            return $returnRes;
        }
        if ($request['trade_status'] == 'TRADE_SUCCESS' || $request['trade_status'] == 'TRADE_FINISHED'){
            $returnRes['status'] = true;
        }
        return $returnRes;
    }
    
    /**
     * 获取返回时的签名验证结果
     */
    function getSignVeryfy($para_temp) {
        $parterKey = $this->aliPayConfig["parterKey"];
        //除去待签名参数数组中的空值和签名参数
        $para_filter = $this->paraFilter($para_temp);
        //对待签名参数数组排序
        $para_sort = $this->argSort($para_filter);
        //把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串
        $prestr = $this->createLinkstring($para_sort);
    
        $isSgin = false;
        $isSgin = $this->md5Verify($prestr, $para_temp['sign'], $parterKey);
        return $isSgin;
    }
    
    /**
     * 验证签名
     */
    function md5Verify($prestr, $sign, $key) {
        $prestr = $prestr . $key;
        $mysgin = md5($prestr);
        if($mysgin == $sign) {
            return true;
        }else {
            return false;
        }
    }
    
    /**
     * 把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串
     */
    function createLinkstring($para) {
        $arg  = "";
        while (list ($key, $val) = each ($para)) {
            $arg.=$key."=".$val."&";
        }
        //去掉最后一个&字符
        $arg = substr($arg,0,count($arg)-2);
        //如果存在转义字符，那么去掉转义
        if(get_magic_quotes_gpc()){$arg = stripslashes($arg);}
    
        return $arg;
    }
    
    /**
     * 除去数组中的空值和签名参数
     */
    function paraFilter($para) {
        $para_filter = array();
        while (list ($key, $val) = each ($para)) {
            if($key == "sign" || $key == "sign_type" || $val == "")continue;
            else    $para_filter[$key] = $para[$key];
        }
        return $para_filter;
    }
    
    /**
     * 对数组排序
     */
    function argSort($para) {
        ksort($para);
        reset($para);
        return $para;
    }

}

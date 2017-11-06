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
        $this->aliPayConfig = array();
        $m = D('Payments');
        $this->aliPayConfig = $m->getPayment("alipays");
    }
    
    /**
     * 生成支付代码
     */
    public function getAlipaysUrl(){
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
            $out_trade_no       = $order['orderNo'].'_'.$order['orderId'];
            $extra_common_param = $obj["orderId"]."@".$obj["userId"];
        }
        
        if($data["status"]==1){
            $return_url = U("Home/Alipays/response","",true,true);
            $notify_url = C('USER_DOMAIN').'/index.php/home/alipays/alinotify.html';    //注意，支付宝回调url不支持兼容模式！！！

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
        }

        $this->success('',$url);
    }

    /**
     * 支付结果同步回调
     */
    public function response(){
        $request = I('get.');
        unset($request['_URL_']);
        $payRes = self::notify($request);
        if($payRes['status']){
            redirect(U("Home/Order/paySuccess", null, true, true));
        }else{
            $this->error('支付失败');
        }
    }
    
    /**
     * 支付结果异步回调
     */
    public function aliNotify(){
        // $this->logResult('调试写文件');exit();

        $m = D('order');
        $request = $_POST;
        $payRes = self::notify($request);
        if($payRes['status']){
            $extras = explode("@",$_POST['extra_common_param']);
            $rs = array();
            $obj = array();
            $obj["userId"]  = $extras[1];
            $obj["orderId"] = $extras[0];
            $obj["payType"] = 0;
            $obj["tradeNo"] = $request['trade_no'];
            
            //支付成功业务逻辑
            $rs = $m->completePay($obj);
            
            if($rs){
                echo 'success';
            }else{
                echo 'fail';
            }
        }else{
            echo 'fail';
        }
    }
    // //调试用
    // public function logResult($word='') {
    //     $fp = fopen("log.txt","a");
    //     flock($fp, LOCK_EX) ;
    //     fwrite($fp,"执行日期：".strftime("%Y%m%d%H%M%S",time())."\n".$word."\n");
    //     flock($fp, LOCK_UN);
    //     fclose($fp);
    // }
    
    /**
     * 支付回调接口
     */
    public function notify($request){
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
    public function getSignVeryfy($para_temp) {
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
    public function md5Verify($prestr, $sign, $key) {
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
    public function createLinkstring($para) {
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
    public function paraFilter($para) {
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
    public function argSort($para) {
        ksort($para);
        reset($para);
        return $para;
    }

}

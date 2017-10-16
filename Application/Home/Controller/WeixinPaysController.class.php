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
 * 微信支付控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用模块名
 * 
 */
class WeixinPaysController extends CommonController {
    /**
     * 初始化
     */
    private $wxpayConfig;
    private $wxpay;
    public function _initialize() {
        if (!session('user_auth.uid')) {
            $this->error('请先登录', U('Home/User/login'));
        }
        header ("Content-type: text/html; charset=utf-8");
        Vendor('wxpay.WxPayConf');
        Vendor('wxpay.WxQrcodePay');
        
        $this->wxpayConfig = array();
        $m = D('payments');
        $this->wxpay = $m->getPayment("weixinpays");
        $this->wxpayConfig['appid'] = $this->wxpay['appId']; // 微信公众号身份的唯一标识
        $this->wxpayConfig['appsecret'] = $this->wxpay['appsecret']; // JSAPI接口中获取openid
        $this->wxpayConfig['mchid'] = $this->wxpay['mchId']; // 受理商ID
        $this->wxpayConfig['key'] = $this->wxpay['apiKey']; // 商户支付密钥Key
        $this->wxpayConfig['notifyurl'] = U("home/WeixinPays/wxNotify","",true,true);
        $this->wxpayConfig['curl_timeout'] = 30;
        $this->wxpayConfig['returnurl'] = "";
        // 初始化WxPayConf_pub
        $wxpaypubconfig = new \WxPayConf($this->wxpayConfig);
    }
    
    /**
     * 获取微信URL
     */
    public function getWeixinPaysURL(){
        $m      = D('order');
        $payObj = I("payObj/s");
        $pkey   = "";
        $data   = array();
        $userId = (int)session('user_auth.uid');

        $data = $m->checkOrderPay();
        if($data["status"]==1){
            $orderId = I('orderId/d');
            $pkey    = $payObj."@".$userId."@".$orderId."@2";
        }

        $url = U('Home/WeixinPays/createQrcode',array("pkey"=>base64_encode($pkey)));
        $this->success('',$url);
    }
    
    public function createQrcode() {
        $pkey         = base64_decode(I("pkey"));
        $pkeys        = explode("@", $pkey );
        $flag         = true;
        $needPay      = 0;
        $out_trade_no = 0;
        $trade_no     = 0;

        if(count($pkeys)!= 4){
            $this->assign('out_trade_no', "");
        }else{
            $userId         = (int)session('user_auth.uid');
            $obj            = array();
            $obj["userId"]  = $userId;
            $obj["orderId"] = $pkeys[2];
            $m              = D('order');
            $order          = $m->getPayOrder($obj);
            $needPay        = $order["needPay"];
            $body           = "支付订单费用";
            $out_trade_no   = $order['orderNo'].'_'.$order['orderId'];
            $trade_no       = $obj["orderNo"];
        }
        
        if($needPay>0){
            // 使用统一支付接口
            $wxQrcodePay = new \WxQrcodePay ();
            $wxQrcodePay->setParameter ( "body", $body ); // 商品描述
            
            $wxQrcodePay->setParameter ( "out_trade_no", $out_trade_no ); // 商户订单号
            $wxQrcodePay->setParameter ( "total_fee", $needPay * 100 ); // 总金额
            $wxQrcodePay->setParameter ( "notify_url", $this->wxpayConfig['notifyurl'] ); // 通知地址
            $wxQrcodePay->setParameter ( "trade_type", "NATIVE" ); // 交易类型
            $wxQrcodePay->setParameter ( "attach", "$pkey" ); // 附加数据
            $wxQrcodePay->SetParameter ( "input_charset", "UTF-8" );
            // 获取统一支付接口结果
            $wxQrcodePayResult = $wxQrcodePay->getResult ();
            $code_url = '';
            // 商户根据实际情况设置相应的处理流程
            if ($wxQrcodePayResult ["return_code"] == "FAIL") {
                // 商户自行增加处理流程
                echo "通信出错：" . $wxQrcodePayResult ['return_msg'] . "<br>";
            } elseif ($wxQrcodePayResult ["result_code"] == "FAIL") {
                // 商户自行增加处理流程
                echo "错误代码：" . $wxQrcodePayResult ['err_code'] . "<br>";
                echo "错误代码描述：" . $wxQrcodePayResult ['err_code_des'] . "<br>";
            } elseif ($wxQrcodePayResult ["code_url"] != NULL) {
                // 从统一支付接口获取到code_url
                $code_url = $wxQrcodePayResult ["code_url"];
                // 商户自行增加处理流程
            }
            $this->assign ( 'out_trade_no', $trade_no );
            $this->assign ( 'code_url', $code_url );
            $this->assign ( 'wxQrcodePayResult', $wxQrcodePayResult );
            $this->assign ( 'needPay', $needPay );
        }else{
            $flag = false;
        }
        
        if($flag){
            return $this->display('order/pay_step2');
        }else{
            return $this->fetch('order/pay_step3');
        }
    
    }
    
    
    /**
     * 检查支付结果
     */
    public function getPayStatus() {
        $trade_no = input('trade_no');
        $total_fee = cache( $trade_no );
        $data = array("status"=>-1);
        if($total_fee>0){
            cache( $trade_no, null );
            $data["status"] = 1;
        }else{// 检查缓存是否存在，存在说明支付成功
            $data["status"] = -1;
        }
        return $data;
    }
    
    /**
     * 微信异步通知
     */
    public function wxNotify() {
        // 使用通用通知接口
        $wxQrcodePay = new \WxQrcodePay ();
        // 存储微信的回调
        $xml = file_get_contents("php://input");
        $wxQrcodePay->saveData ( $xml );
        // 验证签名，并回应微信。
        if ($wxQrcodePay->checkSign () == FALSE) {
            $wxQrcodePay->setReturnParameter ( "return_code", "FAIL" ); // 返回状态码
            $wxQrcodePay->setReturnParameter ( "return_msg", "签名失败" ); // 返回信息
        } else {
            $wxQrcodePay->setReturnParameter ( "return_code", "SUCCESS" ); //设置返回码
        }
        $returnXml = $wxQrcodePay->returnXml ();
        if ($wxQrcodePay->checkSign () == TRUE) {
            if ($wxQrcodePay->data ["return_code"] == "FAIL") {
                echo "FAIL";
            } elseif ($wxQrcodePay->data ["result_code"] == "FAIL") {
                echo "FAIL";
            } else {
                // 此处应该更新一下订单状态，商户自行增删操作
                $order = $wxQrcodePay->getData ();
                $trade_no = $order["transaction_id"];
                $total_fee = $order ["total_fee"];
                $pkey = $order ["attach"] ;
                $pkeys = explode ( "@", $pkey );
                $out_trade_no = 0;
                if($pkeys[0]=="recharge"){//充值
                    $out_trade_no = $order["out_trade_no"];
                    $targetId = (int)$pkeys [1];
                    $targetType = (int)$pkeys [2];
                    $obj = array ();
                    $obj["trade_no"] = $trade_no;
                    $obj["out_trade_no"] = $out_trade_no;
                    $obj["targetId"] = $targetId;
                    $obj["targetType"] = $targetType;
                    $obj["total_fee"] = (float)$total_fee/100;
                    $obj["payFrom"] = 'weixinpays';
                    // 支付成功业务逻辑
                    $m = new LM();
                    $rs = $m->complateRecharge ( $obj );
                    
                }else{//订单支付
                    $userId = (int)$pkeys [1];
                    $out_trade_no = $pkeys[2];
                    $isBatch = (int)$pkeys[3];
                    // 商户订单
                    $obj = array ();
                    $obj["trade_no"] = $trade_no;
                    $obj["out_trade_no"] = $out_trade_no;
                    $obj["isBatch"] = $isBatch;
                    $obj["total_fee"] = (float)$total_fee/100;
                    $obj["userId"] = $userId;
                    $obj["payFrom"] = 'weixinpays';
                    // 支付成功业务逻辑
                    $m = new OM();
                    $rs = $m->complatePay ( $obj );
                }
                if($rs["status"]==1){
                    cache("$out_trade_no",$total_fee);
                    echo "SUCCESS";
                }else{
                    echo "FAIL";
                }
            }
        }else{
            echo "FAIL";
        }
    }

    /**
     * 检查支付结果
     */
    public function paySuccess() {
        return $this->fetch('order_pay_step3');
    }

}

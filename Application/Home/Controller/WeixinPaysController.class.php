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
        $this->wxpayConfig['notifyurl'] = C('USER_DOMAIN').'/index.php/home/weixin_pays/wxnotify.html';
        $this->wxpayConfig['curl_timeout'] = 30;
        $this->wxpayConfig['returnurl'] = "";
        // 初始化WxPayConf_pub
        $wxpaypubconfig = new \WxPayConf($this->wxpayConfig);

        $this->assign('meta_keywords', C('WEB_SITE_KEYWORD'));
        $this->assign('meta_description', C('WEB_SITE_DESCRIPTION'));
        $this->assign('_new_message', cookie('_new_message'));          // 获取用户未读消息数量
        $this->assign('_user_auth', session('user_auth'));              // 用户登录信息
        $this->assign('_user_nav_main', $_user_nav_main);               // 用户导航信息
        $this->assign('_user_center_side', C('USER_CENTER_SIDE'));      // 用户中心侧边
        $this->assign('_user_login_modal', C('USER_LOGIN_MODAL'));      // 用户登录弹窗
        $this->assign('_home_public_layout', C('HOME_PUBLIC_LAYOUT'));  // 页面公共继承模版
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
            $pkey    = $orderId."@".$userId;
        }

        $url = U('Home/WeixinPays/createQrcode',array("pkey"=>base64_encode($pkey)));
        $this->success('',$url);
    }
    
    /**
     * 生成支付二维码
     */
    public function createQrcode() {
        $pkey         = base64_decode(I("pkey"));
        $pkeys        = explode("@", $pkey );
        $flag         = true;
        $needPay      = 0;
        $out_trade_no = 0;
        $trade_no     = 0;
        if(count($pkeys)!= 2){
            $this->assign('out_trade_no', "");
        }else{
            $userId         = (int)session('user_auth.uid');
            $obj            = array();
            $obj["userId"]  = $userId;
            $obj["orderId"] = $pkeys[0];
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
            $wxQrcodePay->setParameter ( "total_fee", $needPay * 100); // 总金额
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
            $this->assign ( 'out_trade_no', $out_trade_no );
            $this->assign ( 'code_url', $code_url );
            $this->assign ( 'wxQrcodePayResult', $wxQrcodePayResult );
            $this->assign ( 'needPay', $needPay );
            // halt($out_trade_no);
        }else{
            $flag = false;
        }
        
        if($flag){
            $this->assign('meta_title','微信支付');
            return $this->display('order/wxpay');
        }else{
            $this->assign('meta_title','支付成功');
            $this->assign('jumpUrl',C('USER_DOAIM').'/admin.php?s=/admin/index/index');
            return $this->display('order/paySuccess');
        }
    
    }
    
    /**
     * 微信异步通知
     */
    public function wxNotify() {
        // $this->logResult('调试写文件');
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
                $out_trade_no = $order ["out_trade_no"];
                // 商户订单
                $obj = array ();
                $obj["orderId"] = $pkeys [0];
                $obj["userId"]  = $pkeys [1];
                $obj["payType"] = 1;
                $obj["tradeNo"] = $trade_no;
                $obj["out_trade_no"] = $out_trade_no;
                $obj["total_fee"] = (float)$total_fee/100;
                // 支付成功业务逻辑
                $m = D('order');
                $rs = $m->completePay($obj);

                if($rs){
                    $file = new \Common\Util\File();
                    $file->cache("$out_trade_no",$total_fee);
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
    public function getPayStatus() {
        $out_trade_no = I('out_trade_no/s');
        $file = new \Common\Util\File();
        $total_fee = $file->cache( $out_trade_no );
        $data = array("status"=>-1);
        
        if($total_fee>0){
            $file->cache( $out_trade_no, null );
            $data["status"] = 1;
        }else{// 检查缓存是否存在，存在说明支付成功
            $data["status"] = -1;
        }
        echo $data["status"];
    }

    //调试用
    public function logResult($word='') {
        $fp = fopen("log.txt","a");
        flock($fp, LOCK_EX) ;
        fwrite($fp,"执行日期：".strftime("%Y%m%d%H%M%S",time())."\n".$word."\n");
        flock($fp, LOCK_UN);
        fclose($fp);
    }
    

}

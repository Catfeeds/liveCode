<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Home\Model;
use Think\Model;

/**
 * 用户模型
 * 
 */
class PaymentsModel extends Model {
    /**
     * 数据库表名
     * 
     */
    protected $tableName = 'payments';
    /**
     * 自动验证规则
     * 
     */
    /**
     * 获取支付方式种类
     */
    public function getByGroup($fielterCode = ''){
        $payments = ['0'=>[],'1'=>[]];
        $rs = $this->where(['enabled'=>1])->order('payOrder asc')->select();
        foreach ($rs as $key =>$v){
            if($fielterCode==$v['payCode'])continue;
            if($v['payConfig']!='')$v['payConfig'] = json_decode($v['payConfig'], true);
            $payments[$v['isOnline']][] = $v;
        }
        return $payments;
    }

    
    /**
     * 获取支付信息
     */
    public function getPayment($payCode){
        $payment = $this->where("payCode='$payCode'")->find();
        $payConfig = json_decode($payment["payConfig"]) ;
        foreach ($payConfig as $key => $value) {
            $payment[$key] = $value;
        }
        // halt($payment);
        return $payment;
    }
    
    /**
     * 获取在线支付方式
     */
    public function getOnlinePayments(){
        //获取支付信息
        return $this->where(['isOnline'=>1,'enabled'=>1])->order('payOrder asc')->select();
    }
    /**
     * 判断某种支付是否开启
     */
    public function isEnablePayment($payCode){
        //获取支付信息
        return $this->where(['isOnline'=>1,'enabled'=>1,'payCode'=>$payCode])->Count();
    }

}

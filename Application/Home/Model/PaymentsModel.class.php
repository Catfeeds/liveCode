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
 * 支付模型
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

}

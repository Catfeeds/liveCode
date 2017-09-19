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
use Think\Verify;

/**
 * 用户模型
 * 
 */
class OrderModel extends Model {
    /**
     * 数据库表名
     * 
     */
    protected $tableName = 'orders';
    /**
     * 自动验证规则
     * 
     */
    protected $_validate = array(
        array('vip', 'require', '版本不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('year', 'require', '时长不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('money', 'require', '交易金额不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
    );
    /**
     * 自动完成规则
     * 
     */
    protected $_auto = array(
        array('orderNo', 'createOrderNo', self::MODEL_INSERT, 'function'),
        array('orderStatus', '-1', self::MODEL_INSERT),
        array('isNew', '1', self::MODEL_INSERT),
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
        array('status', '1', self::MODEL_INSERT),
    );


    /**
     * 获取版本号及价格
     * 
     */
    public function getVersions() {
        $versions = M('vip')->alias('v')->join('__VIP_PRICE__ p on v.id=p.vipId','left')->order('v.sort,p.price desc')->select();
// halt($versions);
        return $versions;
    }

    /**
     * 获取默认的版本号及价格
     * 
     */
    public function getRecommed() {
        $recommed = M('vip')->alias('v')->where(['v.is_recommed'=>1,'year'=>1])->join('__VIP_PRICE__ p on v.id=p.vipId','left')->find();
        return $recommed;
    }

    /**
     * 用户支付
     * 
     */
    public function pay($orderId,$payType) {
        $order = $this->where(['orderId'=>$orderId,'userId'=>session('user_auth.uid'),'orderStatus'=>-1,'status'=>1])->find();
        if (!$order) {
            $this->error = '无效订单！';
            return false;
        }
        $this->startTrans();
        $result = $this->where(['orderId'=>$orderId,'userId'=>session('user_auth.uid')])->save(['orderStatus'=>1,'tradeNo'=>'暂无','pay_time'=>time(),'payType'=>$payType]);
        if($result){
            $expire_time = time()+$order['year']*365*86400;
            $user_action = M('admin_user')->where(['id'=>session('user_auth.uid')])->save(['vipId'=>$order['vipId'],'expire_time'=>$expire_time]);
            if (!$user_action) {
                $this->rollback();
                $this->error = '支付失败！';return false;
            }
            // 提交事务
            $this->commit();
            return true;
        }else{
            $this->rollback();
            $this->error = '支付失败！';return false;
        }



            
        
        
    }
    

}

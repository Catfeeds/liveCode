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
        array('vip', 'require', '请选择版本', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
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
     * 获取套餐
     * 
     */
    public function getVips() {
        $vips = M('vip')->alias('v')->field('v.*')->join('__VIP_PRICE__ p on v.id=p.vipId','left')->where(['price'=>['neq',''],'is_show'=>1])->order('v.sort,p.price desc')->group('v.id')->select();
// halt($vips);
        return $vips;
    }

    /**
     * 获取续费套餐
     * 
     */
    public function getFeeVips() {
        //现在所使用的套餐
        $order = $this->where(['userId'=>session('user_auth.uid'),'orderStatus'=>1,'status'=>1])->order('pay_time desc')->find();
        if (!$order) {
            $this->error = '请先在购买后再进行续费操作！';return false;
        }
        $vip_mod = M('vip');
        $vip = $vip_mod->find($order['vipId']);
        //比现在使用套餐排序更高的套餐
        $vips = $vip_mod->alias('v')->field('v.*')->join('__VIP_PRICE__ p on v.id=p.vipId','left')->where(['price'=>['neq',''],'is_show'=>1,'sort'=>['gt',$vip['sort']]])->order('v.sort,p.price desc')->group('v.id')->select();
        if (!$vips) {
            $this->error = '您目前使用的套餐已经是最高级别！';return false;
        }
        //是否有推荐套餐,没有则把第一个设为默认推荐
        $have_recommed = 0;
        foreach ($vips as $k => $v) {
            if ($v['is_recommed'] == 1) {
                $have_recommed = 1;
            }
            if ($v['id'] == $order['vipId']) {
                $vips[$k]['BuyedYear'] = $order['year'];
            }
        }
        if ($have_recommed == 0) {
            foreach ($vips as $k => $v) {
                $vips[0]['is_recommed'] = 1;
            }
        }
// halt($vips);
        return $vips;
    }

    /**
     * 获取默认的套餐及价格
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
            $this->error = '无效订单！';return false;
        }
        $user = D('User')->find(session('user_auth.uid'));
        $isNew = $user['vipId'] ? 0:1;
        $this->startTrans();
        $result = $this->where(['orderId'=>$orderId,'userId'=>session('user_auth.uid')])->save(['orderStatus'=>1,'tradeNo'=>'暂无','pay_time'=>time(),'payType'=>$payType,'isNew'=>$isNew]);
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

<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Admin\Model;
use Think\Model;
/**
 * 快捷链接模型
 * 
 */
class LivecodeModel extends Model {
    /**
     * 数据库表名
     * 
     */
    protected $tableName = 'cms_livecode';

    /**
     * 自动验证规则
     * 
     */
    protected $_validate = array(
        array('title', 'require', '标题不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        // array('content', 'require', '内容不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        // array('huoma', 'require', '活码地址不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
    );

    /**
     * 自动完成规则
     * 
     */
    protected $_auto = array(
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
        array('update_time', 'time', self::MODEL_BOTH, 'function'),
       
    );
    /**
     * 判断用户当前套餐活码数量是否已达上限
     * 
     */
    public function userLivecodeCountLimit() {
        // 用户已创建的活码数量
        $uid = (int)session('user_auth.uid');
        $count1 = $this->where(['uid'=>$uid])->count();
        $count2 = D('Product')->where(['uid'=>$uid])->count();
        $count3 = D('Phone')->where(['uid'=>$uid])->count();
        $count4 = D('Duourl')->where(['uid'=>$uid])->count();
        $count = $count1+$count2+$count3+$count4;
        //限制数量
        $vip = D('User')->alias('u')->field('livecode_count')->join('__VIP__ v on u.vipId=v.id')->where('u.id='.$uid)->find();

        if ($count < $vip['livecode_count'] || $vip['livecode_count'] == 0) {
            return true;
        }else{
            return false;
        }
    }
    /**
     * 获取待审核活码数量
     */
    public function getIfCheckCount(){
        $count = $this->where(['status'=>0])->count();
        return $count;
    }
  
}

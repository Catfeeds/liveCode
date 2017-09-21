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
 * 用户模型
 * 
 */
class PayconfModel extends Model {
    /**
     * 数据库表名
     * 
     */
    protected $tableName = 'admin_banks';

    /**
     * 自动验证规则
     * 
     */
    protected $_validate = array(
        array('bank', 'require', '银行名称不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('userName', 'require', '开户名称不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('bankName', 'require', '开户银行不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('bankAccount', 'require', '银行卡号不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
    );

    /**
     * 自动完成规则
     * 
     */
    protected $_auto = array(
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
        array('status', '1', self::MODEL_INSERT),
    );

   
}

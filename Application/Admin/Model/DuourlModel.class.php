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
class DuourlModel extends Model {
    /**
     * 数据库表名
     * 
     */
    protected $tableName = 'cms_duourl';

    /**
     * 自动验证规则
     * 
     */
    protected $_validate = array(
        array('title', 'require', '跳转网址不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
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
   
  
}

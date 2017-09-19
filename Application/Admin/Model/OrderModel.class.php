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
        array('operator', 'require', '操作员不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('order_time', 'require', '日期不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('cover', 'require', '附件图片不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
      
    );

    /**
     * 自动完成规则
     * 
     */
    protected $_auto = array(
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
        array('update_time', 'time', self::MODEL_BOTH, 'function'),
         array('order_time', 'strtotime', self::MODEL_BOTH, 'function'),
    );
    
   public function get_sortlist ($map=array())
   {
   	$list=  $this->where($map)->group('operator')->getField('operator',true);
	$map['status']=1;
	$oklist=  $this->where($map)->group('operator')->getField('operator,count(id) as okcount');
	
	$map['status']=2;
	$errlist=  $this->where($map)->group('operator')->getField('operator,count(id) as errcount');
	$map['status']=0;
	$auditlist=  $this->where($map)->group('operator')->getField('operator,count(id) as auditcount');
	$newlist = array();
	foreach( $list as $k=>$v  )
	{
		$newlist[$k]['operator']=$v;
		$newlist[$k]['ok']=(int)$oklist[$v];
		$newlist[$k]['err']=(int)$errlist[$v];
		$newlist[$k]['audit']=(int)$auditlist[$v];
	}
	return ewarr_sort($newlist);
	
   }
   
}

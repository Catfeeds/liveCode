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
class EchartsModel extends Model {
    /**
     * 数据库表名
     * 
     */
    // protected $tableName = 'echarts_data';
    protected $tableName = 'users';


    /**
     * 获取数据统计
     */
    public function getEchartsData(){
        $start = date('Y-m-d 00:00:00',strtotime(I('startDate')));
        $end   = date('Y-m-d 23:59:59',strtotime(I('endDate')));

        $urs = $this->field('left(createTime,10) createTime,count(userId) userNum')
                // ->whereTime('createTime','between',[$start,$end])
                ->where(['dataFlag'=>1,'userType'=>0])
                ->order('createTime asc')
                ->group('left(createTime,10)')
                ->select();
        // halt($urs);

        $rdata = [];
        $days  = [];
        $tmp   = [];
        if(count($urs)>0){
            foreach($urs as $key => $v){
                if(!in_array($v['createTime'],$days))$days[] = $v['createTime'];
                $tmp["0_".$v['createTime']] = $v['userNum'];
            }
        }

        sort($days);
        foreach($days as $v){
            $rdata['u0'][] =  isset($tmp['0_'.$v])?$tmp['0_'.$v]:0;
        }
        $rdata['days'] = $days;
        return $rdata;
    }
   
}

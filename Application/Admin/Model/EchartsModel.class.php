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
 * 数据统计模型
 * 
 */
class EchartsModel extends Model {
    /**
     * 数据库表名
     * 
     */
    protected $tableName = 'echarts_data';

    /**
     * 获取数据统计
     */
    public function getEchartsData($id,$code,$startDate,$endDate){
        $start = date('Y-m-d 00:00:00',strtotime($startDate));
        $end   = date('Y-m-d 23:59:59',strtotime($endDate));
        $where = ['codeId'=>$id,'type'=>$code];
        if (!empty($endDate)) {
            $where['createTime'] = ['between',[$start,$end]];
        }

        $data = $this->field('left(createTime,10) createTime,count(codeId) codeNum')
                ->where($where)
                ->order('createTime asc')
                ->group('left(createTime,10)')
                ->select();

        $rdata = [];
        $days  = [];
        $tmp   = [];
        if(count($data)>0){
            foreach($data as $key => $v){
                if(!in_array($v['createTime'],$days))$days[] = $v['createTime'];
                $tmp["0_".$v['createTime']] = $v['codeNum'];
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

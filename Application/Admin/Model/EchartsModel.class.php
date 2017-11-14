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
     * 获取数据统计循环显示
     */
    public function getEchartsData($info){
        // halt($info);

        $where = [];
        //实时统计数据
        if ($info['tab'] == 'curr') {
            $where = 'createTime > DATE_SUB(NOW(),INTERVAL  1 HOUR)';
            $field = '*,count(ip) AS visitorCount';
            $group = 'ip';
            $order = 'createTime';
        }else{
            if ($info['time'] == 'yes') {   //昨天
                // $yes = date("Y-m-d",strtotime("-1 day"));   //2017-11-08
                $where = 'DATEDIFF(createTime,NOW())=-1';
                $field = 'DATE_FORMAT(createTime, "%H") AS hour,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                $group = 'hour';
                $order = '';
            }elseif ($info['time'] == 'week') { //最近一周
                $where = 'DATEDIFF(createTime,NOW())<7';
                $field = 'DATE_FORMAT(createTime, "%Y-%m-%d") AS date,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                $group = 'date';
                $order = 'date desc';
            }elseif ($info['time'] == 'month') { //最近30天
                $where = 'DATEDIFF(createTime,NOW())<30';
                $field = 'DATE_FORMAT(createTime, "%Y-%m-%d") AS date,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                $group = 'date';
                $order = 'date desc';
            }else{  //今天
                if ($info['tab'] == 'cli') {
                    $where = 'DATEDIFF(createTime,NOW())=0';
                    $field = 'DATE_FORMAT(createTime, "%H") AS hour,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'hour';
                    $order = '';
                }else{
                    $where = 'DATEDIFF(createTime,NOW())=0';
                    $field = 'DATE_FORMAT(createTime, "%H") AS hour,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'hour';
                    $order = '';
                }
            }
        }
        
        $start = date('Y-m-d 00:00:00',strtotime($info['stime']));
        $end   = date('Y-m-d 23:59:59',strtotime($info['etime']));
        if (!empty($info['etime'])) {
            $where = ['createTime'=>['between',[$start,$end]]];
            $field = 'DATE_FORMAT(createTime, "%Y-%m-%d") AS date,count(id) AS visitCount,count(distinct ip) AS visitorCount';
            $group = 'date';
            $order = 'date desc';
        }

        $data = $this->field($field)
                ->where(['codeId'=>$info['id'],'type'=>$info['code']])
                ->where($where)
                ->group($group)
                ->order($order)
                ->select();
        // halt($data);

        $info['total_count'] = $this->where(['codeId'=>$info['id'],'type'=>$info['code']])->where($where)->count();
        if ($data && $info['tab'] != 'curr') {
            foreach ($data as $key => $v) {
                $data[$key]['percentage'] = (int)($v['visitCount']/$info['total_count']*100).'%';
                if ($info['time'] == 'yes') {
                    for($i=23;$i>=0;$i--){
                        $data[$i]['datetime'] = date($i).':00';
                        if ($v['visitCount'] && $v['hour'] == $i) {
                            $data[$i]['visitCount'] = $v['visitCount'];
                            $data[$i]['visitorCount'] = $v['visitorCount'];
                            $data[$i]['percentage'] = $data[$key]['percentage'];
                            unset($data[$key]);
                        }
                    }
                }elseif ($info['time'] == 'week') {
                    for($i=6;$i>=0;$i--){
                        // $data[$i]['datetime'] = date('Y-m-d',mktime(0,0,0,date('m'),date('d')-$i+1,date('Y'))-1);
                        $data[$i]['datetime'] = date("Y-m-d",strtotime("-$i day"));
                    }
                }elseif ($info['time'] == 'month') {
                    for($i=29;$i>=0;$i--){
                        $data[$i]['datetime'] = date("Y-m-d",strtotime("-$i day"));
                    }
                }elseif (!empty($info['etime'])) {
                    $start = strtotime($info['stime']);
                    $end   = strtotime($info['etime']);
                    $i = 0;
                    while ($end>=$start){  
                        $data[$i]['datetime'] = date('Y-m-d',$end)."\n";  
                        $end = strtotime('-1 day',$end);  
                        $i++;
                    } 
                }else{
                    for($i=date('H');$i>=0;$i--){
                        $data[$i]['datetime'] = date($i).':00';
                        if ($v['visitCount'] && $v['hour'] == $i) {
                            $data[$i]['visitCount'] = $v['visitCount'];
                            $data[$i]['visitorCount'] = $v['visitorCount'];
                            $data[$i]['percentage'] = $data[$key]['percentage'];
                            unset($data[$key]);
                        }
                    }
                }
                
            }
            ksort($data);
        }
        return $data;
    }

    /**
     * 获取导出EXCEL数据
     */
    public function getOutEchartsData($info){
        $where = [];
        //实时统计数据
        if ($info['tab'] == 'curr') {
            $where = 'createTime > DATE_SUB(NOW(),INTERVAL  1 HOUR)';
            $field = '*,count(ip) AS visitorCount';
            $group = 'ip';
            $order = 'createTime';
        }else{
            //按日期统计
            if ($info['time'] == 'yes') {   //昨天
                // $yes = date("Y-m-d",strtotime("-1 day"));   //2017-11-08
                $where = 'DATEDIFF(createTime,NOW())=-1';
                $field = 'DATE_FORMAT(createTime, "%Y-%m-%d %H:00") AS hour,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                $group = 'hour';
                $order = '';
            }elseif ($info['time'] == 'week') { //最近一周
                $where = 'DATEDIFF(createTime,NOW())<7';
                $field = 'DATE_FORMAT(createTime, "%Y-%m-%d") AS date,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                $group = 'date';
                $order = 'date desc';
            }elseif ($info['time'] == 'month') { //最近30天
                $where = 'DATEDIFF(createTime,NOW())<30';
                $field = 'DATE_FORMAT(createTime, "%Y-%m-%d") AS date,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                $group = 'date';
                $order = 'date desc';
            }else{  //今天
                $where = 'DATEDIFF(createTime,NOW())=0';
                $field = 'DATE_FORMAT(createTime, "%Y-%m-%d %H:00") AS hour,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                $group = 'hour';
                $order = '';
            }
            $start = date('Y-m-d 00:00:00',strtotime($info['stime']));
            $end   = date('Y-m-d 23:59:59',strtotime($info['etime']));
            if (!empty($info['etime'])) {
                $where = ['createTime'=>['between',[$start,$end]]];
                $field = 'DATE_FORMAT(createTime, "%Y-%m-%d") AS date,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                $group = 'date';
                $order = 'date desc';
            }
        }

        $data = $this->field($field)
                ->where(['codeId'=>$info['id'],'type'=>$info['code']])
                ->where($where)
                ->group($group)
                ->order($order)
                ->select();

        $info['total_count'] = $this->where(['codeId'=>$info['id'],'type'=>$info['code']])->where($where)->count();
        if ($data && $info['tab'] != 'curr') {
            foreach ($data as $key => $v) {
                if ($info['time'] == 'yes') {
                    for($i=23;$i>=0;$i--){
                        $data[$i]['datetime'] = date("Y-m-d",strtotime("-1 day")).' '.$i.':00';
                        if ($v['visitCount'] && strtotime($v['hour']) == strtotime($data[$i]['datetime'])) {
                            $data[$i]['visitCount'] = $v['visitCount'];
                            $data[$i]['visitorCount'] = $v['visitorCount'];
                            unset($data[$key]);
                        }
                    }
                }elseif ($info['time'] == 'week') {
                    for($i=6;$i>=0;$i--){
                        // $data[$i]['datetime'] = date('Y-m-d',mktime(0,0,0,date('m'),date('d')-$i+1,date('Y'))-1);
                        $data[$i]['datetime'] = date("Y-m-d",strtotime("-$i day"));
                    }
                }elseif ($info['time'] == 'month') {
                    for($i=29;$i>=0;$i--){
                        $data[$i]['datetime'] = date("Y-m-d",strtotime("-$i day"));
                    }
                }elseif (!empty($info['etime'])) {
                    $start = strtotime($info['stime']);
                    $end   = strtotime($info['etime']);
                    $i = 0;
                    while ($end>=$start){  
                        $data[$i]['datetime'] = date('Y-m-d',$end)."\n";  
                        $end = strtotime('-1 day',$end);  
                        $i++;
                    } 
                }else{
                    for($i=date('H');$i>=0;$i--){
                        $data[$i]['datetime'] = date('Y-m-d '.$i).':00';
                        if ($v['visitCount'] && strtotime($v['hour']) == strtotime($data[$i]['datetime'])) {
                            $data[$i]['visitCount'] = $v['visitCount'];
                            $data[$i]['visitorCount'] = $v['visitorCount'];
                            unset($data[$key]);
                        }
                    }
                }
            }
            ksort($data);
        }
        return $data;
    }
   
}

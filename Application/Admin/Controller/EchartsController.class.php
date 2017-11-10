<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Common\Util\Think\Page;

/**
 * 数据统计控制器
 * 
 */
class EchartsController extends AdminController {
    /**
     * 导出EXCEL
     */
    public function outEchartsData(){
        $info = I('get.');
        $data = D('Echarts')->getOutEchartsData($info);

        $str = "时间,访问量,访客数\n";
        foreach( $data as $v){
        	$str .= $v['datetime'].",".$v['visitCount'].",".$v['visitorCount']."\n";
        }
        $str = iconv('utf-8','gb2312',$str);
        $filename = date('Ymd').'.csv';
        export_csv($filename,$str);
    }

    /**
     * 获取统计报表数据
     */
    public function getEchartsData(){
        $info = I('post.');

        $where = [];
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
            $where = 'DATEDIFF(createTime,NOW())=0';
            $field = 'DATE_FORMAT(createTime, "%H") AS hour,count(id) AS visitCount,count(distinct ip) AS visitorCount';
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

        $echarsMod = D('Echarts');
        $data = $echarsMod->field($field)
                ->where(['codeId'=>$info['id'],'type'=>$info['code']])
                ->where($where)
                ->group($group)
                ->order($order)
                ->select();
        $info['total_count'] = $echarsMod->where(['codeId'=>$info['id'],'type'=>$info['code']])->where($where)->count();

        if ($data) {
            foreach ($data as $key => $v) {
                if ($info['time'] == 'yes') {
                    for($i=23;$i>=0;$i--){
                        $data[$i]['datetime'] = date($i).':00';
                        if ($v['visitCount'] && $v['hour'] == $i) {
                            $data[$i]['visitCount'] = $v['visitCount'];
                            $data[$i]['visitorCount'] = $v['visitorCount'];
                            unset($data[$key]);
                        }
                    }
                }elseif ($info['time'] == 'week') {
                    for($i=6;$i>=0;$i--){
                        $data[$i]['datetime'] = date("m-d",strtotime("-$i day"));
                    }
                }elseif ($info['time'] == 'month') {
                    for($i=29;$i>=0;$i--){
                        $data[$i]['datetime'] = date("m-d",strtotime("-$i day"));
                    }
                }elseif (!empty($info['etime'])) {
                    $start = strtotime($info['stime']);
                    $end   = strtotime($info['etime']);
                    $i = 0;
                    while ($end>=$start){  
                        $data[$i]['datetime'] = date('m-d',$end)."\n";  
                        $end = strtotime('-1 day',$end);  
                        $i++;
                    } 
                }else{
                    for($i=date('H');$i>=0;$i--){
                        $data[$i]['datetime'] = date($i).':00';
                        if ($v['visitCount'] && $v['hour'] == $i) {
                            $data[$i]['visitCount'] = $v['visitCount'];
                            $data[$i]['visitorCount'] = $v['visitorCount'];
                            unset($data[$key]);
                        }
                    }
                }
            }
            ksort($data);
            if ($info['time'] == 'week' || $info['time'] == 'month' || !empty($info['etime'])) {
                $data = array_reverse($data);
            }
            $visitCount = $visitor = $datetime = [];
            $visitorCount = 0;
            foreach ($data as $key => $v) {
                $visitCount[] = (int)$v['visitCount'];
                $visitor[] = (int)$v['visitorCount'];
                $visitorCount += (int)$v['visitorCount'];
                $datetime[] = $v['datetime'];

            }
        }
// halt($info);

        $data = [
            'series'=>[
                ['name'=>"总访问量:".$info['total_count'],'data'=>$visitCount],
                ['name'=>"总访客数:".$visitorCount,'data'=>$visitor],
            ],
            'xAxis'=>['categories'=>$datetime]
        ];


        echo json_encode(['status'=>1,'data'=>$data]);

    }


}

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

        if ($info['tab'] == 'curr') {
            $str = "来源,ip地址,线路,系统,客户端类型,访问时间,访问次数\n";
            foreach( $data as $v){
                $str .= $v['region'].",".$v['ip'].",".$v['isp'].",".$v['os'].",".$v['browser'].",".$v['createTime'].",".$v['visitorCount']."\n";
            }
        }else{
            $str = "时间,访问量,访客数\n";
            foreach( $data as $v){
                $str .= $v['datetime'].",".$v['visitCount'].",".$v['visitorCount']."\n";
            }
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
        //实时统计数据
        if ($info['tab'] == 'curr') {
            $where = 'createTime > DATE_SUB(NOW(),INTERVAL  1 HOUR)';
            $field = '*,DATE_FORMAT(createTime, "%i") AS hour,count(id) AS visitCount,count(ip) AS visitorCount';
            $group = 'ip';
            $order = 'createTime';
        }else{
            if ($info['time'] == 'yes') {   //昨天
                $where = 'DATEDIFF(createTime,NOW())=-1';
                if ($info['tab'] == 'cli') {    
                    //客户端类型
                    $field = 'browser,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'browser';
                    $order = 'createTime desc';
                }elseif ($info['tab'] == 'sys') {
                    //系统环境
                    $field = 'os,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'os';
                    $order = 'createTime desc';
                }elseif ($info['tab'] == 'net') {
                    //网络线路
                    $field = 'isp,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'isp';
                    $order = 'createTime desc';
                }else{
                    $field = 'DATE_FORMAT(createTime, "%H") AS hour,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'hour';
                    $order = '';
                }
            }elseif ($info['time'] == 'week') { //最近一周
                $where = 'DATEDIFF(createTime,NOW())<7';
                if ($info['tab'] == 'cli') {    
                    //客户端类型
                    $field = 'browser,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'browser';
                    $order = 'createTime desc';
                }elseif ($info['tab'] == 'sys') {
                    //系统环境
                    $field = 'os,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'os';
                    $order = 'createTime desc';
                }elseif ($info['tab'] == 'net') {
                    //网络线路
                    $field = 'isp,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'isp';
                    $order = 'createTime desc';
                }else{
                    $field = 'DATE_FORMAT(createTime, "%Y-%m-%d") AS date,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'date';
                    $order = 'date desc';
                }
            }elseif ($info['time'] == 'month') { //最近30天
                $where = 'DATEDIFF(createTime,NOW())<30';
                if ($info['tab'] == 'cli') {    
                    //客户端类型
                    $field = 'browser,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'browser';
                    $order = 'createTime desc';
                }elseif ($info['tab'] == 'sys') {
                    //系统环境
                    $field = 'os,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'os';
                    $order = 'createTime desc';
                }elseif ($info['tab'] == 'net') {
                    //网络线路
                    $field = 'isp,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'isp';
                    $order = 'createTime desc';
                }else{
                    $field = 'DATE_FORMAT(createTime, "%Y-%m-%d") AS date,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'date';
                    $order = 'date desc';
                }
            }else{  //今天
                $where = 'DATEDIFF(createTime,NOW())=0';
                if ($info['tab'] == 'cli') {    
                    //客户端类型
                    $field = 'browser,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'browser';
                    $order = 'createTime desc';
                }elseif ($info['tab'] == 'sys') {
                    //系统环境
                    $field = 'os,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'os';
                    $order = 'createTime desc';
                }elseif ($info['tab'] == 'net') {
                    //网络线路
                    $field = 'isp,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'isp';
                    $order = 'createTime desc';
                }else{
                    $field = 'DATE_FORMAT(createTime, "%H") AS hour,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'hour';
                    $order = '';
                }
            }
            $start = date('Y-m-d 00:00:00',strtotime($info['stime']));
            $end   = date('Y-m-d 23:59:59',strtotime($info['etime']));
            if (!empty($info['etime'])) {
                $where = ['createTime'=>['between',[$start,$end]]];
                if ($info['tab'] == 'cli') {
                    //客户端类型
                    $field = 'browser,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'browser';
                    $order = 'createTime desc';
                }elseif ($info['tab'] == 'sys') {
                    //系统环境
                    $field = 'os,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'os';
                    $order = 'createTime desc';
                }elseif ($info['tab'] == 'net') {
                    //网络线路
                    $field = 'isp,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'isp';
                    $order = 'createTime desc';
                }else{
                    $field = 'DATE_FORMAT(createTime, "%Y-%m-%d") AS date,count(id) AS visitCount,count(distinct ip) AS visitorCount';
                    $group = 'date';
                    $order = 'date desc';
                }
            }
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
                if ($info['tab'] == 'curr') {
                    for($i=time()-3600;$i<time();$i=$i+60){
                        $minute = substr(date("i",$i), -1);
                        if ($minute == '0' || $minute == '5') {
                            $data[$i]['datetime'] = date("H:i",$i);
                            if ($data[$i]['datetime'] && $v['hour']>=date("i",$i) && $v['hour']<date("i",$i)+5) {
                                $data[$i]['visitCount'] = $v['visitCount'];
                                $data[$i]['visitorCount'] = $v['visitorCount'];
                                unset($data[$key]);
                            }
                        }
                    }
                }elseif ($info['tab'] == 'cli') {
                    $data[$key]['datetime'] = $v['browser'];
                }elseif ($info['tab'] == 'sys') {
                    $data[$key]['datetime'] = $v['os'];
                }elseif ($info['tab'] == 'net') {
                    $data[$key]['datetime'] = $v['isp'];
                }else{
                    //按日期统计
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
                
            }
            ksort($data);
            if ($info['tab'] == '') {
                if ($info['time'] == 'week' || $info['time'] == 'month' || !empty($info['etime'])) {
                    $data = array_reverse($data);
                }
            }
            $visitCount = $visitor = $categories = [];
            $visitorCount = 0;
            foreach ($data as $key => $v) {
                $visitCount[] = (int)$v['visitCount'];
                $visitor[] = (int)$v['visitorCount'];
                $visitorCount += (int)$v['visitorCount'];
                $categories[] = $v['datetime'];
            }
        }
// halt($data);

        $tabalName = getTableName($info['tab']);
        $data = [
            'series'=>[
                ['name'=>"总访问量:".$info['total_count'],'data'=>$visitCount],
                ['name'=>"总访客数:".$visitorCount,'data'=>$visitor],
            ],
            'xAxis'=>['categories'=>$categories],
            'tabalName'=>$tabalName,
        ];


        echo json_encode(['status'=>1,'data'=>$data]);

    }


}

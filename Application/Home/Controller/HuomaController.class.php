<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// |
// +----------------------------------------------------------------------
namespace Home\Controller;
use Think\Controller;
/**
 * 前台默认控制器
 */
class HuomaController extends HomeController{
    /**
     * 默认活码跳转
     */
     public function index(){
        $d = I('d/s');
        if (!$d){
             $this -> error('参数错误');
        }
        $obj = M('cms_phone');
        $type = $obj -> where(array('d' => $d)) -> getField('type');
        $videourl = $obj -> where(array('d' => $d)) -> getField('0,id,title,videourl,huoma');
        $title = $obj -> where(array('d' => $d)) -> getField('videourl');
        if ($type == 2 && $videourl){
            //视频活码跳转
            $obj->where(array('d' => $d)) ->setInc('count', 1);
            M('echarts_data')->add(['codeId'=>$videourl[0]['id'],'createTime'=>date('Y-m-d'),'type'=>1]);
            //$huoma = $obj -> where(array('d' => $d)) -> getField('huoma');
            $videoTitle = '{"mediaTitle": "'.$videourl[0]['title'].'"}';
            $this->assign('title',$videourl[0]['title']);
            $this->assign('videoTitle',$videoTitle);
            $this->assign('vdurl',$videourl[0]['videourl']);
            $this->assign('hmurl',$videourl[0]['huoma']);
            $this->display();
        }elseif ($type == 1 && $title){
            //网址活码跳转
            $obj->where(array('d' => $d)) ->setInc('count', 1);
            M('echarts_data')->add(['codeId'=>$videourl[0]['id'],'createTime'=>date('Y-m-d'),'type'=>2]);
            redirect($title);
        }else{
            $this -> error('参数错误');
        }
    }
    /**
     * 多网址跳转
     */
    public function duo (){
        $d = I('d/s');
        if (!$d){
            $this -> error('参数错误');
        }
        $obj = M('cms_duourl');
        $rs = $obj -> where(array('d' => $d)) -> find();
        if ($rs){
            $urlarr = get_duourl_titlearr($rs['title']);
            
            if (!is_array($urlarr)){
                $this -> error('参数错误');
            }
            switch ($rs['tztype']){
             case 2:
                 $tzurl = $this -> orderjump($urlarr, $rs);
                 break;
             case 3:
                 $timearr = get_duourl_tztimearr($rs['tztime']);
                 $tzurl = $this -> timejump($urlarr, $timearr);
                 break;
             default:
                 $tzurl = $this -> randjump($urlarr);
                 break;
            }
            if ($tzurl){
                $obj->where(array('d' => $d)) ->setInc('count', 1);
                M('echarts_data')->add(['codeId'=>$rs['id'],'createTime'=>date('Y-m-d'),'type'=>3]);
                redirect($tzurl);
            }else{
                $this -> error('参数错误');
            }
         }else{
            $this -> error('参数错误');
         }
    }
 // shunxu
public function orderjump ($urlarr, $info)
{
     $cachename = $info['id'] . $info['d'];
     $tznum = (int)F($cachename);
     $allurlnum = count($urlarr);
     if ($tznum >= $allurlnum)
    {
         $tznum = 0;
         }
     F($cachename, $tznum + 1);
     return $urlarr[$tznum];
     }
 // shijian
public function timejump ($urlarr, $timearr)
{
     if (is_array($timearr))
        {
	    $today=date("Y-m-d"); 
	    $tznum=0;    
        foreach( $timearr as $k=>$v  )
        {
        	$tztime=strtotime($today.$v);
        	if ( NOW_TIME<=$tztime )
        	{
        		$tznum=$k;
        		break;
        	}
        }
        return $urlarr[$tznum];
         }
         
     }
 // suiji
public function randjump ($urlarr)
{
     return $urlarr[array_rand($urlarr)];
     }
}

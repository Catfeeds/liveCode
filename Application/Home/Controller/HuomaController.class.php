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
     * 默认方法
     */
     public function index(){
        
         $d = I('d');
         if (!$d)
        {
             $this -> error('参数错误');
             }
         $obj = M('cms_phone');
         $title = $obj -> where(array('d' => $d)) -> getField('title');
         if ($title)
        {
             redirect($title);
             }else{
             $this -> error('参数错误');
             }
         }
    
     public function duo ()
    {
         $d = I('d');
         if (!$d)
        {
             $this -> error('参数错误');
             }
         $obj = M('cms_duourl');
         $rs = $obj -> where(array('d' => $d)) -> find();
         
         if ($rs)
        {
             $urlarr = get_duourl_titlearr($rs['title']);
            
             if (!is_array($urlarr))
                {
                 $this -> error('参数错误');
                 }
             switch ($rs['tztype'])
            {
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
             if ($tzurl)
            {
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

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
 * 
 */
class IndexController extends HomeController {
    /**
     * 默认方法
     * 
     */
    public function index() {
	  
        $this->assign('meta_title', "首页");
       
        $this->display('');       
       
    }

    public function dcphone ()
    {
    	 if (IS_POST) {
	    	 $num=(int)I('num');
	    	 if ( !$num )
	    	 {
	    	 	$this->error('请输入导出数量');
	    	 }
	    	  $diqu=I('diqu');
	    	 $filename=date("Ymd").'phone.txt';    
    	        $phonetxt=$this->getphonelist($num,$diqu);  
    	       
    	       $phonetxt=implode(PHP_EOL,$phonetxt);
    	       //file_put_contents($txtname,$phonetxt);
    	         
header("Content-Type: application/force-download");
header("Content-Disposition: attachment; filename=".basename($filename));
echo $phonetxt;
 unset($phonetxt);
    	        }
    }
    public function getphonelist ($num=0,$diqu=1)
    {
	    if ( $num )
	    {
	    	$user_object = M('cms_phone');
    	            $where['status']=0;
    	            $phonelist=$user_object->where($where)->getField('title',true);
    	           
    	       //$filename=NOW_TIME.rand(10000,99999).'.txt'; 
    	      
    	       //$txtname=getcwd().'/Uploads/txt/'. $filename;
    	       shuffle($phonelist);
    	       $phonetxt=array_slice($phonelist,1,$num);
    	       unset($phonelist);
    	       $data['status']=1;
    	       if ( $diqu==2 )
    	       {
    	       	$diquqz="+86";
    	       }
    	      foreach( $phonetxt as $v  )
    	      {
	    	      $phonetxt2[]=$diquqz.$v;
    	      	 $where['title']=$v;
    	      	 $user_object->where($where)->save($data);
    	      }
    	      unset($phonetxt);
	    }
    	
    	    return $phonetxt2;
    }

       public function api ()
    {
    	
	    	 $num=(int)I('num');
	    	 $diqu=(int)I('diqu');
	    	 if ( $num )
	    	 {
    	        $phonetxt=$this->getphonelist($num,$diqu);  
    	       $phonetxt=implode(PHP_EOL,$phonetxt);
	    	 }
			echo $phonetxt;
    	     unset($phonetxt);
    }
}

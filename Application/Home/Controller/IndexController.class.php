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
        //用户登录检测
        $uid = is_login();
        if ($uid) {
            return $uid;
        } else {
            if (IS_AJAX) {
                $return['status']  = 0;
                $return['info']    = '请先登录系统';
                $return['login'] = 1;
                $this->ajaxReturn($return);
            } else {
                redirect(U('Home/User/login', null, true, true));
            }
        }

   //    die();
	  // $d=I('d');
	  // if ( !$d )
	  // {
	  // 	$this->error('参数错误');
	  // }
   //     $obj=M('cms_phone');
   //     $title=$obj->where(array('d'=>$d))->getField('title');
   //     if ( $title )
   //     {
   //      redirect($title);
   //     }else{
	  //      $this->error('参数错误');
   //     }
    }

  
}

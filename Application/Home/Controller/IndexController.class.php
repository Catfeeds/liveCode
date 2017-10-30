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
        $get = I('get.');
        if ($get['uid'] && $get['sessionId']) {     //管理员登录用户账号
            $mod = D('User');
            $user_info = $mod->where(['id'=>$get['uid'],'password'=>$get['sessionId']])->find();
            // 设置登录状态
            $uid = $mod->auto_login($user_info);
            if ($uid) {
                $this->success('登录成功！', '/admin.php?s=/admin/index/index');
            } else {
                $this->error('登录失败');
            }

        }else{
            //用户登录检测
            $uid = is_login();

            if ($uid) {
                $user = D('Admin/User')->getUserInfo($uid);
                if ($user['vipId'] == 0) {
                    redirect(U('Home/Order/buy', null, true, true));
                }else{
                    redirect('/admin.php?s=/admin/index/index');
                }
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
        }
        
    }

  
}

<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Home\Controller;
use Common\Controller\CommonController;
/**
 * 前台用户控制器
 * 
 */
class UserController extends CommonController {
    /**
     * 初始化方法
     * 
     */
    protected function _initialize() {
        // halt(C('TOGGLE_WEB_SITE')); 
        // 系统开关
        if (!C('TOGGLE_WEB_SITE')) {
            $this->error('站点已经关闭，请稍后访问~');
        }

        // 获取所有模块配置的用户导航
        $mod_con['status'] = 1;
        $_user_nav_main = array();
        $_user_nav_list = D('Admin/Module')->where($mod_con)->getField('user_nav', true);
        foreach ($_user_nav_list as $key => $val) {
            if ($val) {
                $val = json_decode($val, true);
                if ($val['main']) {
                    $_user_nav_main = array_merge($_user_nav_main, $val['main']);
                }
            }
        }

        // 监听行为扩展
        \Think\Hook::listen('corethink_behavior');

        $this->assign('meta_keywords', C('WEB_SITE_KEYWORD'));
        $this->assign('meta_description', C('WEB_SITE_DESCRIPTION'));
        $this->assign('_new_message', cookie('_new_message'));          // 获取用户未读消息数量
        $this->assign('_user_auth', session('user_auth'));              // 用户登录信息
        $this->assign('_user_nav_main', $_user_nav_main);               // 用户导航信息
        $this->assign('_user_center_side', C('USER_CENTER_SIDE'));      // 用户中心侧边
        $this->assign('_user_login_modal', C('USER_LOGIN_MODAL'));      // 用户登录弹窗
        $this->assign('_home_public_layout', C('HOME_PUBLIC_LAYOUT'));  // 页面公共继承模版
    }

    public function login() {
        if (IS_POST) {
            $username = I('username/s');
            $password = I('password/s');
            // 验证用户名密码是否正确
            $user_object = D('Home/User');
            $user_info = $user_object->login($username, $password);
            
            if (!$user_info) {
                $this->error($user_object->getError());
            }

            // 设置登录状态
            $uid = $user_object->auto_login($user_info);
            if ($uid) {
                $this->success('登录成功！', U('../admin.php/Admin/Index/index'));
            } else {
                $this->logout();
            }
        } else {
            $this->assign('meta_title', '用户登录');
            $this->display();
        }
    }



    /**
     * 用户登录检测
     * 
     */
    protected function is_login() {
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
                redirect(U('User/User/login', null, true, true));
            }
        }
    }

    
}

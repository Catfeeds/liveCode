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
use Think\Verify;
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
        // // 系统开关
        // if (!C('TOGGLE_WEB_SITE')) {
        //     $this->error('站点已经关闭，请稍后访问~');
        // }

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

    /**
     * 图片验证码生成，登录 && 注册 && 找回密码
     * 
     */
    public function verify($vid = 1) {
        $verify = new Verify();
        $verify->length = 4;
        $verify->entry($vid);
    }
    /**
     * 用户前台登录
     * 
     */
    public function login() {
        if (IS_POST) {
            $username = I('username/s');
            $password = I('password/s');
            // 验证用户名密码是否正确
            $mod = D('Home/User');
            $user_info = $mod->login($username, $password);
            
            if (!$user_info) {
                $this->error($mod->getError());
            }

            // 设置登录状态
            $uid = $mod->auto_login($user_info);
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
     * 用户找回密码
     * 
     */
    public function updatePass() {
        if (IS_POST) {
            $email          = I('email/s');
            $emailVerify    = I('emailVerify/s');
            $password       = I('password/s');
            $rePassword     = I('rePassword/s');
            $picVerify      = I('picVerify/s');
            // halt($email);

            // 修改密码
            $mod = D('Home/User');
            $res = $mod->updatePass($email, $emailVerify,$password,$rePassword,$picVerify);
            
            if (!$res) {
                $this->error($mod->getError());
            }

            // 设置登录状态
            $uid = $mod->auto_login($user_info);
            if ($uid) {
                $this->success('登录成功！', U('../admin.php/Admin/Index/index'));
            } else {
                $this->logout();
            }
        } else {
            $this->assign('meta_title', '找回密码');
            $this->display();
        }
    }

    /**
     * 发送验证邮件/绑定邮箱
     */
    public function getEmailVerify(){
        $n = D('Home/Notice');
        $email = I('post.email/s');
        //判断邮箱是否已注册
        $mod = D('Home/User');
        $mod->getUserInfoByParam($email);

        $code   = rand(0,999999);
        $status = $n->email($email)->send('updatePassContent',[$code]);
        if($status){
            // 绑定的邮箱
            session('email.val',$email);
            // 验证码
            session("email.key", $code);
            // 发起绑定邮箱的时间;
            session('email.time',time());
            $this->success('发送成功！');
        }else{
        }
    }

    
}

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
     * 初始化
     * 
     */
    protected function _initialize() {
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
        //用户登录检测
        $loginUid = is_login();
        if ($loginUid) {
            redirect('/admin.php?s=/admin/index/index');
        }
        if (IS_POST) {
            $username = I('username/s');
            $password = I('password/s');
            // 验证用户名密码是否正确
            $mod = D('User');
            $user_info = $mod->login($username, $password);
            if (!$user_info) {
                $this->error($mod->getError());
            }

            // 设置登录状态
            $uid = $mod->auto_login($user_info);
            if ($uid) {
                if ($user_info['vipId']==0) {
                    $this->success('登录成功！', U('Home/Order/buy'));
                }else{
                    $this->success('登录成功！', '/admin.php?s=/admin/index/index');
                }
            } else {
                $this->error('登录失败');
            }
        } else {
            $mod = D('Order');
            // 获取套餐
            $vips = $mod->getVips();
            foreach ($vips as $k=>$v) {
                $vips[$k]['detail'] = json_decode($v['detail'],true);
            }
            // 获取套餐价格
            $versions = M('vip_price')->order('year')->select();
            // 获取默认的套餐及价格
            $recommed = $mod->getRecommed();
            $recommed['detail'] = json_decode($recommed['detail'],true);

            $this->assign([
                'meta_title'    => '用户登录',
                'vips'          => $vips,
                'versions'      => $versions,
                'recommed'      => $recommed,
            ]);
            $this->display();
        }
    }

    /**
     * 用户前台注册
     * 
     */
    public function regist() {
        if (IS_POST) {
            // 注册验证
            $mod = D('User');
            $res = $mod->regist();

            if ($res != false) {
                $this->success('注册成功', U('Home/User/login'));
            }
            $this->error($mod->getError());
        } else {
            $this->assign('meta_title', '用户注册');
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

            // 修改密码
            $mod = D('User');
            $res = $mod->updatePass($email, $emailVerify,$password,$rePassword,$picVerify);
            if ($res !== false) {
                $this->success('操作成功', U('Home/User/login'));
            }
            $this->error($mod->getError());
        } else {
            $this->assign('meta_title', '找回密码');
            $this->display();
        }
    }

    /**
     * 发送验证邮件/绑定邮箱
     */
    public function getEmailVerify(){
        $n     = D('Notice');
        $email = I('post.email/s');
        $type  = I('post.type/s');
        //判断邮箱是否已注册
        $mod = D('User');
        $ifRegist = $mod->getUserInfoByParam($email);
        if ($type == 'regist') {
            //注册
            if (!$ifRegist) {
                $code   = rand(0,999999);
                $status = $n->email($email)->send('REGIST_CONTENT',[$code]);
                if($status){
                    // 绑定的邮箱
                    session('email.val',$email);
                    // 验证码
                    session("email.key", $code);
                    // 发起绑定邮箱的时间;
                    session('email.time',time());
                    $this->success('邮件发送成功，请注意查收！');
                }else{
                    $this->error('发送失败，请稍后再试');
                }
            }else{
                $this->error('邮箱已注册');
            }
        }else{
            //忘记密码
            if ($ifRegist) {
                $code   = rand(0,999999);
                $status = $n->email($email)->send('UPDATEPASS_CONTENT',[$code]);
                // halt()
                if($status){
                    // 绑定的邮箱
                    session('email.val',$email);
                    // 验证码
                    session("email.key", $code);
                    // 发起绑定邮箱的时间;
                    session('email.time',time());
                    $this->success('邮件发送成功，请注意查收！');
                }else{
                    $this->error('发送失败，请稍后再试');
                }
            }else{
                $this->error('邮箱尚未注册');
            }
        }
        
    }

    
}

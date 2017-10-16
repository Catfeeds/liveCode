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
class OrderController extends CommonController {
    /**
     * 初始化
     * 
     */
    protected function _initialize() {
        // 系统开关
        if (!C('TOGGLE_WEB_SITE')) {
            $this->error('站点已经关闭，请稍后访问~');
        }
        if (!session('user_auth.uid')) {
            $this->error('请先登录', U('Home/User/login'));
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
     * 用户下单
     * 
     */
    public function buy() {
        if (IS_POST) {
            $vip        = I('post.vip/s');
            $year       = I('post.year/d');
            $payMoney   = I('post.money/f');

            $mod = D('Home/Order');
            if (!$mod->create()) {
                $this->error($mod->getError());
            }else{
                $mod->userId   = session('user_auth.uid');
                $mod->vipId    = M('vip')->where(['name'=>$vip])->getField('id');
                if (!$mod->vipId) {
                    $this->error('版本不存在');
                }
                $mod->year     = $year;
                $mod->payMoney = $payMoney;
                $result = $mod->add();
                if (!$result) {
                    $this->error('提交失败');
                }
                $this->success('订单提交成功！', U('Home/Order/pay',['orderId'=>$result]));
            }

        } else {
            $mod = D('Home/Order');
            // 获取套餐
            $vips = $mod->getVips();
            // 获取套餐价格
            $versions = M('vip_price')->order('year')->select();
            // 获取默认的套餐及价格
            $recommed = $mod->getRecommed();
            // halt($vips);

            $this->assign([
                'meta_title'    => '版本购买',
                'vips'          => $vips,
                'versions'      => $versions,
                'recommed'      => $recommed,
            ]);
            $this->display();
        }
    }

    /**
     * 用户续费
     * 
     */
    public function fee() {
        if (IS_POST) {
            $vip        = I('post.vip/s');
            $year       = I('post.year/d');
            $payMoney   = I('post.money/f');

            $mod = D('Home/Order');
            if (!$mod->create()) {
                $this->error($mod->getError());
            }else{
                $mod->userId   = session('user_auth.uid');
                $mod->vipId    = M('vip')->where(['name'=>$vip])->getField('id');
                if (!$mod->vipId) {
                    $this->error('版本不存在');
                }
                $mod->year     = $year;
                $mod->payMoney = $payMoney;

                $result = $mod->add();
                if (!$result) {
                    $this->error('提交失败');
                }
                $this->success('订单提交成功！', U('Home/Order/pay',['orderId'=>$result]));
            }

        } else {
            $mod = D('Home/Order');
            // 获取套餐(比现有套餐排序更高的套餐)
            $vips = $mod->getFeeVips();
            if (!$vips) {
                $this->error($mod->getError());
            }
            // 获取套餐价格
            $versions = M('vip_price')->order('year')->select();
            // 获取默认的套餐及价格
            $recommed = $mod->getRecommed();

            $this->assign([
                'meta_title'    => '版本续费',
                'vips'          => $vips,
                'versions'      => $versions,
                'recommed'      => $recommed,
            ]);
            $this->display();
        }
    }

    /**
     * 用户支付
     * 
     */
    public function pay() {
        if (IS_POST) {
            halt(I());
            //支付操作
            $orderId = I('post.orderId/d');
            $payType = I('post.payType/d');
            $mod = D('Home/Order');
            $result = $mod->pay($orderId,$payType);
            if ($result) {
                $this->success('支付成功！', '/admin.php?s=/admin/index/index');
            }else{
                $this->error($mod->getError());
            }
            
        } else {
            $mod = D('Home/Order');
            $orderId = I('get.orderId/d');
            $order = $mod->where(['orderId'=>$orderId,'userId'=>session('user_auth.uid'),'orderStatus'=>-1,'status'=>1])->find();
            if (!$order) {
                $this->error('订单不存在');
            }
            if ($order['orderStatus'] == 1) {
                $this->success('订单已支付成功','/admin.php?s=/admin/index/index');
            }
            // halt($order);
            $vip = M('vip')->getFieldById($order['vipId'],'name');
            //汇款账号
            $banks = M('admin_banks')->where(['status'=>1])->order('create_time desc')->select();
            $this->assign([
                'meta_title'    => '订单支付',
                'vip'           => $vip,
                'order'         => $order,
                'banks'         => $banks,
            ]);
            $this->display();
        }
    }

    
}

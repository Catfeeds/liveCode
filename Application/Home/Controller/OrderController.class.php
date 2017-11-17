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
 * 订单控制器
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

            $mod = D('Order');
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
            //判断用户是否是初次购买
            $user = D('Admin/User')->getUserInfo(session('user_auth.uid'));
            if ($user['vipId'] != 0) {
                $this->error('请在续费管理中进行套餐购买');
            }
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

            $mod = D('Order');
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
            $mod = D('Order');
            $vpMod = M('vip_price');
            //现在所使用的套餐
            $order = $mod->where(['userId'=>session('user_auth.uid'),'orderStatus'=>1,'status'=>1])->order('pay_time desc')->find();
            if (!$order) {
                $this->error('请先在购买成功后再进行续费操作！');
            }
            $usedDays     = ceil((time()-$order['pay_time'])/86400);    //已使用时间
            $pricePerYear = $vpMod->where(['vipId'=>$order['vipId'],'year'=>$order['year']])->getField('price');
            $pricePerDay  = $pricePerYear/365;
            $expenditure  = ceil($usedDays*$pricePerDay);               //已花费的套餐费用
            if ($expenditure <=0) {
                $order['sale'] = 0;
            }else{
                $order['sale'] = $order['payMoney'] - $expenditure;          //可用于抵扣的金额
            }

            // 获取续费套餐
            $vips = $mod->getFeeVips($order);
            foreach ($vips as $k=>$v) {
                $vips[$k]['detail'] = json_decode($v['detail'],true);
            }
            // 获取续费套餐价格
            $versions = $vpMod->order('year')->select();
            // 获取默认的套餐及价格
            $recommed = $mod->getRecommed();
            $recommed['detail'] = json_decode($recommed['detail'],true);

            $this->assign([
                'meta_title'    => '版本续费',
                'order'         => $order,
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
    /**
     * 支付成功页
     * 
     */
    public function paySuccess() {
        $this->assign('meta_title','支付成功');
        $this->assign('jumpUrl',C('USER_DOAIM').'/admin.php?s=/admin/index/index');
        $this->display();
    }
    
}

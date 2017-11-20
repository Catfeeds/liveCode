<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Admin\Controller;
/**
 * 后台默认控制器
 * 
 */
class IndexController extends AdminController {
    /**
     * 默认方法
     * 
     */
    public function index(){
        if (C('ADMIN_TABS')) {
            // 获取所有模块信息及后台菜单
            $menu_list = D('Admin/Module')->getAllMenu();
            $this->assign('_menu_list', $menu_list);  // 后台左侧菜单

            // 获取快捷链接
            $link_list = D('Admin/Link')->getAll();
            $this->assign('_link_list', $link_list);  // 后台快捷链接
        }
        $user_type = session('user_auth.user_type');
        if ($user_type == 2) {
            $uid = (int)session('user_auth.uid');
            $user = D('user')->getUserInfo($uid);
            if ($user['vipId'] != 0) {
                $vip = M('vip')->field('limit_count,zone_size')->where(['id'=>$user['vipId']])->find();
                $user['limit_count']   = $vip['limit_count'] == 0 ? '无限制':$vip['limit_count'].'次';
                $user['zone_size']     = $vip['zone_size'] == 0 ? '无限制':$vip['zone_size'].'M';
                $user['countPercent'] = ceil($user['visitCount']/$user['limit_count']*100);
                // 已使用空间容量
                $user['zoneSize'] = getUserZoneSize($uid);
                $user['zoneSizePercent'] = ceil($user['zoneSize']/$user['zone_size']*100);
            }else{
                $user['limit_count'] = $user['zone_size'] = $user['countPercent'] = 0;
            }
            $this->assign('user', $user);
        }

        $this->assign('meta_title', "首页");
        $this->assign('user_type', $user_type);
        $this->display();
    }

    /**
     * 删除缓存
     * 
     */
    public function removeRuntime() {
        $file = new \Common\Util\File();
        $result = $file->del_dir(RUNTIME_PATH);
        if ($result) {
            $this->success("缓存清理成功");
        } else {
            $this->error("缓存清理失败");
        }
    }
}

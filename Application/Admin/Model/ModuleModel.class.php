<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Admin\Model;
use Think\Model;
use Think\Storage;
use Common\Util\Tree;
/**
 * 功能模块模型
 * 
 */
class ModuleModel extends Model {
    /**
     * 数据库表名
     * 
     */
    protected $tableName = 'admin_module';

    /**
     * 自动验证规则
     * 
     */
    protected $_validate = array(
        array('name', 'require', '模块名称不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('name', '', '该模块已存在', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
        array('title', 'require', '模块标题不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('description', 'require', '模块描述不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('developer', 'require', '模块开发者不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('version', 'require', '模块版本不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('admin_menu', 'require', '模块菜单节点不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
    );

    /**
     * 自动完成规则
     * 
     */
    protected $_auto = array(
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
        array('update_time', 'time', self::MODEL_BOTH, 'function'),
        array('sort', '0', self::MODEL_INSERT),
        array('status', '1', self::MODEL_INSERT),
    );

    /**
     * 安装描述文件名
     * 
     */
    public function install_file() {
        return 'opencmf.php';
    }

    /**
     * 获取模块菜单
     * 
     */
    public function getAdminMenu() {
        // 获取模块左侧导航
        $_side_menu_list = M('admin_menu')->field('id,pid,title,icon,url')->where(['user_type'=>['in',[0,session('user_auth.user_type')]],'user_id'=>['in',[0,session('user_auth.uid')]],'status'=>1])->order('create_time')->select();
        // 转换成树结构
        $tree = new tree();
        return $tree->list_to_tree($_side_menu_list);
    }

    /**
     * 获取模块当前菜单
     * 
     */
    public function getCurrentMenu() {
        $current_url = MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
        $result = M('admin_menu')->where(['url'=>$current_url])->find();
        return $result;
    }

    /**
     * 获取所有模块菜单
     * @param string $addon_dir
     * 
     */
    public function getAllMenu() {
        $menu_list = S('MENU_LIST');
        if (!$menu_list) {
            $con['status'] = 1;
            $system_module_list = $this->where($con)->order('sort asc, id asc')->select();
            $tree = new tree();
            $menu_list = array();
            foreach ($system_module_list as $key => &$module) {
                $temp = $tree->list_to_tree(json_decode($module['admin_menu'], true));
                $menu_list[$module['name']] = $temp[0];
                $menu_list[$module['name']]['id']   = $module['id'];
                $menu_list[$module['name']]['name'] = $module['name'];
            }

            // 如果模块顶级菜单配置了top字段则移动菜单至top所指的模块下边
            foreach ($menu_list as $key => &$value) {
                if ($value['top']) {
                    if ($menu_list[$value['top']]) {
                        $menu_list[$value['top']]['_child'] = array_merge(
                            $menu_list[$value['top']]['_child'],
                            $value['_child']
                        );
                        unset($menu_list[$key]);
                    }
                }
            }

            S('MENU_LIST', $menu_list, 3600);  // 缓存配置
        }
        return $menu_list;
    }

    /**
     * 根据菜单ID的获取其所有父级菜单
     * @param array $current_menu 当前菜单信息
     * @return array 父级菜单集合
     * 
     */
    public function getParentMenu($current_menu ='') {
        if (!$current_menu) {
            $current_menu = $this->getCurrentMenu();
        }
        if (!$current_menu) {
            return false;
        }
            // halt($current_menu); 

        $admin_menu = M('admin_menu')->where(['user_type'=>['in',[0,session('user_auth.user_type')]],'user_id'=>['in',[0,session('user_auth.uid')]]])->select();
        $pid   = $current_menu['pid'];
        $temp  = array();
        $result[] = $current_menu;
        while (true) {
            foreach ($admin_menu as $key => $val){
                if ($val['id'] == $pid) {
                    $pid = $val['pid'];
                    array_unshift($result, $val);  // 将父菜单插入到第一个元素前
                }
            }
            if ($pid == '0') {
                break;
            }
        }
        return $result;
    }

    /**
     * 获取模块列表
     * @param string $addon_dir
     * 
     */
    public function getAll() {
        // 获取除了Common等系统模块外的用户模块
        // 文件夹下必须有$install_file定义的安装描述文件
        $dirs = array_map('basename', glob(APP_PATH.'*', GLOB_ONLYDIR));
        foreach ($dirs as $dir) {
            $config_file = realpath(APP_PATH.$dir).'/'.$this->install_file();
            if (Storage::has($config_file)) {
                $module_dir_list[] = $dir;
                $temp_arr = include $config_file;
                $temp_arr['info']['status'] = -1; //未安装
                $module_list[$temp_arr['info']['name']] = $temp_arr['info'];
            }
        }

        // 获取系统已经安装的模块信息
        $installed_module_list = $this->field(true)
                                      ->order('sort asc,id asc')
                                      ->select();
        if ($installed_module_list) {
            foreach ($installed_module_list as &$module) {
                $new_module_list[$module['name']] = $module;
                $new_module_list[$module['name']]['admin_menu'] = json_decode($module['admin_menu'], true);
            }
            // 系统已经安装的模块信息与文件夹下模块信息合并
            $module_list = array_merge($module_list, $new_module_list);
        }

        foreach ($module_list as &$val) {
            switch($val['status']){
                case '-2':  // 损坏
                    $val['status_icon'] = '<span class="text-danger">损坏</span>';
                    $val['right_button']  = '<a class="label label-danger ajax-get" href="'.U('setStatus', array('status' => 'delete', 'ids' => $val['id'])).'">删除记录</a>';
                    break;
                case '-1':  // 未安装
                    $val['status_icon'] = '<i class="fa fa-download text-success"></i>';
                    $val['right_button']  = '<a class="label label-success" href="'.U('install_before', array('name' => $val['name'])).'">安装</a>';
                    break;
                case '0':  // 禁用
                    $val['status_icon'] = '<i class="fa fa-ban text-danger"></i>';
                    $val['right_button'] .= '<a class="label label-info ajax-get" href="'.U('updateInfo', array('id' => $val['id'])).'">更新菜单</a> ';
                    $val['right_button'] .= '<a class="label label-success ajax-get" href="'.U('setStatus', array('status' => 'resume', 'ids' => $val['id'])).'">启用</a> ';
                    $val['right_button'] .= '<a class="label label-danger ajax-get" href="'.U('uninstall_before', array('id' => $val['id'])).'">卸载</a> ';
                    break;
                case '1':  // 正常
                    $val['status_icon'] = '<i class="fa fa-check text-success"></i>';
                    $val['right_button'] .= '<a class="label label-info ajax-get" href="'.U('updateInfo?id='.$val['id']).'">更新菜单</a> ';
                    if (!$val['is_system']) {
                        $val['right_button'] .= '<a class="label label-warning ajax-get" href="'.U('setStatus', array('status' => 'forbid', 'ids' => $val['id'])).'">禁用</a> ';
                        $val['right_button'] .= '<a class="label label-danger" href="'.U('uninstall_before', array('id' => $val['id'])).'">卸载</a> ';
                    }
                    break;
            }
        }
        return $module_list;
    }
}

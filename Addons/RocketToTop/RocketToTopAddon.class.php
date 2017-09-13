<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Addons\RocketToTop;
use Common\Controller\Addon;
/**
 * 小火箭返回顶部
 * @jry <598821125@qq.com>
 */
class RocketToTopAddon extends Addon{
    /**
     * 插件信息
     * 
     */
    public $info = array(
        'name'        => 'RocketToTop',
        'title'       => '小火箭返回顶部',
        'description' => '小火箭返回顶部',
        'status'      => '1',
        'author'      => 'OpenCMF',
        'version'     => '1.2.0',
    );

    /**
     * 插件安装方法
     * 
     */
    public function install(){
        return true;
    }

    /**
     * 插件卸载方法
     * 
     */
    public function uninstall(){
        return true;
    }

    /**
     * 实现的PageFooter钩子方法
     * 
     */
    public function PageFooter($param){
        $addons_config = $this->getConfig();
        if($addons_config['status']){
            $this->display('rocket');
        }
    }
}

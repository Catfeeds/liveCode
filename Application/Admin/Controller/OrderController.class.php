<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Common\Util\Think\Page;
/**
 * 系统配置控制器
 * 
 */
class OrderController extends AdminController {
    /**
     * 配置列表
     * @param $tab 配置分组ID
     * 
     */
    public function index($group = 1) {
        // 获取所有配置
        $map['status'] = array('egt', '0');  // 禁用和正常状态
        $map['group']  = array('eq', $group);
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $config_object = D('Config');
        $data_list = $config_object
                   ->page($p, C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('sort asc,id asc')
                   ->select();
        $page = new Page(
            $config_object->where($map)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 设置Tab导航数据列表
        $config_group_list = C('CONFIG_GROUP_LIST');  // 获取配置分组
        foreach ($config_group_list as $key => $val) {
            $tab_list[$key]['title'] = $val;
            $tab_list[$key]['href']  = U('index', array('group' => $key));
        }

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('订单中心')  // 设置页面标题
                ->setTabNav($tab_list, $group)  // 设置页面Tab导航
                ->addTableColumn('id', '订单编号')
                ->addTableColumn('title', '订购时间')
                ->addTableColumn('title', '套餐名称')
                ->addTableColumn('sort', '下单用户')
                ->addTableColumn('sort', '费用(元)')
                ->addTableColumn('sort', '类型')
                ->addTableColumn('sort', '状态')
                ->addTableColumn('sort', '支付信息')
                ->setTableDataList($data_list)     // 数据列表
                ->setTableDataPage($page->show())  // 数据列表分页
                ->display();
    }

    
}

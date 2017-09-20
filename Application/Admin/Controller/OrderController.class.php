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
     * 订单中心
     * 
     */
    public function index($orderStatus = 0) {
        $map = ['o.status'=>1];
        if (!$orderStatus) {
            $map['o.orderStatus'] = ['in',[-1,1]];
        }else{
            $map['o.orderStatus'] = $orderStatus;
        }
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $mod = D('Order');
        $data_list = $mod->alias('o')->field('o.*,u.username,v.name')
                   ->where($map)
                   ->join('__ADMIN_USER__ u on u.id = o.userId','left')
                   ->join('__VIP__ v on v.id = o.vipId','left')
                   ->page($p, C('ADMIN_PAGE_ROWS'))
                   ->order('create_time desc')
                   ->select();
        if (!empty($data_list)) {
            foreach ($data_list as $key => $v) {
                $data_list[$key]['name']   = $v['name'].'-'.$v['year'].'年';
                $data_list[$key]['isNew']  = ($v['isNew']==1)?'新开':'续费';
                $data_list[$key]['orderStatus']  = ($v['orderStatus']==1)?'完成':'<font color="red">待支付</font>';
                $data_list[$key]['payInfo'] = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.payType($v['payType']).'<br>'.$v['tradeNo'];
            }
        }

        $page = new Page(
            $mod->where($map)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 设置Tab导航数据列表
        $order_tabs = [0=>'全部订单',-1=>'待支付',1=>'已支付'];  // 获取配置分组
        foreach ($order_tabs as $key => $val) {
            $tab_list[$key]['title'] = $val;
            $tab_list[$key]['href']  = U('index', array('orderStatus' => $key));
        }

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('订单中心')  // 设置页面标题
                ->setTabNav($tab_list, $orderStatus)  // 设置页面Tab导航
                ->addTableColumn('orderNo', '订单编号')
                ->addTableColumn('pay_time', '订购时间','time')
                ->addTableColumn('name', '套餐名称')
                ->addTableColumn('username', '下单用户')
                ->addTableColumn('payMoney', '费用(元)')
                ->addTableColumn('isNew', '类型')
                ->addTableColumn('orderStatus', '状态')
                ->addTableColumn('payInfo', '支付信息')
                ->setTableDataList($data_list)     // 数据列表
                ->setTableDataPage($page->show())  // 数据列表分页
                ->display();
    }

    
}

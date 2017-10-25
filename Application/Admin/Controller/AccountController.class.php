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
 * 用户控制器
 * 
 */
class AccountController extends AdminController {

    /**
     * 密码修改
     * 
     */
    public function editpass() {
        if (IS_POST) {
            $data = I('post.');
            $mod = D('Account');
            $result = $mod->editpass($data);

            if ($result !== false) {
                $this->success('更新成功');
            } else {
                $this->error($mod->getError());
            }

        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('密码修改')  // 设置页面标题
                    ->setPostUrl(U('editpass'))    // 设置表单提交地址
                    ->addFormItem('password', 'password', '原始密码', '请输入原始密码')
                    ->addFormItem('password1', 'password', '新密码', '请输入新密码')
                    ->addFormItem('password2', 'password', '确认密码', '请输入确认密码')
                    ->setFormData()
                    ->display();
        }
    }
    /**
     * 域名管理
     * 
     */
    public function domain() {
        $mod = D('user');
        $data['uid'] = session('user_auth.uid');
        $info = $mod->where(['id'=>$data['uid'],'status'=>1])->find();
        if (IS_POST) {
            //判断用户状态是否正常 && 套餐是否过期
            $this->ifExpired();
            $data['url'] = I('post.url/s');
            if (empty($data['url'])) {
                $this->error('请输入活码域名！');
            }
            if ($info) {
                if ($info['url_status'] == 1 && $data['url'] == $info['url']) {
                    $this->success('域名已通过审核');
                }
                if ($info['url_status'] == -1 && $data['url'] == $info['url']) {
                    $this->error('新添加的域名不能和未通过审核的域名一样');
                }

                $url_status = $info['ifCheck'] == -1 ? 1:0;
                $res = $mod->where(['id'=>$data['uid']])->save(['url'=>$data['url'],'url_status'=>$url_status]);
                if ($res !== false) {
                    $this->success('操作成功');
                } else {
                    $this->error('操作失败');
                }
            }else{
                $this->error('用户不存在或被禁用');
            }
        } else {
            $this->meta_title = '域名管理';
            $this->assign('info',$info);
            $this->display();
        }
    }

    /**
     * 订单中心
     * 
     */
    public function order($orderStatus = 0) {
        $map = ['o.status'=>1,'userId'=>session('user_auth.uid')];
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
                $data_list[$key]['create_time'] = date('Y-m-d H:i',$v['create_time']);
                $data_list[$key]['payInfo'] = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.payType($v['payType']).'<br>'.$v['tradeNo'];
            }
        }

        $page = new Page(
            $mod->alias('o')->where($map)->join('__ADMIN_USER__ u on u.id = o.userId','left')->join('__VIP__ v on v.id = o.vipId','left')->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 设置Tab导航数据列表
        $order_tabs = [0=>'全部订单',-1=>'待支付',1=>'已支付'];  // 获取配置分组
        foreach ($order_tabs as $key => $val) {
            $tab_list[$key]['title'] = $val;
            $tab_list[$key]['href']  = U('order', array('orderStatus' => $key));
        }

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('订单中心')  // 设置页面标题
                ->setTabNav($tab_list, $orderStatus)  // 设置页面Tab导航
                ->addTableColumn('orderNo', '订单编号')
                ->addTableColumn('create_time', '订购时间')
                ->addTableColumn('name', '套餐名称')
                ->addTableColumn('username', '下单用户')
                ->addTableColumn('payMoney', '费用(元)')
                ->addTableColumn('isNew', '类型')
                ->addTableColumn('orderStatus', '状态')
                ->addTableColumn('payInfo', '支付信息')//
                ->setTableDataList($data_list)     // 数据列表
                ->setTableDataPage($page->show())  // 数据列表分页
                ->display();
    }

    /**
     * 续费管理
     * 
     */
    public function fee($orderStatus = 0) {
        $map = ['o.orderStatus'=>1,'o.status'=>1,'o.userId'=>session('user_auth.uid')];
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
                $data_list[$key]['expire_time']   = $v['year']*365*86400+$v['pay_time'];
            }
        }
// halt($data_list);
        $page = new Page(
            $mod->alias('o')->where($map)->join('__ADMIN_USER__ u on u.id = o.userId','left')->join('__VIP__ v on v.id = o.vipId','left')->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $attr['name']  = 'fee';
        $attr['title'] = '续费';
        $attr['class'] = 'label label-success';
        $attr['href']  = '/index.php?s=/home/order/fee';
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('续费管理')  // 设置页面标题
                ->addTableColumn('username', '用户名称')
                ->addTableColumn('pay_time', '订购时间','time')
                ->addTableColumn('name', '套餐名称')
                ->addTableColumn('expire_time', '有效期至','time')
                // ->addTableColumn('isNew', '状态','status')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)     // 数据列表
                ->setTableDataPage($page->show())  // 数据列表分页
                ->addRightButton('self',$attr)           // 添加编辑按钮
                ->display();
    }


}

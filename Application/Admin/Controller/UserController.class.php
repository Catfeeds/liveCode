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
class UserController extends AdminController {
    /**
     * 用户列表
     * 
     */
    public function index() {
        // 搜索
        $keyword   = I('keyword', '', 'string');
        $condition = array('like','%'.$keyword.'%');
        $map['u.id|username'] = array($condition, $condition, '_multi'=>true);

        // 获取所有用户
        $map['u.status'] = array('egt', '0'); // 禁用和正常状态
        $map['u.user_type'] = 2;

        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $mod = D('User');
        $data_list = $mod->alias('u')->field('u.*,v.name')->join('__VIP__ v on u.vipId = v.id','left')
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('u.id desc')
                   ->select();
        foreach ($data_list as $k => $v) {
            $data_list[$k]['expire_time'] = $v['expire_time'] ? date('Y-m-d H:i',$v['expire_time']) :'暂未订购';
            $data_list[$k]['name'] = $v['vipId'] ? '<font color="green">'.$v['name'].'用户</font>' :'普通用户';
            if (!empty($v['url'])) {
                $data_list[$k]['url_status'] = domainStatus($v['url_status']);
            }else{
                $data_list[$k]['url_status'] = '';
            }
        }
        $page = new Page(
            $mod->alias('u')->join('__VIP__ v on u.vipId = v.id','left')->where($map)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $attr['name']  = 'fee';
        $attr['title'] = '续费';
        $attr['class'] = 'label label-info';
        $attr['href']  = U('fee',['id'=>'__data_id__']);
        $attr2['name']  = 'fee';
        $attr2['title'] = '后台管理';
        $attr2['class'] = 'label label-info';
        $attr2['href']  = U('adminManage',['id'=>'__data_id__']);
        $attr3['name']  = 'fee';
        $attr3['title'] = '域名管理';
        $attr3['class'] = 'label label-info';
        $attr3['href']  = U('domain',['id'=>'__data_id__']);
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('用户列表') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('resume')  // 添加启用按钮
                ->addTopButton('forbid')  // 添加禁用按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->setSearch('请输入ID/用户名', U('index'))
                ->addTableColumn('id', 'UID')
                ->addTableColumn('username', '用户名')
                ->addTableColumn('create_time', '注册时间', 'time')
                ->addTableColumn('name', '用户类型')
                ->addTableColumn('expire_time', '有效期至')
                ->addTableColumn('status', '状态', 'status')
                ->addTableColumn('url', '活码域名')
                ->addTableColumn('url_status', '域名状态')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表
                ->setTableDataPage($page->show()) // 数据列表分页
                ->addRightButton('edit')          // 添加编辑按钮
                ->addRightButton('forbid')        // 添加禁用/启用按钮
                ->addRightButton('delete')        // 添加删除按钮
                ->addRightButton('self',$attr)
                ->addRightButton('self',$attr2)
                ->addRightButton('self',$attr3)
                ->display();
    }

    /**
     * 新增用户
     * 
     */
    public function add() {
        if (IS_POST) {
            $user_object = D('User');
            $data = $user_object->create();
            if ($data) {
                $data['user_type'] = 2;
                $id = $user_object->add($data);
                if ($id) {
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('新增用户') //设置页面标题
                    ->setPostUrl(U('add'))    //设置表单提交地址
                    ->addFormItem('reg_type', 'hidden', '注册方式', '注册方式')
                    ->addFormItem('username', 'text', '用户名', '用户名')
                    ->addFormItem('password', 'password', '密码', '密码')
                    ->setFormData(array('reg_type' => 'admin'))
                    ->display();
        }
    }

    /**
     * 编辑用户
     * 
     */
    public function edit($id) {
        if (IS_POST) {
            // 密码为空表示不修改密码
            if ($_POST['password'] === '') {
                unset($_POST['password']);
            }

            // 提交数据
            $user_object = D('User');
            $data = $user_object->create();
           
            if ($data) {
                $result = $user_object
                        ->field('id,username,password,email,mobile,update_time,vipId')
                        ->save($data);
                if ($result) {
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败');
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {
            // 获取账号信息
            $info = D('User')->where(['id'=>$id,'user_type'=>2])->find();
            if (!$info) {
                $this->error('用户不存在');
            }
            unset($info['password']);

            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('编辑用户')  // 设置页面标题
                    ->setPostUrl(U('edit'))    // 设置表单提交地址
                    ->addFormItem('id', 'hidden', 'ID', 'ID')
                    ->addFormItem('username', 'text', '用户名')
                    ->addFormItem('password', 'password', '密码')
                    ->setFormData($info)
                    ->display();
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus($model = CONTROLLER_NAME){
        $ids = I('request.ids');
        if (is_array($ids)) {
            if(in_array('1', $ids)) {
                $this->error('超级管理员不允许操作');
            }
        } else {
            if($ids === '1') {
                $this->error('超级管理员不允许操作');
            }
        }
        parent::setStatus($model);
    }

    /**
     * 续费
     * 
     */
    public function fee($id) {
        $mod = D('User');
        $info = $mod->where(['id'=>$id,'status'=>1,'user_type'=>2])->find();
        if (!$info) {
            $this->error('用户不存在或被禁用！');
        }
        if (IS_POST) {
            $post = I('post.');
            if ($post['vip'] == '') {
                $this->error('请选择套餐');
            }
            //找到对应的套餐明细
            $vip_price = M('vip_price')->find($post['vip']);

            $data['orderNo'] = createOrderNo();
            $data['userId'] = $id;
            $data['orderStatus'] = 1;
            $data['vipId'] = $vip_price['vipId'];
            $data['year'] = $vip_price['year'];
            $data['isNew'] = $info['vipId'] ? 0:1;
            $data['payType'] = 2;
            $data['payMoney'] = $vip_price['price'];
            $data['create_time'] = time();
            $data['pay_time'] = time();
            //创建订单
            $result = M('orders')->add($data);
            if ($result) {
                $expire_time = time()+$data['year']*365*86400;
                //修改用户数据
                $res = $mod->where(['status'=>1,'id'=>$id])->save(['vipId'=>$data['vipId'],'expire_time'=>$expire_time]);
                if ($res) {
                    $this->success('操作成功', U('index'));
                }
            }
            $this->error('操作失败');

        } else {
            //账号的套餐信息
            $order = M('orders')->alias('o')->field('o.orderId,o.year,v.id AS vipId')
                    ->join('__VIP__ v on o.vipId = v.id')
                    ->where(['o.userId'=>$id,'o.orderStatus'=>1])
                    ->order('pay_time desc')
                    ->find();
            if ($order) {
                $vip = M('vip_price')->where(['vipId'=>$order['vipId'],'year'=>$order['year']])->find();
            }
            //所有套餐
            $allVersions = M('vip_price')->alias('p')->field('p.*,v.name')
                        ->join('__VIP__ v on p.vipId = v.id')
                        ->where(['v.is_show'=>1])
                        ->select();
            // halt($vip);
            $this->assign(['vip'=>$vip,'allVersions'=>$allVersions,'id'=>$id,'meta_title'=>'续费']);
            $this->display();
        }
    }

    /**
     * 后台管理
     * 
     */
    public function adminmanage(){
        $uid = I('get.id/d');
        $where = array('eq', 1);
        $mod = D('User');
        $user = $mod->where(['id'=>$uid,'status'=>1,'user_type'=>2])->find(); //查找用户
        if (!$user) {
             $this->error('用户不存在或被禁用！');
        } else {
            // 记录登录SESSION和COOKIES
            $auth = array(
                'uid'      => $user['id'],
                'username' => $user['username'],
                'user_type'=> $user['user_type'],
            );
            session('user_auth', $auth);
            session('user_auth_sign', $mod->data_auth_sign($auth));
            $this->success('登录成功！', U('Admin/Index/index'));
        }
    }

    /**
     * 用户域名管理
     * 
     */
    public function domain($id) {
        if (IS_POST) {
            // 提交数据
            $mod = D('User');
            $data = I('post.');
            if (empty($data['url'])) {
                $this->error('请输入活码域名！');
            }
            if (empty($data['url_status'])) {
                $this->error('请选择审核结果！');
            }
            $result = $mod->save($data);
            if ($result !== false) {
                $this->success('操作成功', U('index'));
            } else {
                $this->error('操作失败');
            }
        } else {
            // 获取账号信息
            $info = D('User')->where(['id'=>$id,'status'=>1,'user_type'=>2])->find(); //查找用户
            if (!$info) {
                 $this->error('用户不存在或被禁用！');
            }
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('域名管理')  // 设置页面标题
                    ->setPostUrl(U('domain'))    // 设置表单提交地址
                    ->addFormItem('id', 'hidden', 'ID', 'ID')
                    ->addFormItem('url', 'text', '活码域名')
                    ->addFormItem('url_status', 'select', '域名审核', '', [1=>'通过',-1=>'不通过'])
                    ->addFormItem('ifCheck', 'select', '该用户是否需要审核', '', [1=>'需要',-1=>'不需要'])
                    ->setFormData($info)
                    ->display();
        }
    }

}

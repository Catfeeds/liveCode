<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Think\Controller;
use Common\Util\Think\Page;
/**
 * 管理员控制器
 * 
 */
class AccessController extends AdminController {
    /**
     * 管理员列表
     * @param $tab 配置分组ID
     * 
     */
    public function index() {
        // 搜索
        $keyword = I('keyword', '', 'string');
        $condition = array('like','%'.$keyword.'%');
        $map['id|uid'] = array(
            $condition,
            $condition,
            '_multi'=>true
        );

        // 获取所有配置
        $map['status'] = array('egt', '0');  // 禁用和正常状态
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $access_object = D('Access');
        $data_list = $access_object
                   ->page($p, C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('sort asc,id asc')
                   ->select();
        $page = new Page(
            $access_object->where($map)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 设置Tab导航数据列表
        $group_object = D('Group');
        $user_object  = D('User');
        foreach ($data_list as $key => &$val) {
            $val['username']    = $user_object->getFieldById($val['uid'], 'username');
            $val['group_title'] = $group_object->getFieldById($val['group'], 'title');
        }

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('管理员列表')  // 设置页面标题
                ->addTopButton('addnew')   // 添加新增按钮
                ->addTopButton('resume')   // 添加启用按钮
                ->addTopButton('forbid')   // 添加禁用按钮
                ->addTopButton('delete')   // 添加删除按钮
                ->setSearch('请输入ID/UID', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('uid', 'UID')
                ->addTableColumn('username', '用户名')
                ->addTableColumn('group_title', '用户组')
                ->addTableColumn('status', '状态', 'status')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)     // 数据列表
                ->setTableDataPage($page->show())  // 数据列表分页
                ->addRightButton('edit')           // 添加编辑按钮
                ->addRightButton('forbid')         // 添加禁用/启用按钮
                ->addRightButton('delete')         // 添加删除按钮
                ->display();
    }

    /**
     * 新增
     * 
     */
    public function add(){
        if (IS_POST) {
            $access_object = D('Access');
            $data = $access_object->create();
            if ($data) {
                if ($access_object->add($data)) {
                    D('user')->save(['id'=>$data['uid'],'user_type'=>1]);
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($access_object->getError());
            }
        } else {
            //使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('新增')  //设置页面标题
                    ->setPostUrl(U('add')) //设置表单提交地址
                    ->addFormItem('uid', 'text', 'UID', '用户ID')
                    ->addFormItem('group', 'select', '用户组', '不同用户组对应相应的权限', select_list_as_tree('Group'))
                    ->display();
        }
    }

    /**
     * 编辑
     * 
     */
    public function edit($id){
        if (IS_POST) {
            $access_object = D('Access');
            $data = $access_object->create();
            $password = $_POST['password'];
            if (!empty($password)) {
                if (!preg_match("/^(?![^a-zA-Z]+$)(?!\D+$).{8,15}$/", $password)) {
                    $this->error('密码必须为8-20位，且包含字母和数字！');
                }
            }
            if ($data) {
                if ($access_object->save($data)) {
                    if (!empty($password)) {
                        $access = $access_object->find($data['id']);
                        D('User')->save(['id'=>$access['uid'],'password'=>user_md5($password)]);
                    }
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败');
                }
            } else {
                $this->error($access_object->getError());
            }
        } else {
            // 使用FormBuilder快速建立表单页面。
            $access = D('Access')->find($id);
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('编辑')  // 设置页面标题
                    ->setPostUrl(U('edit'))    // 设置表单提交地址
                    ->addFormItem('id', 'hidden', 'ID', 'ID')
                    ->addFormItem('password', 'password', '管理员登录密码','默认为空则不修改')
                    ->addFormItem('group', 'select', '用户组', '不同用户组对应相应的权限', select_list_as_tree('Group'))
                    ->setFormData($access)
                    ->display();
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus($model = CONTROLLER_NAME){
        $ids     = I('request.ids');
        $status  = I('request.status');
        $userMod = D('user');

        if ( $status=='delete' ){
            if (is_array($ids)) {
                foreach( $ids as $v  ){ 
                    $access = D($model)->find($v);
                    $userMod->save(['id'=>$access['uid'],'user_type'=>2]);
                }
            } else {
                $access = D($model)->find($ids);
                $userMod->save(['id'=>$access['uid'],'user_type'=>2]);
            }
        }
        if ( $status=='forbid' || $status=='resume' ){
            $newStatus = ($status=='forbid')? 0:1;
            if (is_array($ids)) {
                foreach( $ids as $v  ){ 
                    $access = D($model)->find($v);
                    $userMod->save(['id'=>$access['uid'],'status'=>$newStatus]);
                }
            } else {
                $access = D($model)->find($ids);
                $userMod->save(['id'=>$access['uid'],'status'=>$newStatus]);
            }
        }
        parent::setStatus($model);
    }

}

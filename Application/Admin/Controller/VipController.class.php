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
 * 套餐控制器
 * 
 */
class VipController extends AdminController {
    /**
     * 套餐列表
     * 
     */
    public function index() {
        // 搜索
        $map = [];
        $keyword   = I('keyword', '', 'string');
        if ($keyword) {
            $map['v.name'] = $condition = array('like','%'.$keyword.'%');
        }
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $mod = M('Vip');
        $data_list = $mod->alias('v')->field('p.id,v.name,v.is_recommed,p.price,p.year')
                   ->join('__VIP_PRICE__ p ON p.vipId=v.id')
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('v.sort,p.price desc')
                   ->select();
        // halt($data_list);
        $page = new Page(
            $mod->alias('v')->join('__VIP_PRICE__ p ON p.vipId=v.id')->where($map)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('套餐列表') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->setSearch('请输入套餐名称', U('index'))
               
                ->addTableColumn('name', '套餐名称')
                ->addTableColumn('year', '时长(年)')
                ->addTableColumn('price', '套餐价格(元)')
                ->addTableColumn('is_recommed', '是否推荐', 'status')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表
                ->setTableDataPage($page->show()) // 数据列表分页
                ->addRightButton('edit')          // 添加编辑按钮
                ->addRightButton('delete')        // 添加删除按钮
                ->display();
    }

    /**
     * 新增用户
     * 
     */
    public function add() {
        if (IS_POST) {
            $data = I('post.');
            if (empty($data['name'])) {
                $this->error('套餐名称不能为空');
            }
            if (empty($data['year'])) {
                $this->error('套餐时长不能为空');
            }
            if ((int)$data['year'] <=0) {
                $this->error('套餐时长必须为大于0的整数');
            }
            if (empty($data['price'])) {
                $this->error('套餐价格不能为空');
            }
            if (!is_numeric($data['price']) || (float)$data['price'] <=0) {
                $this->error('套餐价格必须为大于0的数字');
            }
            $mod = M('vip');
            $vip = $mod->where(['name'=>$data['name']])->find();
            if (empty($vip)) {
                $sort = $mod->getField('max(id)');
                $result = $mod->add(['name'=>$data['name'],'is_recommed'=>$data['is_recommed'],'sort'=>$sort]);
            }else{
                if ($data['is_recommed'] != $vip['is_recommed']) {
                    $mod->where(['is_recommed'=>1])->save(['is_recommed'=>0]);
                    $mod->where(['name'=>$data['name']])->save(['is_recommed'=>$data['is_recommed']]);
                }
                $result = $vip['id'];
            }
            if ($result) {
                $res = M('vip_price')->add(['vipId'=>$result,'year'=>(int)$data['year'],'price'=>(float)$data['price']]);
                if ($res) {
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            }

        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('新增套餐') //设置页面标题
                    ->setPostUrl(U('add'))    //设置表单提交地址
                    ->addFormItem('name', 'text', '套餐名称', '套餐名称')
                    ->addFormItem('year', 'text', '套餐时长(年)', '套餐时长(年)')
                    ->addFormItem('price', 'text', '套餐价格(元)', '套餐价格(元)')
                    ->addFormItem('is_recommed', 'radio', '是否为推荐套餐', '是否为推荐套餐', array('0' => '不推荐','1' => '推荐'))
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
            $data = I('post.');
            if (empty($data['name'])) {
                $this->error('套餐名称不能为空');
            }
            if (empty($data['year'])) {
                $this->error('套餐时长不能为空');
            }
            if ((int)$data['year'] <=0) {
                $this->error('套餐时长必须为大于0的整数');
            }
            if (empty($data['price'])) {
                $this->error('套餐价格不能为空');
            }
            if (!is_numeric($data['price']) || (float)$data['price'] <=0) {
                $this->error('套餐价格必须为大于0的数字');
            }
            $mod = M('vip_price');
            $vip_price = $mod->where(['id'=>$data['id']])->find();
            if (empty($vip_price)) {
                $this->error('套餐不存在');
            }else{
                $result = $mod->where(['id'=>$data['id']])->save(['year'=>(int)$data['year'],'price'=>(float)$data['price']]);
            }
            if ($result !== false) {
                $vip_mod = M('vip');
                $vip = $vip_mod->where(['id'=>$vip_price['vipId']])->find();
                if ($data['is_recommed'] != $vip['is_recommed']) {
                    $vip_mod->where(['is_recommed'=>1])->save(['is_recommed'=>0]);
                    $vip_mod->where(['id'=>$vip_price['vipId']])->save(['is_recommed'=>$data['is_recommed']]);
                }
                $res = $vip_mod->where(['id'=>$vip_price['vipId']])->save(['name'=>$data['name']]);
                if ($res !== false) {
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败');
                }
            }
        } else {
            // 获取账号信息
            $info = M('vip')->alias('v')->field('p.id,v.name,v.is_recommed,p.price,p.year')
                    ->join('__VIP_PRICE__ p ON p.vipId=v.id')
                    ->where(['p.id'=>$id])
                    ->find();
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('编辑套餐') //设置页面标题
                    ->setPostUrl(U('edit'))    //设置表单提交地址
                    ->addFormItem('id', 'hidden', 'ID', 'ID')

                    ->addFormItem('name', 'text', '套餐名称', '套餐名称')
                    ->addFormItem('year', 'text', '套餐时长(年)', '套餐时长(年)')
                    ->addFormItem('price', 'text', '套餐价格(元)', '套餐价格(元)')
                    ->addFormItem('is_recommed', 'radio', '是否为推荐套餐', '是否为推荐套餐', array('0' => '不推荐','1' => '推荐'))
                    ->setFormData($info)
                    ->display();
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus($model = 'vip_price'){
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
        parent::setStatus('vip_price');
    }
}

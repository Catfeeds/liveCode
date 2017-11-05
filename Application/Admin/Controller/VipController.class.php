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
        $data_list = $mod->alias('v')->field('v.name,v.is_recommed,v.is_show,v.sort,p.id,p.price,p.year')
                   ->join('__VIP_PRICE__ p ON p.vipId=v.id')
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('v.sort,p.price desc')
                   ->select();

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
                ->addTableColumn('is_recommed', '是否前台推荐', 'status')
                ->addTableColumn('is_show', '是否前台显示', 'status')
                ->addTableColumn('sort', '排序')
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
            //添加到套餐表中
            if (empty($vip)) {
                $result = $mod->add($data);
            }else{
                $result = $vip['id'];
            }
            //推荐只能有一个
            if ($data['is_recommed'] == 1) {
                $mod->where(['is_recommed'=>1,'id'=>['neq',$result]])->save(['is_recommed'=>0]);
            }
            //修改套餐价格表
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
                    ->addFormItem('sort', 'text', '排序', '用于显示的顺序,如果套餐级别更高请输入更大的排序值')
                    ->addFormItem('is_recommed', 'radio', '是否前台推荐', '是否为推荐套餐', array('0' => '不推荐','1' => '推荐'))
                    ->addFormItem('is_show', 'radio', '是否前台显示', '是否显示到前台', array('0' => '不显示','1' => '显示'))
                    ->addFormItem('', 'radio', '<font color="red">套餐明细</font>')
                    ->addFormItem('livecode_count', 'text', '活码数量(个)', '为空则默认为不限制数量')
                    ->addFormItem('jump_url_count', 'text', '跳转网址数量(个)', '为空则默认为不限制数量')
                    ->addFormItem('batch_upload', 'select', '批量上传网址', '批量上传网址', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('batch_edit', 'select', '批量修改网址', '批量修改网址', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('batch_download', 'select', '批量下载活码图片', '批量下载活码图片', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('special_type', 'select', '特殊类型定制', '特殊类型定制', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('single_url', 'select', '独立域名', '独立域名', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('single_host', 'select', '独立主机', '独立主机', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('count_track', 'select', '统计追踪', '统计追踪', ['0'=>'不支持','1'=>'支持'])
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
                $data['id'] = $vip_price['vipId'];
                $res = $vip_mod->where(['id'=>$vip_price['vipId']])->save($data);
                $vip = $vip_mod->where(['id'=>$vip_price['vipId']])->find();
                if ($data['is_recommed'] == 1) {
                    $vip_mod->where(['is_recommed'=>1,'id'=>['neq',$vip_price['vipId']]])->save(['is_recommed'=>0]);
                }
                if ($res !== false) {
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败');
                }
            }
        } else {
            // 获取账号信息
            $info = M('vip')->alias('v')->field('v.*,p.id,p.price,p.year')
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
                    ->addFormItem('sort', 'text', '排序', '用于显示的顺序')
                    ->addFormItem('is_recommed', 'radio', '是否前台推荐', '是否为推荐套餐', array('0' => '不推荐','1' => '推荐'))
                     ->addFormItem('is_show', 'radio', '是否前台显示', '是否显示到前台', array('0' => '不显示','1' => '显示'))
                    ->addFormItem('', 'radio', '<font color="red">套餐明细</font>')
                    ->addFormItem('livecode_count', 'text', '活码数量(个)', '为空则默认为不限制数量')
                    ->addFormItem('jump_url_count', 'text', '跳转网址数量(个)', '为空则默认为不限制数量')
                    ->addFormItem('batch_upload', 'select', '批量上传网址', '批量上传网址', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('batch_edit', 'select', '批量修改网址', '批量修改网址', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('batch_download', 'select', '批量下载活码图片', '批量下载活码图片', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('special_type', 'select', '特殊类型定制', '特殊类型定制', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('single_url', 'select', '独立域名', '独立域名', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('single_host', 'select', '独立主机', '独立主机', ['0'=>'不支持','1'=>'支持'])
                    ->addFormItem('count_track', 'select', '统计追踪', '统计追踪', ['0'=>'不支持','1'=>'支持'])
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
        parent::setStatus('vip_price');
    }
}

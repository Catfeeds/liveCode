<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Admin\Controller;
use \Common\Util\Tree;
/**
 * 支付配置
 * 
 */
class PayconfController extends AdminController {

    /**
     * 新增导航
     * 
     */
    public function alipay() {
        if (IS_POST) {
            $nav_object = D('Module');
            $data = $nav_object->validate(false)->create();
            if (empty($data['icon'])) {
                $data['status'] = -1;
            }
            if ($data) {
                $id = $nav_object->add($data);
                halt('新增成功');
                // if ($id) {
                //     $this->success('新增成功', U('index'));
                // } else {
                //     $this->error('新增失败');
                // }
            } else {
                $this->error($nav_object->getError());
            }
        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('支付宝')  // 设置页面标题
                    ->setPostUrl(U('add'))     // 设置表单提交地址
                    ->addFormItem('pid', 'select', '上级导航', '上级导航', select_list_as_tree('admin_menu', '', '顶级导航'))
                    ->addFormItem('title', 'text', '导航标题', '导航前台显示标题')
                    ->addFormItem('url', 'text', '导航URL', '名称一般为英文单词')
                    ->addFormItem('icon', 'icon', '图标', '导航图标')
                    ->setExtraHtml($this->extra_html)
                    ->display();
        }
    }

    /**
     * 编辑导航
     * 
     */
    public function edit1($id) {
        if (IS_POST) {
            $nav_object = D('Nav');
            $data = $nav_object->create();
            if ($data) {
                if ($nav_object->save($data)) {
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败');
                }
            } else {
                $this->error($nav_object->getError());
            }
        } else {
            $info = D('Nav')->find($id);

            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('编辑导航')  // 设置页面标题
                    ->setPostUrl(U('edit'))    // 设置表单提交地址
                    ->addFormItem('id', 'hidden', 'ID', 'ID')
                    ->addFormItem('pid', 'select', '上级导航', '上级导航', select_list_as_tree('Nav', null, '顶级导航'))
                    ->addFormItem('name', 'text', '导航名称', '名称一般为英文单词')
                    ->addFormItem('title', 'text', '导航标题', '导航前台显示标题')
                    ->addFormItem('type', 'select', '导航类型', '导航类型', D('Nav')->nav_type())
                    ->addFormItem('url', 'text', '请填写外链URL地址', '支持http://格式或者TP的U函数解析格式', null, $info['url'] ? : 'hidden')
                    ->addFormItem('module_name', 'select', '模块', '选择的模块需要具有前台页面', select_list_as_tree('Module', null, null, 'name'), $info['module_name'] ? : 'hidden')
                    ->addFormItem('target', 'radio', '打开方式', '打开方式', array('' => '当前窗口','_blank' => '新窗口打开'))
                    ->addFormItem('icon', 'icon', '图标', '导航图标')
                    ->addFormItem('sort', 'num', '排序', '用于显示的顺序')
                    ->setFormData($info)
                    ->setExtraHtml($this->extra_html)
                    ->display();
        }
    }

    /**
     * 汇款账号列表
     * 
     */
    public function bank() {
        // 获取所有账号
        $map['status'] = array('egt', '0'); // 禁用和正常状态
        $data_list = M('admin_banks')->where($map)->order('id desc')->select();

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('汇款账号') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
               
                ->addTableColumn('bank', '银行名称')
                ->addTableColumn('userName', '开户名称')
                ->addTableColumn('bankName', '开户银行')
                ->addTableColumn('bankAccount', '银行卡号')
                ->addTableColumn('status', '状态', 'status')
                ->addTableColumn('right_button', '操作', 'btn')

                ->setTableDataList($data_list)    // 数据列表
                ->addRightButton('edit')          // 添加编辑按钮
                ->addRightButton('delete')        // 添加删除按钮
                ->display();
    }
    // 根据导航类型设置表单项目
    private $extra_html = <<<EOF
    <script type="text/javascript">  
            window.onload = function() {  
                var t = document.getElementById("bankName");  
                t.onkeydown = change;  
                t.onkeyup = change;  
                t.onkeypress = change;  
            }  
            function change() {  
                this.value = this.value.replace(/\D/g, '').replace(/....(?!$)/g, '$& '); //替换空格前4位数字为4位数字加空格  
            }  
        </script> 
EOF;

    /**
     * 新增汇款账号
     * 
     */
    public function add() {
        if (IS_POST) {
            $mod = D('Payconf');
            if (strlen(I('bankAccount/s')) < 15) {
                $this->error('请输入正确的银行卡号');
            }
            $data = $mod->create();
            if ($data) {
                $bankCount = $mod->where(['status'=>1])->count();
                if ($bankCount >= 3) {
                    $this->error('已启用的账号请勿超过3个,否则将造成前台排版混乱!');
                }
                $id = $mod->add($data);
                if ($id) {
                    $this->success('新增成功', U('bank'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($mod->getError());
            }
        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('新增汇款账号') //设置页面标题
                    ->setPostUrl(U('add'))    //设置表单提交地址

                    ->addFormItem('bank', 'text','银行名称')
                    ->addFormItem('userName', 'text','开户名称')
                    ->addFormItem('bankName', 'text','开户银行')
                    ->addFormItem('bankAccount', 'text','银行卡号','提示:添加的银行账号请勿超过3个,否则将造成前台支付页面排版混乱!','','','id="bankName"')
                    ->setExtraHtml($this->extra_html)
                    ->display();
        }
    }

    /**
     * 编辑汇款账号
     * 
     */
    public function edit($id) {
        if (IS_POST) {
            // 提交数据
            $mod = D('Payconf');
            $data = $mod->create();
            if (strlen(I('bankAccount/s')) < 15) {
                $this->error('请输入正确的银行卡号');
            }
            if ($data) {
                $result = $mod->save($data);
                if ($result) {
                    $this->success('更新成功', U('bank'));
                } else {
                    $this->error('更新失败', $mod->getError());
                }
            } else {
                $this->error($mod->getError());
            }
        } else {
            // 获取账号信息
            $info = D('Payconf')->find($id);

            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('编辑汇款账号')  // 设置页面标题
                    ->setPostUrl(U('edit'))    // 设置表单提交地址
                    ->addFormItem('id', 'hidden', 'ID', 'ID')

                    ->addFormItem('bank', 'text','银行名称')
                    ->addFormItem('userName', 'text','开户名称')
                    ->addFormItem('bankName', 'text','开户银行')
                    ->addFormItem('bankAccount', 'text','银行卡号','提示:添加的银行账号请勿超过3个,否则将造成前台支付页面排版混乱!','','','id="bankName"')
                    ->setExtraHtml($this->extra_html)
                    ->setFormData($info)
                    ->display();
        }
    }


}

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
     * 支付宝设置
     * 
     */
    public function alipay() {
        $m = M('payments');
        $alipay = $m->where(['payCode'=>'alipays'])->find();

        if (IS_POST) {
            $data = I('post.');
            if (empty($data['payAccount'])) {$this->error('收款支付宝账号不能为空');}
            if (empty($data['parterID'])) {$this->error('合作者身份不能为空');}
            if (empty($data['parterKey'])) {$this->error('交易安全验证码不能为空');}

            if ($alipay) {
                $rs = $m->where(['payCode'=>'alipays'])->save(['payConfig'=>json_encode($data)]);
            }else{
                $rs = $m->add(['payCode'=>'alipays','payName'=>'支付宝（及时到账）','payConfig'=>json_encode($data)]);
            }
            if ($rs !== false) {
                $this->success('操作成功');
            } else {
                $this->error('操作失败');
            }
        } else {
            $payConfig = json_decode($alipay["payConfig"]) ;
            foreach ($payConfig as $key => $value) {
                $alipay[$key] = $value;
            }
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('支付宝')  // 设置页面标题
                    ->addFormItem('payAccount', 'text', '收款支付宝账号', '收款支付宝账号')
                    // ->addFormItem('is_recommed', 'radio', '使用纯即时到账接口', '使用纯即时到账接口', array('1' => '是','0' => '否'))
                    ->addFormItem('parterID', 'text', '合作者身份(PID)', '合作者身份(PID)')
                    ->addFormItem('parterKey', 'text', '交易安全验证码(KEY)', '交易安全验证码(KEY)')
                    ->setFormData($alipay)
                    ->display();
        }
    }

    /**
     * 微信支付设置
     * 
     */
    public function wechat() {
        $m = M('payments');
        $weixin = $m->where(['payCode'=>'weixinpays'])->find();

        if (IS_POST) {
            $data = I('post.');

            if (empty($data['appId'])) {$this->error('AppID不能为空');}
            if (empty($data['appsecret'])) {$this->error('AppSecret不能为空');}
            if (empty($data['apiKey'])) {$this->error('API密钥(key)不能为空');}
            if (empty($data['mchId'])) {$this->error('受理商ID不能为空');}

            if ($weixin) {
                $rs = $m->where(['payCode'=>'weixinpays'])->save(['payConfig'=>json_encode($data)]);
            }else{
                $rs = $m->add(['payCode'=>'weixinpays','payName'=>'微信支付','payConfig'=>json_encode($data)]);
            }
            if ($rs !== false) {
                $this->success('操作成功');
            } else {
                $this->error('操作失败');
            }
        } else {
            $payConfig = json_decode($weixin["payConfig"]) ;
            foreach ($payConfig as $key => $value) {
                $weixin[$key] = $value;
            }
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('微信')  // 设置页面标题
                    ->addFormItem('appId', 'text', 'AppID', 'AppID(应用ID)')
                    ->addFormItem('appsecret', 'text', 'AppSecret', 'AppSecret(应用秘钥)')
                    ->addFormItem('apiKey', 'text', 'API密钥(key)', 'API密钥(key)')
                    ->addFormItem('mchId', 'text', '受理商ID', '受理商ID')
                    // ->addFormItem('title', 'text', '微信支付回调URL', '微信支付回调URL')
                    // ->addFormItem('title', 'text', '微信支付说明', '微信支付说明')
                    ->setFormData($weixin)
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

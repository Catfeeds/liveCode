<?php
namespace Admin\Controller;
use Common\Util\Think\Page;
/**
 * 活码管理控制器
 * 
 */
class CheckcodeController extends AdminController {
    /**
     * 初始化
     */
    protected function _initialize() {
        parent::_initialize();
        $this->uid         = $this->_user_auth['uid'];
        $this->userObj     = D('User');
    }
    /**
     * 活码列表
     * 
     */
    public function index($codeType = 1,$status=['0']) {
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        //搜索 && 条件
        $keyword   = I('keyword', '', 'string');
        if ($keyword){
             $where['id|title'] = array('like','%'.$keyword.'%');
        }elseif ($keyword && $codeType = 5) {
             $where['id|name'] = array('like','%'.$keyword.'%');
        }
        $status == 'history'? $status = ['1','-1'] : '';
        $where['status'] = ['in',$status];
        if ($codeType == 3) {
            $where['type'] = 2;
        }elseif ($codeType == 4) {
            $where['type'] = 1;
        }
        $modelName = getModelObj($codeType);
        $obj = D($modelName);
        // h($obj);
        //数据列表
        $data = $obj->where($where)->page($p , C('ADMIN_PAGE_ROWS'))->order('id desc')->select();
        $data_count = $obj->where($where)->count();
        //数据分页
        $page = new Page($data_count,C('ADMIN_PAGE_ROWS'));
        if ($data) {
            if (!$codeType || $codeType == 1) {     //活码生成
                foreach( $data as $k => $v ){
                    $data[$k]['ewm']     = "Uploads/livecode/".$v['id'].'.png';
                    $data[$k]['type']    = codeType($v['type']);
                    $data[$k]['title']   = LC_Substr($v['title'],0,15,"utf-8",true);
                    $data[$k]['username']= $this->userObj->getUserInfo($v['uid'])['username'];

                    if ($v['type'] == 1 || $v['type'] == 5) {
                        $data[$k]['content']='<a href="'.U('detail',['id'=>$v['id'],'codeType'=>1,'model'=>$modelName]).'" class="label label-primary layer2">点击查看</a>';
                    }elseif ($v['type'] == 3) {
                        $file                = json_decode($v['content'],true)['url'];
                        $ext                 = substr(strrchr($file, '.'), 1);
                        $picIcon             = getPicType($ext);
                        $data[$k]['content'] = '<img style="max-width: 200px;max-height: 40px;" src="/Public/images/'.$picIcon.'.png">';
                    }else{
                        $data[$k]['content'] = LC_Substr($v['content'],0,20,"utf-8",true);
                    }
                }            
            }elseif ($codeType == 2) {              //产品活码
                foreach( $data as $k => $v ){
                    $data[$k]['ewm']      = "Uploads/product/".$v['id'].'.png';
                    $data[$k]['title']    = LC_Substr($v['title'],0,15,"utf-8",true);
                    $data[$k]['content']  ='<a href="'.U('detail',['id'=>$v['id'],'codeType'=>2,'model'=>$modelName]).'" class="label label-primary layer2">点击查看</a>';
                    $data[$k]['username'] = $this->userObj->getUserInfo($v['uid'])['username'];
                }
            }elseif ($codeType == 3) {              //视频活码
                foreach( $data as $k => $v ){
                    $data[$k]['ewm']      ="Uploads/ewm/".$v['id'].'.png';
                    $data[$k]['username'] = $this->userObj->getUserInfo($v['uid'])['username'];
                }
            }elseif ($codeType == 4) {              //网址跳转
                foreach( $data as $k => $v ){
                    $data[$k]['ewm']="Uploads/phone/".$v['id'].'.png';
                    $data[$k]['username'] = $this->userObj->getUserInfo($v['uid'])['username'];
                }  
            }elseif ($codeType == 5) {              //多网址跳转
                foreach( $data as $k => $v ){
                    $data[$k]['ewm']      = "Uploads/duourl/".$v['id'].'.png';
                    $data[$k]['content']  = '<a href="'.U('detail',['id'=>$v['id'],'codeType'=>5,'model'=>$modelName]).'" class="label label-primary layer2">点击查看</a>';
                    $data[$k]['title']    = $v['name'];
                    $data[$k]['username'] = $this->userObj->getUserInfo($v['uid'])['username'];
                } 
            }
        }

        $this->assign([
            'meta_title'      => '活码管理',
            'data'            => $data,
            'data_count'      => $data_count,
            'table_data_page' => $page->show(),
            'codeType'        => $codeType,
            'keyword'         => $keyword,
            'status'          => I('get.status/s'),
            'modelName'       => $modelName,

        ]);
        $this->display();

        
    }

    /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus($model = 'Livecode'){
                // h(I());
        $ids = I('request.ids');
        $status=I('request.status');
        // halt($model);

        if ( $status=='delete' ){
            if (is_array($ids)) {
               foreach( $ids as $v  ){ 
                unlink("Uploads/livecode/".$v.'.png');
               }
            } else {
               unlink("Uploads/livecode/".$ids.'.png');
            }
        }
        parent::setStatus($model);
    }

    /**
     * 点击查看
     */
    public function detail (){
        $get = I('get.');
        $obj = D($get['model']);

        $data = $obj->where(['id'=>$get['id']])->find();
        if (!$data) {
            return $this->display('Public/unfined');
        }
        if ($get['codeType'] == 2) {
            $content = json_decode($data["content"]) ;
            foreach ($content as $key => $value) {
                $data[$key] = $value;
            }
            $data['type'] = 2;
            $this->assign('data',$data);
            $this->display('Livecode/live_text');
        }elseif ($get['codeType'] == 5) {
            $data['title']=str_replace('|||','</br>',$data['title']);
            $this->assign('info',$data);
            $this->display('Duourl/detail');
        }else {
            $content = json_decode($data["content"],true);
            foreach ($content as $key => $value) {
                $data[$key] = $value;
            }
            $this->assign('data',$data);
            if ($data['type'] == 1) {
                $this->display('Livecode/live_text');    //图文
            }else{
                $this->display('Livecode/live_vcard');   //名片
            }
        }
        
    }












    /**
     * 编辑活码
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
                    $this->error('更新失败', $user_object->getError());
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {
            // 获取账号信息
            $info = D('User')->where(['id'=>$id,'user_type'=>2])->find();
            // if (!$info) {
            //     $this->error('用户不存在');
            // }
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

    


}

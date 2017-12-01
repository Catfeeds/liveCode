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
        $this->assign('host',$_SERVER['HTTP_HOST']);
    }
    /**
     * 活码列表
     * 
     */
    public function index($codeType = 1,$status=['0','-1']) {
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        //搜索 && 条件
        $keyword   = I('keyword', '', 'string');
        if ($keyword){
            if ($codeType == 5) {
                $where['id|name'] = array('like','%'.$keyword.'%');
            }else{
                $where['id|title'] = array('like','%'.$keyword.'%');
            }
        }

        $status == 'history'? $status = ['1'] : '';
        $where['status'] = ['in',$status];
        if ($codeType == 3) {
            $where['type'] = 2;
        }elseif ($codeType == 4) {
            $where['type'] = 1;
        }
        $modelName = getModelObj($codeType);
        $obj = D($modelName);
        //数据列表
        $data = $obj->where($where)->page($p , C('ADMIN_PAGE_ROWS'))->order('id desc')->select();
        $data_count['totalCount'] = $obj->where($where)->count();

        //数据分页
        $page = new Page($data_count['totalCount'],C('ADMIN_PAGE_ROWS'));
        if ($data) {
            if (!$codeType || $codeType == 1) {     //活码生成
                foreach( $data as $k => $v ){
                    $data[$k]['ewm']     = "Uploads/livecode/".$v['id'].'.png';
                    $data[$k]['type']    = codeType($v['type']);
                    $data[$k]['title']   = LC_Substr($v['title'],0,15,"utf-8",true);
                    $data[$k]['username']= $this->userObj->getUserInfo($v['uid'])['username'];

                    if ($v['type'] == 1 || $v['type'] == 4 || $v['type'] == 5) {
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
        $data_count['unCheckCount1'] = D('Livecode')->where(['status'=>0])->count();
        $data_count['unCheckCount2'] = D('Product')->where(['status'=>0])->count();
        $data_count['unCheckCount3'] = D('phone')->where(['type'=>2,'status'=>0])->count();
        $data_count['unCheckCount4'] = D('phone')->where(['type'=>1,'status'=>0])->count();
        $data_count['unCheckCount5'] = D('Duourl')->where(['status'=>0])->count();

        $this->assign([
            'meta_title'      => '活码管理',
            'data'            => $data,
            'data_count'      => $data_count,
            'table_data_page' => $page->show(),
            'codeType'        => $codeType,
            'keyword'         => $keyword,
            'status'          => I('get.status/s'),
            'modelName'       => $modelName,
            'path_info'       => $_SERVER['PATH_INFO'],
        ]);
        $this->display();
    }

    /**
     * 编辑活码
     * 
     */
    public function edit($codeType=1,$id=0,$jumpUrl='') {
        $modelName = getModelObj($codeType);
        $obj       = D($modelName);

        if (IS_POST) {
            //提交数据
            if ($codeType == 1) {
                $info = I('post.');
                $type = $info['type'];
                if ($type == 1 || $type == 2 || $type == 3 || $type == 4) {    //图文活码 || 文本活码 || 文件活码 || 网址导航
                    $data = $obj->create();
                    if (!$data) {
                        $this->error($obj->getError());exit();
                    }
                }elseif ($type == 5) {                  //名片活码
                    $data['content'] = $info['params'];
                    //联系信息
                    $mobile = $fax = $email = [];
                    foreach ($data['content']['left_phone'] as $k => $v) {
                        if (!$v['en']) {
                            $lastClass = explode(' ', $v['class'])[1];
                            if (strpos($lastClass, 'mobile') !== false) {
                                $v['data-class'] = $lastClass;
                                $mobile[] = $v;
                            }elseif (strpos($lastClass, 'fax') !== false) {
                                $v['data-class'] = $lastClass;
                                $fax[] = $v;
                            }elseif (strpos($lastClass, 'email') !== false) {
                                $v['data-class'] = $lastClass;
                                $email[] = $v;
                            }
                            unset($data['content']['left_phone'][$k]);
                        }
                    }
                    foreach ($data['content']['left_phone'] as $k => $v) {
                        if ($v['en']) {
                            if ($v['en'] == 'Mobile') {
                                $data['content']['left_phone'][$k]['child'] = $mobile;
                            }elseif ($v['en'] == 'Fax') {
                                $data['content']['left_phone'][$k]['child'] = $fax;
                            }elseif ($v['en'] == 'Email') {
                                $data['content']['left_phone'][$k]['child'] = $email;
                            }
                        }
                    }
                    //社交信息
                    $wechat = $website = [];
                    foreach ($data['content']['left_internet'] as $k => $v) {
                        if (!$v['en']) {
                            $lastClass = explode(' ', $v['class'])[1];
                            if (strpos($lastClass, 'wechat') !== false) {
                                $v['data-class'] = $lastClass;
                                $wechat[] = $v;
                            }elseif (strpos($lastClass, 'website') !== false) {
                                $v['data-class'] = $lastClass;
                                $website[] = $v;
                            }
                            unset($data['content']['left_internet'][$k]);
                        }
                    }
                    foreach ($data['content']['left_internet'] as $k => $v) {
                        if ($v['en']) {
                            if ($v['en'] == 'Wechat') {
                                $data['content']['left_internet'][$k]['child'] = $wechat;
                            }elseif ($v['en'] == 'Website') {
                                $data['content']['left_internet'][$k]['child'] = $website;
                            }
                        }
                    }
                    //地址
                    $address = [];
                    foreach ($data['content']['left_address'] as $k => $v) {
                        if (!$v['en']) {
                            $lastClass = explode(' ', $v['class'])[1];
                            if (strpos($lastClass, 'address') !== false) {
                                $v['data-class'] = $lastClass;
                                $address[] = $v;
                            }
                            unset($data['content']['left_address'][$k]);
                        }
                    }
                    foreach ($data['content']['left_address'] as $k => $v) {
                        if ($v['en']) {
                            if ($v['en'] == 'Address') {
                                $data['content']['left_address'][$k]['child'] = $address;
                            }
                        }
                    }

                    $data['title'] = $data['content']['name'].'的名片';
                    $data['update_time'] = time();
                }
                //如果是图文或者文件，内容保存为json格式
                if ($type == 1 || $type == 3 || $type == 4 || $type == 5) {
                    $data['content']   = json_encode($data['content']);
                }
                $data['id']  = $info['editId'];
                
                $result = $obj->save($data);
                if ($result) {
                    //如果是名片活码，需更新vcf文件
                    if ($type == 5) {
                        createVcfFile($data['id'],$data['content']);
                    }
                    $this->success(['site'=>'admin'], '/Uploads/livecode/'.$data['id'].'.png');
                } else {
                    $this->error('更新失败');
                }
            }elseif ($codeType == 2) {          //产品活码
                $info = I('post.');
                $data = $obj->create();
                if (!$data) {
                    $this->error($obj->getError());exit();
                }
                $data['content'] = json_encode($data['content']);
                $data['id']      = $info['editId'];

                $result = $obj->save($data);
                if ($result) {
                    $this->success(['site'=>'admin'], '/Uploads/product/'.$data['id'].'.png');
                } else {
                    $this->error('更新失败');
                }
            }elseif ($codeType == 3) {
                $data = I('post.');
                //判断文件是否存在
                if (!file_exists($data['videourl'])) {
                    $this->error('文件不存在');
                }
                $data['update_time'] = NOW_TIME;

                $result = $obj->save($data);
                if ($result !== false) {
                    $this->success(['type'=>$data['menuId'],'site'=>'admin']);
                } else {
                    $this->error('更新失败');
                }
            }elseif ($codeType == 4) {
                $data = $obj->create();
                if ($data) {
                    $result = $obj->save($data);
                    if ($result) {
                        $this->success('更新成功',urldecode($jumpUrl));
                    } else {
                        $this->error('更新失败');
                    }
                } else {
                    $this->error($obj->getError());
                }
            }elseif ($codeType == 5) {
                $info=I('post.');
                $info['title']=array_filter($info['title']);
                $info['tztime']=array_filter($info['tztime']);
                if ( !$info['name'] ){
                    $this->error('请输入网址名称');
                }
                if ( !$info['title'] ){
                    $this->error('请输入跳转网址');
                }  
                if ( $info['tztype']==3 ){
                    if ( count($info['title'])!=count($info['tztime']) ){
                        $this->error('请确认对应跳转网址是否完整输入跳转时间');
                    }
                    $data['tztime']=implode('|||',$info['tztime']);
                }
                $data['title']       = implode('|||',$info['title']);
                $data['name']        = $info['name'];
                $data['menuId']      = $info['menuId'];
                $data['update_time'] = NOW_TIME;
                $data['id']          = $info['id'];
                $data['tztype']      = $info['tztype'];
                $result = $obj->save($data);
                if ($result) {
                    $this->success('更新成功',urldecode($jumpUrl));
                } else {
                    $this->error('更新失败');
                }
            }
            

        } else {
            //模板显示
            $data = $obj->where(['id'=>$id])->find();
            if (!$data) {$this->error('数据不存在');}

            if ($codeType == 1) {
                if ($data['type'] == 1 || $data['type'] == 3 || $data['type'] == 4 || $data['type'] == 5) {
                    $content = json_decode($data["content"],true);
                    foreach ($content as $key => $value) {
                        if ($data['type'] == 4) {
                            $data['url'][$key] = $value;
                        }else{
                            $data[$key] = $value;
                        }
                    }
                }
                $meta_title = '编辑活码';
                $html       = 'Livecode/edit';
            }elseif ($codeType == 2) {
                $content = json_decode($data["content"]);
                foreach ($content as $key => $value) {
                    $data[$key] = $value;
                }
                //插入名片
                $vcards = D('Livecode')->where(['uid'=>$data['uid'],'type'=>5,'status'=>1])->getField('content',true);
                if ($vcards) {
                    foreach ($vcards as $key => $v) {
                        $vcards[$key] = json_decode($v,true);
                    }
                }
                $meta_title = '编辑产品活码';
                $this->assign('vcards',$vcards);
                $html       = 'Product/add';
            }elseif ($codeType == 3) {
                $meta_title = '编辑视频活码';
                $html       = 'Video/edit';
            }elseif ($codeType == 4) {   //网址跳转
                $builder = new \Common\Builder\FormBuilder();
                return $builder->setMetaTitle('编辑网址跳转')  // 设置页面标题
                        ->setPostUrl(U('edit',['codeType'=>$codeType,'id'=>$id,'jumpUrl'=>urlencode($_SERVER["HTTP_REFERER"])]))    // 设置表单提交地址
                        ->addFormItem('id', 'hidden', 'ID', 'ID')
                        ->addFormItem('menuId', 'hidden')
                        ->addFormItem('title', 'text', '网址名称')
                        ->addFormItem('videourl', 'text', '跳转网址','请在网址前添加http://,确保网址完整！','','',"placeholder='http://'")
                        ->setFormData($data)
                        ->display();
            }elseif ($codeType == 5) {
                $data['title']   = explode('|||',$data['title']);
                $data['tztime']  = explode('|||',$data['tztime']);
                $data['jumpUrl'] = urlencode($_SERVER["HTTP_REFERER"]);
                $meta_title      = '编辑多网址跳转';
                $html            = 'Duourl/edit';
            }

            $data['codeType'] = $codeType;
            $this->assign([
                'meta_title' => $meta_title,
                'data'       => $data,
                'menuId'     => $data['menuId'],
            ]);
            $this->display($html);
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus($codeType = 1){
        $model    = getModelObj($codeType);
        $ids      = I('request.ids');
        $status   = I('request.status');
        $fileName = getEwmFileName($codeType);
        if ($status=='delete'){
            if (is_array($ids)) {
                foreach( $ids as $v  ){ 
                    if ($codeType = 3) {
                        $videourl = D($model) -> where(array('id' => $v)) -> getField('videourl');
                        unlink($videourl);
                    }
                    unlink('Uploads/'.$fileName.'/'.$v.'.png');
                }
            } else {
                if ($codeType = 3) {
                    $videourl = D($model) -> where(array('id' => $ids)) -> getField('videourl');
                    unlink($videourl);
                }
                unlink('Uploads/'.$fileName.'/'.$ids.'.png');
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
                if ($data['type'] == 4) {
                $data['url'][$key] = $value;
                }else{
                    $data[$key] = $value;
                }
            }
            $this->assign('data',$data);
            if ($data['type'] == 1) {
                $this->display('Livecode/live_text');    //图文
            }elseif ($data['type'] == 4) {
                $this->display('Livecode/live_url');     //网址
            }else{
                $this->display('Livecode/live_vcard');   //名片
            }
        }
        
    }

    /**
     * 上传活码生成文件
     */
    public function addLivecodeFile() {
        if($_SERVER['REQUEST_METHOD'] == "POST"){
            $upload = new \Think\Upload();// 实例化上传类
            $upload->rootPath  =     'Uploads/livecode/file/'; // 设置附件上传根目录
            $upload->savePath  =     ''; // 设置附件上传（子）目录+
            // 上传文件 
            $info   =   $upload->upload();
            if(!$info) {// 上传错误提示错误信息
                $this->error('上传失败！');
            }else{// 上传成功
                $size = getFilesize($info['file']['size']);
                $url  = $info['file']['savepath'].$info['file']['savename'];
                $this->success(['uploadFileName'=>$info['file']['name'],'uploadFileSize'=>$size,'uploadFileUrl'=>$upload->rootPath.$url]);
            }
        }
    }


}

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
     * 编辑活码
     * 
     */
    public function edit($codeType=1,$id=0,$jumpUrl='') {
        $modelName = getModelObj($codeType);
        $obj       = D($modelName);

        if (IS_POST) {
            //提交数据
            if ($codeType == 2) {
                $info = I('post.');
                $data = $obj->create();
                if (!$data) {
                    $this->error($obj->getError());exit();
                }
                $data['content'] = json_encode($data['content']);
                $data['id']      = $info['editId'];

                $result = $obj->save($data);
                if ($result) {
                    $this->success('更新成功', '/Uploads/product/'.$data['id'].'.png');
                } else {
                    $this->error('更新失败');
                }
            }elseif ($codeType == 3) {
                $data = I('post.');
                //判断文件是否存在
                if (!file_exists($data['videourl'])) {
                    $this->error('文件不存在');
                }
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
            if ($codeType == 4) {
                $info = $obj->where(['id'=>$id,'type'=>1])->find();
                if (!$info) {
                    $this->error('数据不存在');
                }
                // 使用FormBuilder快速建立表单页面。
                $builder = new \Common\Builder\FormBuilder();
                $builder->setMetaTitle('编辑网址跳转')  // 设置页面标题
                        ->setPostUrl(U('edit',['codeType'=>$codeType,'id'=>$id,'jumpUrl'=>urlencode($_SERVER["HTTP_REFERER"])]))    // 设置表单提交地址
                        ->addFormItem('id', 'hidden', 'ID', 'ID')
                        ->addFormItem('menuId', 'hidden')
                        ->addFormItem('title', 'text', '网址名称')
                        ->addFormItem('videourl', 'text', '跳转网址','请在网址前添加http://,确保网址完整！','','',"placeholder='http://'")
                        ->setFormData($info)
                        ->display();
            }else{
                $data = $obj->where(['id'=>$id])->find();
                if (!$data) {
                    $this->error('数据不存在');
                }
                $data['codeType'] = $codeType;

                if ($codeType == 2) {
                    $content = json_decode($data["content"]) ;
                    foreach ($content as $key => $value) {
                        $data[$key] = $value;
                    }
                    $meta_title = '编辑产品活码';
                    $html       = 'Product/add';
                }elseif ($codeType == 3) {
                    $meta_title = '编辑视频活码';
                    $html       = 'Video/edit';
                }elseif ($codeType == 5) {
                    $data['title']   = explode('|||',$data['title']);
                    $data['tztime']  = explode('|||',$data['tztime']);
                    $data['jumpUrl'] = urlencode($_SERVER["HTTP_REFERER"]);
                    $meta_title      = '编辑多网址跳转';
                    $html            = 'Duourl/edit';
                }

                // halt($data);
                $this->assign([
                    'meta_title' => $meta_title,
                    'data'       => $data,
                    'menuId'     => $data['menuId'],
                ]);
                $this->display($html);
            }
            
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
     * 上传视频
     */
    public function addfile() {
        $REQUEST_METHOD=$_SERVER['REQUEST_METHOD'];
        $uploads_dir="Uploads/video/";
        if($REQUEST_METHOD == "GET")
        {
            if(count($_GET)>0)
            {
                $chunkNumber = $_GET['resumableChunkNumber'];
                $chunkSize = $_GET['resumableChunkSize'];
                $totalSize = $_GET['resumableTotalSize'];
                $identifier = $_GET['resumableIdentifier'];
                $filename = iconv ( 'UTF-8', 'GB2312', $_GET ['resumableFilename'] );
                if(validateRequest($chunkNumber, $chunkSize, $totalSize, $identifier, $filename)=='valid')
                {
                    $chunkFilename = getChunkFilename($chunkNumber, $identifier,$filename,$uploads_dir);
                    {
                        if(file_exists($chunkFilename)){
                            header("HTTP/1.0 200 Found");
                        } else {
                            header("HTTP/1.0 404 Not Found");
                           
                        }
                    }
                }
                else
                {
                    header("HTTP/1.0 404 Not Found");
                    
                }}
        }

        if($REQUEST_METHOD == "POST"){
            if(count($_POST)>0)
            {
                $resumableFilename = iconv ( 'UTF-8', 'GB2312', $_POST ['resumableFilename'] );
                $resumableIdentifier=$_POST['resumableIdentifier'];
                $resumableChunkNumber=$_POST['resumableChunkNumber'];
                $resumableTotalSize=$_POST['resumableTotalSize'];
                $resumableChunkSize=$_POST['resumableChunkSize'];
                if (!empty($_FILES)) foreach ($_FILES as $file) {
                    
                    if ($file['error'] != 0) {
                        _log('error '.$file['error'].' in file '.$resumableFilename);
                        continue;
                    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
                    $temp_dir = $uploads_dir.'/'.$resumableIdentifier;
                    $dest_file = $temp_dir.'/'.$resumableFilename.'.part'.$resumableChunkNumber;
                    
                    if (!is_dir($temp_dir)) {
                        mkdir($temp_dir, 0777, true);
                    }
                    
                    if (!move_uploaded_file($file['tmp_name'], $dest_file)) {
                        _log('Error saving (move_uploaded_file) chunk '.$resumableChunkNumber.' for file '.$resumableFilename);
                    } else {
                        
                        createFileFromChunks($temp_dir, $resumableFilename,$resumableChunkSize, $resumableTotalSize, $uploads_dir);
                    }
                }
            }
        }
    }


}

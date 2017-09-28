<?php
namespace Admin\Controller;
use Common\Util\Think\Page;

/**
 * 视频活码
 * 
 */
class VideoController extends AdminController {
    protected function _initialize() {
        parent::_initialize();
        $this->uid=$this->_user_auth['uid'];
    }
    /**
     * 视频活码列表
     * 
     */
    public function index() {
        // 搜索
        $keyword   = I('keyword', '', 'string');
        if ( $keyword ){
            $map['id|title'] = array('like','%'.$keyword.'%');
        }
       
        $map['type'] = 2;
        // 获取所有用户
        $map['status'] = array('egt', '0'); // 禁用和正常状态
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $user_object = D('Phone');
        $data_list = $user_object
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('id desc')
                   ->select();
                  
        foreach( $data_list as $k => $v ){
            $data_list[$k]['ewm']="Uploads/ewm/".$v['id'].'.png';
        }           
        $page = new Page(
            $user_object->where($map)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $attr['name']  = 'dcurl';
        $attr['title'] = '导出活码地址';
        $attr['class'] = 'btn btn-primary';
        $attr['href']  = U('outurl');
        $attr2['name']  = 'xzewm';
        $attr2['title'] = '下载二维码';
        $attr2['class'] = 'btn btn-primary';
        $attr2['href']  = U('xzewm');
        $attr3['name']  = 'view';
        $attr3['title'] = '数据统计';
        $attr3['class'] = 'label label-info';
        $attr3['href']  = U('view',['id'=>'__data_id__','code'=>'3']);
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('活码列表') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr)
                ->addTopButton('self', $attr2)

                ->setSearch('请输入ID或视频名称', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '视频名称')
                ->addTableColumn('huoma', '活码地址')
                ->addTableColumn('count', '播放次数')
                ->addTableColumn('ewm', '二维码', 'img')
                ->addTableColumn('create_time', '添加时间', 'time')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表
                ->setTableDataPage($page->show()) // 数据列表分页
                ->addRightButton('edit')          // 添加编辑按钮
                ->addRightButton('delete')        // 添加删除按钮
                ->addRightButton('self', $attr3)
                ->display();
    }
    /**
     * 导出
     */
    public function outurl (){
        if ( IS_POST ){
            $ksid=(int)I('ksid');
            $endid=(int)I('endid');
            if ( !$ksid ){
                $this->error('请输入开始ID');
            }
            if ( !$endid ){
                $this->error('请输入结束ID');
            }
            $where['type']=2;
            $where['id']  = array('between',array($ksid,$endid));
            $rs=M('cms_phone')->where($where)->order('id')->select();
            $str = "id,视频名称,活码地址\n";
            foreach( $rs as $v){
                $str .= $v['id'].",".$v['title'].",".$v['huoma']."\n";
            }

            $str = iconv('utf-8','gb2312',$str);
            $filename = date('Ymd').'.csv';
            $this->export_csv($filename,$str);
        }else{
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('导出网址') //设置页面标题
                    ->setPostUrl(U('outurl'))    //设置表单提交地址
                    ->addFormItem('ksid', 'text', '开始ID')
                    ->addFormItem('endid', 'text', '结束ID')
                     ->setAjaxSubmit(false)
                    ->display();
        }
    }
    /**
     * 执行导出
     */
    public function export_csv($filename,$data) {
        header("Content-type:text/csv");
        header("Content-Disposition:attachment;filename=".$filename);
        header('Cache-Control:must-revalidate,post-check=0,pre-check=0');
        header('Expires:0');
        header('Pragma:public');
        echo $data;
    }
    public function edittzwz ()
        {
                if ( IS_POST )
                    {
                        $ksid=I('ksid');
            $endid=I('endid');
            if ( !$ksid )
            {
                $this->error('请输入旧关键词');
            }
            if ( !$endid )
            {
                $this->error('请输入新关键词');
            }
            
            M('cms_phone')->execute("UPDATE __CMS_PHONE__ SET 
    title = replace(title, '$ksid', '$endid') ");
                $this->success('修改成功',U('index'));  
                    }else{
            // 使用FormBuilder快速建立表单页面。
                $builder = new \Common\Builder\FormBuilder();
                $builder->setMetaTitle('批量修改跳转网址') //设置页面标题
                        ->setPostUrl(U('edittzwz'))    //设置表单提交地址
                        ->addFormItem('ksid', 'text', '旧关键词')
                        ->addFormItem('endid', 'text', '新关键词')
                        
                        ->display();
                    }
        
    }
    public function xzewm (){
        if ( IS_POST ){
            $ksid=(int)I('ksid');
            $endid=(int)I('endid');
            if ( !$ksid ){
                $this->error('请输入开始ID');
            }
            if ( !$endid ){
                $this->error('请输入结束ID');
            }
            $where['type']=2;
            $where['id']  = array('between',array($ksid,$endid));
            $rs=M('cms_phone')->where($where)->getField('videourl',true);
            $zip = new \ZipArchive;
            $filename = 'Uploads/video/'.time().'.zip';
            //$zip->open($filename,\ZipArchive::OVERWRITE);
            $zip->open($filename, \ZipArchive::CREATE);
            foreach ($rs as $key => $value) {
                $zip->addFile($value);
            }
            $zip->close();
            header('Location:'.$filename);die();
        }else{
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('下载二维码') //设置页面标题
                    ->setPostUrl(U('xzewm'))    //设置表单提交地址
                    ->addFormItem('ksid', 'text', '开始ID')
                    ->addFormItem('endid', 'text', '结束ID')
                    ->setAjaxSubmit(false)
                    ->display();
        }
    }
    /**
     * 新增视频活码
     * 
     */
    public function add() {
        if (IS_POST) {
            $user_object         = M('cms_phone');
            $data['create_time'] = NOW_TIME;
            $data['update_time'] = NOW_TIME;
            $data['title']       = I('title');
            $data['videourl']    = I('videourl');
            $data['uid']         = $this->uid;
            $data['d']           = get_dwz();
            $data['type']        = 2;
            if ($data) {
                //判断文件是否存在
                if (!file_exists($data['videourl'])) {
                    $this->error('文件不存在', $user_object->getError());
                }
                $data['huoma']=get_huomaurl($data['d']);                
                $id = $user_object->add($data);
                if ($id) {
                     qrcode($data['huoma'],$id);
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {
            // 使用FormBuilder快速建立表单页面。
            // $builder = new \Common\Builder\FormBuilder();
            // $builder->setMetaTitle('新增活码') //设置页面标题
            //         ->setPostUrl(U('add'))    //设置表单提交地址
            //         ->addFormItem('title', 'text', '视频文件')
            //         ->addFormItem('file', 'file', '上传文件','上传需要导入的网址文件，格式为一行一个网址，文档格式为txt')
            $this->display();
        }
    }

    /**
     * 编辑用户
     * 
     */
    public function edit($id) {
        if (IS_POST) {
            
            // 提交数据
            $user_object = D('Phone');
            $data = $user_object->create();
           
            if ($data) {
                //$data['d']=$this->get_dwz($data['title']);
                //$data['huoma']=$this->get_huomaurl($data['d']);
                //$data['huoma']=$this->get_huomaurl($data['d']);
                //判断文件是否存在
                if (!file_exists($data['videourl'])) {
                    $this->error('文件不存在', $user_object->getError());
                }

                $result = $user_object->save($data);
                if ($result) {
                    // unlink("Uploads/ewm/".$data['id'].'.png');
                    //$this->qrcode($data['huoma'],$data['id']);
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败', $user_object->getError());
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {
            // 获取账号信息
            $info = D('Phone')->find($id);
            $this->assign('info',$info);
            $this->display();
        }
    }

   
    public function drurl() {
        if (IS_POST) {
            $file=I('file');
            if ( !$file )
            {
                $this->error('请上传文件');
            }
            $filename=get_upload_info($file,'path');
            if ( !$filename )
            {
                $this->error('请上传文件');
            }
            $txtarr=file( getcwd().$filename, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
            if ( !is_array($txtarr) )
            {
                $this->error('读取失败，请确认txt格式是否符合要求');
            }
           
            $user_object = M('cms_phone');
           $data['create_time']=NOW_TIME;
           $data['update_time']=NOW_TIME;
            $data['uid']=$this->uid;
            foreach( $txtarr as $v  )
            {
              
            $data['title']=$v;
             $rs=$user_object->where(array('title'=>$v))->find();
            if ( $rs )
            {
            /*$data['id']=$rs['id'];
             $user_object->save($data);
             $ewmid=$rs['id'];*/
            }else{
              $data['d']=get_dwz();
            $data['huoma']=get_huomaurl($data['d']);
             //unset($data['id']);
                $ewmid=$user_object->add($data);
               qrcode($data['huoma'],$ewmid);
                }    
            }
            $this->success('导入成功', U('index'));
        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('导入网址') //设置页面标题
                    ->setPostUrl(U('drurl'))    //设置表单提交地址
                    ->addFormItem('file', 'file', '上传文件','上传需要导入的网址文件，格式为一行一个网址，文档格式为txt')
                    ->display();
        }
    }



 
 
  /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus(){
        $ids = I('request.ids');
        $status=I('request.status');
        $obj = M('cms_phone');
        if ( $status=='delete' ) {
            if (is_array($ids)) {  
                foreach( $ids as $v  ){
                    $videourl = $obj -> where(array('id' => $v)) -> getField('videourl');
                    unlink($videourl);
                }
            } else {
                $videourl = $obj -> where(array('id' => $ids)) -> getField('videourl');
                unlink($videourl);
            }
        }
        parent::setStatus('phone');
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

    /**
     * 显示数据统计
     * 
     */
    public function view() {
        $this->assign([
            'id'=>I('get.id/d'),
            'code'=>I('get.code/d'),
            'meta_title'=>'数据统计',
            ]);
        $this->display('Phone/view');
    }

}

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
        $this->obj = D('Phone');
        //判断用户状态是否正常 && 套餐是否过期
        $this->ifExpired();
    }
    /**
     * 视频活码列表
     * 
     */
    public function index() {
        $map = ['uid'=>$this->uid,'type'=>2,'menuId'=>0];
        // 搜索
        $keyword   = I('keyword', '', 'string');
        if ( $keyword ){
            $map['id|title'] = array('like','%'.$keyword.'%');
        }

        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $data_list = $this->obj
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('id desc')
                   ->select();

        foreach( $data_list as $k => $v ){
            $data_list[$k]['ewm']    = "Uploads/ewm/".$v['id'].'.png';
            $data_list[$k]['status'] = domainStatus($v['status']);
        }
        $page = new Page(
            $this->obj->where($map)->count(),
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
        $attr4['name']  = 'dcurl';
        $attr4['title'] = '新建目录';
        $attr4['class'] = 'btn btn-primary';
        $attr4['href']  = U('addMenu');
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('视频活码') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr)
                ->addTopButton('self', $attr2)
                ->addTopButton('self', $attr4)
                ->setSearch('请输入ID或视频名称', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '视频名称')
                ->addTableColumn('huoma', '活码地址')
                ->addTableColumn('count', '扫码次数')
                ->addTableColumn('ewm', '二维码', 'img')
                ->addTableColumn('create_time', '添加时间', 'time')
                ->addTableColumn('status', '状态')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表
                ->setTableDataPage($page->show()) // 数据列表分页
                ->addRightButton('edit')          // 添加编辑按钮
                ->addRightButton('delete')        // 添加删除按钮
                ->addRightButton('self', $attr3)
                ->display();
    }

    /**
     * 视频活码子目录列表
     * 
     */
    public function child() {
        $type = I('get.type/d');
        $map = ['uid'=>$this->uid,'type'=>2,'menuId'=>$type];
        // 搜索
        $keyword   = I('keyword', '', 'string');
        if ( $keyword ){
            $map['id|title'] = array('like','%'.$keyword.'%');
        }

        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $data_list = $this->obj
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('id desc')
                   ->select();

        foreach( $data_list as $k => $v ){
            $data_list[$k]['ewm']     = "Uploads/ewm/".$v['id'].'.png';
            $data_list[$k]['status']  = domainStatus($v['status']);
        }
        $page = new Page(
            $this->obj->where($map)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $attr['name']  = 'dcurl';
        $attr['title'] = '导出活码地址';
        $attr['class'] = 'btn btn-primary';
        $attr['href']  = U('outurl',['type'=>$type]);
        $attr2['name']  = 'xzewm';
        $attr2['title'] = '下载二维码';
        $attr2['class'] = 'btn btn-primary';
        $attr2['href']  = U('xzewm',['type'=>$type]);
        $attr3['name']  = 'view';
        $attr3['title'] = '数据统计';
        $attr3['class'] = 'label label-info';
        $attr3['href']  = U('view',['type'=>$type,'id'=>'__data_id__','code'=>'3']);
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('视频活码') // 设置页面标题
                ->addTopButton('addnew', ['href'=>U('add',['type'=>$type])])  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr)
                ->addTopButton('self', $attr2)
                ->setSearch('请输入ID或视频名称', U('child',['type'=>$type]))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '视频名称')
                ->addTableColumn('huoma', '活码地址')
                ->addTableColumn('count', '播放次数')
                ->addTableColumn('ewm', '二维码', 'img')
                ->addTableColumn('create_time', '添加时间', 'time')
                ->addTableColumn('status', '状态')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表
                ->setTableDataPage($page->show()) // 数据列表分页
                ->addRightButton('edit', ['href'=>U('edit',['type'=>$type,'id'=>'__data_id__'])])          // 添加编辑按钮
                ->addRightButton('delete')        // 添加删除按钮
                ->addRightButton('self', $attr3)
                ->display();
    }

    /**
     * 新建目录
    */
    public function addMenu() {
        if (IS_POST) {
            $time = time();
            $mod  = M('admin_menu');
            $data['pid']        = $mod->getFieldByTitle('视频活码','id');
            $data['user_id']    = session('user_auth.uid');
            $data['title']      = I('title/s');
            $data['url']        = 'Admin/Video/child/type/'.$time;
            $data['create_time']= time();
            empty($data['title']) ? $this->error('请输入目录名称') : '';
            if ($data) {
                $id = $mod->add($data);
                if ($id) {
                    $data['pid'] = $id;
                    $data['status'] = -1;
                    $data['title'] = '新增';
                    $data['url']        = 'Admin/Video/add/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '导出';
                    $data['url']        = 'Admin/Video/outurl/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '下载二维码';
                    $data['url']        = 'Admin/Video/xzewm/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '查看数据统计';
                    $data['url']        = 'Admin/Video/view/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '编辑';
                    $data['url']        = 'Admin/Video/edit/type/'.$time;
                    $mod->add($data);
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($mod->getError());
            }
        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('新建目录') //设置页面标题
                    ->setPostUrl(U('addMenu'))    //设置表单提交地址
                    ->addFormItem('title', 'text', '新建目录名称')
                    ->display();
        }
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
            $where['type'] = 2;
            $where['uid']  = $this->uid;
            $where['id']   = array('between',array($ksid,$endid));
            $rs=M('cms_phone')->where($where)->order('id')->select();
            if (!$rs) {
                $this->error('找不到该区间的文件，请输入正确的ID');
            }
            $str = "id,视频名称,活码地址\n";
            foreach( $rs as $v){
                $str .= $v['id'].",".$v['title'].",".$v['huoma']."\n";
            }

            $str = iconv('utf-8','gb2312',$str);
            $filename = date('Ymd').'.csv';
            export_csv($filename,$str);
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
    /**
     * 下载二维码
     */
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
            $where['type'] = 2;
            $where['uid']  = $this->uid;
            $where['id']   = array('between',array($ksid,$endid));
            $rs=M('cms_phone')->where($where)->getField('id',true);
            if (!$rs) {
                $this->error('找不到该区间的文件，请输入正确的ID');
            }
            foreach( $rs as $v  ){
                $images[]="Uploads/ewm/".$v.".png";
            }
            $zip = new \ZipArchive;
            $zipDir = 'Uploads/ewm/'.date('Ymd');
            if (!is_dir($zipDir)) {
                mkdir($zipDir, 0777, true);
            }
            $zip = new \ZipArchive;
            $filename = $zipDir.'/'.time().'.zip';
            //$zip->open($filename,\ZipArchive::OVERWRITE);
            $zip->open($filename, \ZipArchive::CREATE);
            foreach ($images as $key => $value) {
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
            //判断用户当前套餐活码数量是否已达上限
            $countLimit = userLivecodeCountLimit();
            if (!$countLimit) {
                $this->error('活码创建数量已达上限，请在续费管理中升级套餐');
            }
            //判断用户当前空间容量是否已达上限
            $zoneLimit = userUploadZoneLimit();
            if (!$zoneLimit) {
                $this->error('空间容量已达上限，请在续费管理中升级套餐');
            }
            $zoneSize = getUserZoneSize($this->uid);
            $user = D('user')->getUserInfo($this->uid);
            $vip_zoneSize = M('vip')->where(['id'=>$user['vipId']])->getField('zone_size');
            if ($vip_zoneSize != 0 && $zoneSize >= $vip_zoneSize) {
                $this->error('活码空间容量已达上限，请在续费管理中升级套餐');
            }

            $data = I('post.');
            // halt($data['videourl']);

            //判断文件是否存在
            if (!file_exists($data['videourl'])) {
                $this->error('文件不存在');
            }
            $data['create_time'] = NOW_TIME;
            $data['update_time'] = NOW_TIME;
            $data['uid']         = $this->uid;
            $data['d']           = get_dwz();
            $data['type']        = 2;
            $user                = D('user')->getUserInfo($this->uid);
            $data['status']      = ($user['ifCheck'] == -1)?1:0;
            $data['huoma']       = setLivecodeUrl('',$data['d']);

            $id = $this->obj->add($data);
            if ($id) {
                qrcode($data['huoma'],$id,3);
                $this->success(['type'=>$data['menuId']]);
            } else {
                $this->error('新增失败');
            }
        } else {
            $this->meta_title = '新增视频活码';
            $this->assign('menuId',I('get.type/d'));
            $this->display();
        }
    }

    /**
     * 编辑视频跳转
     * 
     */
    public function edit($id) {
        if (IS_POST) {
            //判断用户当前空间容量是否已达上限
            $zoneLimit = userUploadZoneLimit();
            if (!$zoneLimit) {
                $this->error('空间容量已达上限，请在续费管理中升级套餐');
            }

            $data = I('post.');
            //判断文件是否存在
            if (!file_exists($data['videourl'])) {
                $this->error('文件不存在');
            }
            $user           = D('user')->getUserInfo($this->uid);
            $data['status'] = ($user['ifCheck'] == -1)?1:0;
            $data['update_time'] = NOW_TIME;
            
            $result = $this->obj->save($data);
            if ($result !== false) {
                $this->success(['type'=>$data['menuId']]);
            } else {
                $this->error('更新失败');
            }
        } else {
            $data = $this->obj->where(['id'=>$id,'type'=>2,'uid'=>$this->uid])->find();
            if (!$data) {
                $this->error('数据不存在');
            }
            $this->assign('data',$data);
            $this->meta_title = '编辑视频活码';
            $this->assign('menuId',I('get.type/d'));
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
           
            $data['create_time']=NOW_TIME;
            $data['update_time']=NOW_TIME;
            $data['uid']=$this->uid;
            foreach( $txtarr as $v  )
            {
              
            $data['title']=$v;
             $rs=$this->obj->where(array('title'=>$v))->find();
            if ( $rs )
            {
            /*$data['id']=$rs['id'];
             $user_object->save($data);
             $ewmid=$rs['id'];*/
            }else{
              $data['d']=get_dwz();
            $data['huoma']=get_huomaurl($data['d']);
             //unset($data['id']);
                $ewmid=$this->obj->add($data);
               qrcode($data['huoma'],$ewmid,3);
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
        if ( $status=='delete' ) {
            if (is_array($ids)) {  
                foreach( $ids as $v  ){                    
                    $videourl = $this->obj -> where(array('id' => $v)) -> getField('videourl');
                    unlink($videourl);
                    unlink("Uploads/ewm/".$v.'.png');
                }
            } else {
                $videourl = $this->obj -> where(array('id' => $ids)) -> getField('videourl');
                unlink($videourl);
                unlink("Uploads/ewm/".$ids.'.png');
            }
        }
        parent::setStatus('phone');
    }

    /**
     * 上传视频
     */
    public function addfile() {
        if($_SERVER['REQUEST_METHOD'] == "POST"){
            $upload = new \Think\Upload();// 实例化上传类
            $upload->rootPath  =     'Uploads/video/file/'; // 设置附件上传根目录
            $upload->savePath  =     ''; // 设置附件上传（子）目录+
            // 上传文件 
            $info   =   $upload->upload();
            if(!$info) {// 上传错误提示错误信息
                $this->error('上传失败！');
            }else{// 上传成功
                $size = getFilesize($info['file']['size']);
                $url  = $info['file']['savepath'].$info['file']['savename'];

                $data['code']   = 0;
                $data['msg']    = '上传成功';
                $data['uploadFileName'] = $info['file']['name'];
                $data['uploadFileSize'] = $size;
                $data['uploadFileUrl']  = $upload->rootPath.$url;
                echo  json_encode($data);
                // $this->success(['uploadFileName'=>$info['file']['name'],'uploadFileSize'=>$size,'uploadFileUrl'=>$upload->rootPath.$url]);
            }
        }
    }

    /**
     * 显示数据统计
     * 
     */
    public function view() {
        $user = D('user')->getUserInfo($this->uid);
        $count_track = M('Vip')->where(['id'=>$user['vipId']])->getField('count_track');
        if ($count_track != 1) {
            $this->error('权限不足！');
        }
        
        $info = I('get.');
        $data = D('Echarts')->getEchartsData($info);

        $this->assign([
            'meta_title' => '数据统计',
            'info'       => $info,
            'data'       => $data,
            ]);
        if ($info['tab'] == '' || $info['tab'] == 'curr') {
            $this->display('public/echarts_line');
        }else{
            $this->display('public/echarts_column');
        }
    }

}

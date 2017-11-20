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
 * 产品活码
 * 
 */
class ProductController extends AdminController {
	/**
     * 初始化
     */
    protected function _initialize() {
        parent::_initialize();
        $this->uid = $this->_user_auth['uid'];
        $this->obj = D('Product');
        //判断用户状态是否正常 && 套餐是否过期
        $this->ifExpired();
        $this->assign('host',$_SERVER['HTTP_HOST']);
    }
    /**
     * 产品活码列表
     * 
     */
    public function index() {
        $where = ['menuId'=>0,'uid'=>$this->uid];
        $keyword   = I('keyword', '', 'string');
        if ( $keyword ){
             $where['id|title'] = array('like','%'.$keyword.'%');
        }
        // 获取所有用户
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        
        $data_list = $this->obj
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($where)
                   ->order('id desc')
                   ->select();
                  
        foreach( $data_list as $k => $v ){
            $data_list[$k]['ewm']     = "Uploads/product/".$v['id'].'.png';
            $data_list[$k]['title']   = LC_Substr($v['title'],0,15,"utf-8",true);
            $data_list[$k]['content'] = '<a href="'.U('detail',array('id'=>$v['id'])).'" class="label label-primary layer2">点击查看</a>';
            $data_list[$k]['status']  = domainStatus($v['status']);
        }      
          
        $page = new Page(
            $this->obj->where($where)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $attr['name']  = 'dcurl';
        $attr['title'] = '新建目录';
        $attr['class'] = 'btn btn-primary';
        $attr['href']  = U('addMenu');
        $attr2['name']  = 'xzewm';
        $attr2['title'] = '下载二维码';
        $attr2['class'] = 'btn btn-primary';
        $attr2['href']  = U('xzewm');
        $attr3['name']  = 'view';
        $attr3['title'] = '数据统计';
        $attr3['class'] = 'label label-info';
        $attr3['href']  = U('view',['id'=>'__data_id__','code'=>'2']);

        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('活码列表') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr2)
                ->addTopButton('self', $attr)
                ->setSearch('请输入ID或产品名称', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '产品名称')
                ->addTableColumn('content', '活码内容')
                ->addTableColumn('count', '扫码次数')
                ->addTableColumn('ewm', '二维码', 'img')
                ->addTableColumn('status', '状态')
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
     * 活码生成子目录列表
     * 
     */
    public function child() {
        $type = I('get.type/d');
        $where = ['menuId'=>$type,'uid'=>$this->uid];
        $keyword   = I('keyword', '', 'string');
        if ( $keyword ){
             $where['id|title'] = array('like','%'.$keyword.'%');
        }
        // 获取所有用户
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        
        $data_list = $this->obj
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($where)
                   ->order('id desc')
                   ->select();
                  
        foreach( $data_list as $k => $v ){
            $data_list[$k]['ewm']     = "Uploads/product/".$v['id'].'.png';
            $data_list[$k]['title']   = LC_Substr($v['title'],0,15,"utf-8",true);
            $data_list[$k]['content'] = '<a href="'.U('detail',array('id'=>$v['id'])).'" class="label label-primary layer2">点击查看</a>';
            $data_list[$k]['status']  = domainStatus($v['status']);
        }      
          
        $page = new Page(
            $this->obj->where($where)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $attr2['name']  = 'xzewm';
        $attr2['title'] = '下载二维码';
        $attr2['class'] = 'btn btn-primary';
        $attr2['href']  = U('xzewm',['type'=>$type]);
        $attr3['name']  = 'view';
        $attr3['title'] = '数据统计';
        $attr3['class'] = 'label label-info';
        $attr3['href']  = U('view',['type'=>$type,'id'=>'__data_id__','code'=>'2']);

        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('活码列表') // 设置页面标题
                ->addTopButton('addnew', ['href'=>U('add',['type'=>$type])])  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr2)
                ->setSearch('请输入ID或活码名称', U('child',['type'=>$type]))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '活码名称')
                ->addTableColumn('content', '活码内容')
                ->addTableColumn('count', '扫描次数')
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
            $data['pid']        = $mod->getFieldByTitle('产品活码','id');
            $data['user_id']    = session('user_auth.uid');
            $data['title']      = I('title/s');
            $data['url']        = 'Admin/Product/child/type/'.$time;
            $data['create_time']= time();
            empty($data['title']) ? $this->error('请输入目录名称') : '';
            if ($data) {
                $id = $mod->add($data);
                if ($id) {
                    $data['pid'] = $id;
                    $data['status'] = -1;
                    $data['title'] = '新增活码';
                    $data['url']        = 'Admin/Product/add/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '下载二维码';
                    $data['url']        = 'Admin/Product/xzewm/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '查看数据统计';
                    $data['url']        = 'Admin/Product/view/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '编辑活码';
                    $data['url']        = 'Admin/Product/edit/type/'.$time;
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
    
    
    public function export_csv($filename,$data) {
        header("Content-type:text/csv");
        header("Content-Disposition:attachment;filename=".$filename);
        header('Cache-Control:must-revalidate,post-check=0,pre-check=0');
        header('Expires:0');
        header('Pragma:public');
        echo $data;
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
            $where['uid']  = $this->uid;
            $where['id']  = array('between',array($ksid,$endid));
            $rs=$this->obj->where($where)->getField('id',true);
            if (!$rs) {
                $this->error('找不到该区间的文件，请输入正确的ID');
            }
            foreach( $rs as $v  ){
                $images[]="Uploads/product/".$v.".png";
            }

            $zipDir = 'Uploads/product/'.date('Ymd');
            if (!is_dir($zipDir)) {
                mkdir($zipDir, 0777, true);
            }
            $zip = new \ZipArchive;
            $filename = $zipDir.'/'.time().'.zip';
            $zip->open($filename,\ZipArchive::CREATE);
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
     * 新增活码
     * 
     */
    public function add() {
        if (IS_POST) {
            $editId = I('post.editId/d');
            if (!empty($editId)) {
                return $this->edit();
            }
            //判断用户当前套餐活码数量是否已达上限
            $limit = userLivecodeCountLimit();
            if (!$limit) {
                $this->error('活码创建数量已达上限，请在续费管理中升级套餐');
            }

            $data = $this->obj->create();
            if (!$data) {
                $this->error($this->obj->getError());exit();
            }
            $data['uid']     = $this->uid;
            $data['d']       = get_dwz();
            $data['huoma']   = setLivecodeUrl('product',$data['d']);
            $data['content'] = json_encode($data['content']);
            $user            = D('user')->getUserInfo($this->uid);
            $data['status']  = ($user['ifCheck'] == -1)?1:0;
            //执行添加
            $id = $this->obj->add($data);
            if ($id) {
                qrcode($data['huoma'],$id,6);
                if ($data['menuId']) {
                    $this->success(['type'=>$data['menuId']], '/Uploads/product/'.$id.'.png');
                }
                $this->success('新增成功', '/Uploads/product/'.$id.'.png');
            } else {
                $this->error('新增失败');
            }
            
        } else {
            //插入名片
            $vcards = D('Livecode')->field('content,huoma')->where(['uid'=>$this->uid,'type'=>5,'status'=>1])->select();
            if ($vcards) {
                foreach ($vcards as $key => $v) {
                    $vcards[$key]['content'] = json_decode($v['content'],true);
                }
            }

            $this->meta_title = '新增产品活码';
            $this->assign([
                'meta_title' => '新增产品活码',
                'menuId'     => I('get.type/d'),
                'isUser'     => 1,
                'vcards'     => $vcards,
            ]);
            $this->display();
        }
    }

    /**
     * 编辑活码
     * 
     */
    public function edit($id) {
        if (IS_POST) {
            $info=I('post.');
            $data = $this->obj->create();
            if (!$data) {
                $this->error($this->obj->getError());exit();
            }

            $data['uid']     = $this->uid;
            $data['content'] = json_encode($data['content']);
            $data['id']      = $info['editId'];
            $user            = D('user')->getUserInfo($this->uid);
            $data['status']  = ($user['ifCheck'] == -1)?1:0;

            $result = $this->obj->save($data);
            if ($result) {
                if ($data['menuId']) {
                    $this->success(['type'=>$data['menuId']], '/Uploads/product/'.$data['id'].'.png');
                }
                $this->success('', '/Uploads/product/'.$data['id'].'.png');
            } else {
                $this->error('更新失败');
            }
        } else {
            $data = $this->obj->where(['id'=>$id,'uid'=>$this->uid])->find();
            if (!$data) {
                $this->error('数据不存在');
            }
            $content = json_decode($data["content"]) ;
            foreach ($content as $key => $value) {
                $data[$key] = $value;
            }
            //插入名片
            $vcards = D('Livecode')->field('content,huoma')->where(['uid'=>$this->uid,'type'=>5,'status'=>1])->select();
            if ($vcards) {
                foreach ($vcards as $key => $v) {
                    $vcards[$key]['content'] = json_decode($v['content'],true);
                }
            }

            $this->assign([
                'meta_title' => '编辑产品活码',
                'menuId'     => I('get.type/d'),
                'data'       => $data,
                'isUser'     => 1,
                'vcards'     => $vcards,
            ]);
            $this->display('add');
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus($model = CONTROLLER_NAME){
        $ids = I('request.ids');
        $status=I('request.status');
        if ( $status=='delete' ){
            if (is_array($ids)) {
               foreach( $ids as $v  ){ 
                unlink("Uploads/product/".$v.'.png');
               }
            } else {
               unlink("Uploads/product/".$ids.'.png');
            }
        }
        parent::setStatus($model);
    }

    /**
     * 点击查看
     */
    public function detail (){
        $id   = I('id/d');
        $data = $this->obj->where(['id'=>$id,'uid'=>$this->uid])->find();
        if (!$data) {
            return $this->display('Public/unfined');
        }

        $content = json_decode($data["content"]) ;
        foreach ($content as $key => $value) {
            $data[$key] = $value;
        }
        $data['type'] = 6;
        $data['picUrl'] = '/Uploads/product/file/'.$data['picUrl'];
        $this->assign('data',$data);
        $this->display('Livecode/live_text');
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

    /**
     * 上传文件
     */
    public function addfile() {
        if($_SERVER['REQUEST_METHOD'] == "POST"){
            $upload = new \Think\Upload();// 实例化上传类
            $upload->rootPath  =     'Uploads/product/file/'; // 设置附件上传根目录
            $upload->savePath  =     ''; // 设置附件上传（子）目录+
            // 上传文件 
            $info   =   $upload->upload();
            if(!$info) {// 上传错误提示错误信息
                $this->error('上传失败！');
            }else{// 上传成功
                $size = getFilesize($info['file']['size']);
                $url  = $info['file']['savepath'].$info['file']['savename'];
                $targetUrl  = '/Uploads/product/file/'.$url;
                echo json_encode(['status'=>1,'info'=>'上传成功','data'=>$url,'fileName'=>$info['file']['name'],'fileSize'=>$size,'targetUrl'=>$targetUrl]);
                //$this->success(['uploadFileName'=>$info['file']['name'],'uploadFileSize'=>$size,'uploadFileUrl'=>$url]);
            }
        }
    }

    /**
     * 返回json页面
     */
    public function getJsonHtml() {
        $dataType = I('get.data_Type/s');
        echo file_get_contents('Public/product/json/'.$dataType.'.json');
    }
    /**
     * 返回json页面(高级编辑)
     */
    public function getHighJsonHtml() {
        $dataType = I('get.data_Type/s');
        echo file_get_contents('Public/product/json/high/'.$dataType.'.json');
    }

    /**
     * 识别二维码内容
     */
    public function getQrcodeContent() {
        if($_SERVER['REQUEST_METHOD'] == "POST"){
            $upload = new \Think\Upload();// 实例化上传类
            $upload->rootPath  =     'Uploads/product/file/'; // 设置附件上传根目录
            $upload->savePath  =     ''; // 设置附件上传（子）目录+
            // 上传文件 
            $info   =   $upload->upload();
            if(!$info) {// 上传错误提示错误信息
                $this->error('上传失败！');
            }else{// 上传成功
                $url  = $info['file']['savepath'].$info['file']['savename'];
                $targetUrl  = '/Uploads/product/file/'.$url;
                Vendor('QrReader.QrReader');
                $qrcode = new \QrReader('http://'.$_SERVER['HTTP_HOST'].$targetUrl);  //图片路径
                $text = $qrcode->text(); //返回识别后的文本
                if (!$qrcode) {
                    $this->error('二维码识别失败，请上传有效的二维码！');
                }
                echo json_encode(['status'=>1,'info'=>'上传成功','data'=>$text]);
            }
        }
    }
    /**
     * 生成微信二维码图片
     */
    public function qrWXcode() {
        $ewm = I('post.ewm/s');
        $fileName = md5($ewm.time());    
        qrcode($ewm,$fileName,6);
        echo '/Uploads/product/'.$fileName.'.png';
    }

}

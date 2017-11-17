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
 * 网址跳转控制器
 * 
 */
class PhoneController extends AdminController {
	protected function _initialize() {
	    parent::_initialize();
		$this->uid=$this->_user_auth['uid'];
        $this->obj = D('Phone');
        //判断用户状态是否正常 && 套餐是否过期
        $this->ifExpired();
	}
    /**
     * 网址跳转列表
     * 
     */
    public function index() {
        $map = ['uid'=>$this->uid,'type'=>1,'menuId'=>0];
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
            $data_list[$k]['ewm']    = "Uploads/phone/".$v['id'].'.png';
            $data_list[$k]['status'] = domainStatus($v['status']);
        }           
        $page = new Page(
            $this->obj->where($map)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $attr['name']  = 'dcurl';
	    $attr['title'] = '导出网址';
	    $attr['class'] = 'btn btn-primary';
	    $attr['href']  = U('outurl');
	    $attr2['name']  = 'xzewm';
	    $attr2['title'] = '下载二维码';
	    $attr2['class'] = 'btn btn-primary';
	    $attr2['href']  = U('xzewm');
	    $attr3['name']  = 'edittzwz';
	    $attr3['title'] = '批量修改跳转网址';
	    $attr3['class'] = 'btn btn-primary';
	    $attr3['href']  = U('edittzwz');
	    $attr4['name']  = 'edittzwz';
	    $attr4['title'] = '批量导入网址';
	    $attr4['class'] = 'btn btn-primary';
	    $attr4['href']  = U('drurl');
        $attr5['name']  = 'view';
        $attr5['title'] = '数据统计';
        $attr5['class'] = 'label label-info';
        $attr5['href']  = U('view',['id'=>'__data_id__','code'=>'4']);
        $attr6['name']  = 'dcurl';
        $attr6['title'] = '新建目录';
        $attr6['class'] = 'btn btn-primary';
        $attr6['href']  = U('addMenu');
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('网址跳转') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr)
                ->addTopButton('self', $attr2)
                ->addTopButton('self', $attr3)
                ->addTopButton('self', $attr4)
                ->addTopButton('self', $attr6)
                ->setSearch('请输入ID或网址名称', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '网址名称')
                ->addTableColumn('videourl', '跳转网址')
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
                ->addRightButton('self', $attr5)
                ->display();
    }

    /**
     * 网址跳转子目录列表
     * 
     */
    public function child() {
        $type = I('get.type/d');
        $map = ['uid'=>$this->uid,'type'=>1,'menuId'=>$type];
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
            $data_list[$k]['ewm']     = "Uploads/phone/".$v['id'].'.png';
            $data_list[$k]['status']  = domainStatus($v['status']);
        }
        $page = new Page(
            $this->obj->where($map)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $attr['name']  = 'dcurl';
        $attr['title'] = '导出网址';
        $attr['class'] = 'btn btn-primary';
        $attr['href']  = U('outurl',['type'=>$type]);
        $attr2['name']  = 'xzewm';
        $attr2['title'] = '下载二维码';
        $attr2['class'] = 'btn btn-primary';
        $attr2['href']  = U('xzewm',['type'=>$type]);
        $attr3['name']  = 'edittzwz';
        $attr3['title'] = '批量修改跳转网址';
        $attr3['class'] = 'btn btn-primary';
        $attr3['href']  = U('edittzwz',['type'=>$type]);
        $attr4['name']  = 'edittzwz';
        $attr4['title'] = '批量导入网址';
        $attr4['class'] = 'btn btn-primary';
        $attr4['href']  = U('drurl',['type'=>$type]);
        $attr5['name']  = 'view';
        $attr5['title'] = '数据统计';
        $attr5['class'] = 'label label-info';
        $attr5['href']  = U('view',['type'=>$type,'id'=>'__data_id__','code'=>'4']);
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('网址跳转') // 设置页面标题
                ->addTopButton('addnew', ['href'=>U('add',['type'=>$type])])  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr)
                ->addTopButton('self', $attr2)
                ->addTopButton('self', $attr3)
                ->addTopButton('self', $attr4)
                ->setSearch('请输入ID或网址名称', U('child',['type'=>$type]))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '网址名称')
                ->addTableColumn('videourl', '跳转网址')
                ->addTableColumn('huoma', '活码地址')
                ->addTableColumn('count', '扫码次数')
                ->addTableColumn('ewm', '二维码', 'img')
                ->addTableColumn('create_time', '添加时间', 'time')
                ->addTableColumn('status', '状态')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表
                ->setTableDataPage($page->show()) // 数据列表分页
                ->addRightButton('edit', ['href'=>U('edit',['type'=>$type,'id'=>'__data_id__'])])          // 添加编辑按钮
                ->addRightButton('delete')        // 添加删除按钮
                ->addRightButton('self', $attr5)
                ->display();
    }

    /**
     * 新建目录
    */
    public function addMenu() {
        if (IS_POST) {
            $time = time();
            $mod  = M('admin_menu');
            $data['pid']        = $mod->getFieldByTitle('网址跳转','id');
            $data['user_id']    = session('user_auth.uid');
            $data['title']      = I('title/s');
            $data['url']        = 'Admin/Phone/child/type/'.$time;
            $data['create_time']= time();
            empty($data['title']) ? $this->error('请输入目录名称') : '';
            if ($data) {
                $id = $mod->add($data);
                if ($id) {
                    $data['pid'] = $id;
                    $data['status'] = -1;
                    $data['title'] = '新增';
                    $data['url']        = 'Admin/Phone/add/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '导出网址';
                    $data['url']        = 'Admin/Phone/outurl/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '下载二维码';
                    $data['url']        = 'Admin/Phone/xzewm/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '批量修改跳转地址';
                    $data['url']        = 'Admin/Phone/edittzwz/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '批量导入';
                    $data['url']        = 'Admin/Phone/drurl/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '编辑';
                    $data['url']        = 'Admin/Phone/edit/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '查看数据统计';
                    $data['url']        = 'Admin/Phone/view/type/'.$time;
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
    		$where['type'] = 1;
            $where['uid']  = $this->uid;
    		$where['id']   = array('between',array($ksid,$endid));
	     	$rs=M('cms_phone')->where($where)->order('id')->select();
            if (!$rs) {
                $this->error('找不到该区间的文件，请输入正确的ID');
            }
            $str = "id,网址名称,跳转网址,活码地址\n";
            foreach( $rs as $v){
            	$str .= $v['id'].",".$v['title'].",".$v['videourl'].",".$v['huoma']."\n";
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
    /**
     * 批量修改跳转网址
     */
    public function edittzwz (){
	    if ( IS_POST ){
		    $ksid=I('ksid');
    		$endid=I('endid');
    		if ( !$ksid ){
    			$this->error('请输入旧关键词');
    		}
    		if ( !$endid ){
    			$this->error('请输入新关键词');
    		}
            $user   = D('user')->getUserInfo($this->uid);
            $status = ($user['ifCheck'] == -1)?1:0;

		    M('cms_phone')->execute("UPDATE __CMS_PHONE__ SET videourl = replace(videourl, '$ksid', '$endid'),status = $status");
            $menuId = I('post.menuId/d');
            if ($menuId) {
               $this->success('修改成功', U('child',['type'=>$menuId]));
            }
	     	$this->success('修改成功',U('index'));	
	    }else{
	        // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('批量修改跳转网址') //设置页面标题
                    ->setPostUrl(U('edittzwz'))    //设置表单提交地址
                    ->addFormItem('menuId', 'hidden')
                    ->addFormItem('ksid', 'text', '旧关键词')
                    ->addFormItem('endid', 'text', '新关键词')
                    ->setFormData(['menuId' => I('get.type/d')])
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
            $where['type'] = 1;
            $where['uid']  = $this->uid;
            $where['id']   = array('between',array($ksid,$endid));
    		$rs=M('cms_phone')->where($where)->getField('id',true);
            if (!$rs) {
                $this->error('找不到该区间的文件，请输入正确的ID');
            }
    		foreach( $rs as $v  ){
    			$images[]="Uploads/phone/".$v.".png";
    		}
    	    $zip = new \ZipArchive;
            $zipDir = 'Uploads/phone/'.date('Ymd');
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
     * 新增网址跳转
     * 
     */
    public function add() {
        if (IS_POST) {
            //判断用户当前套餐活码数量是否已达上限
            $limit = D('Livecode')->userLivecodeCountLimit();
            if (!$limit) {
                $this->error('活码创建数量已达上限，请在续费管理中升级套餐');
            }
            
            $data['create_time'] =NOW_TIME;
            $data['update_time'] =NOW_TIME;
            $data['title']       =I('post.title/s');
            $data['videourl']    =I('post.videourl/s');
            $data['uid']         =$this->uid;
            $data['d']           =get_dwz();
            $data['huoma']       = setLivecodeUrl('',$data['d']);
            $data['menuId']      = I('post.type/d');
            $user                = D('user')->getUserInfo($this->uid);
            $data['status']      = ($user['ifCheck'] == -1)?1:0;
            if ( !$data['title'] ){
                $this->error('请输入网址名称');
            }
            if ( !$data['videourl'] ){
                $this->error('请输入跳转网址');
            }

            $id = $this->obj->add($data);
            if ($id) {
                qrcode($data['huoma'],$id,4);
                if ($data['menuId']) {
                   $this->success('新增成功', U('child',['type'=>$data['menuId']]));
                }
                $this->success('新增成功', U('index'));
            } else {
                $this->error('新增失败');
            }
        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('新增网址跳转') //设置页面标题
                    ->setPostUrl(U('add'))    //设置表单提交地址
                    ->addFormItem('title', 'text', '网址名称')
                    ->addFormItem('type', 'hidden')
                    ->addFormItem('videourl', 'text', '跳转网址','请在网址前添加http://,确保网址完整！','','',"placeholder='http://'")
                    ->setFormData(['type'=>I('get.type/d')])
                    ->display();
        }
    }

    /**
     * 编辑网址跳转
     * 
     */
    public function edit($id) {
        if (IS_POST) {
            // 提交数据
            $data = $this->obj->create();   
            if ($data) {
                $user           = D('user')->getUserInfo($this->uid);
                $data['status'] = ($user['ifCheck'] == -1)?1:0;
                $result         = $this->obj->save($data);
                if ($result) {
                    if ($data['menuId']) {
                       $this->success('更新成功', U('child',['type'=>$data['menuId']]));
                    }
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败');
                }
            } else {
                $this->error($this->obj->getError());
            }
        } else {
            $info = D('Phone')->where(['id'=>$id,'type'=>1,'uid'=>$this->uid])->find();
            if (!$info) {
                $this->error('数据不存在');
            }
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('编辑网址跳转')  // 设置页面标题
                    ->setPostUrl(U('edit'))    // 设置表单提交地址
                    ->addFormItem('id', 'hidden', 'ID', 'ID')
                    ->addFormItem('menuId', 'hidden')
                    ->addFormItem('title', 'text', '网址名称')
                    ->addFormItem('videourl', 'text', '跳转网址','请在网址前添加http://,确保网址完整！','','',"placeholder='http://'")
                    ->setFormData($info)
                    ->display();
        }
    }

    /**
     * 批量导入
     */
    public function drurl() {
        if (IS_POST) {
	        $file=I('file');
	        if ( !$file ){
	        	$this->error('请上传文件');
	        }
	        $filename=get_upload_info($file,'path');
	        if ( !$filename ){
	        	$this->error('请上传文件');
	        }
	        $txtarr=file( getcwd().$filename, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
	        if ( !is_array($txtarr) ){
	        	$this->error('读取失败，请确认txt格式是否符合要求');
	        }
            $data['menuId']      = I('post.menuId/d');
            $data['uid']         = $this->uid;
            $data['create_time'] = NOW_TIME;
            $data['update_time'] = NOW_TIME;
            $user                = D('user')->getUserInfo($this->uid);
            $data['status']      = ($user['ifCheck'] == -1)?1:0;
            foreach( $txtarr as $v  ){
    	        $data['videourl']=$v;
    	        $rs=$this->obj->where(array('videourl'=>$v))->find();
    	        if ( $rs ){
        	        /*$data['id']=$rs['id'];
        	       	 $user_object->save($data);
        	       	 $id=$rs['id'];*/
    	        }else{
    		        $data['d']=get_dwz();
                    $data['huoma'] = setLivecodeUrl('',$data['d']);
    		        $id=$this->obj->add($data);
    		        qrcode($data['huoma'],$id,4);
    		    }    
            }
            if ($data['menuId']) {
               $this->success('导入成功', U('child',['type'=>$data['menuId']]));
            }
            $this->success('导入成功', U('index'));
        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('导入网址') //设置页面标题
                    ->setPostUrl(U('drurl'))    //设置表单提交地址
                    ->addFormItem('menuId', 'hidden')
                    ->addFormItem('file', 'file', '上传文件','上传需要导入的网址文件，格式为一行一个网址，文档格式为txt')
                    ->setFormData(['menuId' => I('get.type/d')])
                    ->display();
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
               	    unlink("Uploads/phone/".$v.'.png');
                }
            } else {
               unlink("Uploads/phone/".$ids.'.png');
            }
        }
        parent::setStatus($model);
    }

    /**
     * 显示数据统计
     * 
     */
    public function view() {
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

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
 * 活码生成控制器
 * 
 */
class LivecodeController extends AdminController {
    /**
     * 初始化
     */
	protected function _initialize() {
	    parent::_initialize();
        $this->uid = $this->_user_auth['uid'];
        $this->obj = D('Livecode');
	}
    /**
     * 活码生成列表
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
// halt($data_list);
                  
        foreach( $data_list as $k => $v ){
            $data_list[$k]['ewm']     = "Uploads/livecode/".$v['id'].'.png';
            $data_list[$k]['type']    = codeType($v['type']);
            $data_list[$k]['title']   = LC_Substr($v['title'],0,15,"utf-8",true);
            if ($v['type'] == 3) {
                $data_list[$k]['content']   = json_decode($v['content'],true)['url'];
            }else{
                $data_list[$k]['content'] = LC_Substr($v['content'],0,20,"utf-8",true);
            }
        }      
          
        $page = new Page(
            $this->obj->where($map)->count(),
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
        $attr3['href']  = U('view',['id'=>'__data_id__','code'=>'1']);

        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('活码列表') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr)
                ->addTopButton('self', $attr2)
                ->setSearch('请输入ID或活码名称', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '活码名称')
                ->addTableColumn('type', '活码类型')
                ->addTableColumn('content', '活码内容')
                ->addTableColumn('count', '扫描次数')
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
     * 活码生成子目录列表
     * 
     */
    public function child() {
        // 搜索
        $keyword   = I('keyword', '', 'string');
        if ( $keyword ){
             $map['id|huoma'] = array('like','%'.$keyword.'%');
        }
        // 获取所有用户
        $map['status'] = array('egt', '0'); // 禁用和正常状态
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        
        $data_list = $this->obj
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('id desc')
                   ->select();
                  
        foreach( $data_list as $k => $v )
        {
            $data_list[$k]['ewm']="Uploads/duourl/".$v['id'].'.png';
            $data_list[$k]['title']='<a href="'.U('detail',array('id'=>$v['id'])).'" class="label label-primary layer2">点击查看</a>';
        }      
          
        $page = new Page(
            $this->obj->where($map)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $attr2['name']  = 'xzewm';
        $attr2['title'] = '下载二维码';
        $attr2['class'] = 'btn btn-primary';
        $attr2['href']  = U('xzewm',['type'=>I('type/d')]);
        $attr4['name']  = 'add';
        $attr4['title'] = '新增';
        $attr4['class'] = 'btn btn-primary';
        $attr4['href']  = U('add',['type'=>I('type/d')]);
        $attr5['name']  = 'view';
        $attr5['title'] = '数据统计';
        $attr5['class'] = 'label label-info';
        $attr5['href']  = U('view',['id'=>'__data_id__','code'=>'1']);

        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('活码列表') // 设置页面标题
                ->addTopButton('addnew', $attr4)  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr2)
                ->setSearch('请输入ID或活码名称', U('child',['type'=>I('type/d')]))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '跳转网址')
                ->addTableColumn('huoma', '活码地址')
                ->addTableColumn('ewm', '二维码', 'img')
                ->addTableColumn('create_time', '添加时间', 'time')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表
                ->setTableDataPage($page->show()) // 数据列表分页
                ->addRightButton('edit', ['href'=>U('edit',['type'=>I('type/d'),'id'=>'__data_id__'])])          // 添加编辑按钮
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
            $data['pid']        = $mod->getFieldByTitle('活码生成','id');
            $data['user_id']    = session('user_auth.uid');
            $data['title']      = I('title/s');
            $data['url']        = 'Admin/Livecode/child/type/'.$time;
            $data['create_time']= time();
            empty($data['title']) ? $this->error('请输入目录名称') : '';
            if ($data) {
                $id = $mod->add($data);
                if ($id) {
                    $data['pid'] = $id;
                    $data['status'] = -1;
                    $data['title'] = '新增活码';
                    $data['url']        = 'Admin/Livecode/add/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '下载二维码';
                    $data['url']        = 'Admin/Livecode/xzewm/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '查看数据统计';
                    $data['url']        = 'Admin/Livecode/view/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '编辑活码';
                    $data['url']        = 'Admin/Livecode/edit/type/'.$time;
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
    		if ( !$ksid )
    		{
    			$this->error('请输入开始ID');
    		}
    		if ( !$endid )
    		{
    			$this->error('请输入结束ID');
    		}
    		// $where['type']=1;
    		$where['id']  = array('between',array($ksid,$endid));
    		$rs=$this->obj->where($where)->getField('id',true);
    		foreach( $rs as $v  )
    		{
    			$images[]="Uploads/duourl/".$v.".png";
    		}
        		
        	$zip = new \ZipArchive;
            $filename = date('Ymd').'img.zip';
            $zip->open($filename,\ZipArchive::OVERWRITE);
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
            $type = I('post.type/d');
            
            if ($type == 1) {           //图文活码
                # code...
            }elseif ($type == 2 || $type == 3 || $type == 4) {      //文本活码 || 文件活码 || 网址导航
                $data = $this->obj->create();
                if (!$data) {
                    $this->error($this->obj->getError());exit();
                }
                $data['uid']   = $this->uid;
                $data['d']     = get_dwz();
                $data['huoma'] = get_liveurl($data['d']);
            }
            if ($type == 3) {
                $data['content']   = json_encode($data['content']);
            }
            //执行添加
            $id = $this->obj->add($data);
            if ($id) {
                qrcode($data['huoma'],$id,1);
                $this->success('新增成功', '/Uploads/livecode/'.$id.'.png');
            } else {
                $this->error('新增失败');
            }
            
        } else {
            $this->meta_title = '新增活码';
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
            $info['title']=array_filter($info['title']);
            $info['tztime']=array_filter($info['tztime']);
          
            if ( !$info['title'] ){
	        	$this->error('请输入跳转网址');
	        }  
            if ( $info['tztype']==3 ){
	        	if ( count($info['title'])!=count($info['tztime']) ){
	        		$this->error('请确认对应跳转网址是否完整输入跳转时间');
	        	}
	            $data['tztime']=implode('|||',$info['tztime']);
	        }
            $data['title']=implode('|||',$info['title']);
            $data['update_time']=NOW_TIME;
            $data['id']=$info['id'];
            $data['tztype']=$info['tztype'];
            if ($data) {
                $result = $this->obj->save($data);
                if ($result) {
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败', $this->obj->getError());
                }
            } else {
                $this->error($this->obj->getError());
            }
        } else {
            $this->meta_title = '编辑活码';
            $info = $this->obj->find($id);
            $info['title']=explode('|||',$info['title']);
            $info['tztime']=explode('|||',$info['tztime']);
            $this->assign('info',$info);
            $this->display();
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
               	unlink("Uploads/duourl/".$v.'.png');
               }
            } else {
               unlink("Uploads/duourl/".$ids.'.png');
            }
        }
        parent::setStatus($model);
    }

    public function edittzwz ()
    {
	    	if ( IS_POST )
	        	{
		        	$ksid=I('ksid');
		
		if ( !$ksid )
		{
			$this->error('请输入需要修改的ID');
		}
		$rs=$this->obj->find($ksid);
		if ( !$rs )
		{
			$this->error('没有找到此id的相关信息');
		}
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
	        $data['id']=$ksid;
	        $data['title']=implode('|||',$txtarr);
	        $data['update_time']=NOW_TIME;
	        $this->obj->save($data);
	     	$this->success('修改成功',U('index'));
	        	}else{
	    // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('批量修改跳转网址') //设置页面标题
                    ->setPostUrl(U('edittzwz'))    //设置表单提交地址
                    ->addFormItem('ksid', 'text', '需要修改的ID')
                    ->addFormItem('file', 'file', '上传修改网址','上传需要导入的网址文件，格式为一行一个网址，文档格式为txt')
                    
                    ->display();
	        	}
    
    }
    public function detail ()
    {
    	$id=I('id');
    	$info=$this->obj->find($id);
    	$info['title']=str_replace('|||','</br>',$info['title']);
    	$this->assign('info',$info);
    	$this->display();
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

    /**
     * 上传文件
     */
    public function addfile() {
        if($_SERVER['REQUEST_METHOD'] == "POST"){
            $upload = new \Think\Upload();// 实例化上传类
            $upload->rootPath  =     'Uploads/livecode/file/'; // 设置附件上传根目录
            $upload->savePath  =     ''; // 设置附件上传（子）目录+
            // 上传文件 
            $info   =   $upload->upload();
            // halt($info);
            if(!$info) {// 上传错误提示错误信息
                $this->error('上传失败！');
            }else{// 上传成功
                $size = getFilesize($info['file']['size']);
                $url  = $info['file']['savepath'].$info['file']['savename'];
                $this->success(['uploadFileName'=>$info['file']['name'],'uploadFileSize'=>$size,'uploadFileUrl'=>$url]);
            }
        }
    }

}

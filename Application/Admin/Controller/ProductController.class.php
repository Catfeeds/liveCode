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
	protected function _initialize() {
  	    parent::_initialize();
  		$this->uid=$this->_user_auth['uid'];
  		$this->obj=D('Livecode');
	}
    /**
     * 活码生成列表
     * 
     */
    public function index() {
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
                  
        foreach( $data_list as $k => $v ){
        	$data_list[$k]['ewm']="Uploads/duourl/".$v['id'].'.png';
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
        $attr3['name']  = 'edittzwz';
        $attr3['title'] = '查看数据统计';
        $attr3['class'] = 'btn btn-primary';
        $attr3['href']  = U('view');
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('活码列表') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr)
                ->addTopButton('self', $attr2)
                 ->addTopButton('self', $attr3)
                ->setSearch('请输入id或活码名称', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '活码名称')
                ->addTableColumn('title', '活码类型')
                ->addTableColumn('huoma', '活码内容')
                ->addTableColumn('title', '扫描次数')
                 ->addTableColumn('ewm', '二维码', 'img')
                ->addTableColumn('create_time', '添加时间', 'time')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表

                ->setTableDataPage($page->show()) // 数据列表分页
                 ->addRightButton('edit')          // 添加编辑按钮
                ->addRightButton('delete')        // 添加删除按钮
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
        $attr3['name']  = 'edittzwz';
        $attr3['title'] = '查看数据统计';
        $attr3['class'] = 'btn btn-primary';
        $attr3['href']  = U('view',['type'=>I('type/d')]);
        $attr4['name']  = 'add';
        $attr4['title'] = '新增';
        $attr4['class'] = 'btn btn-primary';
        $attr4['href']  = U('add',['type'=>I('type/d')]);
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('活码列表') // 设置页面标题
                ->addTopButton('addnew', $attr4)  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr2)
                 ->addTopButton('self', $attr3)
                ->setSearch('请输入id或活码名称', U('child',['type'=>I('type/d')]))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '跳转网址')
                ->addTableColumn('huoma', '活码地址')
                 ->addTableColumn('ewm', '二维码', 'img')
                
                ->addTableColumn('create_time', '添加时间', 'time')
               // ->addTableColumn('status', '状态', 'status')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表
                ->setTableDataPage($page->show()) // 数据列表分页
                 ->addRightButton('edit', ['href'=>U('edit',['type'=>I('type/d'),'id'=>'__data_id__'])])          // 添加编辑按钮
                ->addRightButton('delete')        // 添加删除按钮
                ->display();
    }

    /**
     * 新建目录
    */
    public function addMenu() {
        if (IS_POST) {
            $time = time();
            $mod    = M('admin_menu');
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
    
    /**
     * 查看数据统计
     * 
     */
    public function view() {
        // halt($_GET);

        if (IS_POST) {
           $info=I('post.');
          
          if ( $info['addtype']==1 )
          {
             if ( !$info['file'] )
             {
                $this->error('请上传文件');
             }
             $filename=get_upload_info($info['file'],'path');
            if ( !$filename )
            {
                $this->error('请上传文件');
            }
            $txtarr=file( getcwd().$filename, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
            if ( !is_array($txtarr) )
            {
                $this->error('读取失败，请确认txt格式是否符合要求');
            }
            
            $data['title']=implode('|||',$txtarr);
           
          }else{
               $info['title']=array_filter($info['title']);
            $info['tztime']=array_filter($info['tztime']);
            if ( !$info['title'] )
            {
                $this->error('请输入跳转网址');
            }  
            if ( $info['tztype']==3 )
            {
                if ( count($info['title'])!=count($info['tztime']) )
                {
                    $this->error('请确认对应跳转网址是否完整输入跳转时间');
                }
             $data['tztime']=implode('|||',$info['tztime']);
            }
            $data['title']=implode('|||',$info['title']);
          }
           $data['create_time']=NOW_TIME;
           $data['update_time']=NOW_TIME;
            $data['tztype']=$info['tztype'];
             $data['uid']=$this->uid;
             $data['d']=get_dwz();
            $data['huoma']=get_huomaurlduo($data['d']);
            if ($data) {
                $id = $this->obj->add($data);
                if ($id) {
                     qrcode($data['huoma'],$id,2);
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($this->obj->getError());
            }
        } else {
            $this->meta_title = '查看数据统计';
            $this->display();
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

public function xzewm ()
{
		if ( IS_POST )
	    	{
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
header('Location:'.$filename);
die();
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
     * 新增用户
     * 
     */
    public function add() {
        // halt($_GET);

        if (IS_POST) {
           $info=I('post.');
          
          if ( $info['addtype']==1 )
          {
          	 if ( !$info['file'] )
          	 {
          	 	$this->error('请上传文件');
          	 }
          	 $filename=get_upload_info($info['file'],'path');
	        if ( !$filename )
	        {
	        	$this->error('请上传文件');
	        }
	        $txtarr=file( getcwd().$filename, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
	        if ( !is_array($txtarr) )
	        {
	        	$this->error('读取失败，请确认txt格式是否符合要求');
	        }
	        
	        $data['title']=implode('|||',$txtarr);
	       
          }else{
	           $info['title']=array_filter($info['title']);
            $info['tztime']=array_filter($info['tztime']);
	        if ( !$info['title'] )
	        {
	        	$this->error('请输入跳转网址');
	        }  
	        if ( $info['tztype']==3 )
	        {
	        	if ( count($info['title'])!=count($info['tztime']) )
	        	{
	        		$this->error('请确认对应跳转网址是否完整输入跳转时间');
	        	}
	         $data['tztime']=implode('|||',$info['tztime']);
	        }
	        $data['title']=implode('|||',$info['title']);
          }
           $data['create_time']=NOW_TIME;
           $data['update_time']=NOW_TIME;
            $data['tztype']=$info['tztype'];
             $data['uid']=$this->uid;
             $data['d']=get_dwz();
	        $data['huoma']=get_huomaurlduo($data['d']);
            if ($data) {
                $id = $this->obj->add($data);
                if ($id) {
	                 qrcode($data['huoma'],$id,2);
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($this->obj->getError());
            }
        } else {
           $this->meta_title = '新增活码';
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
            $info=I('post.');
           $info['title']=array_filter($info['title']);
            $info['tztime']=array_filter($info['tztime']);
          
            if ( !$info['title'] )
	        {
	        	$this->error('请输入跳转网址');
	        }  
           if ( $info['tztype']==3 )
	        {
	        	if ( count($info['title'])!=count($info['tztime']) )
	        	{
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
       
        if ( $status=='delete' )
        {
	      
        	 if (is_array($ids)) {
	        	
           foreach( $ids as $v  )
           {
	           
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
}

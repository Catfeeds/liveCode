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
	}
    /**
     * 网址跳转列表
     * 
     */
    public function index() {
        // 搜索
        $keyword   = I('keyword', '', 'string');
        if ( $keyword ){
        	$map['id|title'] = array('like','%'.$keyword.'%');
        }
       
        $map['type']=1;
        // 获取所有用户
        $map['status'] = array('egt', '0'); // 禁用和正常状态
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $user_object = D('Phone');
        $data_list = $user_object
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('id desc')
                   ->select();
                  
        foreach( $data_list as $k => $v )
        {
        	$data_list[$k]['ewm']="Uploads/phone/".$v['id'].'.png';
        }           
        $page = new Page(
            $user_object->where($map)->count(),
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

        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('网址跳转') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr)
                ->addTopButton('self', $attr2)
                ->addTopButton('self', $attr3)
                ->addTopButton('self', $attr4)

                ->setSearch('请输入ID或网址名称', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '网址名称')
                ->addTableColumn('videourl', '跳转网址')
                ->addTableColumn('huoma', '活码地址')
                ->addTableColumn('count', '扫码次数')
                ->addTableColumn('ewm', '二维码', 'img')
                ->addTableColumn('create_time', '添加时间', 'time')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表
                ->setTableDataPage($page->show()) // 数据列表分页
                ->addRightButton('edit')          // 添加编辑按钮
                ->addRightButton('delete')        // 添加删除按钮
                ->addRightButton('self', $attr5)
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
    		$where['type']=1;
    		$where['id']  = array('between',array($ksid,$endid));
	     	$rs=M('cms_phone')->where($where)->order('id')->select();
            $str = "id,跳转网址,活码地址\n";
            foreach( $rs as $v){
            	$str .= $v['id'].",".$v['videourl'].",".$v['huoma']."\n";
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
    		$where['type']=1;
    		$where['id']  = array('between',array($ksid,$endid));

    		$rs=M('cms_phone')->where($where)->getField('id',true);
    		foreach( $rs as $v  ){
    			$images[]="Uploads/ewm/".$v.".png";
    		}
    	    $zip = new \ZipArchive;
            $filename = date('Ymd').'img.zip';
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
            $user_object         = M('cms_phone');
            $data['create_time'] =NOW_TIME;
            $data['update_time'] =NOW_TIME;
            $data['title']       =I('title/s');
            $data['videourl']    =I('videourl/s');
            $data['uid']         =$this->uid;
            $data['d']           =get_dwz();
            $data['huoma']       =get_huomaurl($data['d']);

            if ( !$data['title'] ){
                $this->error('请输入网址名称');
            }
            if ( !$data['videourl'] ){
                $this->error('请输入跳转网址');
            }
            if ($data) {
                $id = $user_object->add($data);
                if ($id) {
	                qrcode($data['huoma'],$id,4);
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('新增网址跳转') //设置页面标题
                    ->setPostUrl(U('add'))    //设置表单提交地址
                    ->addFormItem('title', 'text', '网址名称')
                    ->addFormItem('videourl', 'text', '跳转网址','请在网址前添加http://,确保网址完整！','','',"placeholder='http://'")
                    ->display();
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
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('编辑网址跳转')  // 设置页面标题
                    ->setPostUrl(U('edit'))    // 设置表单提交地址
                    ->addFormItem('id', 'hidden', 'ID', 'ID')
                    ->addFormItem('title', 'text', '网址名称')
                    ->addFormItem('videourl', 'text', '跳转网址','请在网址前添加http://,确保网址完整！','','',"placeholder='http://'")
                    ->setFormData($info)
                    ->display();
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
		       qrcode($data['huoma'],$ewmid,4);
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
    public function setStatus($model = CONTROLLER_NAME){
        $ids = I('request.ids');
        
        $status=I('request.status');
       
        if ( $status=='delete' )
        {
	      
        	 if (is_array($ids)) {
	        	
           foreach( $ids as $v  )
           {
	           
           	unlink("Uploads/ewm/".$v.'.png');
           }
          
        } else {
           unlink("Uploads/ewm/".$ids.'.png');
        }
        }
       
        parent::setStatus($model);
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
        $this->display();
    }

    /**
     * 获取统计报表数据
     */
    public function getEchartsData(){
        $id        = I('post.id/d');
        $code      = I('post.code/d');
        $startDate = I('post.startDate/s');
        $endDate   = I('post.endDate/s');

        $mod  = D('Echarts');
        $data = $mod->getEchartsData($id,$code,$startDate,$endDate);
        $this->success($data);
    }


}

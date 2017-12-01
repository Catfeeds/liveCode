<?php
namespace Admin\Controller;
use Common\Util\Think\Page;

/**
 * 多网址跳转控制器
 * 
 */
class DuourlController extends AdminController {
	protected function _initialize() {
	    parent::_initialize();
		$this->uid = $this->_user_auth['uid'];
		$this->obj = D('Duourl');
		//判断用户状态是否正常 && 套餐是否过期
        $this->ifExpired();
	}
    /**
     * 多网址跳转列表
     * 
     */
    public function index() {
        $map = ['uid'=>$this->uid,'menuId'=>0];
        // 搜索
        $keyword   = I('keyword', '', 'string');
        if ( $keyword ){
        	 $map['id|name'] = array('like','%'.$keyword.'%');
        }

        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $data_list = $this->obj
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('id desc')
                   ->select();
                  
        foreach( $data_list as $k => $v ){
            $data_list[$k]['ewm']    = "Uploads/duourl/".$v['id'].'.png';
            $data_list[$k]['title']  = '<a href="'.U('detail',array('id'=>$v['id'])).'" class="label label-primary layer2">点击查看</a>';
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
        $attr4['name']  = 'view';
        $attr4['title'] = '数据统计';
        $attr4['class'] = 'label label-info';
        $attr4['href']  = U('view',['id'=>'__data_id__','code'=>'5']);
        $attr5['name']  = 'dcurl';
        $attr5['title'] = '新建目录';
        $attr5['class'] = 'btn btn-primary';
        $attr5['href']  = U('addMenu');
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('多网址跳转') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr)
                ->addTopButton('self', $attr2)
                ->addTopButton('self', $attr3)
                ->addTopButton('self', $attr5)
                ->setSearch('请输入ID或网址名称', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('name', '网址名称')
                ->addTableColumn('title', '跳转网址')
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
                ->addRightButton('self', $attr4)
                ->display();
    }

    /**
     * 多网址跳转子目录列表
     * 
     */
    public function child() {
        $type = I('get.type/d');
        $map = ['uid'=>$this->uid,'menuId'=>$type];
        // 搜索
        $keyword   = I('keyword', '', 'string');
        if ( $keyword ){
             $map['id|name'] = array('like','%'.$keyword.'%');
        }

        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $data_list = $this->obj
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('id desc')
                   ->select();
                  
        foreach( $data_list as $k => $v ){
            $data_list[$k]['ewm']    = "Uploads/duourl/".$v['id'].'.png';
            $data_list[$k]['title']  = '<a href="'.U('detail',array('id'=>$v['id'])).'" class="label label-primary layer2">点击查看</a>';
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
        $attr['href']  = U('outurl',['type'=>$type]);
        $attr2['name']  = 'xzewm';
        $attr2['title'] = '下载二维码';
        $attr2['class'] = 'btn btn-primary';
        $attr2['href']  = U('xzewm',['type'=>$type]);
        $attr3['name']  = 'edittzwz';
        $attr3['title'] = '批量修改跳转网址';
        $attr3['class'] = 'btn btn-primary';
        $attr3['href']  = U('edittzwz',['type'=>$type]);
        $attr4['name']  = 'view';
        $attr4['title'] = '数据统计';
        $attr4['class'] = 'label label-info';
        $attr4['href']  = U('view',['type'=>$type,'id'=>'__data_id__','code'=>'5']);
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('多网址跳转') // 设置页面标题
                ->addTopButton('addnew', ['href'=>U('add',['type'=>$type])])  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr)
                ->addTopButton('self', $attr2)
                ->addTopButton('self', $attr3)
                ->setSearch('请输入ID或网址名称', U('child',['type'=>$type]))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('name', '网址名称')
                ->addTableColumn('title', '跳转网址')
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
                ->addRightButton('self', $attr4)
                ->display();
    }

    /**
     * 新建目录
    */
    public function addMenu() {
        if (IS_POST) {
            $time = time();
            $mod  = M('admin_menu');
            $data['pid']        = $mod->getFieldByTitle('多网址跳转','id');
            $data['user_id']    = session('user_auth.uid');
            $data['title']      = I('title/s');
            $data['url']        = 'Admin/Duourl/child/type/'.$time;
            $data['create_time']= time();
            empty($data['title']) ? $this->error('请输入目录名称') : '';
            if ($data) {
                $id = $mod->add($data);
                if ($id) {
                    $data['pid'] = $id;
                    $data['status'] = -1;
                    $data['title'] = '新增';
                    $data['url']        = 'Admin/Duourl/add/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '导出网址';
                    $data['url']        = 'Admin/Duourl/outurl/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '下载二维码';
                    $data['url']        = 'Admin/Duourl/xzewm/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '批量修改跳转地址';
                    $data['url']        = 'Admin/Duourl/edittzwz/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '编辑';
                    $data['url']        = 'Admin/Duourl/edit/type/'.$time;
                    $mod->add($data);
                    $data['title'] = '查看数据统计';
                    $data['url']        = 'Admin/Duourl/view/type/'.$time;
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
    		$id=(int)I('id');
    		if ( !$id ){
    			$this->error('请输入需要导出的ID');
    		}
    		$rs=$this->obj->where(['id'=>$id,'uid'=>$this->uid])->find();
     		if ( !$rs ){
     			$this->error('没有找到此id的相关信息');
     		}
        	$title=get_duourl_titlearr($rs['title']);
            $str = "网址名称,跳转网址,活码地址\n";
            foreach( $title as $v){
            	$str .= $rs['name'].",".$v.",".$rs['huoma']."\n";
            }
            $str = iconv('utf-8','gb2312',$str);
            $filename = date('Ymd').'.csv';
            export_csv($filename,$str);
    	}else{
    	    // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('导出网址') //设置页面标题
                    ->setPostUrl(U('outurl'))    //设置表单提交地址
                    ->addFormItem('id', 'text', '需要导出的ID')
                    ->setAjaxSubmit(false)
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
            $where['uid'] = $this->uid;
            $where['id']  = array('between',array($ksid,$endid));
            $rs=$this->obj->where($where)->getField('id',true);
            if (!$rs) {
                $this->error('找不到该区间的文件，请输入正确的ID');
            }
            foreach( $rs as $v  ){
                $images[]="Uploads/duourl/".$v.".png";
            }
            $zip = new \ZipArchive;
            $zipDir = 'Uploads/duourl/'.date('Ymd');
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
     * 新增多网址跳转
     * 
     */
    public function add() {
        if (IS_POST) {
            //判断用户当前套餐活码数量是否已达上限
            $limit = userLivecodeCountLimit();
            if (!$limit) {
                $this->error('活码创建数量已达上限，请在续费管理中升级套餐');
            }
            $info=I('post.');
            if ( !$info['name'] ){
                $this->error('请输入网址名称');
            }
            if ( $info['addtype']==1 ){
                if ( !$info['file'] ){
                   $this->error('请上传文件');
                }
                $filename=get_upload_info($info['file'],'path');
                if ( !$filename ){
                   $this->error('请上传文件');
                }
                $txtarr=file( getcwd().$filename, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
                if ( !is_array($txtarr) ){
                   $this->error('读取失败，请确认txt格式是否符合要求');
                }
	           $data['title']=implode('|||',$txtarr);
	       
            }else{
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
            }
            $data['name']        = $info['name'];
            $data['menuId']      = $info['menuId'];
            $data['create_time'] = NOW_TIME;
            $data['update_time'] = NOW_TIME;
            $data['tztype']      = $info['tztype'];
            $data['uid']         = $this->uid;
            $data['d']           = get_dwz();
            $data['huoma']       = setLivecodeUrl('duo',$data['d']);
            $user                = D('user')->getUserInfo($this->uid);
            $data['status']      = ($user['ifCheck'] == -1)?1:0;
            if ($data) {
                $id = $this->obj->add($data);
                if ($id) {
                    qrcode($data['huoma'],$id,5);
                    if ($data['menuId']) {
                       $this->success('新增成功', U('child',['type'=>$data['menuId']]));
                    }
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($this->obj->getError());
            }
        } else {
            $this->meta_title = '新增多网址跳转';
            $this->assign('menuId',I('get.type/d'));
            $this->display();
        }
    }

    /**
     * 编辑多网址跳转
     * 
     */
    public function edit($id) {
        if (IS_POST) {
            // 提交数据
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
            $user                = D('user')->getUserInfo($this->uid);
            $data['status']      = ($user['ifCheck'] == -1)?1:0;

            $result = $this->obj->save($data);
            if ($result) {
                if ($data['menuId']) {
                   $this->success('更新成功', U('child',['type'=>$data['menuId']]));
                }
                $this->success('更新成功', U('index'));
            } else {
                $this->error('更新失败');
            }
        } else {
            $data = $this->obj->where(['id'=>$id,'uid'=>$this->uid])->find();
            if (!$data) {
                $this->error('数据不存在');
            }
            $this->meta_title = '编辑多网址跳转';
            $data['title']    = explode('|||',$data['title']);
            $data['tztime']   = explode('|||',$data['tztime']);
            $this->assign('data',$data);
            $this->assign('menuId',I('get.type/d'));
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
    /**
     * 批量修改跳转网址
     */
    public function edittzwz (){
	    if ( IS_POST ){
		    $ksid=I('ksid');
    		if ( !$ksid ){
    			$this->error('请输入需要修改的ID');
    		}
    		$rs=$this->obj->find($ksid);
    		if ( !$rs ){
    			$this->error('没有找到此id的相关信息');
    		}
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
            $data['id']          = $ksid;
            $data['title']       = implode('|||',$txtarr);
            $data['update_time'] = NOW_TIME;
            $user                = D('user')->getUserInfo($this->uid);
            $data['status']      = ($user['ifCheck'] == -1)?1:0;
            
	        $this->obj->save($data);
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
                ->addFormItem('ksid', 'text', '需要修改的ID')
                ->addFormItem('file', 'file', '上传修改网址','上传需要导入的网址文件，格式为一行一个网址，文档格式为txt')
                ->setFormData(['menuId' => I('get.type/d')])
                ->display();
        }
    
    }
    public function detail (){
    	$id=I('id/d');
        $info = $this->obj->where(['id'=>$id,'uid'=>$this->uid])->find();
        if (!$info) {
            return $this->display('Public/unfined');
        }
    	$info['title']=str_replace('|||','</br>',$info['title']);
    	$this->assign('info',$info);
    	$this->display();
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
            $this->display('Public/echarts_line');
        }else{
            $this->display('Public/echarts_column');
        }
    }

}

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
        //判断用户状态是否正常 && 套餐是否过期
        $this->ifExpired();
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
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        
        $data_list = $this->obj
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($where)
                   ->order('id desc')
                   ->select();
                  
        foreach( $data_list as $k => $v ){
            $data_list[$k]['ewm']     = "Uploads/livecode/".$v['id'].'.png';
            $data_list[$k]['type']    = codeType($v['type']);
            $data_list[$k]['title']   = LC_Substr($v['title'],0,15,"utf-8",true);
            $data_list[$k]['status']  = domainStatus($v['status']);
            if ($v['type'] == 1 || $v['type'] == 4 || $v['type'] == 5) {
                $data_list[$k]['content']='<a href="'.U('detail',array('id'=>$v['id'])).'" class="label label-primary layer2">点击查看</a>';
            }elseif ($v['type'] == 3) {
                $file = json_decode($v['content'],true)['url'];
                $ext  = substr(strrchr($file, '.'), 1);
                $picIcon = getPicType($ext);
                $data_list[$k]['content']   = '<img class="picture" src="/Public/images/'.$picIcon.'.png">';
            }else{
                $data_list[$k]['content'] = LC_Substr($v['content'],0,20,"utf-8",true);
            }

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
        $attr3['href']  = U('view',['id'=>'__data_id__','code'=>'1']);

        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('活码列表') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr2)
                ->addTopButton('self', $attr)
                ->setSearch('请输入ID或活码名称', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '活码名称')
                ->addTableColumn('type', '活码类型')
                ->addTableColumn('content', '活码内容')
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
            $data_list[$k]['ewm']     = "Uploads/livecode/".$v['id'].'.png';
            $data_list[$k]['type']    = codeType($v['type']);
            $data_list[$k]['title']   = LC_Substr($v['title'],0,15,"utf-8",true);
            $data_list[$k]['status']  = domainStatus($v['status']);
            if ($v['type'] == 1 || $v['type'] == 4 || $v['type'] == 5) {
                $data_list[$k]['content']='<a href="'.U('detail',array('id'=>$v['id'])).'" class="label label-primary layer2">点击查看</a>';
            }elseif ($v['type'] == 3) {
                $file = json_decode($v['content'],true)['url'];
                $ext  = substr(strrchr($file, '.'), 1);
                $picIcon = getPicType($ext);
                $data_list[$k]['content']   = '<img class="picture" src="/Public/images/'.$picIcon.'.png">';
            }else{
                $data_list[$k]['content'] = LC_Substr($v['content'],0,20,"utf-8",true);
            }
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
        $attr3['href']  = U('view',['type'=>$type,'id'=>'__data_id__','code'=>'1']);

        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('活码列表') // 设置页面标题
                ->addTopButton('addnew', ['href'=>U('add',['type'=>$type])])  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->addTopButton('self', $attr2)
                ->setSearch('请输入ID或活码名称', U('child',['type'=>$type]))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '活码名称')
                ->addTableColumn('type', '活码类型')
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
    		$where['id']  = array('between',array($ksid,$endid));
            $where['uid']  = $this->uid;

    		$rs=$this->obj->where($where)->getField('id',true);
            if (!$rs) {
                $this->error('找不到该区间的文件，请输入正确的ID');
            }
    		foreach( $rs as $v  ){
    			$images[]="Uploads/livecode/".$v.".png";
    		}
            $zipDir = 'Uploads/livecode/'.date('Ymd');
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
            $limit = $this->obj->userLivecodeCountLimit();
            if (!$limit) {
                $this->error('活码创建数量已达上限，请在续费管理中升级套餐');
            }

            $type = I('post.type/d');
            if ($type == 1 || $type == 2 || $type == 3 || $type == 4) {    //图文活码 || 文本活码 || 文件活码 || 网址导航
                $data = $this->obj->create();
                if (!$data) {
                    $this->error($this->obj->getError());exit();
                }
            }elseif ($type == 5) {                  //名片活码
                $data['content'] = I('post.params');
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

                $data['type'] = $type;
                $data['menuId'] = I('post.menuId/d');
                $data['title'] = $data['content']['name'].'的名片';
                $data['create_time'] = time();
            }
            $data['uid']   = $this->uid;
            $data['d']     = get_dwz();
            $data['huoma'] = setLivecodeUrl('live',$data['d']);
            $user = D('user')->getUserInfo($data['uid']);
            $data['status']= ($user['ifCheck'] == -1)?1:0;

            //如果是图文或者文件，内容保存为json格式
            if ($type == 1 || $type == 3 || $type == 4 || $type == 5) {
                $data['content']   = json_encode($data['content']);
            }

            //执行添加
            $id = $this->obj->add($data);
            if ($id) {
                qrcode($data['huoma'],$id,1);
                //如果是名片活码，需生成vcf文件
                if ($type == 5) {
                    createVcfFile($id,$data['content']);
                }
                if ($data['menuId']) {
                    $this->success(['type'=>$data['menuId']], '/Uploads/livecode/'.$id.'.png');
                }
                $this->success('新增成功', '/Uploads/livecode/'.$id.'.png');
            } else {
                $this->error('新增失败');
            }
            
        } else {
            $this->meta_title = '新增活码';
            $this->assign('menuId',I('get.type/d'));
            $this->assign('vcard',I('get.vcard/d'));
            $this->display();
        }
    }

    /**
     * 编辑活码
     * 
     */
    public function edit($id) {
        if (IS_POST) {
            $info = I('post.');
            $type = $info['type'];
            if ($type == 1 || $type == 2 || $type == 3 || $type == 4) {    //图文活码 || 文本活码 || 文件活码 || 网址导航
                $data = $this->obj->create();
                if (!$data) {
                    $this->error($this->obj->getError());exit();
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
            // h($data['content']['left_internet']);
            $user = D('user')->getUserInfo($this->uid);
            $data['status']= ($user['ifCheck'] == -1)?1:0;
            //如果是图文或者文件，内容保存为json格式
            if ($type == 1 || $type == 3 || $data['type'] == 4 || $type == 5) {
                $data['content']   = json_encode($data['content']);
            }
            $data['id']  = $info['editId'];

            $result = $this->obj->save($data);
            if ($result) {
                //如果是名片活码，需更新vcf文件
                if ($type == 5) {
                    createVcfFile($data['id'],$data['content']);
                }
                if ($data['menuId']) {
                    $this->success(['type'=>$data['menuId']], '/Uploads/livecode/'.$data['id'].'.png');
                }
                $this->success('', '/Uploads/livecode/'.$data['id'].'.png');
            } else {
                $this->error('更新失败');
            }
        } else {
            $data = $this->obj->where(['id'=>$id,'uid'=>$this->uid])->find();
            if (!$data) {
                $this->error('数据不存在');
            }
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
            $this->meta_title = '编辑活码';
            $this->assign('data',$data);
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
               	unlink("Uploads/livecode/".$v.'.png');
               }
            } else {
               unlink("Uploads/livecode/".$ids.'.png');
            }
        }
        parent::setStatus($model);
    }

    /**
     * 点击查看
     */
    public function detail (){
        $id            = I('id/d');
        $data = $this->obj->where(['id'=>$id,'uid'=>$this->uid])->find();
        if (!$data) {
            return $this->display('Public/unfined');
        }
        $content = json_decode($data["content"],true);
        foreach ($content as $key => $value) {
            if ($data['type'] == 4) {
                $data['url'][$key] = $value;
            }else{
                $data[$key] = $value;
            }
        }
        if ($data['type'] == 1) {
            $data['picUrl'] = '/Uploads/livecode/file/'.$data['picUrl'];
        }
        $this->assign('data',$data);
        if ($data['type'] == 1) {
            $this->display('live_text');    //图文
        }elseif ($data['type'] == 4) {
            $this->display('live_url');     //网址
        }else{
            $this->display('live_vcard');   //名片
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

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
            $data_list[$k]['content']='<a href="'.U('detail',array('id'=>$v['id'])).'" class="label label-primary layer2">点击查看</a>';
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
                ->addTopButton('self', $attr)
                ->addTopButton('self', $attr2)
                ->setSearch('请输入ID或产品名称', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '产品名称')
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
            $data_list[$k]['content']='<a href="'.U('detail',array('id'=>$v['id'])).'" class="label label-primary layer2">点击查看</a>';
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
                $this->edit();
            }
            //判断用户当前套餐活码数量是否已达上限
            $limit = D('Livecode')->userLivecodeCountLimit();
            if (!$limit) {
                $this->error('活码创建数量已达上限，请在续费管理中升级套餐');
            }

            $data = $this->obj->create();
            if (!$data) {
                $this->error($this->obj->getError());exit();
            }
            $data['uid']   = $this->uid;
            $data['d']     = get_dwz();
            $data['huoma'] = setLivecodeUrl('product',$data['d']);
            $data['content']   = json_encode($data['content']);
            
            //执行添加
            $id = $this->obj->add($data);
            if ($id) {
                qrcode($data['huoma'],$id,6);
                $this->success('新增成功', '/Uploads/product/'.$id.'.png');
            } else {
                $this->error('新增失败');
            }
            
        } else {
            $this->meta_title = '新增产品活码';
            $this->assign('menuId',I('get.type/d'));
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
            $data['uid']   = $this->uid;
            $data['content']   = json_encode($data['content']);
            $data['id']=$info['editId'];
            // halt($data);

            if ($data) {
                $result = $this->obj->save($data);
                if ($result) {
                    $this->success('更新成功', '/Uploads/product/'.$data['id'].'.png');
                } else {
                    $this->error('更新失败', $this->obj->getError());
                }
            } else {
                $this->error($this->obj->getError());
            }
        } else {
            $this->meta_title = '编辑产品活码';
            $data = $this->obj->find($id);
            $content = json_decode($data["content"]) ;
            foreach ($content as $key => $value) {
                $data[$key] = $value;
            }
            // halt($data);

            $this->assign('data',$data);
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
        $id            = I('id/d');
        $data          = $this->obj->find($id);
        $content = json_decode($data["content"]) ;
        foreach ($content as $key => $value) {
            $data[$key] = $value;
        }
        $this->assign('data',$data);
        $this->display('Livecode/live_text');
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

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
 * 用户控制器
 * 
 */
class PhoneController extends AdminController {
    /**
     * 用户列表
     * 
     */
    public function index() {
        // 搜索
        $keyword   = I('keyword', '', 'string');
        if ( $keyword )
        {
        	 $map['title'] = array('like','%'.$keyword.'%');
        }
       

        // 获取所有用户
        $map['status'] = array('egt', '0'); // 禁用和正常状态
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $user_object = D('Phone');
        $data_list = $user_object
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('id desc')
                   ->select();
                  
                   
        $page = new Page(
            $user_object->where($map)->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('号码列表') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->setSearch('请输入号码', U('index'))
                ->addTableColumn('id', 'ID')
                ->addTableColumn('title', '号码')
                ->addTableColumn('create_time', '添加时间', 'time')
                ->addTableColumn('status', '状态', 'status')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表
                ->setTableDataPage($page->show()) // 数据列表分页
                ->addRightButton('delete')        // 添加删除按钮
                ->display();
    }

    /**
     * 新增用户
     * 
     */
    public function add() {
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
           
            foreach( $txtarr as $k=>$v  )
            {
	        $data[$k]['title']=$v;
	        $data[$k]['create_time']=NOW_TIME;
           $data[$k]['update_time']=NOW_TIME;
           
            }
             $user_object->addAll($data);
            $this->success('导入成功', U('index'));
        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('导入号码') //设置页面标题
                    ->setPostUrl(U('add'))    //设置表单提交地址
                    ->addFormItem('file', 'file', '上传文件','上传需要导入的号码文件，格式为一行一个号码，文档格式为txt')
                    ->display();
        }
    }


   
}

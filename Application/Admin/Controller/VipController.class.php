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
 * 套餐控制器
 * 
 */
class VipController extends AdminController {
    /**
     * 套餐列表
     * 
     */
    public function index() {
        // 搜索
        $map = [];
        $keyword   = I('keyword', '', 'string');
        if ($keyword) {
            $map['v.name'] = $condition = array('like','%'.$keyword.'%');
        }
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $mod = M('Vip');
        $data_list = $mod->alias('v')->field('v.id,v.name,v.is_recommed,v.is_show,v.sort,p.vipId')
                   ->join('__VIP_PRICE__ p ON p.vipId=v.id')
                   ->page($p , C('ADMIN_PAGE_ROWS'))
                   ->where($map)
                   ->order('v.sort,p.price desc')
                   ->group('p.vipId')
                   ->select();

        $page = new Page(
            $mod->alias('v')->join('__VIP_PRICE__ p ON p.vipId=v.id')->where($map)->group('p.vipId')->count(),
            C('ADMIN_PAGE_ROWS')
        );

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('套餐列表') // 设置页面标题
                ->addTopButton('addnew')  // 添加新增按钮
                ->addTopButton('delete')  // 添加删除按钮
                ->setSearch('请输入套餐名称', U('index'))
                ->addTableColumn('name', '套餐名称')
                ->addTableColumn('is_recommed', '是否为推荐套餐', 'status')
                ->addTableColumn('is_show', '是否前台显示', 'status')
                ->addTableColumn('sort', '排序')
                ->addTableColumn('right_button', '操作', 'btn')
                ->setTableDataList($data_list)    // 数据列表
                ->setTableDataPage($page->show()) // 数据列表分页
                ->addRightButton('edit')          // 添加编辑按钮
                ->addRightButton('delete')        // 添加删除按钮
                ->display();
    }

    /**
     * 新增套餐
     * 
     */
    public function add() {
        $menu = D('Module')->where(['pid'=>4])->select();
        if (IS_POST) {
            $data = I('post.');
            if ($data['editId']) {
                return $this->edit();
            }
            //明细转json
            $data['detail'] = $data['detail']?$data['detail']:[];
            $data['detail'] = json_encode($data['detail']);
            //活码显示类型
            $ids = [];
            foreach ($menu as $v) {
                $ids[] = $v['id'];
            }
            $data['menu_auth'] = explode(',',$data['menu_auth']);

            if ($data['menu_auth']) {
                $data['menu_auth'] = array_diff($ids, $data['menu_auth']);
                sort($data['menu_auth']);
            }else{
                $data['menu_auth'] = $ids;
            }
            
            if ($data['menu_auth']) {
                $data['menu_auth'] = json_encode($data['menu_auth']);
            }else{
                $data['menu_auth'] = '';
            }

            //添加到套餐表中
            $mod = M('vip');
            $id = $mod->add($data);
            if ($id) {
                //推荐只能有一个
                if ($data['is_recommed'] == 1) {
                    $mod->where(['is_recommed'=>1,'id'=>['neq',$id]])->save(['is_recommed'=>0]);
                }
                //添加到套餐价格表
                foreach ($data['vip'] as $v) {
                    M('vip_price')->add(['vipId'=>$id,'year'=>(int)$v['year'],'price'=>(float)$v['price']]);
                }
                $this->success('新增成功', U('index'));
            }else{
                $this->error('新增失败');
            }
        } else {
            $this->assign(['meta_title' =>'新增套餐','menu'=> $menu]);
            $this->display();
        }
    }

    /**
     * 编辑套餐
     * 
     */
    public function edit($id) {
        $menu = D('Module')->where(['pid'=>4])->select();
        if (IS_POST) {
            $data = I('post.');
            //明细转json
            $data['detail'] = $data['detail']?$data['detail']:[];
            $data['detail'] = json_encode($data['detail']);
            //活码显示类型
            $ids = [];
            foreach ($menu as $v) {
                $ids[] = $v['id'];
            }
            $data['menu_auth'] = explode(',',$data['menu_auth']);

            if ($data['menu_auth']) {
                $data['menu_auth'] = array_diff($ids, $data['menu_auth']);
                sort($data['menu_auth']);
            }else{
                $data['menu_auth'] = $ids;
            }

            if ($data['menu_auth']) {
                $data['menu_auth'] = json_encode($data['menu_auth']);
            }else{
                $data['menu_auth'] = '';
            }

            $vip_mod = M('vip');
            $data['id'] = $data['editId'];
            $res = $vip_mod->save($data);
            if ($res !== false) {                
                if ($data['is_recommed'] == 1) {
                    $vip_mod->where(['is_recommed'=>1,'id'=>['neq',$data['id']]])->save(['is_recommed'=>0]);
                }
                $mod = M('vip_price');
                //添加到套餐价格表
                $mod->where(['vipId'=>$data['id']])->delete();
                foreach ($data['vip'] as $v) {
                    $mod->add(['vipId'=>$data['id'],'year'=>(int)$v['year'],'price'=>(float)$v['price']]);
                }

                $this->success('更新成功', U('index'));
            }else {
                $this->error('更新失败');
            }

            
        } else {
            // 获取套餐信息
            $info = M('vip')->where(['id'=>$id])->find();
            $info['vip_price'] = M('vip_price')->field('year,price')->where(['vipId'=>$id])->select();
            $info['menu_auth'] = json_decode($info['menu_auth'],true);
            $info['detail'] = json_decode($info['detail'],true);

            $this->assign(['meta_title' =>'编辑套餐','editId'=> $id,'info'=> $info,'menu'=> $menu]);
            $this->display();
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus($model = 'vip'){
        $ids    = I('request.ids');
        $status = I('request.status');

        if ( $status=='delete' ) {
            $mod = M('vip_price');
            if (is_array($ids)) {  
                foreach( $ids as $v  ){                    
                    $mod->where(['vipId' => $v])->delete();
                }
            } else {
                $mod->where(['vipId' => $ids])->delete();
            }
        }

        parent::setStatus('vip');
    }
}

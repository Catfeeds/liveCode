<?php
namespace Admin\Controller;
use Common\Util\Think\Page;
/**
 * 活码管理控制器
 * 
 */
class CheckcodeController extends AdminController {
    /**
     * 初始化
     */
    protected function _initialize() {
        parent::_initialize();
        $this->uid         = $this->_user_auth['uid'];
        $this->userObj     = D('User');
    }
    /**
     * 活码列表
     * 
     */
    public function index($codeType = 1,$status=['0']) {
        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;
        //搜索 && 条件
        $keyword   = I('keyword', '', 'string');
        if ($keyword){
             $where['id|title'] = array('like','%'.$keyword.'%');
        }elseif ($keyword && $codeType = 5) {
             $where['id|name'] = array('like','%'.$keyword.'%');
        }
        $status == 'history'? $status = ['1','-1'] : '';
        $where['status'] = ['in',$status];
        if ($codeType == 3) {
            $where['type'] = 2;
        }elseif ($codeType == 4) {
            $where['type'] = 1;
        }
        $modelName = getModelObj($codeType);
        $obj = D($modelName);
        // h($obj);
        //数据列表
        $data = $obj->where($where)->page($p , C('ADMIN_PAGE_ROWS'))->order('id desc')->select();
        $data_count = $obj->where($where)->count();
        //数据分页
        $page = new Page($data_count,C('ADMIN_PAGE_ROWS'));
        if ($data) {
            if (!$codeType || $codeType == 1) {     //活码生成
                foreach( $data as $k => $v ){
                    $data[$k]['ewm']     = "Uploads/livecode/".$v['id'].'.png';
                    $data[$k]['type']    = codeType($v['type']);
                    $data[$k]['title']   = LC_Substr($v['title'],0,15,"utf-8",true);
                    $data[$k]['username']= $this->userObj->getUserInfo($v['uid'])['username'];

                    if ($v['type'] == 1 || $v['type'] == 5) {
                        $data[$k]['content']='<a href="'.U('detail',['id'=>$v['id'],'codeType'=>1,'model'=>$modelName]).'" class="label label-primary layer2">点击查看</a>';
                    }elseif ($v['type'] == 3) {
                        $file                = json_decode($v['content'],true)['url'];
                        $ext                 = substr(strrchr($file, '.'), 1);
                        $picIcon             = getPicType($ext);
                        $data[$k]['content'] = '<img style="max-width: 200px;max-height: 40px;" src="/Public/images/'.$picIcon.'.png">';
                    }else{
                        $data[$k]['content'] = LC_Substr($v['content'],0,20,"utf-8",true);
                    }
                }            
            }elseif ($codeType == 2) {              //产品活码
                foreach( $data as $k => $v ){
                    $data[$k]['ewm']      = "Uploads/product/".$v['id'].'.png';
                    $data[$k]['title']    = LC_Substr($v['title'],0,15,"utf-8",true);
                    $data[$k]['content']  ='<a href="'.U('detail',['id'=>$v['id'],'codeType'=>2,'model'=>$modelName]).'" class="label label-primary layer2">点击查看</a>';
                    $data[$k]['username'] = $this->userObj->getUserInfo($v['uid'])['username'];
                }
            }elseif ($codeType == 3) {              //视频活码
                foreach( $data as $k => $v ){
                    $data[$k]['ewm']      ="Uploads/ewm/".$v['id'].'.png';
                    $data[$k]['username'] = $this->userObj->getUserInfo($v['uid'])['username'];
                }
            }elseif ($codeType == 4) {              //网址跳转
                foreach( $data as $k => $v ){
                    $data[$k]['ewm']="Uploads/phone/".$v['id'].'.png';
                    $data[$k]['username'] = $this->userObj->getUserInfo($v['uid'])['username'];
                }  
            }elseif ($codeType == 5) {              //多网址跳转
                foreach( $data as $k => $v ){
                    $data[$k]['ewm']      = "Uploads/duourl/".$v['id'].'.png';
                    $data[$k]['content']  = '<a href="'.U('detail',['id'=>$v['id'],'codeType'=>5,'model'=>$modelName]).'" class="label label-primary layer2">点击查看</a>';
                    $data[$k]['title']    = $v['name'];
                    $data[$k]['username'] = $this->userObj->getUserInfo($v['uid'])['username'];
                } 
            }
        }

        $this->assign([
            'meta_title'      => '活码管理',
            'data'            => $data,
            'data_count'      => $data_count,
            'table_data_page' => $page->show(),
            'codeType'        => $codeType,
            'keyword'         => $keyword,
            'status'          => I('get.status/s'),
            'modelName'       => $modelName,

        ]);
        $this->display();

        
    }

    /**
     * 编辑活码
     * 
     */
    public function edit($codeType,$id) {
        $modelName = getModelObj($codeType);
        $obj       = D($modelName);

        if (IS_POST) {
            // halt($codeType);
            if ($codeType == 2) {
                $info = I('post.');
                $data = $obj->create();
                if (!$data) {
                    $this->error($obj->getError());exit();
                }
                $data['content'] = json_encode($data['content']);
                $data['id']      = $info['editId'];

                $result = $obj->save($data);
                if ($result) {
                    $this->success('更新成功', '/Uploads/product/'.$data['id'].'.png');
                } else {
                    $this->error('更新失败');
                }
            }
            

        } else {
            $data = $obj->where(['id'=>$id])->find();
            if (!$data) {
                $this->error('数据不存在');
            }
            $data['codeType'] = $codeType;

            if ($codeType == 2) {
                $content = json_decode($data["content"]) ;
                foreach ($content as $key => $value) {
                    $data[$key] = $value;
                }
                $meta_title = '编辑产品活码';
                $html       = 'Product/add';
                $this->assign('menuId',$data['menuId']);

            }elseif ($codeType == 3) {
                $meta_title = '编辑视频活码';
                $html       = 'Product/add';
                $this->assign('menuId',$data['menuId']);
                # code...
            }
            // halt($codeType);

            // halt($data);
            $this->assign([
                'meta_title' => $meta_title,
                'data'       => $data,
            ]);
            $this->display($html);
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus($codeType = 1){
        $model    = getModelObj($codeType);
        $ids      = I('request.ids');
        $status   = I('request.status');
        $fileName = getEwmFileName($codeType);
        if ($status=='delete'){
            if (is_array($ids)) {
                foreach( $ids as $v  ){ 
                    if ($codeType = 3) {
                        $videourl = D($model) -> where(array('id' => $v)) -> getField('videourl');
                        unlink($videourl);
                    }
                    unlink('Uploads/'.$fileName.'/'.$v.'.png');
                }
            } else {
                if ($codeType = 3) {
                    $videourl = D($model) -> where(array('id' => $ids)) -> getField('videourl');
                    unlink($videourl);
                }
                unlink('Uploads/'.$fileName.'/'.$ids.'.png');
            }
        }
        parent::setStatus($model);
    }

    /**
     * 点击查看
     */
    public function detail (){
        $get = I('get.');
        $obj = D($get['model']);

        $data = $obj->where(['id'=>$get['id']])->find();
        if (!$data) {
            return $this->display('Public/unfined');
        }
        if ($get['codeType'] == 2) {
            $content = json_decode($data["content"]) ;
            foreach ($content as $key => $value) {
                $data[$key] = $value;
            }
            $data['type'] = 2;
            $this->assign('data',$data);
            $this->display('Livecode/live_text');
        }elseif ($get['codeType'] == 5) {
            $data['title']=str_replace('|||','</br>',$data['title']);
            $this->assign('info',$data);
            $this->display('Duourl/detail');
        }else {
            $content = json_decode($data["content"],true);
            foreach ($content as $key => $value) {
                $data[$key] = $value;
            }
            $this->assign('data',$data);
            if ($data['type'] == 1) {
                $this->display('Livecode/live_text');    //图文
            }else{
                $this->display('Livecode/live_vcard');   //名片
            }
        }
        
    }


}

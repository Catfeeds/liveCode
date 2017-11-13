<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// |
// +----------------------------------------------------------------------
namespace Home\Controller;
use Think\Controller;
/**
 * 前台默认控制器
 */
class HuomaController extends HomeController{
    /**
     * 活码生成跳转
     */
    public function live(){
        $d    = I('d/s');
        $obj  = M('cms_livecode');
        $data = $obj->where(['d'=>$d,'status'=>1])->find();
        if (!$data) {
            return $this->display('Public/unfined');
        }
        $userMod = D('User');
        $user = $userMod->alias('u')->field('limit_count,visitCount')->join('__VIP__ v on u.vipId=v.id')->where('u.id='.$data['uid'])->find();
        if ($user['limit_count'] != 0 && $user['visitCount'] >= $user['limit_count']) {
            return $this->display('Public/unfined');
        }

        $userMod->where(['id'=>$data['uid']])->setInc('visitCount', 1);
        $obj->where(['d'=>$d,'status'=>1])->setInc('count', 1);
        //获取访问者信息
        $info            = getIPLoc_taobao(get_client_ip());
        $info['os']      = getOS();
        $info['browser'] = getBrowser();
        $info['codeId']  = $data['id'];
        $info['createTime'] = date('Y-m-d H:i:s');
        $info['type']    = 1;
        M('echarts_data')->add($info);

        if ($data['type'] == 1 || $data['type'] == 2) {           //文本活码
            if ($data['type'] == 1) {
                $content = json_decode($data["content"],true);
                foreach ($content as $key => $value) {
                    $data[$key] = $value;
                }
                $data['picUrl'] = '/Uploads/livecode/file/'.$data['picUrl'];
            }
            $this->assign('data',$data);
            $this->display('live_text');
        }elseif ($data['type'] == 3) {      //文件活码
            $ext             = substr(strrchr($data['title'], '.'), 1); 
            $content         = json_decode($data['content'],true);
            $data['url']     = '/Uploads/livecode/file/'.$content['url'];
            $data['fileName']= $content['fileName'];
            $data['size']    = $content['size'];
            $data['picIcon'] = getPicType($ext);
            $this->assign('data',$data);
            $this->display('live_file');
        }elseif ($data['type'] == 4) {      //网址导航
            $content = json_decode($data["content"],true);
            foreach ($content as $key => $value) {
                $data['url'][$key] = $value;
            }
            $this->assign('data',$data);
            $this->display('live_url');
        }elseif ($data['type'] == 5) {      //名片活码
            $content = json_decode($data["content"],true);
            foreach ($content as $key => $value) {
                $data[$key] = $value;
            }
            $this->assign('data',$data);
            $this->display('live_vcard');
        } 
    }

    /**
     * 产品活码跳转
     */
    public function product(){
        $d    = I('d/s');
        $obj  = M('cms_product');
        $data = $obj->where(['d'=>$d,'status'=>1])->find();
        if (!$data) {
            return $this->display('Public/unfined');
        }
        $userMod = D('User');
        $user = $userMod->alias('u')->field('limit_count,visitCount')->join('__VIP__ v on u.vipId=v.id')->where('u.id='.$data['uid'])->find();
        if ($user['limit_count'] != 0 && $user['visitCount'] >= $user['limit_count']) {
            return $this->display('Public/unfined');
        }
        $userMod->where(['id'=>$data['uid']])->setInc('visitCount', 1);
        $obj->where(['d'=>$d,'status'=>1])->setInc('count', 1);
        //获取访问者信息
        $info            = getIPLoc_taobao(get_client_ip());
        $info['os']      = getOS();
        $info['browser'] = getBrowser();
        $info['codeId']  = $data['id'];
        $info['createTime'] = date('Y-m-d H:i:s');
        $info['type']    = 2;
        M('echarts_data')->add($info);

        $content = json_decode($data["content"]);
        foreach ($content as $key => $value) {
            $data[$key] = $value;
        }
        $data['type'] = 6;
        $data['picUrl'] = '/Uploads/product/file/'.$data['picUrl'];
        $this->assign('data',$data);
        $this->display('live_text');
    }

    /**
     * 默认活码跳转（视频活码、网址活码）
     */
    public function index(){
        $d = I('d/s');
        $obj = M('cms_phone');
        $data = $obj->where(['d'=>$d,'status'=>1])->find();
        if (!$data) {
            return $this->display('Public/unfined');
        }
        $userMod = D('User');
        $user = $userMod->alias('u')->field('limit_count,visitCount')->join('__VIP__ v on u.vipId=v.id')->where('u.id='.$data['uid'])->find();
        if ($user['limit_count'] != 0 && $user['visitCount'] >= $user['limit_count']) {
            return $this->display('Public/unfined');
        }
        $userMod->where(['id'=>$data['uid']])->setInc('visitCount', 1);
        $obj->where(['d'=>$d,'status'=>1])->setInc('count', 1);

        $type = $obj -> where(array('d' => $d)) -> getField('type');
        $videourl = $obj -> where(array('d' => $d)) -> getField('0,id,title,videourl,huoma');
        $url = $obj -> where(array('d' => $d)) -> getField('videourl');
        //获取访问者信息
        $info            = getIPLoc_taobao(get_client_ip());
        $info['os']      = getOS();
        $info['browser'] = getBrowser();
        $info['codeId']  = $videourl[0]['id'];
        $info['createTime'] = date('Y-m-d H:i:s');

        if ($type == 2 && $videourl){
            //视频活码跳转
            $info['type'] = 3;
            M('echarts_data')->add($info);
            //$huoma = $obj -> where(array('d' => $d)) -> getField('huoma');
            $videoTitle = '{"mediaTitle": "'.$videourl[0]['title'].'"}';
            $this->assign('title',$videourl[0]['title']);
            $this->assign('videoTitle',$videoTitle);
            $this->assign('vdurl',$videourl[0]['videourl']);
            $this->assign('hmurl',$videourl[0]['huoma']);
            $this->display();
        }elseif ($type == 1 && $url){
            //网址活码跳转
            $info['type'] = 4;
            M('echarts_data')->add($info);
            redirect($url);
        }else{
            $this -> error('参数错误');
        }
    }
    /**
     * 多网址跳转
     */
    public function duo (){
        $d = I('d/s');
        $obj = M('cms_duourl');
        $rs = $obj->where(['d'=>$d,'status'=>1])->find();
        if (!$rs) {
            return $this->display('Public/unfined');
        }
        $userMod = D('User');
        $user = $userMod->alias('u')->field('limit_count,visitCount')->join('__VIP__ v on u.vipId=v.id')->where('u.id='.$rs['uid'])->find();
        if ($user['limit_count'] != 0 && $user['visitCount'] >= $user['limit_count']) {
            return $this->display('Public/unfined');
        }
        $userMod->where(['id'=>$rs['uid']])->setInc('visitCount', 1);

        $urlarr = get_duourl_titlearr($rs['title']);
        if (!is_array($urlarr)){
            $this -> error('参数错误');
        }
        switch ($rs['tztype']){
         case 2:
             $tzurl = $this -> orderjump($urlarr, $rs);
             break;
         case 3:
             $timearr = get_duourl_tztimearr($rs['tztime']);
             $tzurl = $this -> timejump($urlarr, $timearr);
             break;
         default:
             $tzurl = $this -> randjump($urlarr);
             break;
        }
        if ($tzurl){
            $obj->where(array('d' => $d)) ->setInc('count', 1);
            //获取访问者信息
            $info            = getIPLoc_taobao(get_client_ip());
            $info['os']      = getOS();
            $info['browser'] = getBrowser();
            $info['codeId']  = $rs['id'];
            $info['createTime'] = date('Y-m-d H:i:s');
            $info['type']    = 5;
            M('echarts_data')->add($info);
            redirect($tzurl);
        }else{
            $this -> error('参数错误');
        }
    }
    // shunxu
    public function orderjump ($urlarr, $info){
        $cachename = $info['id'] . $info['d'];
        $tznum = (int)F($cachename);
        $allurlnum = count($urlarr);
        if ($tznum >= $allurlnum){
             $tznum = 0;
        }
        F($cachename, $tznum + 1);
        return $urlarr[$tznum];
     }
     // shijian
    public function timejump ($urlarr, $timearr){
        if (is_array($timearr)){
    	    $today=date("Y-m-d"); 
    	    $tznum=0;    
            foreach( $timearr as $k=>$v  ){
            	$tztime=strtotime($today.$v);
            	if ( NOW_TIME<=$tztime ){
            		$tznum=$k;
            		break;
            	}
            }
            return $urlarr[$tznum];
        }
         
     }
     // suiji
    public function randjump ($urlarr){
        return $urlarr[array_rand($urlarr)];
    }

    /**
     * 如果微信打开名片活码，生成微信名片
     */
    public function getvcard(){
        $id = I('post.id/d');
        $data = M('cms_livecode')->where(['id'=>$id])->find();
        if (!$data) {
            $this->error('获取文件失败！');
        }
        $content = json_decode($data["content"],true);
        foreach ($content as $key => $value) {
            $data[$key] = $value;
        }

        $name     = $data['name'];
        $company  = $data['company'];
        $position = $data['appointment'];
        $tell     = $data['left_phone'][0]['val'];
        $phone    = $data['left_phone'][1]['val'];
        $email    = $data['left_phone'][3]['val'];
        $fax      = $data['left_phone'][2]['val'];
        $addr     = $data['left_address'][0]['val'];
        $url      = $data['left_internet'][1]['val'];
        $qq       = $data['left_internet'][3]['val'];
        $intro    = $data['left_intro'][0]['val'];

        Vendor('phpqrcode.phpqrcode');
        //生成二维码图片
        $object = new \QRcode();
        $url='BEGIN:VCARD
            VERSION:3.0
            FN:'.$name.'
            ORG:'.$company.'
            TITLE:'.$position.'
            TEL;TYPE=work:'.$tell.'
            TEL:'.$phone.'
            EMAIL:'.$email.'
            TEL;TYPE=WORK,FAX:'.$fax.'
            URL;WORK:'.$url.'
            X-QQ:'.$qq.'
            ADR:'.$addr.'
            NOTE;ENCODING=QUOTED-PRINTABLE:'.$intro.'
            END:VCARD';
        $level='M';
        $size=4;
        $errorCorrectionLevel =intval($level) ;//容错级别
        $matrixPointSize = intval($size);//生成图片大小
        //$object->png($url,"vcardimg/b.png");
        $dir = 'Uploads/'.date('Y-m');
        if (!is_dir($dir)) {
            mkdir($dir, 0777, true);
        }
        $res = $object->png($url, $dir.'/'.$id.'.png', $errorCorrectionLevel, $matrixPointSize,2);    //vcardimg为保存目录
        if ($res === 'false') {
            $this->error('获取文件失败！');
        }
        $this->success('/'.$dir.'/'.$id.'.png');

    }

}
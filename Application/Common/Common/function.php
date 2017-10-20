<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------

require_once(APP_PATH . '/Common/Common/addon.php'); //加载插件相关公共函数库
require_once(APP_PATH . '/Common/Common/developer.php'); //加载开发者二次开发公共函数库

/**
 * 根据配置类型解析配置
 * @param  string $type  配置类型
 * @param  string  $value 配置值
 */
function parse_attr($value, $type = null) {
    switch ($type) {
        default: //解析"1:1\r\n2:3"格式字符串为数组
            $array = preg_split('/[,;\r\n]+/', trim($value, ",;\r\n"));
            if (strpos($value,':')) {
                $value  = array();
                foreach ($array as $val) {
                    list($k, $v) = explode(':', $val);
                    $value[$k]   = $v;
                }
            } else {
                $value = $array;
            }
            break;
    }
    return $value;
}

/**
 * POST数据提前处理
 * @return array
 * 
 */
function format_data($data = null) {
    //解析数据类似复选框类型的数组型值
    if (!$data) {
        $data = $_POST;
    }
    foreach($data as $key => $val){
        if (is_array($val)) {
            $data[$key] = implode(',', $val);
        } else if (check_date_time($val)) {
            $data[$key] = strtotime($val);
        } else if (check_date_time($val, 'Y-m-d H:i')) {
            $data[$key] = strtotime($val);
        } else if (check_date_time($val, 'Y-m-d')) {
            $data[$key] = strtotime($val);
        }
    }
    return $data;
}

/**
 * 获取所有数据并转换成一维数组
 * 
 */
function select_list_as_tree($model, $map = null, $extra = null, $key = 'id') {
    //获取列表
    $con['status'] = array('eq', 1);
    if ($map) {
        $con = array_merge($con, $map);
    }
    $model_object = D($model);
    if (in_array('sort', $model_object->getDbFields())) {
        $list = $model_object->where($con)->order('sort asc, id asc')->select();
    } else {
        $list = $model_object->where($con)->order('id asc')->select();
    }

    //转换成树状列表(非严格模式)
    $tree = new \Common\Util\Tree();
    $list = $tree->toFormatTree($list, 'title', 'id', 'pid', 0, false);

    if ($extra) {
        $result[0] = $extra;
    }

    //转换成一维数组
    foreach ($list as $val) {
        $result[$val[$key]] = $val['title_show'];
    }
    return $result;
}

/**
 * 解析文档内容
 * @param string $str 待解析内容
 * @return string
 * 
 */
function parse_content($str) {
    // 将img标签的src改为lazy-src用户前台图片lazyload加载
    if (C('STATIC_DOMAIN')) {
        return preg_replace('/(<img.*?)src="/i', '$1 class="lazy img-responsive" style="display:inline-block;" data-lazy="'.C('STATIC_DOMAIN'), $str);
    } else {
        return preg_replace('/(<img.*?)src=/i', "$1 class='lazy img-responsive' style='display:inline-block;' data-lazy=", $str);
    }
}

/**
 * 字符串截取(中文按2个字符数计算)，支持中文和其他编码
 * @static
 * @access public
 * @param str $str 需要转换的字符串
 * @param str $start 开始位置
 * @param str $length 截取长度
 * @param str $charset 编码格式
 * @param str $suffix 截断显示字符
 * @return str
 */
function cut_str($str, $start, $length, $charset='utf-8', $suffix = true) {
    return \Common\Util\Think\String::cutStr(
        $str, $start, $length, $charset, $suffix
    );
}

/**
 * 过滤标签，输出纯文本
 * @param string $str 文本内容
 * @return string 处理后内容
 * 
 */
function html2text($str) {
   return \Common\Util\Think\String::html2text($str);
}

/**
 * 友好的时间显示
 * @param int    $sTime 待显示的时间
 * @param string $type  类型. normal | mohu | full | ymd | other
 * @param string $alt   已失效
 * @return string
 * 
 */
function friendly_date($sTime, $type = 'normal', $alt = 'false') {
    $date = new \Common\Util\Think\Date((int)$sTime);
    return $date->friendlyDate($type, $alt);
}

/**
 * 时间戳格式化
 * @param int $time
 * @return string 完整的时间显示
 * 
 */
function time_format($time = NULL, $format='Y-m-d H:i') {
    $time = $time === NULL ? time() : intval($time);
    return date($format, $time);
}

/**
 * 判断是否日期时间
 * @return string
 */
function check_date_time($str_time, $format="Y-m-d H:i:s") {
    $unix_time = strtotime($str_time);
    $check_date= date($format, $unix_time);
    if ($check_date == $str_time) {
        return true;
    } else {
        return false;
    }
}

/**
 * 格式化字节大小
 * @param  number $size      字节数
 * @param  string $delimiter 数字和单位分隔符
 * @return string            格式化后的带单位的大小
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function format_bytes($size, $delimiter = '') {
    $units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
    for ($i = 0; $size >= 1024 && $i < 5; $i++) $size /= 1024;
    return round($size, 2) . $delimiter . $units[$i];
}

/**
 * 系统非常规MD5加密方法
 * @param  string $str 要加密的字符串
 * @return string
 * 
 */
function user_md5($str, $auth_key) {
    if (!$auth_key) {
        $auth_key ='de55e5e2rer5QWQW11';
    }
  
    return '' == $str ? '' : md5(sha1($str) . $auth_key);
}

/**
 * 检测用户是否登录
 * @return integer 0-未登录，大于0-当前登录用户ID
 * 
 */
function is_login() {
    return D('Admin/User')->is_login();
}

/**
 * 根据用户ID获取用户信息
 * @param  integer $id 用户ID
 * @param  string $field
 * @return array  用户信息
 * 
 */
function get_user_info($id, $field) {
    $userinfo = D('Admin/User')->find($id);
    if ($userinfo[$field]) {
        return $userinfo[$field];
    }
    return $userinfo;
}

/**
 * 获取上传文件路径
 * @param  int $id 文件ID
 * @return string
 * 
 */
function get_cover($id, $type) {
    if ((int)$id) {
        $upload_info = D('Admin/Upload')->find($id);
        $url = $upload_info['real_path'];
    }
    if (!$url) {
        switch ($type) {
            case 'default' : //默认图片
                $url = C('TMPL_PARSE_STRING.__HOME_IMG__').'/default/default.gif';
                break;
            case 'avatar' : //用户头像
                $url = C('TMPL_PARSE_STRING.__HOME_IMG__').'/default/avatar.gif';
                break;
            default: //文档列表默认图片
                break;
        }
    }
    return $url;
}

/**
 * 获取上传文件信息
 * @param  int $id 文件ID
 * @return string
 * 
 */
function get_upload_info($id, $field) {
    $upload_info = D('Admin/Upload')->where('status = 1')->find($id);
    if ($field) {
        if (!$upload_info[$field]) {
            return $upload_info['id'];
        } else {
            return $upload_info[$field];
        }
    }
    return $upload_info;
}

/**
 * 是否微信访问
 * @return bool
 * 
 */
function is_weixin() {
    if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
        return true;
    } else {
        return false;
    }
}

/**
 * 是否手机访问
 * @return bool
 * 
 */
function is_wap() {
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE'])) {
        return true;
    }
    // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset ($_SERVER['HTTP_VIA'])) {
        // 找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
    }
    // 脑残法，判断手机发送的客户端标志,兼容性有待提高
    if (isset ($_SERVER['HTTP_USER_AGENT'])) {
        $clientkeywords = array ('nokia',
            'sony',
            'ericsson',
            'mot',
            'samsung',
            'htc',
            'sgh',
            'lg',
            'sharp',
            'sie-',
            'philips',
            'panasonic',
            'alcatel',
            'lenovo',
            'iphone',
            'ipod',
            'blackberry',
            'meizu',
            'android',
            'netfront',
            'symbian',
            'ucweb',
            'windowsce',
            'palm',
            'operamini',
            'operamobi',
            'openwave',
            'nexusone',
            'cldc',
            'midp',
            'wap',
            'mobile'
        );
        // 从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
            return true;
        }
    }
    // 协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT'])) {
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
            return true;
        }
    }
    return false;
}

/**
 * 获取Http头信息
 * @return array
 * 
 */
if (!function_exists('getallheaders')) {
    function getallheaders() {
       foreach ($_SERVER as $name => $value) {
           if (substr($name, 0, 5) == 'HTTP_') {
               $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
           }
       }
       return $headers;
    }
}
/**
 * 调试输出
 */
function halt($obj) {
    echo '<pre>';var_dump($obj);exit;
}
/*
    获取系统配置表数据
    @param string $name 变量名（varname）
    return array or null (成功返回array， 失败返回null)
*/
function system_config($name){
    $sysConfig = D('Admin/Config')->field("id, value")->where(['name'=>$name,'status = 1'])->find();
    return isset($sysConfig) ? $sysConfig : null;
}
/**
 * 生成默认订单号
 */
function createOrderNo(){
    return date('Ymd').(round(microtime(true),4)*10000);
}
/**
 * 返回交易类型
 */
function payType($payType){
    switch ($payType) {
        case '0':
            return '支付宝';
            break;
        case '1':
            return '微信';
            break;
        default:
            return '管理员支付';
            break;
    }
}
/**
 * 返回对比表显示数量
 */
function showDiffCount($type,$data){
    if ($type == 'text') {
        if ($data == 0) {
            return '不限制';
        }else{
            return $data.'个';
        }
    }elseif ($type == 'select') {
        if ($data == 0) {
            return '';
        }else{
            return '支持';
        }
    }

}
/**
 * 返回活码类型
 */
function codeType($codeType){
    switch ($codeType) {
        case '1':
            return '图文';
            break;
        case '2':
            return '文本';
            break;
        case '3':
            return '文件';
            break;
        case '4':
            return '网址';
            break;
        case '5':
            return '名片';
            break;
        default:
            return '图文';
            break;
    }
}
/**
 * 截取字符串
 */
function LC_Substr($str, $start = 0, $length, $charset = "utf-8", $suffix = false){
    $newStr = '';
    if (function_exists ( "mb_substr" )) {
        if ($suffix && mb_strlen($str,'utf8')>$length){
            $newStr = mb_substr ( $str, $start, $length, $charset )."...";
        }else{
            $newStr = mb_substr ( $str, $start, $length, $charset );
        }
    } elseif (function_exists ( 'iconv_substr' )) {
        if ($suffix && mb_strlen($str,'utf8')>$length){
            $newStr = iconv_substr ( $str, $start, $length, $charset )."...";
        }else{
            $newStr = iconv_substr ( $str, $start, $length, $charset );
        }
    }
    if($newStr==''){
    $re ['utf-8'] = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
    $re ['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
    $re ['gbk'] = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
    $re ['big5'] = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
    preg_match_all ( $re [$charset], $str, $match );
    $slice = join ( "", array_slice ( $match [0], $start, $length ) );
    if ($suffix)
        $newStr = $slice;
    }
    return $newStr;
}
/**
 * 字节Byte转换
 */
function getFilesize($num){
    $p = 0;
    $format='bytes';
    if($num>0 && $num<1024){
       $p = 0;
       return number_format($num).' '.$format;
    }
    if($num>=1024 && $num<pow(1024, 2)){
       $p = 1;
       $format = 'KB';
   }
   if ($num>=pow(1024, 2) && $num<pow(1024, 3)) {
      $p = 2;
      $format = 'MB';
   }
   if ($num>=pow(1024, 3) && $num<pow(1024, 4)) {
      $p = 3;
      $format = 'GB';
   }
   if ($num>=pow(1024, 4) && $num<pow(1024, 5)) {
      $p = 3;
      $format = 'TB';
   }
   $num /= pow(1024, $p);
   return number_format($num, 3).' '.$format;
}
/**
 * 返回文件图片类型
 */
function getPicType($ext){
    if ($ext == 'doc' || $ext == 'docx') {
        return 'wordicon';
    }elseif ($ext == 'pdf') {
        return 'pdficon';
    }elseif ($ext == 'xls' || $ext == 'xlsx') {
        return 'excelicon';
    }elseif ($ext == 'ppt' || $ext == 'pptx') {
        return 'ppticon';
    }elseif ($ext == 'gif' || $ext == 'jpg' || $ext == 'jpeg' || $ext == 'png' || $ext == 'bmp') {
        return 'imgicon';
    }else{
        return 'fileicon';
    }
}

/**
 * 生成数据返回值
 */
function WSTReturn($msg,$status = -1,$data = []){
    $rs = ['status'=>$status,'msg'=>$msg];
    if(!empty($data))$rs['data'] = $data;
    return $rs;
}
/**
 * 返回用户域名状态
 */
function domainStatus($url_status){
    switch ($url_status) {
        case '0':
            return '<font color="red">待审核</font>';
            break;
        case '1':
            return '<font color="green">正常</font>';
            break;
        case '-1':
            return '未通过';
            break;
        default:
            return '';
            break;
    }
}
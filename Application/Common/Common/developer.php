<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------

//开发者二次开发公共函数统一写入此文件，不要修改function.php以便于系统升级。

function trimall($str)//删除空格
{
    $qian=array(" ","　","\t","\n","\r");$hou=array("","","","","");
    return str_replace($qian,$hou,$str);    
}

 function layer_html ()
    {
     $model = C('TMPL_PARSE_STRING');
	 $tmplayer_html = <<<EOF
  <script src="{$model['__PUBLIC__']}/libs/layer/layer.js"></script>
        <script type="text/javascript">
           $(function(){
	$('.layer').click(function(){
    var url=($(this).attr('href'));
    var layerindex=layer.open({
    type: 2,
    area: ['50%', '90%'],
    fix: true, //不固定
    maxmin: true,
    content: url
});
layer.full(layerindex);
    return false;
});

	 });
        </script>
EOF;
  return $tmplayer_html;
    }

    function get_rand($proArr) {
  $result = '';
  $proSum = array_sum($proArr);
  foreach ($proArr as $key => $proCur) {
    $randNum = mt_rand(1, $proSum);
    if ($randNum <= $proCur) {
      $result = $key;
      break;
    } else {
      $proSum -= $proCur;
    }
  }
  unset ($proArr);
  return $result;
}
 /**
  * tmparr 排序数组
  *field 排序字段  
  * direction 排序顺序标志 SORT_DESC 降序；SORT_ASC 升序  
  **/
function ewarr_sort ($tmparr=array(),$field="ok",$direction="SORT_DESC")
{
	$arrSort = array();  
foreach($tmparr AS $uniqid => $row){  
    foreach($row AS $key=>$value){  
        $arrSort[$key][$uniqid] = $value;  
    }  
}  
if($direction){  
    array_multisort($arrSort[$field], constant($direction), $tmparr);  
}  
return $tmparr;
}

/**
 * 生成随机数
 */
function get_dwz() {
    $endtime=1356019200;//2012-12-21时间戳
    $curtime=time();//当前时间戳
    $newtime=$curtime-$endtime;//新时间戳
    $rand=rand(10000,99999);//5随机
    $all=$rand.$newtime;
    $onlyid=base_convert($all,10,36);//把10进制转为36进制的唯一ID
    return $onlyid;
}
/**
 * 返回活码生成地址
 */
 function get_liveurl ($d=''){
     return C('HOME_PAGE').'/index.php/huoma/live?d='.$d;
}
/**
 * 返回产品活码地址
 */
 function get_producturl ($d=''){
     return C('HOME_PAGE').'/index.php/huoma/product?d='.$d;
}
/**
 * 返回网址活码地址
 */
function get_huomaurl ($d=''){
	 return C('HOME_PAGE').'/index.php/huoma/?d='.$d;
}
/**
 * 返回多网址活码地址
 */
 function get_huomaurlduo ($d=''){
	 return C('HOME_PAGE').'/index.php/huoma/duo?d='.$d;
}

/**
 * 生成二维码
 */
function qrcode($url='',$id=0,$urltype=1){
    Vendor('phpqrcode.phpqrcode');
  
    $errorCorrectionLevel =3 ;//容错级别 
    $matrixPointSize = 7;//生成图片大小 
    if ( $urltype==1 ){
    	$filepath='Uploads/livecode/';  //活码生成
    }elseif ( $urltype==2 ){
    	$filepath='Uploads/product/';   //产品活码
    }elseif ( $urltype==3 ){
        $filepath='Uploads/ewm/';       //视频活码
    }elseif ( $urltype==4 ){
        $filepath='Uploads/phone/';     //网址跳转
    }elseif ( $urltype==5 ){
        $filepath='Uploads/duourl/';    //多网址跳转
    }elseif ( $urltype==6 ){
        $filepath='Uploads/product/';    //多网址跳转
    }
    // 生成的文件名
    $fileName = $filepath.$id.'.png';
    $object = new \QRcode();
    $object->png($url, $fileName, $errorCorrectionLevel, $matrixPointSize, 2);   
}

function get_duourl_titlearr ($title=''){
	return explode('|||',$title);
}

function get_duourl_tztimearr ($tztime=''){
	return explode('|||',$tztime);
} 



//视频上传
function getChunkFilename ($chunkNumber, $identifier,$filename, $uploads_dir){
        
    $temp_dir = $uploads_dir.'/'.$identifier;
    return  $temp_dir.'/'.$filename.'.part'.$chunkNumber;
}
function cleanIdentifier ($identifier){
    return $identifier;
    //return  preg_replace('/^0-9A-Za-z_-/', '', $identifier);
}
//$maxFileSize = 2*1024*1024*1024;
function validateRequest ($chunkNumber, $chunkSize, $totalSize, $identifier, $filename, $fileSize=''){
    // Clean up the identifier
    //$identifier = cleanIdentifier($identifier);
    // Check if the request is sane
    if ($chunkNumber==0 || $chunkSize==0 || $totalSize==0 || $identifier==0 || $filename=="") {
        return 'non_resumable_request';
    }
    $numberOfChunks = max(floor($totalSize/($chunkSize*1.0)), 1);
    if ($chunkNumber>$numberOfChunks) {
        return 'invalid_resumable_request1';
    }
    // Is the file too big?
    //      if($maxFileSize && $totalSize>$maxFileSize) {
    //          return 'invalid_resumable_request2';
    //  }
    if($fileSize!="") {
        if($chunkNumber<$numberOfChunks && $fileSize!=$chunkSize) {
            // The chunk in the POST request isn't the correct size
            return 'invalid_resumable_request3';
        }
        if($numberOfChunks>1 && $chunkNumber==$numberOfChunks && $fileSize!=(($totalSize%$chunkSize)+$chunkSize)) {
            // The chunks in the POST is the last one, and the fil is not the correct size
            return 'invalid_resumable_request4';
        }
        if($numberOfChunks==1 && $fileSize!=$totalSize) {
            // The file is only a single chunk, and the data size does not fit
            return 'invalid_resumable_request5';
        }
    }
    return 'valid';
}
// loop through files and move the chunks to a temporarily created directory

/**
*
* Logging operation - to a file (upload_log.txt) and to the stdout
* @param string $str - the logging string
*/
function _log($str) {
    // log to the output
    $log_str = date('d.m.Y').": {$str}\r\n";
    echo $log_str;
    // log to file
    if (($fp = fopen('upload_log.txt', 'a+')) !== false) {
        fputs($fp, $log_str);
        fclose($fp);
    }
}
/**
*
* Delete a directory RECURSIVELY
* @param string $dir - directory path
* @link http://php.net/manual/en/function.rmdir.php
*/
function rrmdir($dir) {
    if (is_dir($dir)) {
        $objects = scandir($dir);
        foreach ($objects as $object) {
            if ($object != "." && $object != "..") {
                if (filetype($dir . "/" . $object) == "dir") {
                    rrmdir($dir . "/" . $object);
                } else {
                    unlink($dir . "/" . $object);
                }
            }
        }
        reset($objects);
        rmdir($dir);
    }
}
/**
*
* Check if all the parts exist, and
* gather all the parts of the file together
* @param string $dir - the temporary directory holding all the parts of the file
* @param string $fileName - the original file name
* @param string $chunkSize - each chunk size (in bytes)
* @param string $totalSize - original file size (in bytes)
*/
function createFileFromChunks($temp_dir, $fileName, $chunkSize, $totalSize, $uploads_dir) {
    // count all the parts of this file
    $total_files = 0;
    foreach(scandir($temp_dir) as $file) {
        if (stripos($file, $fileName) !== false) {
            $total_files++;
        }
    }
    // check that all the parts are present
    // the size of the last part is between chunkSize and 2*$chunkSize
    if ($total_files * $chunkSize >=  ($totalSize - $chunkSize + 1)) {
        // create the final destination file
        if (($fp = fopen($uploads_dir.'/'.$fileName, 'w')) !== false) {
            for ($i=1; $i<=$total_files; $i++) {
                fwrite($fp, file_get_contents($temp_dir.'/'.$fileName.'.part'.$i));
                //_log('writing chunk '.$i);
            }
            fclose($fp);
        } else {
            _log('cannot create the destination file');
            return false;
        }
        // rename the temporary directory (to avoid access from other
        // concurrent chunks uploads) and than delete it
        if (rename($temp_dir, $temp_dir.'_UNUSED')) {
            rrmdir($temp_dir.'_UNUSED');
        } else {
            rrmdir($temp_dir);
        }
    }
}
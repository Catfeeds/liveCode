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

function get_dwz() {
       
        $endtime=1356019200;//2012-12-21时间戳
        $curtime=time();//当前时间戳
        $newtime=$curtime-$endtime;//新时间戳
        $rand=rand(10000,99999);//5随机
        $all=$rand.$newtime;
        $onlyid=base_convert($all,10,36);//把10进制转为36进制的唯一ID
        return $onlyid;
    }
 function get_huomaurl ($d='')
{
	 return C('HOME_PAGE').'/index.php/huoma/?d='.$d;
}
 function get_huomaurlduo ($d='')
{
	 return C('HOME_PAGE').'/index.php/huoma/duo?d='.$d;
}
 function qrcode($url='http://www.baidu.com',$id=0,$urltype=1){
 
  Vendor('phpqrcode.phpqrcode');
  
  $errorCorrectionLevel =3 ;//容错级别 
  $matrixPointSize = 7;//生成图片大小 
if ( $urltype==1 )
{
	$filepath='Uploads/ewm/';
}else{
	$filepath='Uploads/duourl/';
}
            // 生成的文件名
            $fileName = $filepath.$id.'.png';
  $object = new \QRcode();
  $object->png($url, $fileName, $errorCorrectionLevel, $matrixPointSize, 2);   

 }
function get_duourl_titlearr ($title='')
{
	return explode('|||',$title);
}
function get_duourl_tztimearr ($tztime='')
{
	return explode('|||',$tztime);
} 



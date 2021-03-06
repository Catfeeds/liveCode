$(function(){
	var postUrl = 'admin.php?s=/admin/video/addfile';
	//文件活码上传
	layui.config({
    base:'Public/libs/uploadVideo/', //mupload模块所在的目录
	}).use(['mupload'], function(){
        layui.mupload({
          //必须，服务器路径
          url:postUrl,
          //必须，传递table的id,请不要传class
          container:'#shiptab',
          //默认"file"，用于服务器获取文件名
          file_name:'file',
          //回调函数
          complete:function(res){
            if(res[0].code != 0){
                return layer.msg('上传失败');
            }else{
                //上传成功
                $('#fileSize').val(res[0].uploadFileSize);
                $('#fileUrl').val(res[0].uploadFileUrl);
            }
          }
	    });
	})
})
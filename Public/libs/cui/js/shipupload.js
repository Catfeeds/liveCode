$(function(){
	var postUrl = 'admin.php?s=/admin/livecode/addfile';
	var codeType= $("#codeType").val();     //管理员审核编辑
    if (codeType) {
        postUrl = 'admin.php?s=/admin/checkcode/addLivecodeFile';
    }
    var productPostUrl = 'admin.php?s=/admin/product/addfile';
	var codeType= $("#codeType").val();     //管理员审核编辑
    if (codeType) {
        productPostUrl = 'admin.php?s=/admin/product/addLivecodeFile';
    }

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
              console.log(res)
          }
	    });
	})
})
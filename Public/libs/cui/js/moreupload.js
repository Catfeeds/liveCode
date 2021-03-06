$(function(){
	var codeType= $("#codeType").val();     //管理员审核编辑
	var postUrl = 'admin.php?s=/admin/livecode/addfile';
    if (codeType) {
        postUrl = 'admin.php?s=/admin/checkcode/addLivecodeFile';
    }
    var productPostUrl = 'admin.php?s=/admin/product/addfile';
    if (codeType) {
        productPostUrl = 'admin.php?s=/admin/checkcode/addLivecodeFile';
    }

	//文件活码上传
	layui.config({
    base:'Public/libs/uploadFile/', //mupload模块所在的目录
	}).use(['mupload'], function(){
            layui.mupload({
              //必须，服务器路径
              url:postUrl,
              //必须，传递table的id,请不要传class
              container:'#container',
              //默认"file"，用于服务器获取文件名
              file_name:'file',
              //回调函数
              complete:function(res){
                  	$('#uploadFileName').val(res[0].uploadFileName);
	        		$('#uploadFileSize').val(res[0].uploadFileSize);
	        		$('#uploadFileUrl').val(res[0].uploadFileUrl);
              }
	    });
	})
	
	layui.use('upload', function(){
	  var $ = layui.jquery,upload = layui.upload;
	  // //多文件列表示例
	  // var demoListView = $('#demoList')
	  // uploadListIns = upload.render({
	  //   elem: '#testList'
	  //   ,url: postUrl
	  //   ,accept: 'file'
   //      ,exts: "doc|docx|pdf|xls|xlsx|ppt|pptx|wps|txt|zip|rar|gz|bz2|7z|gif|jpg|jpeg|png|bmp"
   //      ,size: 10240
	  //   ,multiple: true
	  //   ,auto: false
	  //   ,bindAction: '#testListAction'
	  //   ,choose: function(obj){   
	  //     var files = obj.pushFile();//将每次选择的文件追加到文件队列
	      
	  //     //读取本地文件
	  //     obj.preview(function(index, file, result){
	  //       var tr = $(['<tr id="upload-'+ index +'">'
	  //         ,'<td>'+ file.name +'</td>'
	  //         ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
	  //         ,'<td>等待上传</td>'
	  //         ,'<td>'
	  //           ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
	  //           ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
	  //         ,'</td>'
	  //       ,'</tr>'].join(''));
	        
	  //       //单个重传
	  //       tr.find('.demo-reload').on('click', function(){
	  //         obj.upload(index, file);
	  //       });
	        
	  //       //删除
	  //       tr.find('.demo-delete').on('click', function(){
	  //         delete files[index]; //删除对应的文件
	  //         tr.remove();
	  //       });
	        
	  //       demoListView.html(tr);
	  //       notAllow();
	  //     });
	  //   }
	  //   ,done: function(res, index, upload){
	    	
	  //     if(res.status == 1){ //上传成功
	  //       var tr = demoListView.find('tr#upload-'+ index)
	  //       ,tds = tr.children();
	  //       tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
	  //       tds.eq(3).html(''); //清空操作
	  //       $('#uploadFileName').val(res.info.uploadFileName);
	  //       $('#uploadFileSize').val(res.info.uploadFileSize);
	  //       $('#uploadFileUrl').val(res.info.uploadFileUrl);
	  //       notAllow();
	  //       return;
	  //     }
	      
	  //     this.error(index, upload);
	  //   }
	  //   ,error: function(index, upload){
	  //     var tr = demoListView.find('tr#upload-'+ index)
	  //     ,tds = tr.children();
	  //     tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
	  //     tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
	  //   }
	  // });
	  
	  
	  //普通图片上传
	  var uploadInst = upload.render({
	    elem: '#test1'
	    ,url: postUrl
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#demo1').attr('src', result); //图片链接（base64）
	      });
	    }
	    ,done: function(res){
	    	console.log(res)
	      //如果上传失败
	      if(res.code != 0){
	        return layer.msg('上传失败');
	      }else{
	      	//上传成功
	        $('#uploadPicUrl').val(res.uploadFileUrl);
	      }
	      
	    }
	    ,error: function(){
	      //演示失败状态，并实现重传
	      var demoText = $('#demoText');
	      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>  <a class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</a>');
	      demoText.find('.demo-reload').on('click', function(){
	        uploadInst.upload();
	      });
	      //演示失败状态，并实现删除
	      demoText.find('.demo-delete').on('click', function(){
	      	  $('#demo1').attr('src', '/Public/images/noimg.png');
	          demoText.empty();
	      });
	    }
	  });

	  //名片头像上传
	  var uploadInst2 = upload.render({
	    elem: '#uploadAvatar'
	    ,url: postUrl
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('.head_img').attr('src', result); //图片链接（base64）
	      });
	    }
	    ,done: function(res){
	      //如果上传失败
	      if(res.code != 0){
	        return layer.msg('上传失败');
	      }else{
	      	//上传成功
	      	$(".vcard_face").css({"background-image":"url("+'/'+res.uploadFileUrl+")"});
	      }
	      
	    }
	    ,error: function(){
	    }
	  });
	  //名片背景上传
	  var uploadInst3 = upload.render({
	    elem: '#upload-bg'
	    ,url: postUrl
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('.imgshow img').attr('src', result); //图片链接（base64）
	      });
	    }
	    ,done: function(res){
	      //如果上传失败
	      if(res.code != 0){
	        return layer.msg('上传失败');
	      }else{
	      	//上传成功
	      	$('#bglist li').addClass('active').siblings('li').removeClass('active');
			// var imgSrc=$('#bglist li').find('.imgshow img').attr('src');
			$(".imgShowBox").addClass('active');
			$('.imgshow img').attr('src', res.uploadFileUrl); //图片链接（base64）
	      	$(".vcard_head").css({"background-image":"url("+'/'+res.uploadFileUrl+")"});
	      }
	      
	    }
	    ,error: function(){
	    }
	  });
	  
	  
	  //产品活码图片上传
	  var uploadInst4 = upload.render({
	    elem: '#testcp'
	    ,url: productPostUrl
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#demo1').attr('src', result); //图片链接（base64）
	      });
	    }
	    ,done: function(res){
	      //如果上传失败
	      if(res.status != 1){
	        return layer.msg('上传失败');
	      }else{
	      	//上传成功
	        $('#uploadPicUrl').val(res.data);
	      }
	      
	    }
	    ,error: function(){
	      //演示失败状态，并实现重传
	      var demoText = $('#demoText');
	      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>  <a class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</a>');
	      demoText.find('.demo-reload').on('click', function(){
	        uploadInst4.upload();
	      });
	      //演示失败状态，并实现删除
	      demoText.find('.demo-delete').on('click', function(){
	      	  $('#demo1').attr('src', '/Public/images/noimg.png');
	          demoText.empty();
	      });
	    }
	  });
	  
	  //产品活码识别二维码
	  var uploadInst5 = upload.render({
	    elem: '#uploadCode'
	    ,url: 'admin.php?s=/admin/product/getQrcodeContent'
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#demo5').attr('src', result); //图片链接（base64）
	      });
	    }
	    ,done: function(res){
	      //如果上传失败
	      if(res.status != 1){
	        return layer.msg('上传失败');
	      }else{
	      	//上传成功
	        $('#modal-ewm-input').val(res.data);
	        $('#uploadWechat').val(res.data);
	      }
	      
	    }
	    ,error: function(){
	      //演示失败状态，并实现重传
	      var demoText = $('#demoText5');
	      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>  <a class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</a>');
	      demoText.find('.demo-reload').on('click', function(){
	        uploadInst5.upload();
	      });
	      //演示失败状态，并实现删除
	      demoText.find('.demo-delete').on('click', function(){
	      	  $('#demo5').attr('src', '/Public/images/noimg.png');
	          demoText.empty();
	      });
	    }
	  });
	  
	  	
	});
	
	
	
	var notAllow=function(){
		var span=$("#demoList").find('tr td:nth-child(3) span').html();
		if(span=='上传成功'){
			$("#testListAction").prop('disabled','true');
			$("#testListAction").css('cursor','not-allowed');
		}else if(span!='上传成功'){
			$("#testListAction").removeAttr('disabled');
			$("#testListAction").css('cursor','pointer');
		}
	}
})
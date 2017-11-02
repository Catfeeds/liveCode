$(function(){
	var postUrl = 'admin.php?s=/admin/livecode/addfile';
	var codeType= $("#codeType").val();     //管理员审核编辑
    if (codeType != '') {
        postUrl = 'admin.php?s=/admin/checkcode/addLivecodeFile';
    }

	layui.use('upload', function(){
	  var $ = layui.jquery,upload = layui.upload;
	  //多文件列表示例
	  var demoListView = $('#demoList')
	  uploadListIns = upload.render({
	    elem: '#testList'
	    ,url: postUrl
	    ,accept: 'file'
        ,exts: "doc|docx|pdf|xls|xlsx|ppt|pptx|wps|txt|zip|rar|gz|bz2|7z|gif|jpg|jpeg|png|bmp"
        ,size: 10240
	    ,multiple: true
	    ,auto: false
	    ,bindAction: '#testListAction'
	    ,choose: function(obj){   
	      var files = obj.pushFile();//将每次选择的文件追加到文件队列
	      
	      //读取本地文件
	      obj.preview(function(index, file, result){
	        var tr = $(['<tr id="upload-'+ index +'">'
	          ,'<td>'+ file.name +'</td>'
	          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
	          ,'<td>等待上传</td>'
	          ,'<td>'
	            ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
	            ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
	          ,'</td>'
	        ,'</tr>'].join(''));
	        
	        //单个重传
	        tr.find('.demo-reload').on('click', function(){
	          obj.upload(index, file);
	        });
	        
	        //删除
	        tr.find('.demo-delete').on('click', function(){
	          delete files[index]; //删除对应的文件
	          tr.remove();
	        });
	        
	        demoListView.html(tr);
	        notAllow();
	      });
	    }
	    ,done: function(res, index, upload){
	    	
	      if(res.status == 1){ //上传成功
	        var tr = demoListView.find('tr#upload-'+ index)
	        ,tds = tr.children();
	        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
	        tds.eq(3).html(''); //清空操作
	        $('#uploadFileName').val(res.info.uploadFileName);
	        $('#uploadFileSize').val(res.info.uploadFileSize);
	        $('#uploadFileUrl').val(res.info.uploadFileUrl);
	        notAllow();
	        return;
	      }
	      
	      this.error(index, upload);
	    }
	    ,error: function(index, upload){
	      var tr = demoListView.find('tr#upload-'+ index)
	      ,tds = tr.children();
	      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
	      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
	    }
	  });
	  
	  
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
	      //如果上传失败
	      if(res.status != 1){
	        return layer.msg('上传失败');
	      }else{
	      	//上传成功
	        $('#uploadPicUrl').val(res.info.uploadFileUrl);
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
	      if(res.status != 1){
	        return layer.msg('上传失败');
	      }else{
	      	//上传成功
	      	$(".vcard_face").css({"background-image":"url("+'/Uploads/livecode/file/'+res.info.uploadFileUrl+")"});
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
	      if(res.status != 1){
	        return layer.msg('上传失败');
	      }else{
	      	//上传成功
	      	$('#bglist li').addClass('active').siblings('li').removeClass('active');
			// var imgSrc=$('#bglist li').find('.imgshow img').attr('src');
			$(".imgShowBox").addClass('active');
			$('.imgshow img').attr('src', '/Uploads/livecode/file/'+res.info.uploadFileUrl); //图片链接（base64）
	      	$(".vcard_head").css({"background-image":"url("+'/Uploads/livecode/file/'+res.info.uploadFileUrl+")"});
	      }
	      
	    }
	    ,error: function(){
	    }
	  });
	  
	  
	  //产品活码图片上传
	  var uploadInst = upload.render({
	    elem: '#testcp'
	    ,url: 'url'
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
	        $('#uploadPicUrl').val(res.info.uploadFileUrl);
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
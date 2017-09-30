$(function(){
	layui.use('upload', function(){
	  var $ = layui.jquery,upload = layui.upload;
	  //多文件列表示例
	  var demoListView = $('#demoList')
	  uploadListIns = upload.render({
	    elem: '#testList'
	    ,url: 'admin.php?s=/admin/livecode/addfile'
  		,data: {name1:1} //可选项。额外的参数，如：{id: 123, abc: 'xxx'}
	    ,accept: 'file'
        ,exts: "doc|docx|pdf|xls|xlsx|ppt|pptx|wps|txt|zip|rar|gz|bz2|7z|gif|jpg|jpeg|png|bmp"
        ,size: 10240
	    ,multiple: true
	    ,auto: false
	    ,bindAction: '#testListAction'
	    ,choose: function(obj){   
	      var files = obj.pushFile(); //将每次选择的文件追加到文件队列
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
	      });
	    }
	    ,done: function(res, index, upload){
	      if(res.code == 0){ //上传成功
	        var tr = demoListView.find('tr#upload-'+ index)
	        ,tds = tr.children();
	        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
	        tds.eq(3).html(''); //清空操作
	        delete files[index]; //删除文件队列已经上传成功的文件
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
	});
})
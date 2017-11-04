function treehove(id){
	$('#tree_'+id).show();
	event.stopPropagation();
}

function treeout(id){
	$('#tree_'+id).hide();
	event.stopPropagation();
}

//增加目录
function treeadd(obj,pid){		
	$.ajax({
        type: "POST", 
        async: "false", 
        url: 'admin.php?s=/admin/module/add', 
        data: {'pid':pid}, 
        success: function (data) { 	
        	if (data.status == 1) {
        		 window.location.href='/admin.php?s=/admin/'+data.info.codeType+'/addmenu.html';
        	}else{
				$.alertMessager('获取目录失败');
        	}				
        } 
   	});
}

//编辑目录
function treedit(obj,id){
	var html=$(obj).parent('.changetree').siblings('a').find('.ml').html();
	var ahref=$(obj).parent('.changetree').siblings('a').attr('href');
	var Input="<input type='text' class='treeinp' value='"+ html +"' style='width:80px;height:18px;' autofocus='autofocus'/>"
	$(obj).parent('.changetree').siblings('a').find('.ml').html(Input);
	$(obj).parent('.changetree').siblings('a').attr('href','javascript:;');
	$(obj).parent('.changetree').hide();
	var inp=$(obj).parent('.changetree').siblings('a').find('.ml').find('input');
	inp.select();
	inp.blur(function(){
		var title = $(this).val();
		$(this).parent('.ml').parent('a').attr('href',ahref);
		$(this).parent('.ml').html(title);
		$(this).parent('.ml').parent('a').siblings('.changetree').show();
		$.ajax({
	        type: "POST", 
	        async: "false", 
	        url: 'admin.php?s=/admin/module/edit', 
	        data: {'id':id,'title':title}, 
	        success: function (data) {
	        	if (data.status == 1) {
					$.alertMessager(data.info,'success');
	        	}else{
					$.alertMessager(data.info);
	        	}
				setTimeout(function(){window.location.reload();},2000);
	        } 
	    });
	})
}

//删除目录
function treedel(obj,id,pid){
	var trueOrFalse = confirm('确定删除该目录吗？');
	if(!trueOrFalse){
		return;
	}else{
		 $.ajax({ 
             type: "POST", 
             async: "false", 
             url: 'admin.php?s=/admin/module/del',
             data: {'id':id,'pid':pid}, 
             success: function (data) {
             	if (data.status == 1) {
					$.alertMessager(data.info,'success');
	        	}else{
					$.alertMessager(data.info);
	        	}
				setTimeout(function(){window.location.reload();},2000);
             } 
         }); 
	}
}
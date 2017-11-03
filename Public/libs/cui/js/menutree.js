	function treehove(id){
		$('#tree_'+id).show();
		event.stopPropagation();

	}
	
	function treeout(id){
		$('#tree_'+id).hide();
		event.stopPropagation();
	}
	
	//增加目录
	function treeadd(obj,parentid){		
		$.ajax({
	        type: "POST", 
	        async: "false", 
	        url: "add", 
	        data: {'parentid':parentid}, 
	        success: function (data) { 					
			var addhtml='<ul class="treeUl"><li onmouseover=treehove('+data.id+') onmouseout=treeout('+data.id+')>';
		        addhtml+='<a href="" style="height: 34px;"></a>';
		        addhtml+='<span class="nav-label ml">新建目录</span>';
		        addhtml+='<div class="changetree" id="tree_'+data.id+'">';
		        addhtml+='<span class="button add" onclick="treeadd(this,'+parentid+')" title="新建目录"></span>';
		        addhtml+='<span class="button edit" onclick="treedit(this,'+data.id+')" title="编辑目录" ></span>';
		        addhtml+='<span class="button remove" onclick="treedel(this,'+data.id+')" title="删除目录"></span></div>';
		        addhtml+='</li></ul>';
				$(obj).parent('.changetree').after(addhtml);
				event.stopPropagation();
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
			var name = $(this).val();
			$(this).parent('.ml').parent('a').attr('href',ahref);
			$(this).parent('.ml').html(name);
			$(this).parent('.ml').parent('a').siblings('.changetree').show();
			$.ajax({
		        type: "POST", 
		        async: "false", 
		        url: "edit", 
		        data: {'id':id,'name':name}, 
		        success: function (data) {
		        	event.stopPropagation();
		        } 
		    });
		})
	}
	
	//删除目录
	function treedel(obj,id){
		var trueOrFalse = confirm('确定删除该目录吗？');
		if(!trueOrFalse){
			return;
		}else{
			 $.ajax({ 
                 type: "POST", 
                 async: "false", 
                 url: "del", 
                 data: {'id':id}, 
                 success: function () {
                 	event.stopPropagation();
                 } 
             }); 
		}
	}
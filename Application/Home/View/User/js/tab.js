//window.onload=function(){
//	//选项卡1
//	var edition=document.getElementsByClassName("edition")[0];
//	var editLis=edition.getElementsByTagName("li");
//	for(var i=0;i<editLis.length;i++){
//		editLis[i].index=i;
//		editLis[i].onclick=function(){
//			for(var i=0;i<editLis.length;i++){
//				editLis[i].className="";
//			}
//			editLis[this.index].className="edit_on";
//		}
//	}		
//	//选项卡2
//	var duration=document.getElementsByClassName("duration")[0];
//	var duratLis=duration.getElementsByTagName("li");
//	for(var i=0;i<duratLis.length;i++){
//		duratLis[i].index=i;
//		duratLis[i].onclick=function(){
//			for(var i=0;i<duratLis.length;i++){
//				duratLis[i].className="";
//			}
//			duratLis[this.index].className="edit_on";
//		}
//	}	
//}

$(function(){
	$(".duration li").each(function(i){
		$(this).click(function(){
			$(this).addClass("edit_on").siblings('li').removeClass("edit_on");
			$('#duration').val(i);
			aihuoma();
		})
	})
	$(".edition li").each(function(i){
		$(this).click(function(){
			$(this).addClass("edit_on").siblings('li').removeClass("edit_on");
			$('#edition').val(i);
			aihuoma();
		})
	})
	$(".payli li").each(function(i){
		$(this).click(function(){
			$(this).addClass("edit_on").siblings('li').removeClass("edit_on");
			$('#payli').val(i);
			var _val=$("#payli").attr("value");
			if(_val==2){
				$(".offline").show();
				$(".now_buy").hide();
			}else{
				$(".offline").hide();
				$(".now_buy").show();
			}
		})
	})
	function aihuoma(){
		var _html=$(".edition .edit_on").html();
		var _html1=$(".duration .edit_on p").html();
		var _html2=$(".duration .edit_on .jine").html();
		$(".col1").html(_html+_html1);
		$(".col2 font").html(_html2);
	}
	
	
})



$(function(){
	$(".dis_block li:first-child").addClass('edit_on');
	$(".duration li").each(function(){
		$(".duration li").click(function(){
			$(this).addClass("edit_on").siblings('li').removeClass("edit_on");
			aihuoma();
		})
	})
	$(".edition li").each(function(){
		$(this).click(function(){
			$(this).addClass("edit_on").siblings('li').removeClass("edit_on");
			var index=$(this).index();
			$(".ch_edit .duration").eq(index).addClass('dis_block').show().siblings().removeClass('dis_block').hide();
			$(".dis_block li:first-child").addClass('edit_on').siblings('li').removeClass('edit_on');
			aihuoma();
		})
	})
	$(".payli li").each(function(i){
		$(this).click(function(){
			$(this).addClass("edit_on").siblings('li').removeClass("edit_on");
			$('#payType').val(i);
			var _val=$("#payType").attr("value");
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
		var banben=$(".edition .edit_on").html();
		var nian=$(".duration.dis_block .edit_on p").html();
		var nian_num=nian.split('')[0];
		var edu=$(".duration.dis_block .edit_on .jine").html();
		var tot=nian_num*edu;
		$(".col1").html(banben+nian);
		$(".col2 font").html(tot);
		$(".vip").val(banben);
		$(".year").val(nian_num);
		$(".money").val(tot);
	}
	aihuoma();
	
})


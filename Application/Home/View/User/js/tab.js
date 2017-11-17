
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
			edit();
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
		var nian_num=nian.split('年')[0];
		var edu=$(".duration.dis_block .edit_on .jine").html();
		var tot=nian_num*edu;

		$(".col2 font").html(tot);
		$(".col1").html(banben+'&nbsp;'+nian);
		$(".vip").val(banben);
		$(".year").val(nian_num);
		// 选择的套餐id
		var vipId = $(".edition .edit_on").attr('vipId');
		if (vipId == $("#vipId").val()) {
			$(".sale font").html(0);
		}else{
			$(".sale font").html($("#sale").val());
		}
		//续费差价
		var sale=$(".sale font").html();
		if (sale) {
			var feetotal=nian_num*edu-sale;
			if (feetotal < 0) {
				feetotal = 0;
			}
			$(".total font").html(feetotal);
			$(".money").val(feetotal);
		}else{
			//购买
			$(".money").val(tot);
		}
	}
	aihuoma();
	
	function edit(){
		var edit_on=$(".edition .edit_on").html();
		//alert(edit_on)
		$(".con_table tr th").each(function(){
			var th=$(this).html();
			if(edit_on==th){
				var ind = $(this).index()+1;
				$(this).addClass('bgcolg').siblings('th').removeClass('bgcolg');
				$(".con_table tr td:nth-child("+ind+")").addClass('bgcolg').siblings('td').removeClass('bgcolg');
			}
		})
	}
	edit();
})


$(function(){
	//头部选项卡
	$(".tab_code li").click(function(){
		$(this).addClass('tab_active').siblings('li').removeClass('tab_active');
		var index=$(this).index();
		$(".wrapper .editor-wrap").eq(index).show().siblings('.editor-wrap').hide();
	})
	//左侧鼠标经过
	$(".left_box").each(function(){
		$(this).hover(function(){
			$(this).find('.bg_wrap.green').removeClass('hidden').siblings('.left_box').find('.bg_wrap.green').addClass('hidden');
		},function(){
			$(this).find('.bg_wrap.green').addClass('hidden');
		})
		$(this).click(function(){
			$(this).addClass('border-rt-green').siblings('.left_box').removeClass('border-rt-green');
			var pos_top=$(this).position().top;
			var index=$(this).index();
			$("#rightwrap .edit_area").eq(index).show().siblings('.edit_area').hide();
			$("#rightwrap .edit_area").eq(index).css({'margin-top':pos_top});
		})
	})
	$('.close').click(function(){
		$(this).parent('.edit_area').css({'display':'none'});
	})
	
	
	//监听input事件
	$(".inp_t input,textarea").focus(function(){
		$(this).siblings('.length_tip').show();
		$(this).bind('input propertychange', function() {  
			var _val=$(this).val().length;
			$(this).siblings('.length_tip').find('font').html(_val);
			var val_con=$(this).val();
//			alert(val_con)
		});  
	})
	$(".inp_t input").blur(function(){
		$(this).siblings('.length_tip').hide();
	})
	  
	
	//layout选项卡
	$('.field-layout li').each(function(i){
		$(this).click(function(){
			$(this).addClass('active').siblings('li').removeClass('active');
			$('#info-layout').val(i);
			var infoVal=$('#info-layout').attr('value');
			if(infoVal==1){
				$(".vcard_head").addClass('layout-m').removeClass('layout-r');
			}else if(infoVal==2){
				$(".vcard_head").addClass('layout-r').removeClass('layout-m');
			}else if(infoVal==0){
				$(".vcard_head").removeClass('layout-m layout-r');
			}
		})
	})
	
	//语言切换
	$('.language input').each(function(){
		$(this).click(function(){
			var check_id=$(this).attr('id');
			if($('#lang').val()==check_id) return;
			if($(this).is(":checked")){
				$('#lang').val(check_id);
			}
			$('.lang').each(function(){
				var lang_key=$(this).attr('data-lang-key');
				var lang_html=$(this).html();
				$(this).attr('data-lang-key',lang_html);
				$(this).html(lang_key);
			})
		})
	})
})

//上传图片
$(".head_upload").change(function(){
	$(this).parents('#avatar-upload').hide();
	$('#portraitSubmit').show();
})
$("#upload-bg").change(function(){
	$('.imgShowBox').show();
})

//遮罩层
$(".show_btn").click(function(){
	$(".theme-popover-mask").show();
	$(".theme-popover").fadeIn();
})
$(".btn-cancel").click(function(){
	$("#front_cover").show();
	$(".form_file").hide();
	$(".theme-popover-mask").hide();
	$(".theme-popover").fadeOut();
	var showImg=$(".bgbtn").attr("src");
	$(".vcard_head").css({"background-image":"url("+showImg+")"});
})
$(".btn-ok").click(function(){
	$("#front_cover").show();
	$(".form_file").hide();
	$(".theme-popover-mask").hide();
	$(".theme-popover").fadeOut();
	var imgsrc=$("#bglist li.active").find('img').attr('src');
	$(".vcard_head").css({"background-image":"url("+imgsrc+")"});
	$(".bgbtn").attr("src",imgsrc);
})
$(".up_close").click(function(){
	$(this).parents('.parent').hide().siblings().show();
})
$("#bglist li").click(function(){
	$(this).addClass('active').siblings('li').removeClass('active');
	var imgSrc=$(this).find('img').attr('src');
	$("#sel-bgcolor").val(imgSrc);
	$(".vcard_head").css({"background-image":"url("+imgSrc+")"});
})

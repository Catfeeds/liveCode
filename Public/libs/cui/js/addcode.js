$(function(){
	$(".tab_code li").click(function(){
		$(this).addClass('tab_active').siblings('li').removeClass('tab_active');
		var index=$(this).index();
		$(".wrapper .editor-wrap").eq(index).show().siblings('.editor-wrap').hide();
	})
})

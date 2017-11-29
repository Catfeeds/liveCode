//高级编辑器模块
define(function(require, exports, module) {
	function senior_edit(data){
		var seniorEdit = ['<div class="senior_bg" id="senior_edit">'];
		seniorEdit.push('<iframe src="'+SENIOR_EDIT+'/senior_edit.html" id="iframe" name="senior_iframe" scrolling="no" frameborder="0">');
        seniorEdit.push('</iframe>');
        seniorEdit.push('</div>');

		var link = '<link href="'+STATIC_SERVICE+'/cli/css/senior_edit.css" rel="stylesheet" media="all" />';
		$('head').append(link);//加载样式
		$('body').append(seniorEdit.join(''));//输出
        $('body',window.parent.document).css('overflow','hidden'); // 背景禁用scroll

        //iframe高度随屏幕大小变化
        var window_h = document.documentElement.clientHeight,
            iframe_h;
        function iframeHeight(){
            if(window_h <= 700){
                iframe_h = window_h - 30 - 30;
            }else if(700 < window_h && window_h <= 900){
                iframe_h = window_h - 50 - 50;
            }else if(window_h > 900){
                iframe_h = window_h - 110 - 110;
            }
            $('#iframe').css({'height':iframe_h+'px','margin-top':-iframe_h/2+'px'});
        }
        iframeHeight();
        //窗口大小发生改变时iframe高度自适应
        $(window).resize(function(){
            window_h = document.documentElement.clientHeight;
            iframeHeight();
        });
        
        $('#iframe').load(function(){
            //打开时获取活码编辑页编辑器中的内容并显示在高级编辑器中
            window.frames['senior_iframe'].window.setContent(data.current_con);
            //关闭弹框
            var close=window.frames['senior_iframe'].document.getElementById('close');
            $(close).click(function(){
				
                $('body',window.parent.document).css('overflow','auto');  // 背景启用scroll

                $('#senior_edit').remove();
                if (typeof data.domaincallback=="function") {
                    data.domaincallback();
                }
            });
            //保存内容
            var save_btn=window.frames['senior_iframe'].document.getElementById('save_btn');
            $(save_btn).click(function(){
                $('body',window.parent.document).css('overflow','auto');  // 背景启用scroll 
                window.frames['senior_iframe'].window.saveContent(function(ret){
                    if(typeof data.savecallback=="function"){
                        data.savecallback(ret);//ret为iframe的子页面中编辑器的内容
                        $('#senior_edit').remove();//移除弹框
                        if (typeof data.domaincallback=="function"){
                            data.domaincallback();
                        }
                    }
                });
                $('.phone_num1').on('mouseenter mouseleave',function(e){
		        	$(this).parents('.phonen').attr('href',"tel:"+$(this).html());
					$(this).parents('.phonen').attr('_href',"tel:"+$(this).html());
		        })
				$('.phone_num').on('mouseenter mouseleave',function(e){
		        	$(this).parents('.phonen').attr('href',"tel:"+$(this).html());
					$(this).parents('.phonen').attr('_href',"tel:"+$(this).html());
		        })
            });
        });
	}

	exports.senior_edit = senior_edit;
});
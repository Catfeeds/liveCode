;(function($){
    // 加载样式&插件
        if ($('#clistyle-stylesheet').length == 0) {   //不重复加载
            $('<link rel="stylesheet" id="clistyle-plugins-stylesheet" href="'+STATIC_SERVICE+'/cli/css/clistyle.css">').appendTo('head');
        }
        if ($('#jquery-spectrum').length == 0) {
        	$('<script id="jquery-spectrum" src="'+STATIC_SERVICE+'/cli/js/lib/plug/jquery.spectrum.min.js"></script>').appendTo('head');
        	$('<link rel="stylesheet" id="jquery-spectrum-stylesheet" href="'+STATIC_SERVICE+'/cli/js/lib/plug/jquery.spectrum.min.css">').appendTo('head');
        }
    $.fn.clistyle = function(options){
    	// 参数
	    var defaults = {
	        top: 48,
	        height: windowHeight-48,
	        editorMain: '#editor_main',
	        onlyTable: false,
	    };

	    var o = $.extend(defaults, options);
	    
	    // 编辑器右移
	    var windowHeight = $(window).height();
    	var windowWidth = $(window).width();
    	var editorPaddingX = (windowWidth - 810)/2;
    	if (editorPaddingX < (305 + 20)) {
    		var editorTransformX = 305 - editorPaddingX +30;
    		var originalMarginLeft = $(o.editorMain).css('margin-left');
            $(o.editorMain).css({'margin-left':305+30});
        }

	    /* 插件html */
	    if (o.onlyTable) {
	    	var headerHtml = '<div class="clistyle-header">选择表格样式 <span class="clistyle-close" id="clistyle-close">×</span></div>';
	    	var colorPicker = '';
	    	var ulTop = 52;
	    } else {
	    	var headerHtml = '<div class="clistyle-header">\
	    		请选择样式\
            	<span class="clistyle-close" id="clistyle-close">×</span></div>';
            var colorPicker = '<div class="clistyle-colorpicker-wrapper">\
            	<div class="btn-group">\
	              <button type="button" class="btn btn-xs light active" data-clistyle-type="title">标题</button>\
	              <button type="button" class="btn btn-xs light" data-clistyle-type="text">正文</button>\
	              <button type="button" class="btn btn-xs light" data-clistyle-type="divider">分割线</button>\
	            </div>\
	            <span class="text-darkgrey h6 m-l-md m-t-sm">更改主题色</span>\
           		<input type="text" id="clistyle-colorpicker" class="clistyle-colorpicker"></div>';
	    	var ulTop = 52 + 57;
	    };
    	var templateList = '<ul class="clistyle-template-list" id="clistyle-template-list" style="top:'+ulTop+'px"></ul>';
    	var wrapperHtml = '<div class="clistyle-wrapper" id="clistyle-wrapper" style="top: '+o.top+'px">'+headerHtml+colorPicker+templateList+'</div>';
    	/* 插件html  end */

    	// html插入（先移除之前的，在加载新的）
    	$('#clistyle-wrapper').remove();
    	$(wrapperHtml).insertBefore(o.editorMain);
    	setTimeout(function(){
    		$('#clistyle-wrapper').addClass('show');
    	},100);

	    // 颜色选择器
	    $("#clistyle-colorpicker").spectrum({
		    color: "#4caf50",
		    showPalette: true,
		    showInput: true,
		    palette: [
		        ["#000","#444","#666","#999","#ccc","#eee","#f3f3f3","#fff"],
		        ["#f00","#f90","#ff0","#0f0","#0ff","#00f","#90f","#f0f"],
		        ["#f4cccc","#fce5cd","#fff2cc","#d9ead3","#d0e0e3","#cfe2f3","#d9d2e9","#ead1dc"],
		        ["#ea9999","#f9cb9c","#ffe599","#b6d7a8","#a2c4c9","#9fc5e8","#b4a7d6","#d5a6bd"],
		        ["#e06666","#f6b26b","#ffd966","#93c47d","#76a5af","#6fa8dc","#8e7cc3","#c27ba0"],
		        ["#c00","#e69138","#f1c232","#6aa84f","#45818e","#3d85c6","#674ea7","#a64d79"],
		        ["#900","#b45f06","#bf9000","#38761d","#134f5c","#0b5394","#351c75","#741b47"],
		        ["#600","#783f04","#7f6000","#274e13","#0c343d","#073763","#20124d","#4c1130"]
		    ],
		    cancelText:"取消",
		    chooseText:"确定",
		    change: function(color){
		    	var hex = color.toHexString(); // #ff0000
		    	setColor(hex);
		    }
		});

		function setColor(color) {
			$('#clistyle-template-list').find('[data-clistyle-brushtype="bg"]').css('background-color',color);
	    	$('#clistyle-template-list').find('[data-clistyle-brushtype="bd"]').css('border-color',color);
	    	$('#clistyle-template-list').find('[data-clistyle-brushtype="bdl"]').css('border-left-color',color);
	    	$('#clistyle-template-list').find('[data-clistyle-brushtype="bdr"]').css('border-right-color',color);
	    	$('#clistyle-template-list').find('[data-clistyle-brushtype="bdt"]').css('border-top-color',color);
	    	$('#clistyle-template-list').find('[data-clistyle-brushtype="bdb"]').css('border-bottom-color',color);
	    	$('#clistyle-template-list').find('[data-clistyle-brushtype="text"]').css('color',color);
	    	$('#clistyle-template-list').find('[data-clistyle-opacity]').each(function(){
	    		$(this).css('opacity',$(this).attr('data-clistyle-opacity'));
	    	});
		}

		//关闭box
		$('#clistyle-close').click(function(){
			$('#clistyle-wrapper').removeClass('show');
			$(o.editorMain).css('margin-left',originalMarginLeft);
			$('#activeinsert-wrapper').remove();	//插入活码模块隐藏
			setTimeout(function(){
	    		$('#clistyle-wrapper').remove();
	    	},300);
		})

		// 请求html文件
	    if (o.onlyTable) {
	    	var dataType = 'table';
	    } else {
	    	var dataType = 'title';
	    }
	    $('[data-clistyle-type]').click(function(){
	    	var dataType = $(this).attr('data-clistyle-type');
	    	$(this).addClass('active').siblings().removeClass('active');
	    	
	    	var currenctColor = $('#clistyle-wrapper').find('.sp-preview-inner').css('background-color');
	    	getTemplate(dataType,currenctColor);
	    });

	    // 判断是否是样式里面插入样式
	    var isChildOfSection = false;
    	$('.edui-body-container').click(function(e){
    		var $clistyleSection = $(e.target).parents('.clistyle-section-table');
    		if (typeof $clistyleSection == 'undefined' || $clistyleSection.length == 0 ) {
    			isChildOfSection = false
    		} else {
    			isChildOfSection = true;
    		};
        })
        
	    // 获取模版
	    var loading = '<div class="loader-inner ball-clip-rotate pull-left">\
          <div></div>\
        </div>\
        <span class="m-l-sm text-darkgrey">正在加载，请稍候</span>';
        getTemplate(dataType);
	    function getTemplate(dataType,color){
	    	$('#clistyle-template-list').html(loading);
	    	$.ajax({
	            type: "GET",
	            url: "/admin.php?s=/admin/product/getJsonHtml",
	            dataType : "jsonp",
	            jsonp: "callback",
	            data: {"data_Type":dataType},
				jsonpCallback:"success_jsonpCallback",
	            success: function(json){
	            	$('#clistyle-template-list').html(json);
	            	setColor(color);
	            	var _tempLi = $('#clistyle-template-list').find('li');
	            	_tempLi.click(function(){
	            		var _this = $(this);
	            		var _tempHtml = _this.html();

	            		if (typeof umImgText != 'undefined') {
	            			var nowEditorObj = eval($('.tab-pane.active').find('.editor_box').attr('editor-type'));
	            		} else if (typeof um != 'undefined') {
	            			var nowEditorObj = eval(um);
	            		};
	            	
	            		if ($(".empty_placeholder").length != 0) {
				            $(".empty_placeholder").remove();
				            $("#myEditor,#myFileEditor,#myTextEditor,#myUrlEditor").append('<p><br></p>');
				        }

				        if (!isChildOfSection) {
				        	nowEditorObj.execCommand('inserthtml','<ppp>'+_tempHtml+'</ppp><p><br/></p>',true);
				        } else {
				        	alert('该样式不能套用');
				        }

	            		// 点击事件记录
	            		var clistyleType = _this.attr('data-clistyle-type');
	            		var clistyleId = _this.attr('data-clistyle-id');
	            		$.get(CLI_DOMAIN+'/Api/ClickLog/click',{fir:clistyleType,sec:clistyleId},function(res){
	            			if (res) { }
	            		},'json');
	            	});
	        	}
	    	});
    	}
    }
})(jQuery);
var wwei_editor = null; // 百度编辑框的id
var append = null; //要插入地方的id 
var showBtn = null; // 点击显示的按钮
var url = null; // ajax请求地址
var tempUrl = null; // 不需要设置
//_loadtemp("title");
function saveContent(callback){
	var html,
		ue=UE.getEditor('wx_editor');
	ue.ready(function() {
	    html=ue.getContent();//获取编辑器中的内容
	});
	if(typeof callback=='function'){
		callback(html);
	}
}

function setContent(con){
	var ue=UE.getEditor('wx_editor');
	ue.ready(function() {
	    ue.setContent(con);//设置编辑器中的内容
	    ue.focus(['true']);//光标定位到编辑器尾部
	});
}

function initEditor(wx_editor,appendArea,showEdi,ajaxUrl){//
    wwei_editor = UE.getEditor(wx_editor);
    append = appendArea;
    showBtn = showEdi;
    tempUrl = ajaxUrl;
    url = tempUrl +  "temp_title.html";
    /*$("#"+showBtn).click(function(){
		$(".span5").css("display","block");
		$(this).hide();
	});

    $("<div class='span5'><ul class='nav nav-tabs' id='templateTab'><li class='active'><a href='#temp-title' data-type='title'>标题</a></li><li><a href='#temp-text' data-type='text'>正文</a></li><li><a href='#temp-img' data-type='img'>图片</a></li><li><a href='#temp-follow' data-type='follow'>吸粉</a></li><li><a href='#temp-scene' data-type='scene'>场景</a></li><li><a href='#temp-tpl' data-type='tpl'>模板</a></li></ul><div class='tab-content template-content'><div id='template-loading' class='hide'><img src='/images/loading.gif'> 加载中...</div><div class='tab-pane active' id='temp-title'></div><div class='tab-pane' id='temp-text'></div><div class='tab-pane' id='temp-img'></div><div class='tab-pane' id='temp-follow'></div><div class='tab-pane' id='temp-scene'></div><div class='tab-pane' id='temp-tpl'></div></div> </div>")
    .appendTo("#"+append);*/

	tempLoad();

}


function getSelectionHtml() {
    var range = wwei_editor.selection.getRange();
    range.select();
    var selectionObj = wwei_editor.selection.getNative();
    var rangeObj = selectionObj.getRangeAt(0);
    var docFragment = rangeObj.cloneContents();
    var testDiv = document.createElement("div");
    testDiv.appendChild(docFragment);
    var selectHtml = testDiv.innerHTML;
    if(selectHtml=='<br>') selectHtml='';//修复ctrl+z 导致的错误 by xrx 2015-08-13
    return selectHtml;
}

function insertHtml(html) {
	var select_html = getSelectionHtml();
	if (select_html != "") {
		select_html = strip_tags(select_html, '<br><p><h1><h2><h3><h4><h5><h6><img>');
		var select_obj = $('<div>' + select_html + '</div>');
		var obj = $('<div>' + html + '</div>');
		select_obj.find('img').each(function(i) {
			var img = obj.find('img').eq(i);
			if (img && img.size() > 0) {
				img.attr('src', $(this).attr('src'));
				$(this).remove();
			}
		});
		var brushs = obj.find('.wweibrush');
		var total = brushs.size();
		if (total > 0) {
			if (total == 1) {
				var brush_item = obj.find('.wweibrush:first');
				if (brush_item.data('brushtype') == 'text') {
					brush_item.html($.trim(select_obj.text()));
				} else {
					select_obj.contents().each(function(i) {
						var $this = this;
						if (this.tagName == "IMG") {
							return;
						};
						if ($.trim($($this).text()) == "" || this.tagName == 'BR' || $(this).html() == "" || $(this).html() == "&nbsp;" || $(this).html() == "<br>" || $(this).html() == "<br/>") {
							$(this).remove();
						}
					});
					var style = brush_item.data('style');
					if (style) {
						select_obj.find('*').each(function() {
							$(this).attr('style', style);
						});
					}
					brush_item.html(select_obj.html());
				}
			} else {
				select_obj.contents().each(function(i) {
					var $this = this;
					if (this.tagName == "IMG") {
						return;
					};
					if ($.trim($($this).text()) == "" || this.tagName == 'BR' || $(this).html() == "" || $(this).html() == "&nbsp;" || $(this).html() == "<br>" || $(this).html() == "<br/>") {
						$(this).remove();
					}
				});
				select_obj.contents().each(function(i) {
					var $this = this;
					if ($this.nodeType == 3) {
						$this = $('<p>' + $(this).text() + '</p>').get(0);
					}
					if (i < total) {
						var brush_item = brushs.eq(i);
						if (brush_item.data('brushtype') == 'text') {
							brush_item.html($.trim($($this).text()));
						} else {
							var style = brush_item.data('style');
							if (style) {
								$($this).attr('style', style);
							}
							brush_item.empty().append($($this));
						}
					} else {
						var brush_item = brushs.eq(total - 1);
						if (brush_item.data('brushtype') == 'text') {
							brush_item.append($($this).text());
						} else {
							var style = brush_item.data('style');
							if (style) {
								$($this).attr('style', style);
							}
							brush_item.append($($this));
						}
					}
				});
			}
			obj.find('p').each(function(i) {
				if ($(this).html() == "" || $(this).html() == "&nbsp;" || $(this).html() == "<br>" || $(this).html() == "<br/>") {
					if (typeof $(this).attr('style') == 'undefined') {
						$(this).remove();
					}
				}
			});
		}
		html = obj.html();
		wwei_editor.execCommand('insertHtml', html);
		wwei_editor.undoManger.save();
		return true;
	} else {}

    wwei_editor.execCommand('insertHtml', html);
    wwei_editor.undoManger.save();
    return true;
}


///////////////////////////////////////////////////////////////////

function tempLoad() {
	var data_type = 'title';
    function _loadtemp(data_type){
        $("#template-loading").show();
        $.ajax({
            type: "GET",
            url: STATIC_SERVICE+"/loadtemp1/function.php",
            dataType : "jsonp",
            jsonp: "callback",
            data: {"data_Type":data_type},
			jsonpCallback:"success_jsonpCallback",
            success: function(json){
                $("#template-loading").hide();
                var tabPane = $("#temp-"+data_type);
                tabPane.html(json);
                var _tempLi = tabPane.find('.template-list li');
                _tempLi.hover(function(){
                    $(this).css({"background-color":"#fff"});
                },function(){
                    $(this).css({"background-color":"#fff"});
                });
                _tempLi.click(function(){
               		//如果是模板，是缩略图预览
                    if(data_type=='tpl'){
                        /*var _tempHtml = $(this).find('.tpl-code').html();
                        wwei_editor.setContent("");
                        wwei_editor.execCommand('insertHtml', _tempHtml);*/
                        /*var _tempHtml = $(this).html();
                        insertHtml(_tempHtml + "<p><br/></p>");*/
                        $(".img-div").hide();
                        $(this).find(".tpl-code").show();
                        $(".return_tpl_list").show();
                        $(".tpl-code").click(function(){
                        	var _tempHtml = $(this).html();
	                        wwei_editor.setContent("");
	                        wwei_editor.execCommand('insertHtml', _tempHtml);
                        })
					    $(".return_tpl_list").click(function(){
					    	$(".hide").hide();
					    	$(".img-div").show();
					    	$(this).hide();
					    });
                    }else{
                        var _tempHtml = $(this).html();
                        insertHtml(_tempHtml + "<p><br/></p>");
                    }
                    
                });
				//模板和其他是一样的，没有缩略图预览，只有全图预览
				/*_tempLi.click(function(){
					var _tempHtml = $(this).html();
					insertHtml(_tempHtml + "<p><br/></p>");
				});*/
            }
        });
    }
    _loadtemp(data_type);//加载
    //TAB切换


    $('#templateTab li').click(function (e) {
        e.preventDefault();
        $('.tab-pane').removeClass('active');
        $("#style-show-box-middle").show();
        $("#start-middle-div").hide();
        data_type = $(this).attr("data-type");
        $("#temp-"+data_type).addClass('active');
        if(data_type){
            var tabPane = $("#temp-"+data_type);
            if(tabPane.find('.template-list').length<=0){
                _loadtemp(data_type);
            }
        }
    });
}

$(function(){
	var s_windowwidth=$(window).width();
    var s_width=s_windowwidth-512;
    $('.span7').width(s_width);
});

window.onload=function(){
	var height=$(window).height()-110;
	$('#edui1_iframeholder').css("height",height);

	$(".template-list li").each(function(){
		$(this).click(function(){
			var num=$(this).find(".number").html();	
			if(num){
				num++;
				$(this).find(".number").html(num);
			}
		});
	});

    $('.nav .type-title-list-li').each(function(){
        $(this).click(function(){
            var num=$('.nav li').index(this);
            $(".nav .type-title-list-li").removeClass("current");
            $(".nav .type-title-list-li").eq(num).addClass("current");
        });
    });

    $(".close-btn").click(function(){
        $('body').hide();
    });
      
    $(window).resize(function(){
        var s_windowwidth=$(window).width();
        var s_width=s_windowwidth-512;
        $('.span7').width(s_width);
        height=$(window).height()-110;
    	$('#edui1_iframeholder').css("height",height);
    });
	

	// tr删除添加 特殊处理
	var iframeBody = $("#ueditor_0").contents().find("body");
	// iframeBody.on('mouseenter','tr',function(){
	// 	var _this = $(this);
 //        var trash = '<td class="" style="border: 0; padding: 0; width: 80px;">'+
 //        '<div class="table-operation-box" style="width: 35px; height: 100%; padding: 0 10px; background: #666; border-radius: 4px;">'+
 //        '<i class="fa fa-plus" style="color: #fff; margin-right: 8px; cursor: pointer;" data-toggle="tooltip" data-placement="top" data-original-title="添加" data-add-tr></i>'+
 //        '<i class="fa fa-trash" style="color: #fff; cursor: pointer;" data-toggle="tooltip" data-placement="top" data-original-title="删除" data-delete-tr></i></div></td>';

 //        if ( _this.find('.fa-trash').length == 0 ) {
 //            $(this).append(trash);
 //        };
	// })


    /* 电话拨打功能 */
    if (typeof window.getSelection != 'undefined') { 
        //现代浏览器
        var editorPhoneClickAbled = false;
		iframeBody.on('mouseup',function(e){
			editorPhoneClickAbled = true;
	    	var target = e.target;
	    	var txt;
	    	var objWindow = $("#ueditor_0")[0].contentWindow;
	    	var objDocument = $("#ueditor_0").contents().context;
		    txt = objWindow.getSelection().toString();

			if (typeof target != 'undefined' && target.toString().indexOf('tel:') == -1) {
				setTimeout(function(){
					$('#editor-btn-phone').removeClass('editor-hover');
				},300);
				$('#editor-btn-phone').off().click(function(){
					if (editorPhoneClickAbled) {
						editorPhoneClickAbled = false;
						$(this).addClass('editor-hover');
						var	len = txt.length;
			        	var position = target.innerHTML.indexOf(txt);
			        	var position2 = position+len;
			        	var tempstr1 = target.innerHTML.substring(0,position);
						var tempstr2 = target.innerHTML.substring(position2);
						txt = "<a href='tel:"+txt+"' style='color: #0275d8;'>"+txt+"</a>";
						target.innerHTML = tempstr1 + txt + tempstr2;
					}
				})
			} else {
				setTimeout(function(){
					$('#editor-btn-phone').addClass('editor-hover');
				},300);
			}
	    })
    } else {
    	$('#editor-btn-phone').off().click(function(){
    		alert('该功能暂不支持IE浏览器，建议使用谷歌浏览器')
		})
    }

    $('#editor-btn-phone').mouseenter(function(){
    	$(this).addClass('editor-hover');
    	$('#editor-tooltip-phone').show();
    }).mouseleave(function(){
    	$(this).removeClass('editor-hover');
    	$('#editor-tooltip-phone').hide();
    })
    /* 电话拨打功能 end */

}

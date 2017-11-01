//单个功能的低版本浏览器提示插件
define(function(require, exports, module) {
	var _config = {
		"IE5":{
			"tips":"当前浏览器为IE5，请换至高版本IE浏览器访问！",
			"reg":/MSIE 5.0/
		},
		"IE6":{
			"tips":"当前浏览器为IE6，请换至高版本IE浏览器访问！",
			"reg":/MSIE 6.0/
		},
		"IE7":{
			"tips":"当前浏览器为IE7，请换至高版本IE浏览器访问！",
			"reg":/MSIE 7.0/
		},
		"IE8":{
			"tips":"当前浏览器为IE8，请换至高版本IE浏览器访问！",
			"reg":/MSIE 8.0/
		},
		"IE9":{
			"tips":"当前浏览器为IE9，请换至高版本IE浏览器访问！",
			"reg":/MSIE 9.0/
		},
		"IE10":{
			"tips":"当前浏览器为IE10，请换至高版本IE浏览器访问！",
			"reg":/MSIE 10.0/
		},
		"IE11":{
			"tips":"当前浏览器为IE11，请换至高版本IE浏览器访问！",
			"reg":/MSIE 11.0/
		},
		"FIRFOX":{
			"tips":"当前浏览器为火狐浏览器！",
			"reg":/WOW64; rv:37.0/
		},
		"CHROME":{
			"tips":"当前浏览器为谷歌内核浏览器！",
			"reg":/KHTML, like Gecko/
		},
		"360":{
			"tips":"当前浏览器为IE内核浏览器兼容模式！",
			"reg":/.NET CLR 3.5.30729; .NET CLR 3.0.30729;/
		},
		"SOGO":{
			"tips":"当前浏览器为IE内核浏览器兼容模式！",
			"reg":/.NET CLR 3.5.30729; .NET CLR 3.0.30729;/
		},
		"OPERA":{
			"tips":"当前浏览器为谷歌内核浏览器！",
			"reg":/KHTML, like Gecko/
		}
	};
	exports.tip_plugin = function(){
		var i, numargs = arguments.length, config_obj;
		var tip_box = ['<div class="tip_plugin_bg" id="tip_plugin_box">'];
		tip_box.push('<div class="tip_plugin_box">');
		tip_box.push('<div class="tip_plugin_top"><span class="tip_plugin_top_icon"></span>浏览器不兼容</div>');
		tip_box.push('<div class="tip_plugin_main">');
		tip_box.push('<p>你的浏览器版本过低，无法兼容此功能。</br>建议升级至最新版');
		tip_box.push('<a class="tip_plugin_link" href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie" target="_blank"><span class="tip_plugin_ie_icon"></span>IE</a>');
		tip_box.push('，或使用');
		tip_box.push('<a class="tip_plugin_link" href="http://dlsw.baidu.com/sw-search-sp/soft/9d/14744/ChromeStandalone_47.0.2526.106_Setup.1450323126.exe" target="_blank"><span class="tip_plugin_chrome_icon"></span>Chrome</a>');
		tip_box.push('，');
		tip_box.push('<a class="tip_plugin_link" href="http://www.firefox.com.cn/" target="_blank"><span class="tip_plugin_firefox_icon"></span>火狐</a>');
		tip_box.push('。</p>');
		tip_box.push('<a href="javascript:;" class="close_tip_plugin" id="close_tip_plugin">我知道了</a>');
		tip_box.push('</div></div></div>');



		var css = '<link href="'+STATIC_SERVICE+'/cli/css/tip_plugins.css" rel="stylesheet" media="all" />';
		var need_tips=false;
		for (i = 0; i < numargs; i++){
			config_obj = _config[arguments[i]];
			if(document.documentMode==5){
				alert('当前浏览器模式为Quirks模式，请切换至标准模式访问！');
				need_tips=true;
				break;
			}else if(config_obj.reg.test(navigator.userAgent)){
				$('head').append(css);//加载样式
				$('body').append(tip_box.join(''));//输出提示框
				// $('#tips_msg').html(config_obj.tips);//所匹配的提示语
				need_tips=true;
				break;
			}
		}
		//关闭提示框
		$('#close_tip_plugin').click(function(){
			$('#tip_plugin_box').remove();
		});
		return need_tips;
	}

});
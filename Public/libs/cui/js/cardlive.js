//添加item
$('.add_com1').click(function(){
	var _len=$(this).attr('val');
	var html='<div class="form-group">';
		html+='<input class="form-control-label input1 noinput" maxLength="6" value="部门'+_len+'" oninput="listenIn(this,'+"'.branch"+_len+"'"+')" data-class="bumen'+_len+'"/>';
		html+='<div class="inp_t">';
		html+='<input type="text"  value="" oninput="listenIn(this,'+"'.bumen"+_len+"'"+')" />';
		html+='</div><a href="javascript:;"  class="fa fa-trash remove_com" onclick="remove(this)"></a></div>';
	$(this).parents('.addable_wrap').append(html);
	
	$('.add_com1').attr('val',parseInt(_len)+1);
	
	var html1='<div class="left_addable_wrap" data-class="bumen'+_len+'">';
		html1+='<div class="vcard_data_txt b-b basic_info">';
		html1+='<span class="vcard_data_title branch'+_len+'" >部门'+_len+'</span>';
		html1+='<span class="vcard_data_value bumen'+_len+'"></span>';
		html1+='</div></div>';
	$('.left_box.left_basic').append(html1);
	
	move();
	
})
$('.add_address').click(function(){
	var _len=$(this).attr('val');
//	var _len=$(this).parents('.addable_wrap').find('.form-group').length;
	var html='<div class="form-group">';
		html+='<input class="form-control-label input1 noinput" maxLength="6" value="地址'+_len+'" oninput="listenIn(this,'+"'.addresso"+_len+"'"+')" data-class="address'+_len+'"/>';
		html+='<div class="inp_t">';
		html+='<input type="text"  value="" oninput="listenIn(this,'+"'.address"+_len+"'"+')" />';
		html+='</div><a href="javascript:;" class="fa fa-trash remove_com" onclick="remove(this)"></a></div>';
	$(this).parents('.addable_wrap').append(html);
	
	$('.add_address').attr('val',parseInt(_len)+1);
	
	var html1='<div class="left_addable_wrap" data-class="address'+_len+'">';
		html1+='<div class="vcard_data_txt b-b">';
		html1+='<span class="vcard_data_title addresso'+_len+'">地址'+_len+'</span>';
		html1+='<span class="vcard_data_value address'+_len+'"></span>';
		html1+='</div></div>';
	$('.left_box.left_address').append(html1);
	move();
})
$('.add_mp').click(function(){
	var _len=$(this).attr('val');
	var html='<div class="form-group">';
		html+='<input class="form-control-label input1 noinput" maxLength="6" value="家庭电话'+_len+'" oninput="listenIn(this,'+"'.mobilep"+_len+"'"+')" data-class="mobile'+_len+'"/>';
		html+='<div class="inp_t">';
		html+='<input type="text"  value="" oninput="listenIn(this,'+"'.mobile"+_len+"'"+')" />';
		html+='</div><a href="javascript:;" class="fa fa-trash remove_com" onclick="remove(this)"></a></div>';
	$(this).parents('.addable_wrap').append(html);
	$('.add_mp').attr('val',parseInt(_len)+1);
	var html1='<div class="left_addable_wrap" data-class="mobile'+_len+'">';
		html1+='<div class="vcard_data_txt b-b">';
		html1+='<span class="vcard_data_title mobilep'+_len+'">家庭电话'+_len+'</span>';
		html1+='<span class="vcard_data_value mobile'+_len+'"></span>';
		html1+='</div></div>';
	$('#left_addable_phone').append(html1);
	move();
})
$('.add_fax').click(function(){
	var _len=$(this).attr('val');
	var html='<div class="form-group">';
		html+='<input class="form-control-label input1 noinput" maxLength="6" value="传真'+_len+'" oninput="listenIn(this,'+"'.faxo"+_len+"'"+')" data-class="fax'+_len+'"/>';
		html+='<div class="inp_t">';
		html+='<input type="text"  value="" oninput="listenIn(this,'+"'.fax"+_len+"'"+')" />';
		html+='</div><a href="javascript:;" class="fa fa-trash remove_com" onclick="remove(this)"></a></div>';
	$(this).parents('.addable_wrap').append(html);
	$('.add_fax').attr('val',parseInt(_len)+1);
	var html1='<div class="left_addable_wrap" data-class="fax'+_len+'">';
		html1+='<div class="vcard_data_txt b-b">';
		html1+='<span class="vcard_data_title faxo'+_len+'">传真'+_len+'</span>';
		html1+='<span class="vcard_data_value fax'+_len+'"></span>';
		html1+='</div></div>';
	$('#left_addable_fax').append(html1);
	move();
})
$('.add_email').click(function(){
	var _len=$(this).attr('val');
	var html='<div class="form-group">';
		html+='<input class="form-control-label input1 noinput" maxLength="6" value="电子邮件'+_len+'" oninput="listenIn(this,'+"'.emailo"+_len+"'"+')" data-class="email'+_len+'"/>';
		html+='<div class="inp_t">';
		html+='<input type="text"  value="" oninput="listenIn(this,'+"'.email"+_len+"'"+')" />';
		html+='</div><a href="javascript:;" class="fa fa-trash remove_com" onclick="remove(this)"></a></div>';
	$(this).parents('.addable_wrap').append(html);
	$('.add_email').attr('val',parseInt(_len)+1);
	var html1='<div class="left_addable_wrap" data-class="email'+_len+'">';
		html1+='<div class="vcard_data_txt b-b">';
		html1+='<span class="vcard_data_title emailo'+_len+'">电子邮件'+_len+'</span>';
		html1+='<span class="vcard_data_value email'+_len+'"></span>';
		html1+='</div></div>';
	$('#left_addable_email').append(html1);
	move();
})
$('.add_website').click(function(){
	var _len=$(this).attr('val');
	var html='<div class="form-group">';
		html+='<input class="form-control-label input1 noinput" maxLength="6" value="网址'+_len+'" oninput="listenIn(this,'+"'.websiteo"+_len+"'"+')" data-class="website'+_len+'"/>';
		html+='<div class="inp_t">';
		html+='<input type="text"  value="" oninput="listenIn(this,'+"'.website"+_len+"'"+')" />';
		html+='</div><a href="javascript:;" class="fa fa-trash remove_com" onclick="remove(this)"></a></div>';
	$(this).parents('.addable_wrap').append(html);
	$('.add_website').attr('val',parseInt(_len)+1);
	var html1='<div class="left_addable_wrap" data-class="website'+_len+'">';
		html1+='<div class="vcard_data_txt b-b">';
		html1+='<span class="vcard_data_title websiteo'+_len+'">网址'+_len+'</span>';
		html1+='<span class="vcard_data_value website'+_len+'"></span>';
		html1+='</div></div>';
	$('#left_addable_site').append(html1);
	move();
})

$('.add_wechat').click(function(){
	var _len=$(this).attr('val');
	var html='<div class="form-group">';
		html+='<input class="form-control-label  input1 noinput" maxLength="6" value="即时通讯'+_len+'" oninput="listenIn(this,'+"'.wechato"+_len+"'"+')" data-class="wechat'+_len+'"/>';
		html+='<div class="inp_t">';
		html+='<input type="text"  value="" oninput="listenIn(this,'+"'.wechat"+_len+"'"+')" />';
		html+='</div><a href="javascript:;" class="fa fa-trash remove_com" onclick="remove(this)"></a></div>';
	$(this).parents('.addable_wrap').append(html);
	$('.add_wechat').attr('val',parseInt(_len)+1);
	var html1='<div class="left_addable_wrap" data-class="wechat'+_len+'">';
		html1+='<div class="vcard_data_txt b-b">';
		html1+='<span class="vcard_data_title wechato'+_len+'">即时通讯'+_len+'</span>';
		html1+='<span class="vcard_data_value wechat'+_len+'"></span>';
		html1+='</div></div>';
	$('#left_addable_message').append(html1);
	move();
})

//移除添加的列表
function remove(obj){
	$(obj).parent('.form-group').remove();
	var txt1=$(obj).siblings('.form-control-label').attr('data-class');
	$(".left_addable_wrap").each(function(){
		var txt2=$(this).attr('data-class');
		if(txt1==txt2){
			$(this).remove();
		}
	})
}
//监听事件
function listenIn(obj,id){
	var val_con=$(obj).val();
	$(id).html(val_con);
}

function move(){
	$(".form-group .input1").hover(function(){
		$(this).removeClass('noinput');
	},function(){
		$(this).addClass('noinput');
	})
}

$(function(){
	//添加网址
	$("#add_url_btn").click(function(){
		var html="";
			html+='<div class="url-row row no-gutter m-b">';
			html+='<div class="col-md-3">';
			html+='<input type="text" placeholder="文字说明" class="form-control url-border url-desc " value=""></div>';
			html+='<div class="col-md-6">';
			html+='<input type="text" placeholder="链接地址http://" class="form-control url-border url-link" value=""></div>';
			html+='<div class="col-md-3">';
			html+='<i class="fa fa-arrow-up url-icon url-up"></i>';
			html+='<i class="fa fa-arrow-down  url-icon url-down"></i>';
			html+='<i class="fa fa-trash url-icon delicon"></i></div></div>';
		$(this).before(html);
		var e=$(".url-row").length;
		$(".url-row:last").attr("num",e-1);
	})
	//添加明细
	$("#add_detail_btn").click(function(){
		var html="";
			html+='<div class="url-row row no-gutter m-b">';
			html+='<div class="col-md-3">';
			html+='<input type="text" placeholder="文字说明" class="form-control url-border detail-desc " value=""></div>';
			html+='<div class="col-md-6">';
			html+='<input type="text" placeholder="配置值" class="form-control url-border detail-val" value=""></div>';
			html+='<div class="col-md-3">';
			html+='<i class="fa fa-trash url-icon delicon"></i></div></div>';
		$(this).before(html);
		var e=$(".url-row").length;
		$(".url-row:last").attr("num",e-1);
	})
	//添加套餐选项
	$("#add_vip_btn").click(function(){
		var html="";
			html+='<div class="url-row row no-gutter m-b">';
			html+='<div class="col-md-3">';
			html+='<input type="text" placeholder="套餐时长(年)" class="form-control url-border vip-year " value=""></div>';
			html+='<div class="col-md-6">';
			html+='<input type="text" placeholder="套餐价格(元)" class="form-control url-border vip-price" value=""></div>';
			html+='<div class="col-md-3">';
			html+='<i class="fa fa-trash url-icon delicon"></i></div></div>';
		$(this).before(html);
		var e=$(".url-row").length;
		$(".url-row:last").attr("num",e-1);
	})
	//删除网址
	function Up_or_Down(e, t) {
		var i = e.parent().parent(),
			o = e.parent().parent().prev(".url-row"),
			a = e.parent().parent().next(".url-row");
		if ("up" == t) {
			if (void 0 === o[0]) return !1;
			o.before(i)
		}
		if ("down" == t) {
			if (void 0 === a[0]) return !1;
			a.after(i)
		}
	}
	$(document).on("click",".fa-arrow-up",function(){
		Up_or_Down($(this),"up")
	});
	$(document).on("click",".fa-arrow-down",function(){
		Up_or_Down($(this),"down")
	})
	$(document).on("click",".delicon",function(){
		var e=$(".url-row").length;
		if(e==1){
			return;
		}else{
			$(this).parents('.no-gutter').remove();
		}
	})

	//新增套餐
    $(".submit").click(function(){
		var params = {};
		params     = getAllParams('.s-query');
        params.vip = getDuoInputParams('.vip-year');
        params.detail = getDuoInputParams2('.detail-desc');

        if (params.name == '') {
            $.alertMessager('请输入套餐名称!');return;
        }
        if (!$(".vip-year").val()) {
            $.alertMessager('请输入套餐时长!');return;
        }
        if (!$(".vip-price").val()) {
            $.alertMessager('请输入套餐价格!');return;
        }

        $.ajax({
            url: 'admin.php?s=/admin/vip/add',
            type: 'POST',
            data: params,
            success: function (data) {  
                if(data.status == 1){
                    $.alertMessager(data.info,'success');
					setTimeout(function(){window.location.href=data.url;},2000);
                }else{
                    $.alertMessager(data.info);return;
                }
            }
        });
    });

})

getAllParams = function(obj){
	var params = {};
	var chk = {},s;
	$(obj).each(function(){
		if($(this)[0].type=='hidden' || $(this)[0].type=='number' || $(this)[0].type=='tel' || $(this)[0].type=='password' || $(this)[0].type=='select-one' || $(this)[0].type=='textarea' || $(this)[0].type=='text'){
			params[$(this).attr('id')] = $.trim($(this).val());
		}else if($(this)[0].type=='radio'){
			if($(this).attr('name')){
				params[$(this).attr('name')] = $('input[name='+$(this).attr('name')+']:checked').val();
			}
		}else if($(this)[0].type=='checkbox'){
			if($(this).attr('name') && !chk[$(this).attr('name')]){
				s = [];
				chk[$(this).attr('name')] = 1;
				$('input[name='+$(this).attr('name')+']:checked').each(function(){
					s.push($(this).val());
				});
				params[$(this).attr('name')] = s.join(',');
			}
		}
	});
	chk=null,s=null;
	return params;
}
//套餐选项
getDuoInputParams = function(obj){
    var params = {};
    $(obj).each(function(key){
        if($(this).val() && $(this).parents('.no-gutter').find('.vip-price').val()){
            params[key] = {year:$(this).val(),price:$(this).parents('.no-gutter').find('.vip-price').val()};
        }
    });
    return params;
}
//明细
getDuoInputParams2 = function(obj){
    var params = {};
    $(obj).each(function(key){
        if($(this).val() && $(this).parents('.no-gutter').find('.detail-val').val()){
            params[key] = {desc:$(this).val(),val:$(this).parents('.no-gutter').find('.detail-val').val()};
        }
    });
    return params;
}
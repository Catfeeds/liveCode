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

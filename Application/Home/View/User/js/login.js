$(function(){
	$(".close").click(function(){
		$(".theme-popover").fadeOut();
		$(".theme-popover-mask").hide();
	})
	$(".forback").click(function(){
		$(".login,.regist").hide();
		$(".get-back").fadeIn();
	})
	$(".free-regist").click(function(){
		$(".login,.get-back").hide();
		$(".regist").fadeIn();
	})
	$(".login-now").click(function(){
		$(".regist,.get-back").hide();
		$(".login").fadeIn();
	})
	
	//点击登录、注册弹窗
	$(document).on('click','.denglu',function(){
		$(".login").fadeIn();
		$(".regist,.get-back").hide();
		$(".theme-popover-mask").fadeIn();
		$(".theme-popover").fadeIn();
	})
	$(document).on('click','.zhuce',function(){
		$(".regist").fadeIn();
		$(".login,.get-back").hide();
		$(".theme-popover-mask").fadeIn();
		$(".theme-popover").fadeIn();
	})
	
	
	// 刷新验证码
    $(".code-img").on('click', function() {
        var verifyimg = $(".verifyimg").attr("src");
        if (verifyimg.indexOf('?') > 0) {
            $(".verifyimg").attr("src", verifyimg + '&random=' + Math.random());
        } else {
            $(".verifyimg").attr("src", verifyimg.replace(/\?.*$/, '') + '?' + Math.random());
        }
    });
})
//找回密码
function sendEmail(url,id){
    var email = $('#'+id).val();
    if (email == '') {
    	$.alertMessager('请输入邮箱!');return;
    }
    var rule = /^[0-9a-zA-Z]+(?:[_-][a-z0-9-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*.[a-zA-Z]+$/i;
    if (!rule.test(email)) {
        $.alertMessager('请输入正确的邮箱!');return;
    }
    $.ajax({
	    url: url,
	    type: 'POST',
	    data: {email:email,type:'forgetPass'}
	}).done(function(data) {
	    if (data.status == 1) {
	        $.alertMessager(data.info,'success');
	        var gobackbtn=document.getElementById('gobackbtn');
	        time(gobackbtn);
	    } else {
	        $.alertMessager(data.info, 'danger');
	    }
	});
	
}
//注册
function sendEmails(url,id){
    var email = $('#'+id).val();
    if (email == '') {
    	$.alertMessager('请输入邮箱!');return;
    }
    var rule = /^[0-9a-zA-Z]+(?:[_-][a-z0-9-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*.[a-zA-Z]+$/i;
    if (!rule.test(email)) {
        $.alertMessager('请输入正确的邮箱!');return;
    }
    $.ajax({
	    url: url,
	    type: 'POST',
	    data: {email:email,type:'regist'}
	}).done(function(data) {
	    if (data.status == 1) {
	        $.alertMessager(data.info,'success');
	        var registbtn=document.getElementById('registbtn');
	        times(registbtn);
	    } else {
	        $.alertMessager(data.info, 'danger');
	    }
	});
	
}


var wait=60;
function time(o) {
    if (wait == 0) {
        o.removeAttribute("disabled");            
        o.value="重新发送";
        wait = 60;
    } else {
        o.setAttribute("disabled", true);
        o.value=wait+"秒后重试";
        wait--;
        setTimeout(function() {
            time(o)
        },1000)
    }
}

var waits=60;
function times(obj) {
    if (waits == 0) {
        obj.removeAttribute("disabled");            
        obj.value="重新发送";
        waits = 60;
    } else {
        obj.setAttribute("disabled", true);
        obj.value=waits+"秒后重试";
        waits--;
        setTimeout(function() {
            times(obj)
        },1000)
    }
}

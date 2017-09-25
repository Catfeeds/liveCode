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
	    data: {email:email}
	}).done(function(data) {
	    if (data.status == 1) {
//	        var gobackbtn=document.getElementById('gobackbtn');
//	        var registbtn=document.getElementById('registbtn');
//	        time(gobackbtn);
//	        time(registbtn);
	        $.alertMessager(data.info,'success');
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
        o.value=wait+"秒后可重发";
        wait--;
        setTimeout(function() {
            time(o)
        },1000)
    }
}
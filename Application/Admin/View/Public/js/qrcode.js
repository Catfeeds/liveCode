$(function(){
	$(".sub_btn").click(function(){
		$("#code2").empty();
		var str = toUtf8($(".main_text").val());
		
		$("#code2").qrcode({
			render: "table",
			width: 300,
			height:300,
			text: str
		});
		$.alertMessager('二维码已成功保存!','success');return;
	});
})

function toUtf8(str) {   
    var out, i, len, c;   
    out = "";   
    len = str.length;   
    for(i = 0; i < len; i++) {   
    	c = str.charCodeAt(i);   
    	if ((c >= 0x0001) && (c <= 0x007F)) {   
        	out += str.charAt(i);   
    	} else if (c > 0x07FF) {   
        	out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));   
        	out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));   
        	out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));   
    	} else {   
        	out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));   
        	out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));   
    	}   
    }   
    return out;   
}


$('#picID').click(function () {
    var data = new FormData($('#uploadForm')[0]);
    $.ajax({
        url: 'url',
        type: 'POST',
        data: data,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
            console.log(data);
            if(data.status){
                console.log('upload success');
            }else{
                console.log(data.message);
            }
        },
        error: function (data) {
            console.log(data.status);
        }
    });
});
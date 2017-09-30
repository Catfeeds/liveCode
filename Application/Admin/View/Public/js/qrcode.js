$(function(){
    KindEditor.ready(function(K) {
        kindeditor_1 = K.create('#imgtext', {
            allowFileManager : true,
            filePostName : 'file',
            cssPath : [
                '__PUBLIC__/libs/cui/css/cui.min.css',
                '__PUBLIC__/libs/kindeditor/plugins/code/prettify.css'
            ],
            width : '100%',
            height : '500px',
            resizeType: 1,
            pasteType : 2,
            urlType : 'absolute',
            fileManagerJson : '/admin.php?s=/admin/upload/filemanager',
            uploadJson : '/admin.php?s=/admin/upload/upload',
            extraFileUploadParams: {
                session_id : '16dnm7gnf59ivch3tu8cb95kq5'
            },
            afterBlur: function(){this.sync();}
        });
    });

    //文本活码
    $("#save_btn2").click(function(){
        // $("#code2").empty();
        var title = $("#title2").val();
        var content = $("#content2").val();
        if (content == '') {
            $.alertMessager('请输入内容!');return;
        }
        $.ajax({
            url: 'admin.php?s=/admin/livecode/add',
            type: 'POST',
            data: {title:title,content:content,type:2},
            success: function (data) {  
                if(data.status == 1){
                    console.log(data.url);
                    $("#code2 img").attr('src',data.url);
                    $("#img2").attr('href',data.url);
                }else{
                    console.log(data.message);
                }
            }
        });
        $.alertMessager('二维码已成功保存!','success');return;
        
        // $("#code2").qrcode({
        //     render: "table",
        //     width: 150,
        //     height:150,
        //     text: content
        // });
    });

})

// function toUtf8(str) {   
//     var out, i, len, c;   
//     out = "";   
//     len = str.length;   
//     for(i = 0; i < len; i++) {   
//     	c = str.charCodeAt(i);   
//     	if ((c >= 0x0001) && (c <= 0x007F)) {   
//         	out += str.charAt(i);   
//     	} else if (c > 0x07FF) {   
//         	out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));   
//         	out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));   
//         	out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));   
//     	} else {   
//         	out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));   
//         	out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));   
//     	}   
//     }   
//     return out;   
// }


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
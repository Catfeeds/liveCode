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
        var title = $("#title2").val();
        var content = $("#content2").val();
        if (title == '') {
            $.alertMessager('请输入标题名称!');return;
        }
        if (content == '') {
            $.alertMessager('请输入内容!');return;
        }
        $.ajax({
            url: 'admin.php?s=/admin/livecode/add',
            type: 'POST',
            data: {title:title,content:content,type:2},
            success: function (data) {  
                if(data.status == 1){
                    $("#code2 img").attr('src',data.url);
                    $("#img2").attr('href',data.url);
                    $.alertMessager('二维码已成功保存!','success');return;
                }else{
                    $.alertMessager(data.info);return;
                }
            }
        });
    });
    //文件活码
    $("#save_btn3").click(function(){
        var uploadFileName = $("#uploadFileName").val();
        var uploadFileSize = $("#uploadFileSize").val();
        var uploadFileUrl  = $("#uploadFileUrl").val();
        if (uploadFileName == '' || uploadFileUrl == '') {
            $.alertMessager('请先上传文件!');return;
        }
        $.ajax({
            url: 'admin.php?s=/admin/livecode/add',
            type: 'POST',
            data: {title:uploadFileName,content:{url:uploadFileUrl,size:uploadFileSize},type:3},
            success: function (data) {
                if(data.status == 1){
                    $("#code3 img").attr('src',data.url);
                    $("#img3").attr('href',data.url);
                    $.alertMessager('二维码已成功保存!','success');return;
                }else{
                    $.alertMessager(data.info);return;
                }
            }
        });
    });
    //网址导航
    $("#save_btn4").click(function(){
        var title = $("#title4").val();
        var content = $("#url").val();
        if (title == '') {
            $.alertMessager('请输入标题名称!');return;
        }
        if (content == '') {
            $.alertMessager('请输入网址!');return;
        }
        $.ajax({
            url: 'admin.php?s=/admin/livecode/add',
            type: 'POST',
            data: {title:title,content:content,type:4},
            success: function (data) {  
                if(data.status == 1){
                    $("#code4 img").attr('src',data.url);
                    $("#img4").attr('href',data.url);
                    $.alertMessager('二维码已成功保存!','success');return;
                }else{
                    $.alertMessager(data.info);return;
                }
            }
        });
    });


})


$('#file').click(function () {
    var formdata = new FormData($('#uploadForm')[0]);
    console.log(formdata)
    $.ajax({
        url: 'admin.php?s=/admin/livecode/addfile',
        type: 'POST',
        data: formdata,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
    }).done(function(data){  

    }); 
});
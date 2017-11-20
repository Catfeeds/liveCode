$(function(){
    KindEditor.ready(function(K) {
        kindeditor_1 = K.create('.imgtext', {
            allowFileManager : true,
            filePostName : 'file',
            cssPath : [
                'public/libs/cui/css/cui.min.css',
                'public/libs/kindeditor/plugins/code/prettify.css'
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
    
    var editId  = $("#editId").val();
    var menuId   = $("#menuId").val();
    var postUrl  = 'admin.php?s=/admin/livecode/add';
    var codeType= $("#codeType").val();     //管理员审核编辑
    if (codeType) {
        postUrl = 'admin.php?s=/admin/checkcode/edit/codeType/'+codeType+'/id/'+editId;
    }

    //图文活码
    $("#save_btn").click(function(){
        var picUrl  = $("#uploadPicUrl").val();
        var title   = $("#title").val();
        var content = $(".imgtext").val();
        if (picUrl == '') {
            $.alertMessager('请上传图片!');return;
        }
        if (title == '') {
            $.alertMessager('请输入标题名称!');return;
        }
        if (content == '') {
            $.alertMessager('请输入内容!');return;
        }
        $.ajax({
            url: postUrl,
            type: 'POST',
            data: {editId:editId,menuId:menuId,title:title,content:{picUrl:picUrl,content:content},type:1},
            success: function (data) {  
                if(data.status == 1){
                    $("#code1 img").attr('src',data.url);
                    $("#img1").attr('href',data.url);
                    returnSuccessInfo(data);
                }else{
                    $.alertMessager(data.info);return;
                }
            }
        });
    });
    //文本活码
    $("#save_btn2").click(function(){
        var title   = $("#title2").val();
        var content = $("#content2").val();
        if (title == '') {
            $.alertMessager('请输入标题名称!');return;
        }
        if (content == '') {
            $.alertMessager('请输入内容!');return;
        }
        $.ajax({
            url: postUrl,
            type: 'POST',
            data: {editId:editId,menuId:menuId,title:title,content:content,type:2},
            success: function (data) {  
                if(data.status == 1){
                    $("#code2 img").attr('src',data.url);
                    $("#img2").attr('href',data.url);
                    returnSuccessInfo(data);
                }else{
                    $.alertMessager(data.info);return;
                }
            }
        });
    });
    //文件活码
    $("#save_btn3").click(function(){
        var title = $("#title3").val();
        var uploadFileName = $("#uploadFileName").val();
        var uploadFileSize = $("#uploadFileSize").val();
        var uploadFileUrl  = $("#uploadFileUrl").val();
        if (title == '') {
            $.alertMessager('请输入标题名称!');return;
        }
        if (uploadFileName == '' || uploadFileUrl == '') {
            $.alertMessager('请上传文件!');return;
        }
        $.ajax({
            url: postUrl,
            type: 'POST',
            data: {editId:editId,menuId:menuId,title:title,content:{fileName:uploadFileName,url:uploadFileUrl,size:uploadFileSize},size:uploadFileSize,type:3},
            success: function (data) {
                if(data.status == 1){
                    $("#code3 img").attr('src',data.url);
                    $("#img3").attr('href',data.url);
                    returnSuccessInfo(data);
                }else{
                    $.alertMessager(data.info);return;
                }
            }
        });
    });
    //网址导航
    $("#save_btn4").click(function(){
        var title = $("#title4").val();
        var desc  = $(".url-desc").val();
        var link  = $(".url-link").val();
        var content = getUrlParams('.url-desc');
        if (title == '') {
            $.alertMessager('请输入标题名称!');return;
        }
        if (desc == '') {
            $.alertMessager('请输入文字说明!');return;
        }
        if (link == '') {
            $.alertMessager('请输入链接地址!');return;
        }
        $.ajax({
            url: postUrl,
            type: 'POST',
            data: {editId:editId,menuId:menuId,title:title,content:content,type:4},
            success: function (data) {  
                if(data.status == 1){
                    $("#code4 img").attr('src',data.url);
                    $("#img4").attr('href',data.url);
                    returnSuccessInfo(data);
                }else{
                    $.alertMessager(data.info);return;
                }
            }
        });
    });
    //名片活码
    $("#save_btn5").click(function(){
        var params           = {};
        var head             = $(".vcard_head").attr('style');
        params.head          = head.slice(23,head.length-3);
        var face             = $(".vcard_face").attr('style');
        params.face          = face.slice(23,face.length-3);
        params.name          = $("#vcard_data_name").html();
        params.appointment   = $(".vcard_data_appointment").html();
        params.company       = $(".vcard_data_company").html();
        params.branch        = getParams('.left_basic .vcard_data_title');          //部门
        params.layoutbg      = $('#info-layout').val();                             //展示位置

        params.left_phone    = getParams('.left_phone .vcard_data_title');          //联系信息
        params.left_internet = getParams('.left_internet .vcard_data_title');       //社交信息
        params.left_address  = getParams('.left_address .vcard_data_title');        //地址信息
        params.left_intro    = getParams('.left_intro .vcard_data_title');          //个人说明
        params.lang          = $('#lang').val();                                    //语言

        if (params.name == '姓名' || params.name == 'Name') {
            $.alertMessager('请输入姓名!');return;
        }
        $.ajax({
            url: postUrl,
            type: 'POST',
            data: {editId:editId,menuId:menuId,params:params,type:5},
            success: function (data) {  
                if(data.status == 1){
                    $("#code5 img").attr('src',data.url);
                    $("#img5").attr('href',data.url);
                    returnSuccessInfo(data);
                }else{
                    $.alertMessager(data.info);return;
                }
            }
        });
    });
    

})

getParams = function(obj){
    var params = {};
    var chk = {},s;
    $(obj).each(function(key){
        if($(this).html()){
            params[key] = {ch:$(this).html(),en:$(this).attr('data-lang-key'),val:$(this).next().html(),class:$(this).next('span').attr('class'),id:$(this).parent().parent().attr('id')};
        }
    });
    chk=null,s=null;
    return params;
}
//网址活码
getUrlParams = function(obj){
    var params = {};
    $(obj).each(function(key){
        if($(this).val() && $(this).parents('.no-gutter').find('.url-link').val()){
            if (key == 0) {
                params[key] = {desc:$(this).val(),link:$(this).parents('.no-gutter').find('.url-link').val(),content:$(".imgtext2").val()};
            }else{
                params[key] = {desc:$(this).val(),link:$(this).parents('.no-gutter').find('.url-link').val()};
            }
        }
    });
    return params;
}
returnSuccessInfo = function(data){
    $.alertMessager('二维码已成功保存!','success');
    if (data.info.site) {
        setTimeout(function(){self.location=document.referrer;},2000);
    }else{
        if (data.info.type) {
            setTimeout(function(){location.href = "admin.php?s=/admin/livecode/child/type/"+data.info.type;},2000);
        }else{
            setTimeout(function(){location.href = "admin.php?s=/admin/livecode/index";},2000);
        }
    }
}
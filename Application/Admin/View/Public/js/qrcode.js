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
    
    var menuId  = $("#menuId").val();
    //图文活码
    $("#save_btn").click(function(){
        var editId  = $("#editId").val();
        var picUrl  = $("#uploadPicUrl").val();
        var title   = $("#title").val();
        var content = $("#imgtext").val();
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
            url: 'admin.php?s=/admin/livecode/add',
            type: 'POST',
            data: {editId:editId,menuId:menuId,title:title,content:{picUrl:picUrl,content:content},type:1},
            success: function (data) {  
                if(data.status == 1){
                    $("#code1 img").attr('src',data.url);
                    $("#img1").attr('href',data.url);
                    $.alertMessager('二维码已成功保存!','success');return;
                }else{
                    $.alertMessager(data.info);return;
                }
            }
        });
    });
    //文本活码
    $("#save_btn2").click(function(){
        var editId  = $("#editId2").val();
        var title   = $("#title2").val();
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
            data: {editId:editId,menuId:menuId,title:title,content:content,type:2},
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
        var editId         = $("#editId3").val();
        var uploadFileName = $("#uploadFileName").val();
        var uploadFileSize = $("#uploadFileSize").val();
        var uploadFileUrl  = $("#uploadFileUrl").val();
        if (uploadFileName == '' || uploadFileUrl == '') {
            $.alertMessager('请先上传文件!');return;
        }
        $.ajax({
            url: 'admin.php?s=/admin/livecode/add',
            type: 'POST',
            data: {editId:editId,menuId:menuId,title:uploadFileName,content:{url:uploadFileUrl,size:uploadFileSize},type:3},
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
        var editId  = $("#editId4").val();
        var title   = $("#title4").val();
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
            data: {editId:editId,menuId:menuId,title:title,content:content,type:4},
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
    //名片活码
    $("#save_btn5").click(function(){
        var params           = {};
        var editId           = $("#editId5").val();

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
        // console.log(params.left_phone)
        if (params.name == '姓名' || params.name == 'Name') {
            $.alertMessager('请输入姓名!');return;
        }
        $.ajax({
            url: 'admin.php?s=/admin/livecode/add',
            type: 'POST',
            data: {editId:editId,menuId:menuId,params:params,type:5},
            success: function (data) {  
                if(data.status == 1){
                    $("#code5 img").attr('src',data.url);
                    $("#img5").attr('href',data.url);
                    $.alertMessager('二维码已成功保存!','success');return;
                }else{
                    $.alertMessager(data.info);return;
                }
            }
        });
    });
    //产品活码
    $("#save_btn6").click(function(){
        var editId  = $("#editId6").val();
        var menuId  = $("#menuId").val();
        var codeType= $("#codeType").val();     //管理员审核编辑
        var picUrl  = $("#uploadPicUrl").val();
        var title   = $("#title6").val();
        var content = $("#imgtext").val();
        var postUrl = 'admin.php?s=/admin/product/add';

        if (picUrl == '') {
            $.alertMessager('请上传图片!');return;
        }
        if (title == '') {
            $.alertMessager('请输入产品名称!');return;
        }
        if (content == '') {
            $.alertMessager('请输入内容!');return;
        }
        if (codeType != '') {
            postUrl = 'admin.php?s=/admin/checkcode/edit/codeType/'+codeType+'/id/'+editId;
        }

        $.ajax({
            url: postUrl,
            type: 'POST',
            data: {editId:editId,menuId:menuId,title:title,content:{picUrl:picUrl,content:content}},
            success: function (data) {  
                if(data.status == 1){
                    $("#code6 img").attr('src',data.url);
                    $("#img6").attr('href',data.url);
                    $.alertMessager('二维码已成功保存!','success');return;
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
/* 
    @UMeditor编辑器内图片上传服务文件 by zhj
    @param: is_vip 用户账号类型 30基础版 0高级版
*/
define(function(require, exports, module) {
    var pd = false;
    function save_adddisable() {
        $('[data-save]').attr("disabled","disabled");
        $('[data-preview]').attr("disabled","disabled");
        $('#show-qrcode').attr("disabled","disabled");
    }
    function save_rmdisable() {
        $('[data-save]').removeAttr("disabled");
        $('[data-preview]').removeAttr("disabled");
        $('#show-qrcode').removeAttr("disabled");
    }
    function upload(is_vip) {
        var imgTitle;
        if (!pd) {
            pd = true;
            var img, file, suffix, size;
            img = 'jpg,jpeg,png,gif,mp4';
            suffix = img;
            size = 1024 * 1024 * 2;
            //基础版用户
            if(is_vip==30){
                size = 1024 * 1024 * 30;
            }
            //高级版用户
            if(is_vip==0){
                size=1024 * 1024 * 300;
            };
            $(".edui-image-file").upload({
                'exts': suffix, //支持的扩展名
                'extsfun': function(nowexts) { //不支持的扩展名回调
                    var alertContent = '<p>非常抱歉，出于安全的考虑以及根据网监部门和安全联盟的规定，暂时不能支持您当前上传文件的格式。目前我们仅支持以下格式：</p><br>'+
                        '<p>jpg,jpeg,gif,png</p>';
                    var alertFooter = '<div class="modal-footer">'+
                    '<button class="btn dark-white" data-dismiss="modal">我知道了</button>'+
                    '</div>';
                    $('#modal-alert').modal('show').find('.modal-title').text('上传图片格式不支持')
                    .end().find('.modal-body').empty().append(alertContent);
                    $('#modal-alert').find('.modal-footer').remove().end().find('.modal-body').after(alertFooter);
                },
                'maxsize': size, //最大200MB
                'maxsizefun': function(nowsize) { //超出大小回调
                    var maxsizeMB = size/1024/1024;
                    if (is_vip != 0 && is_vip != 30) { //免费版 
                        var alertContent = '<div class="text-center"><p class="m-b">最大支持 '+maxsizeMB+' MB,现在为 '+nowsize+'，付费用户拥有更高上传权限</p>'+
                            '<a href="#" target="_blank" class="btn btn-sm white m-r">查看版本比较</a>'+
                            '<a href="#" target="_blank" class="btn btn-sm green">购买</a>'; 
                        $('#modal-alert').modal('show').find('.modal-title').text('上传的图片过大')
                        .end().find('.modal-body').empty().append(alertContent);
                    } else {
                        var alertContent = '<p class="text-center"><i class="fa fa-exclamation-circle text-warn m-r"></i>您上传的文件过大，请<a class="text-green link text-u-l p-x-xs" href="javascript:open_qq();">联系我们</a>寻求帮助</p>';
                        $('#modal-alert').modal('show').find('.modal-title').text('上传的图片过大')
                        .end().find('.modal-body').empty().append(alertContent);
                    }                
                },
                'start': function($setAfter) { //开始上传
                    save_adddisable();

                    var list = new Object();
                    list.src = STATIC_SERVICE+"/cli/images/pic-loading.gif";
                    list.style = "max-width: 100%;";
                    imgTitle = "imgNum_" + Math.floor(Math.random() * 10000000 + 1);
                    list.title = imgTitle;
                    if (typeof umImgText != 'undefined') {  //umEditor obj
                        var nowEditorObj = eval($('.tab-pane.active').find('.editor_box').attr('editor-type'));
                    } else if (typeof um != 'undefined') {
                        var nowEditorObj = eval(um);
                    };
                    $(".empty_placeholder").remove();
                    nowEditorObj.execCommand("inserthtml",'<span></span>');
                    nowEditorObj.execCommand('insertimage', list);
                },
                'progress': function(percentage, $objProgress) { //上传过程
                },
                'complete': function(data) { //上传成功
                    save_rmdisable();
                    data.path = data.path.replace(/(http:\/\/)|(https:\/\/)/, "//");// 去掉http:与https:
                    alert('上传成功','ok');
                    re_data = data.path;
                    $("img[title = "+ imgTitle +"]").attr("src",re_data);
                },
                'failed': function(msg) { //上传失败
                    save_rmdisable();
                    console.log("上传失败");
                }
            }, 'cliim');
        }
    }
    exports.upload = upload; 
});
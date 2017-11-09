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
            img = 'jpg,jpeg,png,gif';
            suffix = img;
            size = 1024 * 1024 * 20;
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
                    $(".maskmodal").show();
                    $(".modal-backdrop").hide();
                    $(".navbar-inverse").css('z-index',"0");
                    $(".dark-white").click(function(){
                    	 $(".maskmodal").hide();
                    	 $(".navbar-inverse").css('z-index',"1");
                    })
                },
                'maxsize': size, //最大200MB
                'maxsizefun': function(nowsize) { //超出大小回调
                    var alertContent = '<p class="text-center"><i class="fa fa-exclamation-circle text-warn m-r"></i>您上传的文件过大，请联系我们，寻求帮助</p>';
                    $('#modal-alert').modal('show').find('.modal-title').text('上传的图片过大')
                    .end().find('.modal-body').empty().append(alertContent);  
                    $(".maskmodal").show();
                    $(".modal-backdrop").hide();
                    $(".navbar-inverse").css('z-index',"0");
                    $(".dark-white").click(function(){
                    	 $(".maskmodal").hide();
                    	 $(".navbar-inverse").css('z-index',"1");
                    })
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
                    //alert('上传成功','ok');
                    re_data = "../Uploads/product/file/"+data;
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
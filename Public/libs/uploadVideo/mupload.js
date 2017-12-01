layui.define(['element', 'jquery', 'layer'] , function(exports){
    "use strict";

var element = layui.element,
    $ = layui.jquery;

var msgConf = {
    icon: 2
    ,shift: 6
};

function guid() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
        return v.toString(16);
    });
}

var MUpload = function(options){
    this.options = {
        //上传路径
        url:'',
        //服务器接收的名称
        file_name:'file',
        //容器名称
        container:'',
        //回调函数
        complete:function(){},
    };
    //存储当前需要上传的文件
    this.fileobj = {};
    //存储上传后服务器返回的结果
    this.ress = [];
    
    this._attr = {
        ////记录上传完毕的文件份数（不管文件是否上传成功）
        upload_count:0,
    };
    //设置参数
    for(var k in this.options){
        options[k] && (this.options[k] = options[k]);
    }
};

function delFile(key){
    var that = this;
    //若没有key，则删除所有的file
    if (!key) {
        for(var k in that.fileobj){
            delete that.fileobj[k];
        }
        change_del_btn(that.options.container+' .layui-mupload-submit', 0);
        return;
    }
    if(!(key in that.fileobj)){return;}
    delete that.fileobj[key];
    $('#'+key).remove();
    var len = Object.keys(that.fileobj).length;
    change_del_btn(that.options.container+' .layui-mupload-submit', len);
    changeNoFileBox(that.options.container, len);
}

function addFile(flist){
    if (!flist) {return;}
    var that = this,
        options = that.options,
        len = Object.keys(that.fileobj).length;
    
    if(len == 0){
        $(options.container + ' tbody').empty();
    }
    for (var i = 0; i < flist.length; i++) {
        var key = guid();
        that.fileobj[key] = flist[i];
        add_file_item(options.container, key, that.fileobj[key].name);
    }

    change_del_btn(options.container+' .layui-mupload-submit', Object.keys(that.fileobj).length);
}

function change_del_btn(obj, index){
        index && $(obj).removeClass('layui-btn-disabled') || $(obj).addClass('layui-btn-disabled');
    }

function add_file_item(container, key, name){
    var tr=[];
        tr.push('<tr id="'+key+'">');
        tr.push('<td class="">'+ name + '</td>');
        tr.push('<span>'+name+'</span>');
        tr.push('<td><div class="layui-progress" lay-filter="'+key+'">');
        tr.push('<div class="layui-progress-bar" lay-percent="0%"></div>');
        tr.push('</div></td>');
        tr.push('<td class="layui-icon-status">');
        tr.push('<i class="layui-icon layui-item-wait" style="font-size: 20px;color: #808080;">...</i>');
        tr.push('<i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-item-going" style="font-size: 20px;display:none;color: #808080;">&#xe63d;</i>');
        tr.push('<i class="layui-icon layui-item-success" style="font-size: 20px;display:none;color: #5FB878;">&#xe610;</i>');
        tr.push('<i class="layui-icon layui-item-error" style="font-size: 20px;display:none;color: #FF5722;">&#x1007;</i>');
        tr.push('</td>');
        tr.push('<td><a id="del-item-'+key+'" class="layui-btn layui-btn-primary layui-btn-mini del-item" data-itemid="'+key+'"><i class="layui-icon" style="    margin-right: 0;">&#xe640;</i></a></td>');
        tr.push('</tr>');
        $(container + ' tbody').html(tr.join(''));
}

function changeIconCss(key,item, st){
        $('#'+key+' .layui-icon-status i').css({'display':'none'});
        $('#'+key+' .layui-icon-status .layui-item-'+item).css({'display':'block'});
        st && st == 1 && $('#' + key + ' .layui-progress-bar').addClass('layui-bg-red');
    }


MUpload.prototype.upload = function(formobj, key){
    var stop = 1,
        that = this,
        options = that.options;

    function s(res){
        if(typeof res.code && res.code == 0){
            changeIconCss(key,'success');
        }else{
            changeIconCss(key,'error', 1);
        }
        that.ress.push(res);
        complete();
    }
    function complete(){
        stop = 0;
        element.progress(key, '100%');
        that._attr.upload_count++;
    }
    function e(xhr, error, obj){
        changeIconCss(key,'error', 1);
        complete();
    }
    var settings = {
      url: options.url,
      type:'post',
      data: formobj,
      success: s,
      processData:false,
      contentType:false,
      dataType: 'json',
      error:e,
    }
    var n = 0, timer = setInterval(function(){
        //等待上传
        if(stop){
            n = n + Math.random()*10|0;
            if (n>96) {
                clearInterval(timer);
                n = 96;
            }
            element.progress(key, n+'%');
        }
        else{
            clearInterval(timer);
        }
    },30);
    $.ajax(settings);
}

function initTable(otableid){
    var $table = $(otableid);
    if ($table.children('colgroup').length == 0) {
        var colgroup = ['<colgroup>',
                    '<col>',
                    '<col width="37%">',
                    '<col width="8%">',
                    '<col width="8%">',
                    '</colgroup>'].join('');
        $table.append(colgroup);    
    }
    var thead = [];
        thead.push('<thead>');
        thead.push('<tr><th class="layui-elip">');
        thead.push('<span>文件名</span>');
        thead.push('&nbsp;<div class="layui-box layui-btn layui-upload-button layui-upload-button-small layui-mupload-addfile">');
        thead.push('<input class="layui-mupload-file" name="" value="" lay-title="上传" multiple="multiple" type="file">');
        thead.push('<span class="layui-upload-icon"><i class="layui-icon">&#xe608;</i>添加文件</span>');
        thead.push('</div>&nbsp;');
        thead.push('<a class="layui-btn layui-btn-disabled layui-upload-button-small layui-mupload-submit"><i class="layui-icon">&#xe62f;</i> 上传文件</a>');
        thead.push('</th>');
        thead.push('<th>进度条</th>');
        thead.push('<th>状态</th>');
        thead.push('<th>操作</th>');
        thead.push('</tr></thead>');
    $table.append(thead.join(''));
<<<<<<< HEAD:shipath/mupload.js
    var tfoot = [
        '<tfoot><tr style="background-color:#f2f2f2;color: #999999;">',
        '<td colspan="4">',
        '<span>上传文件</span>',
        '</td>',
        '</tr></tfoot>',
    ].join('');
    $table.append(tfoot);
=======
>>>>>>> f7d6b0f2d7caeed0fa6ffb9bfd65c0c0ee0a85e5:Public/libs/uploadVideo/mupload.js
    $table.append('<tbody></tbody>');
    changeNoFileBox(otableid, 0)
}

/**
 * change tbody部分
 * @param  {string} otableid table对象的id
 * @param  {[number]} index    true or false
 *                             传递 1or 0
 *                             1：删除 tr, 0:添加tr
 * @return {[type]}          
 */
function changeNoFileBox(otableid, index){
    var nofile_tr = [
        '<tr class="layui-mupload-nofile"><td colspan="4" style="text-align:center;color:#b2b2b2;height:60px;">',
        '<div class="" style="font-size:16px;cur"><i class="layui-icon" style="font-size:26px;vertical-align: middle;">&#xe608;</i> 添加文件（可直接拖拽文件到此区域）</div>',
        '</td></tr>'
    ];
    if (!index && !$(otableid).hasClass('layui-mupload-nofile')) {
        $(otableid+' tbody').html(nofile_tr.join(''));
        return;
    }
    $(otableid).hasClass('layui-mupload-nofile') && $(otableid + ' .layui-mupload-nofile').remove();
}

/**
 * 监听拖拽区域
 * @param  {[dom]} elemObj 监听区域的对象
 * @return {[type]}         [description]
 */
function handlerDrag(elemObj){
    var that = this;

    elemObj.addEventListener('dragover', function(ev){
        ev.preventDefault();
    }, false);
    elemObj.addEventListener('drop', function(ev){
        ev.preventDefault();
        var files = ev.dataTransfer.files;
            if(!files || files.length == 0){
                return;
            }              
            if(!/.(mp4)$/.test(files[0].name)){
                return layer.msg('视频上传支持的类型为MP4格式');
            }
            addFile.call(that, files);
    }, false);
}


MUpload.prototype.action = function(){
    var that = this,
        fileobj = that.fileobj,
        options = that.options;
    that.ress = [];
    that._attr.upload_count = 0;

    var timer = setInterval(function(){
        //判断所有文件是否已上传完毕(不管是否上传成功)
        if (that._attr.upload_count == Object.keys(fileobj).length) {
            clearInterval(timer);
            delFile.call(that);
            //所有文件上传操作完毕后，执行回调函数
            typeof options.complete === 'function' && options.complete(that.ress);
        }   
    }, 10);
    
    for(var key in that.fileobj){
        var uForm = new FormData();
        uForm.append(options.file_name, fileobj[key]);
        change_del_btn('#del-item-'+key, 0);
        changeIconCss(key,'going');
        that.upload(uForm, key);
    }
}

MUpload.prototype.init = function(){
    // if(!$(this.options.container)[0]){
    //     layer.msg('container 不存在', msgConf);
    //     return;
    // }
    var that = this, options = that.options;
    initTable(options.container);

    //删除文件
    $(options.container).on('click', '.del-item', function(e){
        var key = $(this).data('itemid');
        delFile.call(that, key);
    });

    //添加文件
    $(options.container).on('change','.layui-mupload-file', function(e){
        if(!this.files || this.files.length == 0){
            $(this).val('');
            return;
        }
        
        if(!/.(mp4)$/.test($(this).val())){
            return layer.msg('视频上传支持的类型为MP4格式');
        }
        addFile.call(that, this.files);
        $(this).val('');
    });

    //上传文件
    $(options.container).on('click', '.layui-mupload-submit', function(){
        if (!Object.keys(that.fileobj).length) {return;}
        change_del_btn(this,0);
        that.action();
    });

    //监听拖拽事件
    handlerDrag.call(that, $(options.container + ' tbody')[0]);
 }
  //暴露接口
  exports('mupload', function(options){
    var mupload = new MUpload(options = options || {});
    mupload.init();
  });
})
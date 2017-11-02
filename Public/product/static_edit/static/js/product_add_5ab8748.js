$(function(){
	$(".navbar-right .dropdown").click(function(){
		$(this).find(".dropdown-menu").toggle();
	})
})
$(function(){
	$('#sidebar .navside-first [data-toggle="collapse"]').click(function(){
		$(this).toggleClass('arrowbb');
		$(this).next('.navside-second').slideToggle('slow');
	})
})
function closePage() {
    return is_change ? "您确定退出吗？": void 0
}
function InsertOldSeniorEditor(e) {
    var t = e.getContent();
    seajs.use(STATIC_SERVICE + "/cli/js/tip_plugins.js",
    function(i) {
        return i.tip_plugin("IE5", "IE6", "IE7", "IE8") ? !1 : void seajs.use(STATIC_SERVICE + "/cli/js/senior_edit.js",
        function(i) {
            i.senior_edit({
                savecallback: function(t) {
                    e.setContent(t)
                },
                current_con: t
            })
        })
    })
}
function change_type() {
    var e = ($("[data-type-selected]"), "pro");
    $("[data-type=" + e + "]").addClass("active").siblings().removeClass("active"),
    $(".tab-pane").removeClass("active"),
    $("." + e + "_section").parent(".tab-pane").addClass("active"),
    $(".senior_edit").removeClass("senior_edit_fixed"),
    $(".option_list").each(function() {
        $(this).removeClass("option_current"),
        "head_title" == $(this).attr("option-tab") && $(this).addClass("option_current")
    }),
    "jump" == e ? ($("#footer_link").hide(), $("#footer_menu").hide(), $("#footer_status").hide(), $("#title_content").hide()) : ($("#footer_link").show(), $("#footer_menu").show(), $("#footer_status").show(), $("#title_content").show(), "text" == e || "imgtext" == e ? $(".option_list").each(function() {
        "active_content" == $(this).attr("option-tab") && $(this).addClass("hide_option")
    }) : $(".option_list").removeClass("hide_option"), $(".option_section").removeClass("option_show"), $(".head_title").addClass("option_show")),
    $(".type_content_show").removeClass("mobile_show"),
    $("#type_" + e + "_content").addClass("mobile_show"),
    "pro" == e ? ($("#title_new").hide(), $("#title_color_box").hide()) : ($("#title_new").show(), $("#title_color_box").show())
}
function imgPasteUpload(e) {
    var t = /<img[^>]*>/g,
    i = /src=[\'\"]?([^\'\"]*)[\'\"]?/i,
    o = /src=[\'\"]?([^\'\"]*)[\'\"]?/g,
    n = /_src=[\'\"]?([^\'\"]*)[\'\"]?/g,
    a = e.match(t);
    if (null != a && (getCapacityCommon.capacityOverproof(getCapacityCommon.accumulationFileSize()), 0 !== getCapacityCommon.accumulationFileSize())) for (var r = 0; r < a.length; r++) {
        var s = a[r].match(i);
        if (s[1]) {
            if ( - 1 != s[1].indexOf("file://localhost")) {
                alert("图片内容请单独复制粘贴");
                continue
            }
            imgPasteAjax(r, s[1])
        }
        if (s[0]) {
            var c = s[0].replace(o, "src='" + STATIC_SERVICE + "/cli/images/pic-loading.gif' class='img_loading' img-id='" + r + "'");
            e = e.replace(s[0], c),
            null != e.match(n) && (e = e.replace(e.match(n)[0], ""))
        }
    }
    return e
}
function imgPasteAjax(e, t) {
    $.ajax({
        url: "//upload.api.cli.im/upload.php?kid=cliim",
        type: "post",
        dataType: "json",
        data: {
            remote_url: t
        },
        success: function(t) {
            if (1 == t.status) {
                if (null != t.data.filesize_byte) var i = imgSizeOver(t.data.filesize_byte);
                1 != i && $("img[img-id = '" + e + "']").attr("src", t.data.path).css("max-width", "100%").removeClass("img_loading")
            } else $("img[img-id = '" + e + "']").attr("src", "" + STATIC_SERVICE + "/cli/images/pic-loading-fail.jpg").removeClass("img_loading").addClass("img_fail")
        }
    })
}
function imgSizeOver(e) {
    var t;
    if (1 == edition_id ? t = 2097152 : 2 == edition_id ? t = 31457280 : edition_id >= 3 && (t = 314572800), e > t && 1 == edition_id) {
        var i = (e / 1024 / 1024).toFixed(2) + " MB",
        o = t / 1024 / 1024,
        n = '<div class="text-center"><p class="m-b">最大支持 ' + o + " MB,现在为 " + i + '，付费用户拥有更高上传权限</p><a href="//cli.im/news/price" target="_blank" class="btn btn-sm white m-r">查看版本比较</a><a href="//' + USER_DOMAIN + '/buy" target="_blank" class="btn btn-sm green">购买</a>';
        return $("#modal-alert").modal("show").find(".modal-title").text("上传的图片过大").end().find(".modal-body").empty().append(n),
        1
    }
    return 2
}
function VerifyTips(e, t, i, o) {
    2 == o ? ($(t).html(i), $(e).show(), setTimeout('$("' + e + '").fadeOut()', 2e3)) : ($(e).show(), setTimeout('$("' + e + '").fadeOut()', 2e3))
}
function getUrlPara(e) {
    var t = new RegExp("(^|&)" + e + "=([^&]*)(&|$)"),
    i = window.location.search.substr(1).match(t);
    return null != i ? unescape(i[2]) : 1
}
function getUrlName(e) {
    var t = new RegExp("(^|&)" + e + "=([^&]*)(&|$)"),
    i = window.location.search.substr(1).match(t);
    return null != i ? unescape(i[2]) : null
}
function VerifyTipStay(e, t) {
    var i = '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
    $(e).html(t),
    $(e).append(i).show()
}
function setCookie(e, t) {
    var i = 30,
    o = new Date;
    o.setTime(o.getTime() + 24 * i * 60 * 60 * 1e3),
    document.cookie = e + "=" + escape(t) + ";expires=" + o.toGMTString()
}
function getCookie(e) {
    var t, i = new RegExp("(^| )" + e + "=([^;]*)(;|$)");
    return (t = document.cookie.match(i)) ? unescape(t[2]) : null
}
function UserPluginOpenqq(e) {
    var t = document.getElementsByTagName("head")[0],
    i = document.createElement("iframe");
    i.id = "qq_frame",
    i.src = e,
    t.appendChild(i)
}
function downurl(e) {
    var t = e.replace("/qr?data=", "/qr/downQr?data="),
    i = t + "&type=png";
    return i
}
var oldIE, op, op_1, op_name, telnum, is_change = !1,
toolbar_config = "undo redo | removeformat horizontal | bold italic underline | forecolor backcolor fontsize | justifyleft justifycenter justifyright | insertorderedlist insertunorderedlist | link unlink image clistyle table tellink",
um = UM.getEditor("myEditor", {
    toolbar: [toolbar_config],
    pasteImageEnabled: !0,
    focus: !1
});
document.body.draggable = !1,
document.body.setAttribute("ondragstart", "return false"),
document.body.setAttribute("ondragenter", "event.dataTransfer.dropEffect='none'; event.stopPropagation(); event.preventDefault();"),
document.body.setAttribute("ondragover", "event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"),
document.body.setAttribute("ondrop", "event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();");
var wrapperMinHeight = $(window).height() - 180;
$(".wrapper, .wrapper .w-p100:eq(0)").css("min-height", wrapperMinHeight + "px"),
400 > wrapperMinHeight - 210 ? $("#myEditor").css("min-height", 400) : $("#myEditor").css("min-height", wrapperMinHeight - 210);
var editorHeight = $("#myEditor").outerHeight();
$(".right-operations-2").css("min-height", editorHeight - 80),
um.addListener("beforepaste",
function(e, t) {
    t.html = imgPasteUpload(t.html)
}),
um.addListener("contentChange",
function() {
    is_change = !0
}),
window.onbeforeunload = closePage,
$(function() {
    var e = '<label class="checkbox-inline pasteplain_btn text-darkgrey" id="pasteplain_check"><input type="checkbox" value="option1" class="has-value">粘贴保留格式</label><span class="senior-edit-btn text-green" senior-editor>高级编辑</span>';
    $(".edui-toolbar").append(e),
    $("#pasteplain_check").click(),
    um.execCommand("pasteplain"),
    $("#pasteplain_check input").change(function() {
        var e = um;
        e.execCommand("pasteplain")
    }),
    $(".edui-icon-image").html("<i class='fa fa-photo text-grey m-r-sm'></i><span>插入图片</span>"),
    $(".edui-icon-clistyle").html("<i class='fa fa-magic text-grey m-r-sm'></i><span>插入样式</span>"),
    $(".edui-icon-table").html("<i class='fa fa-table text-grey m-r-sm'></i><span>插入表格</span>"),
    $(".edui-icon-tellink").html("<i class='fa fa-phone text-grey m-r-sm'></i><span>插入电话</span>");
    $(".edui-icon-ship").html("<i class='fa fa-ship text-grey m-r-sm'></i><span>插入视频</span>");
    var t = getUrlName("code_type");
    if (null != t && 0 != t ? $.ajax({
        type: "GET",
        url: "/apis/scene/get/" + t,
        success: function(e) {
            if (1 == e.status) {
                var t = e.data.data_imgurl,
                i = e.data.data_content; - 1 != window.location.href.indexOf("/proadd") && ($("#img").val(t), $("#template_btn").show(), $("#img_cover").css("background-image", "url(" + t + ")"), $("#type_pro_img").attr("src", t), $("#upload-img-btn").hide(), $("#img_cover").show(), um.setContent(i), um.focus_first("cursor_point"), 1 != getCookie("cookie_msg_close") && $("#umeditor_alert").show(), is_change = !1)
            } else um.focus()
        }
    }) : -1 != window.location.href.indexOf("/proadd") ? ($("#upload-img-del").hide(), $("#upload-img-up").hide(), um.setContent("<p class='empty_placeholder text-lightgrey' style='font-size:14px;'></p>"), $("#myEditor").click(function() {
        0 != $(this).find(".empty_placeholder").length && $(this).find(".empty_placeholder").remove().end().append("<p><br></p>")
    }), $(".edui-btn-image").click(function() {
        0 != $(this).find(".empty_placeholder").length && $("#myEditor").find(".empty_placeholder").remove().end().append("<p><br></p>")
    })) : um.focus(), 1 == edition_id && $(".free-logo-lock-box").removeClass("none"), "undefined" != typeof window.getSelection) {
        var i = $("#myEditor");
        i.on("mouseup",
        function() {
            var e = $("#myEditor").context;
            telnum = e.getSelection().toString()
        })
    }
    $(document).scroll(function() {
        var e = $(document).scrollTop();
        return 72 - e > 48 ? void $("#edit_right_content").css({
            top: 72 - e
        }) : void $("#edit_right_content").css({
            top: 48
        })
    })
}),
$('[data-toggle="tab"]').on("shown.bs.tab",
function() {
    var e = $(this),
    t = e.attr("data-type");
    "jump" != t && "<p>输入的文本将显示在这里</p>" != $(".active_show_des").html() && "输入的文本将显示在这里" != $(".active_show_des").html() && (um.setContent($(".active_show_des").html()), is_change = !1)
}),
"undefined" != typeof row && row.content.desc && (um.setContent(row.content.desc.value), is_change = !1),
"undefined" != typeof row && row.content.text && (um.setContent(row.content.text.value), is_change = !1),
$(function() {
    is_change = !1,
    $("html").is(".lt-ie10") && (oldIE = !0),
    oldIE && $('input[type="text"]').placeholder(),
    $('[data-toggle="tooltip"]').tooltip(),
    $('[data-toggle="popover"]').popover({
        delay: 200
    }),
    $(window).scroll(function() {
        var e = parseInt($(window).scrollTop());
        80 > e && $("#preview").removeClass("active_present_fixed"),
        e >= 80 && $("#preview").addClass("active_present_fixed")
    }),
    $("#gtin-val").focus(function() {
        $(this).removeClass("border-danger"),
        $("#wrong-gtin").addClass("none"),
        $("#wrong-gtin-13").addClass("none")
    }),
    $("#back-list").click(function() {
        var e = getUrlPara("p"),
        t = getUrlPara("t"),
        i = getUrlPara("i");
        1 == is_change ? Modal.confirm({
            msg: "你有修改未保存，是否保存？"
        }).on(function(o) {
            o ? seajs.use("qrcode/proaddActive",
            function(e) {
                var t = "auto_back";
                e.addActive(t)
            }) : (is_change = !1, window.location.href = "/user/active/pro?t=" + t + "&p=" + e + "&i=" + i)
        }) : window.location.href = "/user/active/pro?t=" + t + "&p=" + e + "&i=" + i
    }),
    seajs.use("keyup_change",
    function(e) {
        e.jump("#jump_url", ".jump_url_show"),
        e.keyup_change("#phone", "", ".type_call_link", ""),
        e.keyup_change(".active_title", "", ".title", ".img_title"),
        e.keyup_change(".footerlink_des", "", "#theme_url", "")
    }),
    $("#file_des").click(function() {
        $(this).hide(),
        $("#file_des_edit").removeClass("none"),
        $("#file_des_title").removeClass("none")
    }),
    $("#url_des").click(function() {
        $(this).hide(),
        $("#url_des_edit").removeClass("none"),
        $("#url_des_title").removeClass("none")
    }),
    $("[data-upload-img]").click(function() {
        if (getCapacityCommon.capacityOverproof(getCapacityCommon.accumulationFileSize()), 0 !== getCapacityCommon.accumulationFileSize()) {
            var e = $(this).find('input[type="file"]').attr("data-type"),
            t = file_size;
            seajs.use([STATIC_SERVICE+"/public/upload.js?v=20170503", "m/upload_" + e],
            function(i, o) {
                o.upload(e, t),
                is_change = !0
            })
        }
    }),
    $(document).on("click", "input[name = 'Filedata']",
    function() {
        return 0 == getCapacityCommon.accumulationFileSize() && "file" != $(this).attr("data-type") ? !1 : void 0
    }),
    $("[data-upload-file]").click(function() {
        if (!$("#upload-file-btn").hasClass("disabled")) {
            var e = $(this).find('input[type="file"]').attr("data-type"),
            t = file_size;
            seajs.use([STATIC_SERVICE+"/public/upload.js?v=20170503", "m/upload_" + e],
            function(i, o) {
                o.upload(e, t)
            })
        }
    }),
    $("#upload-img-del").click(function() {
        $("#img").val(""),
        $("#uploadfile-img").removeAttr("disabled"),
        $("#upload-img-btn").show(),
        $("#upload-img-del").hide(),
        $("#upload-img-up").hide(),
        $("#img_cover").hide(),
        $("#type_pro_img").attr("src", ""),
        is_change = !0
    }),
    $("#show-qrcode").click(function() {
        if ("undefined" != typeof enturl) {
            var e = downurl($("#qrcode_img_pro img").attr("src"));
            window.open(e)
        } else alert("请先生成二维码！")
    }),
    $("#down-qrtype").click(function() {
        "undefined" != typeof enturl ? seajs.use(STATIC_SERVICE + "/cli/js/m/down.js",
        function(e) {
            var t = downurl($("#qrcode_img_pro img").attr("src"));
            e.down(t,
            function() {})
        }) : alert("请先生成二维码！")
    }),
    $("#beauty-qrcode").click(function() {
        "undefined" != typeof enturl ? seajs.use(STATIC_SERVICE + "/cli/js/cli_beautify.js",
        function() {
            load_beautify({
                value: enturl,
                needreset: !0
            })
        }) : alert("请先生成二维码！")
    }),
    $("[senior-editor]").click(function() {
        if ("undefined" != typeof um) var nowEditorObj = eval(um);
        "function" == typeof InsertOldSeniorEditor && InsertOldSeniorEditor(nowEditorObj)
    }),
    $("#myEditor").on("mouseenter", "tbody tr",
    function() {
        var e = $(this),
        t = '<td class="table-operation" style="border: 0; padding: 0; width: 10%; background: #fff;"><div class="table-operation-box"><i class="fa fa-plus m-r-sm text-white pointer" data-toggle="tooltip" data-placement="top" data-original-title="添加" data-add-tr></i><i class="fa fa-trash text-white pointer" data-toggle="tooltip" data-placement="top" data-original-title="删除" data-delete-tr></i></div></td>';
        0 == e.find(".table-operation").length ? e.append(t) : e.find(".table-operation").css("opacity", "1"),
        $("[data-delete-tr]").off().click(function() {
            e.remove()
        }).mouseenter(function() {
            $(this).tooltip("show")
        }),
        $("[data-add-tr]").off().click(function() {
            if (e.hasClass("tr_bgcolor")) var t = e.clone().removeAttr("style").removeClass("tr_bgcolor").removeClass("firstRow");
            else {
                if (e.hasClass("firstRow")) var i = e.next().attr("style");
                else var i = e.prev().attr("style");
                var t = e.clone().attr("style", i).addClass("tr_bgcolor").removeClass("firstRow")
            }
            e.after(t),
            $("[data-toggle = 'tooltip']").tooltip("hide")
        }).mouseenter(function() {
            $(this).tooltip("show")
        })
    }).on("mouseleave", "tr",
    function() {
        $(this).find(".table-operation").css("opacity", "0")
    }).on("mouseleave", "table",
    function() {
        $(this).find(".table-operation").remove()
    }).on("mouseleave",
    function() {
        $(this).find(".table-operation").css("opacity", "0")
    }).on("click", "tr",
    function() {
        $(this).find(".table-operation").remove()
    }),
    $("#option_btn").click(function() {
        $("#modal-other-option").modal("show")
    }),
    $("#modal-option-confirm").click(function() {
        $("#modal-other-option").modal("hide"),
        $("[data-save]").click()
    }),
    $("[data-preview]").click(function() {
        if ($(this).attr("disabled", "disabled"), $("#show-qrcode").attr("disabled", "disabled"), 1 == is_change) seajs.use("qrcode/proaddActive",
        function(e) {
            var t = "auto_preview";
            e.addActive(t)
        }),
        is_change = !1;
        else if ("undefined" != typeof enturl) {
            var e = "/" + coding + "?iframe=1";
            seajs.use(STATIC_SERVICE + "/cli/js/preview.js?t=20170420",
            function(t) {
                t.mobile_preview(enturl, e, "", "yes")
            })
        } else seajs.use("qrcode/proaddActive",
        function(e) {
            var t = "auto_preview";
            e.addActive(t)
        })
    }),
    $(document).on("click", ".preview_show_close,.qrcode_plugins_close,#qrcode_plugins,.preview_show_bg",
    function() {
        $("[data-preview]").removeAttr("disabled"),
        $("#show-qrcode").removeAttr("disabled")
    }),
    $("#alert_msg_close").click(function() {
        setCookie("cookie_msg_close", 1)
    }),
    $("[data-save]").click(function() {
        um.setDisabled("");
        var e = $("#qrcode_img_pro img");
        e.removeClass("pointer"),
        e.removeAttr("data-save"),
        e.off(),
        $("#show-qrcode").attr("disabled", "disabled"),
        $("[data-preview]").attr("disabled", "disabled"),
        seajs.use("qrcode/proaddActive",
        function(e) {
            e.addActive()
        })
    }),
    $(document).on("click", "#pro_tooltip_close",
    function() {
        $("#qrcodeimg_tooltip").removeClass("in")
    }),
    $("#active_qq").click(function() {
        $("#user_plugins_qqservice").click()
    });
    var windowWidth = $(window).width();
    if ($("#editor_main").css("margin-left", (windowWidth - 810) / 2), $(window).resize(function() {
        var e = $(window).width();
        $("#editor_main").css("margin-left", (e - 810) / 2)
    }), $("#feedback").click(function() {
        seajs.use("m/feedback",
        function(e) {
            e.feedback("huoma@nears.cn", "商品码商品反馈", "您对商品码有什么建议吗")
        })
    }), getCookie("climanager")) {
        var cookieClimanager = getCookie("climanager"),
        cookieClimanagerDecode = unescape(cookieClimanager),
        cookieClimanagerJson = JSON.parse(cookieClimanagerDecode),
        supportQqLink = cookieClimanagerJson.contact_link;
        $("#onlinechat").attr({
            href: supportQqLink,
            target: "_blank"
        })
    }
    document.body.clientWidth < 1e3 && $("#support-wrapper").addClass("none"),
    $(window).resize(function() {
        document.body.clientWidth < 1e3 ? $("#support-wrapper").addClass("none") : $("#support-wrapper").removeClass("none")
    }),
    $("#feedback").click(function() {
        $.ajax({
            async: !0,
            type: "get",
            url: "/Api/QqServer/add",
            data: {
                data_from: 101
            },
            dataType: "jsonp",
            success: function() {}
        })
    }),
    $("#onlinechat").click(function() {
        $.ajax({
            async: !0,
            type: "get",
            url: "/Api/QqServer/add",
            data: {
                data_from: 102
            },
            dataType: "jsonp",
            success: function() {}
        })
    })
});
var originalLeave = $.fn.popover.Constructor.prototype.leave;
$.fn.popover.Constructor.prototype.leave = function(e) {
    var t, i, o = e instanceof this.constructor ? e: $(e.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
    originalLeave.call(this, e),
    e.currentTarget && (t = !1 === o.options.container ? $(e.currentTarget).siblings(".popover") : $(".popover", o.options.container), i = o.timeout, t.one("mouseenter",
    function() {
        clearTimeout(i),
        t.one("mouseleave",
        function() {
            $.fn.popover.Constructor.prototype.leave.call(o, o)
        })
    }))
},
$(function() {
    window.Modal = function() {
        var e = new RegExp("\\[([^\\[\\]]*?)\\]", "igm"),
        t = $("#tip-modal-sm"),
        i = t.html(),
        o = function(e) {
            return t.html(i),
            t.find(".cancel").hide(),
            a(e),
            {
                on: function(e) {
                    e && e instanceof Function && t.find(".ok").click(function() {
                        e(!0)
                    })
                }
            }
        },
        n = function(e) {
            return t.html(i),
            t.find(".cancel").show(),
            a(e),
            t.click(function() {
                $("#tip-modal-sm").modal("hide")
            }),
            {
                on: function(e) {
                    e && e instanceof Function && (t.find(".ok").click(function() {
                        e(!0)
                    }), t.find(".cancel").click(function() {
                        e(!1)
                    }))
                }
            }
        },
        a = function(i) {
            var o = {
                msg: "提示内容",
                title: "提示",
                btnok: "确定",
                btncl: "取消"
            };
            $.extend(o, i);
            var n = t.html().replace(e,
            function(e, t) {
                return {
                    Title: o.title,
                    Message: o.msg,
                    BtnOk: o.btnok,
                    BtnCancel: o.btncl
                } [t]
            });
            t.html(n),
            t.modal({
                width: 500,
                backdrop: "static"
            })
        };
        return {
            alert: o,
            confirm: n
        }
    } ()
});
var url = window.location.host;
if ( - 1 != url.search(/cliim.net/) && -1 != url.search(/cli.me/)) {
    var _hmt = _hmt || []; !
    function() {
        var e = document.createElement("script");
        e.src = "//hm.baidu.com/hm.js?cb508e5fef81367bfa47f4ec313bf68c";
        var t = document.getElementsByTagName("script")[0];
        t.parentNode.insertBefore(e, t)
    } (),
    seajs.use(STATIC_SERVICE+"/public/cli_analytics.js")
}
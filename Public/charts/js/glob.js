	$(function(){
	var url = window.location.host;
	$url = $(".time-nav").attr('field');
	if(url.indexOf('2w.ma')>0) 
	{
		$(".nav_black").hide();
		$(".sidebar").css("top","0");
		$(".main").css("padding-top","20px");
	}
	$(".1day").click(function(){
		dateHref(-1,$url);
	});
	$(".7day").click(function(){
		dateHref(-7,$url);
	});
	$(".30day").click(function(){
		dateHref(-30,$url);
	});
	/*预览浮窗*/
	$("#yulan_btn").click(function(){
		$("body").attr("onmousewheel","return false");
		$(".black_bg").show();
		if($(".yulan").attr('src') == "") $(".yulan").attr('src',$(this).attr('link_add'));
		$(".yulan").show();
	});
	
	$("#duli_btn").click(function(){
		$("body").attr("onmousewheel","return false");
		$(".black_bg").show();
		$(".show_addr").show();
	});
	$(".black_bg").click(function(){
		$(".black_bg").hide();
		$(".yulan").hide();
		$(".show_addr").hide();
		$("body").removeAttr("onmousewheel");
	});
	/*地域级联选择按钮*/
	$(".submit_area").click(function(){
		$arr = new Array();
		$(".jilian select").each(function(i){
			if($(this).find("option:selected").val()>0)
				$arr[i] = $(this).find("option:selected").val();
		});
		if($arr.length == 0)
		{
			alert('请至少选择一个国家');
			return false;
		}
		$mark = $arr.length+1;
		$id = $arr[$arr.length-1];
		window.location.href="/index/area/mark/"+$mark+"/id/"+$id;
	});
	/*mobile导航*/
	$(".nav_btn").click(function(){
		$(this).next(".menu").toggle();
		event.stopPropagation();
	});
	$(window).click(function(){
		$(".menu").hide();
	});

	//添加气泡提示
	var is_show_tips = false;	//是否处于hover状态下
	$('.highcharts-legend-item').live('mouseenter',function(){
		is_show_tips = true;
		if($('.custom_tips').length<1){
			$('body').append($(custom_tips_tpl).html());
			$('.custom_tips').show();
		}else{
			$('.custom_tips').show();
		}
		if($(this).find('text').text().indexOf('访问量')>0){
			$('.custom_tips').find('p').text('访问量：用户每扫描一次二维码就记录1次。用户多次扫描同一个二维码，访问量值累计');
		}else{
			$('.custom_tips').find('p').text('访客数：一天之内独立访客数，一天内(同IP,同设备,同系统,同环境)多次访问您的二维码只计算1个访客');
		}
	});
	$('.highcharts-legend-item').live('mouseleave',function(){
		is_show_tips = false;
		$('.custom_tips').hide();
	});

	$('body').live('mousemove',function(e){
		if(is_show_tips){
			var top = e.pageY+20;
			var left = e.pageX-122;
			$('.custom_tips').css({'top':top,'left':left});
		}
	});

});
function dateHref($date,$url)
{
	/*$url = '/index/'+$url+'/stime/'+GetDateStr($date)+'/etime/'+GetDateStr(-1);
	console.log($url);*/
	if($date == -1)
		window.location.href='/index/'+$url+'/stime/'+GetDateStr($date)+'/etime/'+GetDateStr(-1);
	else if($date ==0)
		window.location.href='/index/'+$url+'/stime/'+GetDateStr($date)+'/etime/'+GetDateStr(0);
	else
		window.location.href='/index/'+$url+'/stime/'+GetDateStr($date+1)+'/etime/'+GetDateStr(0);
}
function GetDateStr(AddDayCount) {
    var dd = new Date();
    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = dd.getMonth()+1;//获取当前月份的日期
    var d = dd.getDate();
    return y+"-"+m+"-"+d;
}

function jsonGoInt(data){
	for(var z=0;z<data.series.length;z++)
    {
        for(var i=0;i<data.series[z].data.length;i++)
        {
            data.series[z].data[i] = parseInt(data.series[z].data[i]);
        }
    }
    return data;
}


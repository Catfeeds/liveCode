var myChart;
$(function(){
    $("#startDate").ligerDateEditor();
	$("#endDate").ligerDateEditor();
    myChart = echarts.init(document.getElementById('mainwarp'));
    loadStat();
});
function loadStat(){
	var id        = $('#id').val();
	var code      = $('#code').val();
	var startDate = $('#startDate').val();
	var endDate   = $('#endDate').val();
	$.ajax({
	    url: 'admin.php?s=/admin/phone/getEchartsData',
	    type: 'POST',
	    data: {id:id,code:code,startDate:startDate,endDate:endDate}
	}).done(function(data) {
	    if (data.status == 1) {
	        var option = {
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['扫码次数']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: false, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    xAxis: {
			        type: 'category',
			        boundaryGap: false,
			        data: data.info.days
			    },
			    yAxis: {
			        type: 'value'
			    },
			    series: [
			        {
			            name:'扫码次数',
			            type:'line',
			            data:data.info.u0
			        }
			    ]
			};
                    
			myChart.setOption(option);
	    }
	});


}
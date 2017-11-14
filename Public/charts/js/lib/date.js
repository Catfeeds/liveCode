$(function(){
	$(".nav li:eq(1)").addClass("active");
	lineData["title"]["text"] =data.tabalName;
	lineData["series"] = data.series;
	lineData["xAxis"] = data.xAxis;
	lineData["series"][1]['visible'] = false;
	lineData["series"][0]['selected'] = true;
	$('#container').highcharts(lineData);
	$('#container').highcharts().yAxis[0].setExtremes(0);
});
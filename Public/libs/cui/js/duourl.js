  $(function() {
	  //一键导入多url
  	$('#addtype1').click(function() {
  		$('.item_file').show();
  		$('.sdtj').hide();
  		$('#sjtz').hide();
  	});
  	//手动添加url
  	$('#addtype2').click(function() {
  		$('.item_file').hide();
  		$('.sdtj').show();
  		$('#sjtz').show();
  	});
  	//初始化时间选择
  	$('.time-picker').hunterTimePicker();
//增加一个连接
  	$("#addtzlj").bind("click", function() {

  		$(".sdtj").append($('#sdtjmb').html());
  		$('.time-picker').hunterTimePicker();
  	});

  });

//删除连接
  function deletetzmb(obj) {
  	$(obj).parent().parent('.tzljmb').remove();
  }
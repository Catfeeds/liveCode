function getPayUrl(){
    var params = {};
        params.payObj = "orderPay";
        params.orderId = $("#orderId").val();
        params.payType = $("#payType").val();
    if(params.payType==""){
        $.alertMessager('请先选择支付方式!');return;
    }
    var payType = '';
    if (params.payType == 0) {
        payType = 'Alipays';
    }else {
        payType = 'WeixinPays';
    }
    jQuery.post('index.php?s=/home/'+payType+'/get'+payType+"Url",params,function(data) {
        if(data.status==1){
            if(payType=="weixinpays"){
                location.href = data.url;
            }else{
                window.open(data.url);
            }
        }else{
            $.alertMessager('您的订单已支付!');setTimeout("location.href='/admin.php?s=/admin/index/index';", 2000); 
        }
    });
}
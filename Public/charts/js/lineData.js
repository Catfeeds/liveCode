var lineData = new Object();
$(function () {
    lineData = {
        credits:{
            enabled:false
        },
        title: {
            text: '',
            style: {"font-weight":"bold","font-size":"20px"},
            x: -20 //center
        },
        subtitle: {
            text: '',
            x: -20
        },
        exporting: {
            enabled: false
        },
        yAxis: {
            options:{
                startOnTick:false,
                endOnTick:false
            },
            title: {
                text: ''
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ''
        },
        legend: {
            layout: 'vertical',
            align: 'top',
            verticalAlign: 'top',
            borderWidth: 1,
            margin:30,
            lineHeight:40
        },
        plotOptions: {
            series: {
                showCheckbox: true,
                
            },
            line:{
                events :{
                    checkboxClick: function(event) {
                        if(event.checked==true) {
                            this.show();
                        }
                        else {
                            this.hide();
                        }
                    },
                    legendItemClick:function(event) {//return false 即可禁用LegendIteml，防止通过点击item显示隐藏系列
                        return false;
                    }
                }
            }
        }
    }
});
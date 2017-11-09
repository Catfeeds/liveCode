var columnData = new Object();
$(function () {
    columnData = {
    	credits:{
            enabled:false
        },
        chart: {
            type: 'column'
                    },
        title: {
            text: '',
            style: {"font-weight":"bold","font-size":"20px"},
            margin:50
        },
        subtitle: {
            text: '',
            style: {"color":"#449d44","font-family":"Microsoft YaHei"}
        },
        exporting: {
            enabled: false
        },
        yAxis: {
            min: 0,
            title: {
                text: ''
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.f}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.15,
                borderWidth: 0,
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
            },
            series: {
                showCheckbox: true,
                
            }
        }
    };
    /*设置图表样式*/
    Highcharts.theme = {
    xAxis: {
        gridLineWidth: 0,
        lineColor: '#999',
        tickColor: '#999',
        labels: {
            style: {
                fontFamily:'Microsoft YaHei'
                }
            }
        }
    };
var highchartsOptions = Highcharts.setOptions(Highcharts.theme);
});
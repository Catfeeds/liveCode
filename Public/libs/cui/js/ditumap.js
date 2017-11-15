// 百度地图API功能
var map = new BMap.Map("bdmap");
var point = new BMap.Point(116.331398,39.897445);
map.centerAndZoom(point,14);
map.enableScrollWheelZoom();

map.addControl(new BMap.NavigationControl()); 
//浏览器定位以及初始地图的经纬度和详细地址
var geolocation = new BMap.Geolocation();
var marker;
geolocation.getCurrentPosition(function(r){
	if(this.getStatus() == BMAP_STATUS_SUCCESS){
		marker = new BMap.Marker(r.point);
		map.addOverlay(marker);
		marker.enableDragging();//标注可拖动
		mk(marker);
		map.panTo(r.point);
		//alert('您的位置：'+r.point.lng+','+r.point.lat);
		$("#lng_lat").val(r.point.lng + "," + r.point.lat);
		$("#ditu_jwd").val(r.point.lng + "," + r.point.lat)
		var geoc = new BMap.Geocoder();    //地图的详细地址
		var pt = r.point;
        geoc.getLocation(pt, function(rs){
            //addressComponents对象可以获取到详细的地址信息
            var addComp = rs.addressComponents;
            var site = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
            //将对应的HTML元素设置值
            $("#detail_add").val(site);
        }); 
	}
	else {
		alert('failed'+this.getStatus());
	}        
},{enableHighAccuracy: true})

//点击地图发生的事件
map.addEventListener("click", function(e){ 
	var geoc = new BMap.Geocoder();    //地图的详细地址
	var pt = e.point;
    geoc.getLocation(pt, function(rs){
        //addressComponents对象可以获取到详细的地址信息
        var addComp = rs.addressComponents;
        var site = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
        //将对应的HTML元素设置值
        $("#detail_add").val(site);
        //alert("1"+site)
    });        
	map.removeOverlay(marker);
	var point2 = new BMap.Point(e.point.lng, e.point.lat); 
	marker = new BMap.Marker(point2);        
	map.addOverlay(marker);
	marker.enableDragging();//标注可拖动
	//alert("当前位置1：" + e.point.lng + "," + e.point.lat);  
	$("#lng_lat").val(e.point.lng + "," + e.point.lat);
	
	//拖动标注点发生的事件
	mk(marker);
});

function mk(obj){
	obj.addEventListener("dragend", function(e){   
		$("#lng_lat").val(e.point.lng + "," + e.point.lat);
	 	//alert("当前位置2：" + e.point.lng + "," + e.point.lat);  
	 	var geoc = new BMap.Geocoder();    
	 	var pt = e.point;
        geoc.getLocation(pt, function(rs){
            //addressComponents对象可以获取到详细的地址信息
            var addComp = rs.addressComponents;
            var site = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
            //将对应的HTML元素设置值
            //alert("2"+site)
            $("#detail_add").val(site);
        });   
	})
}

//输入框搜索
var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
	{"input" : "suggestId"
	,"location" : map
});

ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
var str = "";
	var _value = e.fromitem.value;
	var value = "";
	if (e.fromitem.index > -1) {
		value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
	}    
	str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
	
	value = "";
	if (e.toitem.index > -1) {
		_value = e.toitem.value;
		value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
	}    
	str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
});

var myValue;
ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
	myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
	setPlace();
	document.getElementById("detail_add").value = myValue;
});

function setPlace(){
	map.clearOverlays();    //清除地图上所有覆盖物
	map.removeOverlay(marker);
	function myFun(){
		var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
		map.centerAndZoom(pp, 14);
		//map.addOverlay(new BMap.Marker(pp)); //添加标注
		marker = new BMap.Marker(pp);        
		map.addOverlay(marker);
		marker.enableDragging();//标注可拖动
		mk(marker);
		document.getElementById("lng_lat").value = pp.lng + "," + pp.lat;;
	}
	var local = new BMap.LocalSearch(map, { //智能搜索
	  onSearchComplete: myFun
	});
	local.search(myValue);
}

//点击搜索
function theLocation(){
	map.removeOverlay(marker);
    var city = document.getElementById("suggestId").value;
    document.getElementById("detail_add").value = city;
    var localSearch = new BMap.LocalSearch(map);
      localSearch.enableAutoViewport();  
      function searchByStationName() {
        localSearch.setSearchCompleteCallback(function (searchResult) {
          var poi = searchResult.getPoi(0);
          document.getElementById("lng_lat").value = poi.point.lng + "," + poi.point.lat; //获取经度和纬度
          map.centerAndZoom(poi.point, 14);
          //map.addOverlay(new BMap.Marker(poi.point));
          marker = new BMap.Marker(poi.point);        
		  map.addOverlay(marker);
		  marker.enableDragging();//标注可拖动
		  mk(marker);
        });
        localSearch.search(city);
      }
	  searchByStationName();
}


$("#mapmark").click(function(){
	$("#modal-map").show();
})
$(".modal-footer-js").click(function(){
	$(this).parents('#modal-map').hide();
})
$("#tran_submit").click(function(){
	$(this).parents('#modal-map').hide();
	$("#removemark").show();
	$("#mapmark").html('重新标注');
	var lng_lat = $("#lng_lat").val();
	var detail_add = $("#detail_add").val();
	$("#modal-address-input").val(detail_add);
	$("#ditu_jwd").val(lng_lat);
})
$("#removemark").click(function(){
	$(this).hide();
	$("#mapmark").html('标注地址');
	$("#modal-address-input").val('');
	$("#ditu_jwd").val('');
})
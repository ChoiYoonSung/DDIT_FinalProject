<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body style="background: white;">

<div class="panel panel-inverse">
	<div class="panel-heading">
		<div class="panel-title" style="height: 20px;">담당자별 업무현황</div>
	</div>
	<div class="panel-body">
		<div id="apex-bar-chart"></div>
	</div>
</div>

<script type="text/javascript">
window.setTimeout(function(){
	var empNameArr = [];
	var empAvgArr = [];
	var heightPx;
	 $.ajax({
		url: "getMainWorkByManager.do",
		type: "get",
		dataType: "json",
		async:false,
		success: function(data){
			var dataLength = data.length;
			heightPx = dataLength * 40;
			heightPx += "px";
			for(var i in data){
				empNameArr.push(data[i].EMPNAME);
				empAvgArr.push(data[i].EMPAVG);
			}
		},
		error: function (request, status, error){
		
		}
	});
  
  var barChart = new ApexCharts(
    document.querySelector('#apex-bar-chart'), {
      chart: { height: heightPx, type: 'bar', stacked: true, stackType: 'normal', parentHeightOffset: 15},
      plotOptions: {
        bar: { horizontal: true,  dataLabels: { position: 'top' }}  
      },
      dataLabels: { enabled: true, offsetX: -6, style: { fontSize: '12px', colors: [COLOR_WHITE] } },
      colors: [COLOR_ORANGE, COLOR_DARK],
      stroke: { show: true, width: 1, colors: [COLOR_WHITE] },
      series: [
        { name: '진척도', data: empAvgArr }
      ],	
      
      xaxis: {
        categories: empNameArr,
        axisBorder: { show: true, color: COLOR_SILVER_TRANSPARENT_5, height: 1, width: '100%', offsetX: 0, offsetY: -1 },
        axisTicks: { show: true, borderType: 'solid', color: COLOR_SILVER, height: 6, offsetX: 0, offsetY: 0 }
      }
    }
  );
  
  barChart.render();
  

}, 200);


</script>
</body>


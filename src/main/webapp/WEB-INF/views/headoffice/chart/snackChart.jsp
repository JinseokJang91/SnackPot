<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.content {
	/*padding-left: 70px;
	padding-top: 70px;
	margin-left: auto;
	margin-right: auto;
	overflow-y: auto;*/
	
	 height: 100vh;
            padding: 50px 0px;
            margin-left: auto;
            margin-right: auto;
            overflow-y: auto;
}

.chart{

 height: 50vh;

}
</style>

</head>
<body>

	<div class="container-fluid">
		<div class="row flex-nowrap">

			<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />


			<div class="content content col-8">



				<h2>인기 간식 통계</h2>
				<br>
				<div id="bar_chart_div" class="chart col-12"></div>
				<br>
				<table id="snackChart" class="table table-hover" align="center">

					<thead>
						<tr>
							<th>제품명</th>
							<th>출고수량</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${chart}" var="c">
							<tr>
								<td>${ c.snackName }</td>
								<td>${ c.amount }</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>


			</div>



		</div>
	</div>

	<script>
		google.charts.load('current', {
			'packages' : [ 'bar', 'corechart' ]
		});

		function topSnackChart() {
			var data = google.visualization.arrayToDataTable([
					[ 'Test', ${name} ], 
					[ "", ${amount}] 
			]);

			var barChartOption = {
				bars : 'vertical',
				height : '100%',
				width : '100%',
				legend : {
					position : "bottom"
				},
				isStacked : false,
				tooltip : {
					textStyle : {
						fontSize : 12
					},
					showColorCode : false
				},
				animation : { //차트가 뿌려질때 실행될 애니메이션 효과
					startup : true,
					duration : 1000,
					easing : 'linear'
				},
				annotations : {
					textStyle : {
						fontSize : 15,
						bold : true,
						italic : true,
						color : '#0A174E',
						auraColor : '#F5D042',
						opacity : 0.8
					}
				}
			};
			

			var chart = new google.visualization.BarChart(document
					.getElementById('bar_chart_div'));

			chart.draw(data, barChartOption);
			//반응형 그래프 출력 
			//window.addEventListener('resize', function() { chart.draw(data, barChartOption); }, false);
		}

		google.charts.setOnLoadCallback(topSnackChart);
	</script>



</body>
</html>
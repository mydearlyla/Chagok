<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarAsset.jsp" %>

<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.css"/>
</head>

<style>
.row{
	padding: 20px 50px;
}
.btn1 {
    width: 250px;
    background-color: #66bb7a;
    height: 50px;
    font-size: 22px;
    color: #fff;
    margin:20px;
	border: none;
	border-radius: 5px;
}
</style>

<section class="content">
	<div class="row">
		<div class="col-md-6">
				<c:if test="${chkBud.equals('budN') }">
					<div class="box-body" style="text-align: center;">
						<h3>설정된 예산이 없어요!</h3>
						<h3>예산은 효율적이고 계획적인 소비 습관 생성에 도움이 됩니다.</h3>
						<input type="button" id="setbud" class="btn1" value="한 달 예산 세우기"
							onclick="location.href='/asset/budget?mm=0';">	
					</div>
				</c:if>
				
				<c:if test="${chkBud.equals('budY') }">
					<c:set var="dtSum2" value="${map.dtSum2 }" />
					<c:set var="totalBud" value="${map.totalBud }" />
					<c:set var="d" value="${dtSum2 div totalBud }" />
					<c:set var="d2" value="${totalBud - dtSum2 }"/>
					<div class="box-body">
						<div class="col-md-6" style="text-align: center;">
							<section ng-click="pageLink({menu:'report', subMenu:'budget'})">
								<div class="data-section-title">
									<h4>예산 소진율</h4>
								</div>
								<div id="radialprogress"></div>
								
							</section>
						</div>
		
						<div class="col-md-6">
							<p class="text-center">
							<h3>
								이번달 예산의
								<fmt:formatNumber value="${d }" type="percent" /><br>
								를 소진했어요.
							</h3>
							<h4>이번달 예산 :
								<fmt:formatNumber value="${totalBud }" />원
							</h4>
							<h4>
								오늘까지 지출 : <fmt:formatNumber value="${dtSum2 }" />원
							</h4>
							</p>
							<div class="progress-group">
								<span class="progress-text">예산 소진율</span>
								<span class="progress-number">
								<fmt:formatNumber value="${dtSum2 }" /> / <fmt:formatNumber value="${totalBud }" />
								</span>
								<div class="progress">
									<div class="progress-bar progress-bar-green" role="progressbar"
										aria-valuemin="0" aria-valuemax="100"
										style="width:<fmt:formatNumber value="${d }" type="percent"/>">
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>	
		</div>
	
		<c:if test="${userVO.isCheck.equals('N') }">
			<div class="col-md-6">
	<!-- 			<div class="box"> -->
					<div class="box-body" style="text-align: center;">
						<h3>등록된 자산 정보가 없습니다!</h3>
						<h3>${userVO.nick }님의 자산을 간편하게 조회해보세요.</h3>
						<input type="button" id="setbud" class="btn1" value="내 자산 불러오기"
							onclick="location.href='/asset/myAsset';">	
					</div>	
	<!-- 			</div>	 -->
			</div>	
		</c:if>
		
		
		<c:if test="${userVO.isCheck.equals('Y') }">
			<div class="col-md-6">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">내 자산 요약</h3>
					</div>
				</div>
				<div class="info-box bg-green">
					<span style="font-size: 30px; padding-left: 20px;">계좌</span>
					<span style="font-size: 30px; padding-left: 20px;">92,050원</span>
				</div>
		
				<div class="info-box bg-red">
					<span style="font-size: 30px; padding-left: 20px;">카드</span>
					<span style="font-size: 30px; padding-left: 20px;">92,050원</span>
				</div>
		
				<div class="info-box bg-aqua">
					<span style="font-size: 30px; padding-left: 20px;">현금</span>
					<span style="font-size: 30px; padding-left: 20px;">92,050원</span>
				</div>
			</div>
		</c:if>
	</div>
	
	<c:if test="${chkAb.equals('abN') }">
		<div class="row">
			<div class="col-md-12">
				<div class="box-body" style="text-align: center;">
					<h3>등록된 가계부 정보가 없습니다.</h3>
					<h3>차곡이 ${uservo.nick }님의 소비 습관을 분석해드릴게요!</h3>
					<input type="button" 
						class="btn1" value="가계부 쓰기"
						onclick="location.href='/asset/abookList';">			
				</div>
			</div>
		</div>
	</c:if>
	
	<c:if test="${chkAb.equals('abY') }">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">날짜별 리포트 요약</h3>
					</div>
	
					<div class="box-body">
						<div class="col-sm-4 border-right">
							<div class="description-block">
								<h4>이번달 평균 소비금액은</h4>
								<h3><fmt:formatNumber value="${map.dtAvg }"/>원 입니다.</h3>
							</div>
				
						</div>
				
						<div class="col-sm-4 border-right">
							<div class="description-block">
								<h4>이번달 총 소비금액은</h4>
								<h3><fmt:formatNumber value="${map.dtSum }"/>원 입니다.</h3>
							</div>
				
						</div>
				
						<div class="col-sm-4">
							<div class="description-block">
								<h4>이번달 예상 지출금액은</h4>
								<h3><fmt:formatNumber value="${map.expSum }"/>원 입니다.</h3>
							</div>
						</div>
						
					</div>
	
				</div>
			</div>
		</div>
	
	
		<div class="row">
			<div class="col-md-12">
	<!-- 			<div class="box"> -->
						<div class="row">
							<div class="col-md-6">
								<div class="box box-primary">
									<div class="box-header with-border">
										<h3 class="box-title">이번달 최다 지출</h3>
									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="donutchart" style="height: 330px; width: 661px;"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="box box-danger">
									<div class="box-header with-border">
										<h3 class="box-title">이번달 최대 지출</h3>
									</div>
									<div class="box-body">
											<canvas id="barchart" style="height: 330px; width: 661px;"></canvas>
									</div>
								</div>	
							</div>
						</div>		
				</div>
	<!-- 		</div> -->
		</div>
	</c:if>
</section>

<!-- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<!-- jQuery.number -->
<script src="/resources/js/jquery.number.min.js"></script>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<script type="text/javascript">

var jData = ${map.cateCntjson};
var jData2 = ${map.cateSumjson};
var label1 = new Array();
var value1 = new Array();
var label2 = new Array();
var value2 = new Array();
var colorList = new Array();

colorList = [
	'rgba(255, 99, 132, 1)',
	'rgba(54, 162, 235, 1)',
	'rgba(255, 206, 86, 1)',
	'rgba(75, 192, 192, 1)',
	'rgba(153, 102, 255, 1)',
	'rgba(255, 159, 64, 1)'
];

for(var i=0; i<jData.length; i++) {
	var d = jData[i];
	label1.push(d.cateName1);
	value1.push(d.cateCnt);
}

for(var i=0; i<jData2.length; i++) {
	var d = jData2[i];
	label2.push(d.cateName2);
	value2.push(d.cateSum);
}

</script>

<script type="text/javascript">
var datadonut = {
	labels: label1,
	datasets: [{
// 		label: 'Total Population',
		data: value1,
		backgroundColor: colorList,
		borderWidth: 2
	}],
	options: {
		scales: {
			y: {
				beginAtZero: true
			}
		}
	}
};

var databar = {
	labels: label2,
	datasets: [{
		data: value2,
		backgroundColor: colorList,
		borderColor:colorList,
		borderWidth: 2
	}]
};

var optionbar = {
	scales: {
		y: {
			beginAtZero: true
		}
	},
	legend: {
		display: false
	},
	tooltips: { 
		callbacks: { 
			label: function(tooltipItem, data) { //숫자 단위 콤마
				return tooltipItem.xLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원"; 
			} 
		}
	}
}

var ctx = document.getElementById('donutchart').getContext('2d');
var ctx2 = document.getElementById('barchart').getContext('2d');
var donutchart = new Chart(ctx, {
	type: 'doughnut',
	data: datadonut
});
var linechart = new Chart(ctx2, {
	type: 'horizontalBar',
	data: databar,
	options: optionbar
});
$(document).ready(function(){
// 	console.log(label1);
	$('#tbody1').empty();
	$.each (label1, function (i, el) {
		$('#tbody1').append("<tr");
		$('#tbody1').append("<td>"+i+"</td>");
		$('#tbody1').append("<td>"+label1[i]+"</td>");
		$('#tbody1').append("<td>"+$.number(value1[i])+"회</td>");
		$('#tbody1').append("/<tr>");
	});
	
	$('#tbody2').empty();
	$.each (label2, function (i, el) {
		$('#tbody2').append("<tr>");
		$('#tbody2').append("<td>"+i+"</td>");
		$('#tbody2').append("<td>"+label2[i]+"</td>");
		$('#tbody2').append("<td>"+$.number(value2[i])+"원</td>");
		$('#tbody2').append("/<tr>");
	});
	
});

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.4.11/d3.min.js"></script>
<script>
$(document).ready(function(){
	var svg ;

	function drawProgress(end){ 
		d3.select("svg").remove() 
		  if(svg){
		  svg.selectAll("*").remove();
		  
		}
		var wrapper = document.getElementById('radialprogress');
		var start = 0;
		 
		var colours = {
		  fill: '#00A65A',
		  track: '#FFD883',
		  text: '#00A65A',
		  stroke: '#fff',
		}
	
		var radius = 80;
		var border = 12;
		var strokeSpacing = 4;
		var endAngle = Math.PI * 2;
		var formatText = d3.format('.0%');
		var boxSize = radius * 2;
		var count = end;
		var progress = start;
		var step = end < start ? -0.01 : 0.01;
	
		//Define the circle
		var circle = d3.svg.arc()
		  .startAngle(0)
		  .innerRadius(radius)
		  .outerRadius(radius - border);
	
		//setup SVG wrapper
		svg = d3.select(wrapper)
		  .append('svg')
		  .attr('width', boxSize)
		  .attr('height', boxSize);
	
		  
		// ADD Group container
		var g = svg.append('g')
		  .attr('transform', 'translate(' + boxSize / 2 + ',' + boxSize / 2 + ')');
	
		//Setup track
		var track = g.append('g').attr('class', 'radial-progress');
		track.append('path')
		  .attr('fill', colours.track)
		  .attr('stroke', colours.stroke)
		  .attr('stroke-width', strokeSpacing + 'px')
		  .attr('d', circle.endAngle(endAngle));
	
		//Add colour fill
		var value = track.append('path')
		  .attr('fill', colours.fill)
		  .attr('stroke', colours.stroke)
		  .attr('stroke-width', strokeSpacing + 'px');
	
		//Add text value
		var numberText = track.append('text')
		  .attr('fill', colours.text)
		  .attr('text-anchor', 'middle')
		  .attr('dy', '.5rem')
			.attr('font-size', '30px')
	
		  //update position of endAngle
		  value.attr('d', circle.endAngle(endAngle * end));
		  //update text value
		  numberText.text(formatText(end));
	  
	}

	   drawProgress(${d});
});
</script>

<%@ include file="../include/footer.jsp" %>
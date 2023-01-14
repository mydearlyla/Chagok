<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebarAsset.jsp"%>

<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.css"/>
</head>

<style>
.btn1 {
    width: 250px;
    background-color: #66bb7a;
    height: 60px;
    font-size: 30px;
    color: #fff;
    margin:2%;
	border: none;
	border-radius: 5px;
    line-height: normal;
}
.row {
	margin: 3%;
}
.content1 {
    margin-right: auto;
    margin-left: auto;
}
.color {
	color:#66BB7A;
}
table {
  border-collapse: separate;
  border-spacing: 0 5px;
}
td {
  padding-left: 10px;
}
h3 {
	font-size: 22px;
}
</style>

	<c:if test="${chkLogin.equals('loginN') || chkAb.equals('abN') }">
		<div class="row" style="text-align: center;">
			<div class="col-md-12">
				<div class="box-body">
					<h1>등록된 가계부 정보가 없습니다.</h1>
					<h1>차곡이 ${nick }님의 소비 습관을 분석해드릴게요!</h1>
					<input type="button" 
						class="btn1" value="가계부 쓰기"
						onclick="location.href='/asset/abookList';">			
				</div>
			</div>
		</div>
	</c:if>
		
	<c:if test="${chkAb.equals('abY') }">
		<div class="row">
			<section class="content-header" style="text-align: center;">
				<c:set var="today" value="<%=new java.util.Date() %>"/><br><br>
				<h1 style="font-size:33px;">${nick }님의
					<fmt:formatDate value="${today }" pattern="MM"/>월 날짜별 리포트
				</h1>
			</section>
		</div>
		
		<section class="content1">
			<div class="row">
				<div class="col-sm-4 border-right">
					<div class="description-block">
						<h4>이번달 평균 소비금액은</h4>
						<h3><span class="color"><fmt:formatNumber value="${map.dtAvg1 }"/>원</span></h3>
						<c:if test="${map.dtAvg2 != null}">
							<h4>지난달은 <fmt:formatNumber value="${map.dtAvg2 }"/>원</h4>
						</c:if>
					</div>
		
				</div>
		
				<div class="col-sm-4 border-right">
					<div class="description-block">
						<h4>이번달 총 소비금액은</h4>
						<c:set var="a" value="${map.dtSum1 }"/>
						<c:set var="b" value="${map.dtSum2 }"/>
						<c:set var="c" value="${map.dtSumIn }"/><!-- 이번달 총 수입 -->
						<h3><span class="color"><fmt:formatNumber value="${a }"/>원</span></h3>
						<c:if test="${b != null}">
							<h4>지난달은 <fmt:formatNumber value="${b }"/>원</h4>
						</c:if>
					</div>
		
				</div>
		
				<div class="col-sm-4">
					<div class="description-block">
						<h4>이번달 예상 지출금액은</h4>
						<h3><span class="color"><fmt:formatNumber value="${map.expSum }"/>원</span></h3>
					</div>
				</div>
			</div>
		</section>
		
		<section>
			<div class="row" style="text-align: center;">
				<div class="col-md-6">
					<c:set var="d" value="${a div b }"/>
					<c:choose>
					    <c:when test="${d>2 }">
							<h3>허거덩... 이러다 거지가 될지도 모릅니다...</h3>
							<c:if test="${b != null}">
								<h4>지난달보다 <fmt:formatNumber value="${d }" type="percent"/> 많이 쓰고 있습니다.</h4>
							</c:if>
					    </c:when>
					    <c:when test="${0<d && d<=2 }">
							<h3>소비를 줄여보는 건 어떨까요?</h3>
							<h4>지난달보다 <fmt:formatNumber value="${d }" type="percent"/> 많이 쓰고 있습니다.</h4>
					    </c:when>
					    <c:when test="${d==0 }">
					    
							<h3>이대로만 유지해도 좋아요</h3>
							<h4>지난달과 동일하게 쓰고있습니다.</h4>
					    </c:when>
					    <c:otherwise>
							<h3>잘 하고 있어요!</h3>
							<h4>지난달보다 <fmt:formatNumber value="${d }" type="percent"/> 많이 쓰고 있습니다.</h4>
							<h4>지난달보다 <fmt:formatNumber value="${d }" type="percent"/> 적게 쓰고 있습니다.</h4>
					    </c:otherwise>
					</c:choose>
					<c:if test="${dtAvg3 != null}">
						<h4>최근 3개월 간 평균 지출 : <fmt:formatNumber value="${dtAvg3}"/>원</h4>
					</c:if>
				</div>
				<div class="col-md-6">
					<h3>이번달 남은 금액은 <fmt:formatNumber value="${c-a }"/>원 입니다.</h3>
					<h4><fmt:formatDate value="${today }" pattern="MM"/>월 총수입 +<fmt:formatNumber value="${c }"/>원</h4>
					<h4><fmt:formatDate value="${today }" pattern="MM"/>월 총지출 -<fmt:formatNumber value="${a }"/>원</h4>
				</div>
			</div>
		</section>
	
		<section class="content1">
		<div class="row">	
			<div class="col-md-6">
				<div class="box box-warnn">
					<div class="box-header with-border">
						<h3 class="box-title">최다 지출 카테고리 분석</h3>
					</div>
		
					<div class="box-body">
						<table class="table">
							<thead>
								<tr>
									<th>기간</th>
									<th>지출</th>
									<th>수입</th>
								</tr>
							</thead>
							<tbody id="tbody1"></tbody>
						</table>
					</div>
				</div> 
			</div>
			<div class="col-md-6">
				<div class="box box-danger">
					<div class="box-header">
						<h3 class="box-title">한 달 요약</h3>
					</div>
		
					<div class="box-body no-padding">
						<table class="table">
							<thead>
								<tr>
									<th>기간</th>
									<th>지출</th>
									<th>수입</th>
								</tr>
							</thead>
							<tbody id="tbody2"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		</section>

		<section class="content1">
		<div class="row">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">일간 지출 추이</h3>
					</div>
					<div class="box-body">
						<div class="chart">
							<canvas id="linechart1"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">누적 지출 추이</h3>
					</div>
					<div class="box-body">
						<div class="chart">
							<canvas id="linechart2"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12" style="text-align: center; padding:2%">
				<h3>이번달은 ${map.noOut }일 동안 무지출을 실천했어요</h3>
				<h4>이번달 소비 횟수 : ${map.outCnt }회</h4>
			</div>
		</div>
		</section>
		
		
		<section>
		<div class="row">	
			<div class="col-md-6">
				<div id="amptop"></div>
				<div class="box-header">
					<h3 class="box-title">이번달 지출금액 TOP 4</h3>
				</div>
	
				<div class="box-body no-padding">
					<table class="table">
						<tbody id="tbody3"></tbody>
					</table>
				</div>
			</div>
			
			<div class="col-md-6">
				<div id="cnttop"></div>
				<div class="box-header">
					<h3 class="box-title">이번달 지출횟수 TOP 4</h3>
				</div>
	
				<div class="box-body no-padding">
					<table class="table">
						<tbody id="tbody4"></tbody>
					</table>
				</div>
			</div>
		</div>	
		</section>
	</c:if>
	
<!-- jQuery.number -->
<script src="/resources/js/jquery.number.min.js"></script>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<script type="text/javascript">

var outCum = ${map.outCumjson}
var label2 = new Array();
var value2 = new Array();

var day = ${map.dayjson}
var label1 = new Array();
var value1 = new Array();

var week = ${map.weekjson}
var week2 = new Array();
var weekin = new Array();
var weekout = new Array();

var month = ${map.monthjson}
var month2 = new Array();
var monthin = new Array();
var monthout = new Array();

var amptop = ${map.amtTopjson}
var top1 = new Array();
var bottom1 = new Array();
var amt = new Array();
var content = new Array();

var cntTop = ${map.cntTopjson}
var top2 = new Array();
var bottom2 = new Array(); 
var cnt = new Array();

for(var i=0; i<week.length; i++){
	var d = week[i];
	week2.push(d.week2);
	weekin.push(d.weekin);
	weekout.push(d.weekout);
}

for(var i=0; i<month.length; i++){
	var d = month[i];
	month2.push(d.month2);
	monthin.push(d.monthin);
	monthout.push(d.monthout);
}

for(var i=0; i<day.length; i++){
	var d = day[i];
	label1.push(d.date);
	value1.push(d.sum);
}

for(var i=0; i<amptop.length; i++){
	var d = amptop[i];
	top1.push(d.top1);
	bottom1.push(d.bottom1);
	amt.push(d.amt);
	content.push(d.content);
}

for(var i=0; i<cntTop.length; i++){
	var d = cntTop[i];
	top2.push(d.top2);
	bottom2.push(d.bottom2);
	cnt.push(d.cnt);
}

for(var i=0; i<outCum.length; i++) {
	var d = outCum[i];
	label2.push(d.t2date);
	value2.push(d.cumSum);
}
</script>

<script type="text/javascript">
var a = $.number(5000000);
console.log(a);


$(document).ready(function(){
	var arr = ${map.amtTopjson};
	$.each (week2, function (i, el) {
		$('#tbody1').append("<tr>");
		$('#tbody1').append("<td>"+week2[i]+"</td>");
		if(weekout[i]==null){
			$('#tbody1').append("<td>지출 내역 없음</td>");
		} else {
			$('#tbody1').append("<td>"+$.number(weekout[i])+"원</td>");
		}
		if(weekin[i]==null){
			$('#tbody1').append("<td>수입 내역 없음</td>");
		} else {
			$('#tbody1').append("<td>"+$.number(weekin[i])+"원</td>");
		}
		$('#tbody1').append("/<tr>");
	});

	$.each (month2, function (i, el) {
		$('#tbody2').append("<tr>");
		$('#tbody2').append("<td>"+month2[i]+"</td>");
		if(monthout[i]==null){
			$('#tbody2').append("<td>지출 내역 없음</td>");
		} else {
			$('#tbody2').append("<td>"+$.number(monthout[i])+"원</td>");
		}
		if(monthin[i]==null){
			$('#tbody2').append("<td>수입 내역 없음</td>");
		} else {
			$('#tbody2').append("<td>"+$.number(monthin[i])+"원</td>");
		}
		$('#tbody2').append("/<tr>");
	});
	
	$('#amptop').append("<h3>"+content[0]+"에 가장 많은 금액을 지출했어요</h3>");
	$('#amptop').append("<h3>1회 지출액 : "+$.number(amt[0])+"원</h3>");
	$.each (top1, function (i, el) {
		$('#tbody3').append("<tr>");
		$('#tbody3').append("<td>"+(i+1)+"</td>");
		$('#tbody3').append("<td>"+top1[i]+" > "+bottom1[i]+"</td>");
		$('#tbody3').append("<td>"+content[i]+"</td>");
		$('#tbody3').append("<td>"+$.number(amt[i])+"원</td>");
		$('#tbody3').append("/<tr>");
	});

	$('#cnttop').append("<h3>"+bottom2[0]+"을 자주 소비했어요</h3>");
	$('#cnttop').append("<h3>한 달 간 "+cnt[0]+"회 소비</h3>");
	$.each (top2, function (i, el) {
		$('#tbody4').append("<tr>");
		$('#tbody4').append("<td>"+(i+1)+"</td>");
		$('#tbody4').append("<td>"+top2[i]+" > "+bottom2[i]+"</td>");
		$('#tbody4').append("<td>"+cnt[i]+"회</td>");
		$('#tbody4').append("/<tr>");
	});
});

</script>

<script type="text/javascript">
var dataline1 = {
	labels: label1,
	datasets: [{
		data: value1,
	    fill: false,
	    borderColor: '#66BB7A',
	    tension: 0.1
	}]
};

var dataline2 = {
	labels: label2,
	datasets: [{
		data: value2,
	    fill: true,
	    borderColor: '#66BB7A',
	    tension: 0.1
	}]
};

var optionline = {
	legend: {
		display: false
	},
	tooltips: { 
		callbacks: { 
			label: function(tooltipItem, data) { //숫자 단위 콤마
				return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원"; 
			} 
		}
	}
}

var ctx1 = document.getElementById('linechart1').getContext('2d');
var ctx2 = document.getElementById('linechart2').getContext('2d');
var linechart = new Chart(ctx1, {
	type: 'line',
	data: dataline1,
	options: optionline
});
var linechart = new Chart(ctx2, {
	type: 'line',
	data: dataline2,
	options: optionline
});

</script>

<%@ include file="../include/footer.jsp"%>
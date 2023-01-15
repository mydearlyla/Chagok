<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

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
.img-div {
    height: 150px;
    width: 150px;
    object-fit: contain;
    margin: auto;
}
.col-sm-4.a {
	margin:auto;
}

.img1-title {
    text-align:center;
    display:table;
    width:280px;
    height:250px;
}

.img1-div {
    display:table-cell;
    vertical-align:middle;
}

.img1 {
    max-width:180px;
    max-height:180px;
    border-radius: 0px;
}
.col-sm-4 a {
	padding:0;
	margin:0;
}
.rowa {
	padding:0;
}
.users-list>li img {
    border-radius: 0px;
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
					<fmt:formatDate value="${today }" pattern="MM"/>월 카테고리별 리포트
				</h1>
			</section>
		</div>
		
		<section class="content1">
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
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">최다 지출 카테고리 분석</h3>
						</div>
						<div class="box-body">
							<table class="table">
								<thead>
									<tr>
										<th>순위</th>
										<th>상위카테고리</th>
										<th>지출횟수</th>
									</tr>
								</thead>
								<tbody id="tbody1"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<section class="content1">	
			<div class="row">		
				<div class="col-md-6">
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">이번달 최대 지출</h3>
						</div>
						<div class="box-body">
							<div class="chart">
								<canvas id="barchart" style="height: 330px; width: 661px;"></canvas>
							</div>
						</div>
					</div>
				</div>
			
				<div class="col-md-6">		
					<div class="box box-success">
						<div class="box-header with-border">
							<h3 class="box-title">최대 지출 카테고리 분석</h3>
						</div>
						<div class="box-body">
							<table class="table">
								<thead>
									<tr>
										<th>순위</th>
										<th>상위카테고리</th>
										<th>지출금액</th>
									</tr>
								</thead>
								<tbody id="tbody2"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>

		<c:if test="${not empty map.chRandList }">		
		<section class="content1">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">${nick }님, 함께 절약하는 습관을 길러요</h3>
						</div>
			
						<div class="box-body no-padding">
							<ul class="users-list clearfix">
							<c:forEach var="ch" items="${map.chRandList }">
								<li>
									<div class="img1-title">
										<div class="img1-div">
											<a href="/challenge/detail?cno=${ch.cno }">
											<c:if test="${ch.c_thumbFile != null}">
												<img src="${pageContext.request.contextPath }/resources${ch.c_thumbFile }"
													class="img1">
											</c:if>
											<c:if test="${ch.c_thumbFile == null}">
												<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"
													class="img1"> 
											</c:if>
											</a>
										</div>
									</div>
									<div class="box-footer">
										<h4>
											<a href="/challenge/detail?cno=${ch.cno }">${ch.c_title }</a>
										</h4>
										<div class="rowa">
											<div class="col-sm-4">
												<span class="description-text">진행기간</span><br>
												<span class="description-text">${ch.c_period }</span>
											</div>
					
											<div class="col-sm-4">
												<span class="description-header">시작일</span><br>
												<span class="description-text">${ch.c_start }</span>
											</div>
					
											<div class="col-sm-4">
												<span class="description-header">모집인원</span><br>
												<span class="description-text">${ch.c_pcnt }명</span>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
							</ul>
			
						</div>
			
						<div class="box-footer text-center">
							<a href="/commumain" style="font-size: 18px;">챌린지 더보기</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		</c:if>

		<c:if test="${not empty map.cardRandList }">
		<section class="content1">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-warning">
						<div class="box-header with-border">
							<h3 class="box-title">${nick }님, 이런 카드는 어떠세요?</h3>
						</div>
						
						<div class="box-body no-padding">
							<ul class="users-list clearfix">
							<c:forEach var="card" items="${map.cardRandList }">
								<li>
									<div class="img1-title">
										<div class="img1-div">
											<c:if test="${card.prop_img != null}">
												<img src="${pageContext.request.contextPath }/resources${card.prop_img }"
													class="img1" style="boarder-radius: 0%">
											</c:if>
											<c:if test="${card.prop_img == null}">
												<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"
													class="img1"> 
											</c:if>
										</div>
									</div>
									<div class="box-footer">
										<h5 class="description-header">${card.prop_name }</h5>
										<h5 class="description-header">${card.prop_info }</h5>
										<div class="row">
											<c:forEach var="cardInfo" items="${card.prop_content }">
												<div class="col-sm-4 border-right">
													<div class="description-block">
														<span class="description-text">${cardInfo }</span>
													</div>
												</div>
											</c:forEach>		
										</div>
									</div>
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		</c:if>
	</c:if>

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
	'rgba(255, 159, 64, 1)',
	'rgba(229, 103, 254, 1)',
	'rgba(103, 186, 254, 1)'
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

<%@ include file="../include/footer.jsp"%>
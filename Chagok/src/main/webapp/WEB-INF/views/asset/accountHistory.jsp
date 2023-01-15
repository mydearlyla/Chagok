<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/bkcss/bkcss1.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/bkcss/bkcss2.css">

</head>

<body>
		
	<c:if test="${accountHistoryList != null }">
		
		<div class="container__tXwE">
			<ul class="cards_2AMVH">
				
				<c:set var="index" value="${1 }"/>
				<c:forEach var="accountHistoryVO" items="${accountHistoryList }">
				
				<li>
					<div class="wrap_2lqJo" style="height: 150px">
						<div class="rank_JrkfK">${index }</div>
						<h4 class="title_3gORD">
							<strong> 
								<fmt:parseDate value="${accountHistoryVO.tran_date }" var="dateValue" pattern="yyyyMMdd"/>
								<fmt:formatDate value="${dateValue }" pattern="yyyy년 MM월 dd일"/>
							</strong>
						</h4>
						<section class="details_32db_">
							<img src="https://cdn-icons-png.flaticon.com/512/5875/5875025.png"
								class="landscapeImage_2tyu8 image_q-O13">
							<div class="desc_36Dy-">
								<h4 style="font-size: 2.5em; letter-spacing: 2px; margin: 10px 0 0 0">${accountHistoryVO.branch_name} </h4>
								<h4 style="font-size: 1.5em; letter-spacing: 2px; margin: 15px 0 0 5px">
									<fmt:parseDate value="${accountHistoryVO.tran_time}" var="timeValue" pattern="HHmmss"/>
									<fmt:formatDate value="${timeValue }" pattern="HH : mm"/>
									
								</h4>
							</div>
							<div class="buttons_2Q2OW" style="margin-top: -30px">
								<a class="detail_2z1En">
									<c:if test="${accountHistoryVO.inout_type.equals('입금') }">
										+
									</c:if>
									<c:if test="${accountHistoryVO.inout_type.equals('출금') }">
										-
									</c:if>
									<fmt:formatNumber value="${accountHistoryVO.tran_amt}"/> 원
								</a>
								<button class="issue_3gKkv">잔액 : <fmt:formatNumber value="${accountHistoryVO.after_balance_amt}"/> 원</button>
							</div>	
						</section>
					</div>
				</li>
				<c:set var="index" value="${index + 1 }"/>
				</c:forEach>
				
			</ul>
		</div>
	</c:if>
	
	<c:if test="${empty accountHistoryList}">
		<div class="desc_36Dy-" style="text-align: center; margin: 240px 0 0 0; width:100%;">
			<h4 style="font-size: 2.5em; letter-spacing: 2px;">
				거래 내역이 없습니다.
			</h4>
		</div>
	</c:if>
		
		
</body>
</html>
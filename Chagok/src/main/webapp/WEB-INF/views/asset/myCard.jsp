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


<!-- 로딩 코드 start -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#waiting {
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    position: fixed;
    display: flex;
    background: white;
    z-index: 999;
    opacity: 0.9;
}
#waiting > img {
    display: flex;
    width: fit-content;
    height: fit-content;
    margin: auto;
}
</style>
<div id="waiting">
   <img src="../resources/imgUpload/new-loading.gif">
</div>

<script type="text/javascript">
    $(window).on('load', function() {
        setTimeout(function(){
            $("#waiting").fadeOut();
        }, 300);
    });
</script>
<!-- 로딩 코드 end -->



<body>

	<h1> 코 드 임 시 보 관 함 ! ! ! ! !!  !! !</h1>


	<!-- 
	<div class="wrap_1y4z9">
		<div class="container__tXwE right_2TA44">
			<div class="sort_16prT">
				<div class="container_3Jw5o boldText_o4ss5">
					<input id="82a34e79-f7c2-48f2-b0c8-8eac6528b3e5" type="checkbox"
						class="input_1Rc57">
					<div class="clickAbleLayer_3AJtV"></div>
					<label for="82a34e79-f7c2-48f2-b0c8-8eac6528b3e5"
						class="title_2t2z9" data-test="dropdown-label">신용카드<span
						class="arrow_16bdk"></span></label>
					<ul class="list_1IQps">
						<li class="item_3nRpz"><button
								class="defaultButton_2p1Dh button_ecG6a" data-test="drop-down0">신용/체크
								전체</button></li>
						<li class="item_3nRpz"><button
								class="selectedButton_3sCf9 button_ecG6a boldText_o4ss5"
								data-test="drop-down1">신용카드</button></li>
						<li class="item_3nRpz"><button
								class="defaultButton_2p1Dh button_ecG6a" data-test="drop-down2">체크카드</button></li>
					</ul>
				</div>
			</div>
		</div> 
		-->
		
		<div class="container__tXwE">
			<ul class="cards_2AMVH">
				
				<c:set var="index" value="${1 }"/>
				<c:forEach var="accountHistoryVO" items="${accountHistoryList }">
				<li>
					<div class="wrap_2lqJo">
						<div class="rank_JrkfK">${index }</div>
						<span class="type_PbbRn">신용</span>
						<h4 class="title_3gORD">
							<strong>${accountHistoryVO.branch_name}</strong>삼성카드 taptap O
						</h4>
						<section class="details_32db_">
							<img src="https://cdn.banksalad.com/cards/samsung_2928.png"
								class="landscapeImage_2tyu8 image_q-O13">
							<div class="desc_36Dy-">${accountHistoryVO.tran_amt }</div>
							<div class="buttons_2Q2OW">
								<a class="detail_2z1En" href="/cards/2928">상세보기</a>
								<button class="issue_3gKkv">카드신청</button>
							</div>	
						</section>
					</div>
				</li>
				<c:set var="index" value="${index + 1 }"/>
				</c:forEach>
				
			</ul>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head class="">
<title>차곡</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes,viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="스마트한 자산관리 솔루션, 회사의 자산관리가 쉬워진다.">
<meta name="keywords" content="SAMQ,샘큐,노버스,노버스메이,자산관리">
<meta name="author" content="Novusmay">
<meta property="og:title"
	content="SAMQ - 스마트한 자산관리 솔루션, 회사의 자산관리가 쉬워진다.">
<meta property="og:description" content="스마트한 자산관리 솔루션, 회사의 자산관리가 쉬워진다.">
<meta property="og:site_name" content="SAMQ">
<meta property="og:url" content="https://www.novusmay.com/samq/">
<meta property="og:image" content="https://i.imgur.com/syK7Oa0.jpg">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.png">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/vendor/slick.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/vendor/slick-theme.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/reset.css">
<link rel="stylesheet" type="text/css" href="$../resources/mainpagecss/css/font.css">
<link rel="stylesheet" type="text/css" href="$../resources/mainpagecss/css/style.css">
<link rel="stylesheet" type="text/css" href="../resources/mainpagecss/css/font.css">
<link rel="stylesheet" type="text/css" href="../resources/mainpagecss/css/style.css">

<!-- 제이쿼리 Datepicker-->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
	integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />


<style id="__web-inspector-hide-shortcut-style__">
.__web-inspector-hide-shortcut__, .__web-inspector-hide-shortcut__ *,
	.__web-inspector-hidebefore-shortcut__::before,
	.__web-inspector-hideafter-shortcut__::after {
	visibility: hidden !important;
}
/* .p{ */
/*     font-family: 'GmarketSans'; */
/*     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff'); */
/*     font-weight: normal; */
/*     font-style: normal; */
/*     margin: 0 0 0 0px; */
/* } */

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


<style type="text/css">
.custom_inner {
	display: flex;
    height: 75px;
    background: rgba(255, 255, 255,1);
    padding: 0 100px 0 100px;
    align-items: center;
    border-bottom: 1px solid #bfb7b773;
    flex-direction: row;
    justify-content: space-between;
    box-shadow: 0 0 3px 0 rgb(156, 170, 171,70%);
/* 	position: fixed;  */
    z-index: 99999;
    width: 100%;
    top: 0px;
    transition-property : height;
    transition-duration : 1s;  
}

.custom_inner .logo {
	display: flex;
	align-items: center;
}


.custom_inner #a {
	width: 170px;
    font-size: 60px;
    padding-left: 30px;
    letter-spacing: 10px;
    opacity: 0.95;
}
.custom_inner .logo img {
	width: 140px;
     height: 60px; 
    opacity: 0.95;
}
.custom_inner #a:hover,
.custom_inner .logo img:hover{
    opacity: 1;
}

.custom_inner .category {
    display: flex;
/*     width: 1192px; */
    flex-direction: row;
    justify-content: center;
	margin: 0px;
}
.custom_inner .category div{
	width: 86px;
    height: auto;
    text-align: center;
    margin: 0 10px 0 10px; 
    font-size: 22px;

}
.custom_inner .category p {
/*     padding-bottom: 5px; */
    border-bottom: 2px solid rgba(255, 219, 131 / 0%);
    padding-top: 5px;
    
}
.custom_inner .category p:hover{
border-bottom: 2px solid rgba(255, 219, 131 / 80%);
transition : border-bottom 0.5s;
transition : color 0.3s;
color : rgba(255, 219, 131 / 80%);
}
.custom_inner .user_menu {
    display: flex;
    flex-direction: row;
    justify-content: flex-end;
    width: 240px;
}

.custom_inner .user_menu div {
	width: 70px;
    height: auto;
    text-align: center;
    margin-left: 10px;
    }
.custom_inner .user_menu .login,
.custom_inner .user_menu .join{
border: 3px solid rgb(255 191 131 / 40%);
    border-radius: 9px;
    width: 87px;  
    height: auto;
    text-align: center;
    font-size: 17px;
    padding: 5px;
    margin-right: 5px;
    }
.custom_inner .user_menu .login:hover,
.custom_inner .user_menu .join:hover{
 border: 3px solid rgb(255 191 131 / 80%);
 background: rgb(176 224 229 / 5%);
 }   
</style>
</head>

<body>
	<div class="custom_inner">
		<div class="logo">
<!-- 			<img id="logo" src="../resources/dist/img/credit/chagoklogo.png" -->
			<a href="/main"><img id="logo" src="../resources/dist/img/credit/pre-logo4.png" class="logo_img" ></a>
<!-- 			<p id="a">차곡</p> -->
		</div>
		<div class="category">
			<div id="header-center" class="challange">
				<a href="/commumain"><p style="font-family: 'GmarketSans'">챌린지</p></a>
			</div>
			<div class="community">
				<a href="/commumain"><p style="font-family: 'GmarketSans'">커뮤니티</p></a>
			</div>
			<div class="management">
				<a href="/assetmain"><p style="font-family: 'GmarketSans'">자산관리</p></a>
			</div>
			<div class="notice">
				<p style="font-family: 'GmarketSans'">공지사항</p>
			</div>
		</div>
		<div class="user_menu">
		<c:if test="${nick == '' || nick == null}">
			<div class="login"><a href="/login"><p style="font-family: 'GmarketSans'">로그인</p></a></div>
			<div class="join"><a href="/register"><p style="font-family: 'GmarketSans'">회원가입</p></a></div>
		</c:if>
		<c:if test="${nick != '' || nick != null}">
			<div class="login"><a href="#"><p style="font-family: 'GmarketSans'">${nick }님 환영합니다.</p></a></div>
		</c:if>
		</div>
	</div>
</body>

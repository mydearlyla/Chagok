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

<link rel="stylesheet" type="text/css" href="../resources/mainpagecss/css/font.css">
<link rel="stylesheet" type="text/css" href="../resources/mainpagecss/css/style.css">

<!-- jQuery -->
   <script src="../resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- jQgrid -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/ui-lightness/jquery-ui.css">
<link rel="stylesheet" type="text/css" media="screen" href="../resources/plugins/jQueryUI/jquery-ui.css" />
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../resources/plugins/jqGrid_4.4.3/css/ui.jqgrid.css" />

<script type="text/javascript" src="../resources/plugins/jqGrid_4.4.3/js/jquery-1.7.2.min.js"></script>
<!--<script type="text/javascript" src="./jqGrid_4.4.3/js/jquery.jqGrid.src.js" ></script> -->
<script type="text/javascript" src="../resources/plugins/jqGrid_4.4.3/js/i18n/grid.locale-kr.js" ></script>
<script type="text/javascript" src="../resources/plugins/jqGrid_4.4.3/js/jquery.jqGrid.min.js" ></script>
<!-- jQuery -->

<!-- <link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript" src="../resources/plugins/datepicker/jquery.datetimepicker.min.js"></script>
<script type="text/javascript" src="../resources/plugins/datepicker/jquery.datetimepicker.full.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../resources/plugins/datepicker/datepicker3.css" />
<!-- <script type="text/javascript" src="../resources/plugins/datepicker/ko.js"></script> -->
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>          flatpicker ko -->
<!-- <link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script> -->
<!-- <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->

<!-- date+time picker -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/confetti.css">
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>    <!-- flatpicker min js -->
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>          <!-- flatpicker ko -->


<!-- 결제 : iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

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
<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->




<style type="text/css">
.custom_inner {
	display: flex;
    height: 75px;
    background: rgba(255, 255, 255,1);
    padding: 0 0 0 100px;
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
    margin-left: 120px;
}

.custom_inner .user_menu div {
/* 	width: 70px; */
    height: auto;
    text-align: center;
    }
.custom_inner .user_menu .login,
.custom_inner .user_menu .join{
/* border: 3px solid rgb(255 191 131 / 40%); */
/*     border-radius: 9px; */
/*     width: 180px;   */
    height: auto;
    text-align: right;
    font-size: 14px;
    padding: 5px;
    margin-right: 5px;
    }
.custom_inner .user_menu .login:hover,
.custom_inner .user_menu .join:hover{
/*  border: 3px solid rgb(255 191 131 / 80%); */
 background: rgb(176 224 229 / 5%);
 }   
</style>

<script type="text/javascript">
	$(document).ready(function(){
		var link = window.location.href;
		var currentURL = link.substring(22);
// 		alert(currentURL);
		
		$('#loginURL').click(function(){
			$(this).attr('href', "/login?pageInfo="+currentURL)
		});
	});
</script>

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
				<a href="/notice"><p style="font-family: 'GmarketSans'">공지사항</p></a>
			</div>
		</div>
		<div class="user_menu">
		<c:if test="${nick == null}">
			<a href="/login" id="loginURL"><div class="login"><p style="font-family: 'GmarketSans'">로그인</p></div></a>
			<a href="/register"><div class="join"><p style="font-family: 'GmarketSans'">회원가입</p></div></a>
		</c:if>
		<c:if test="${nick != null}">
			<a href="/myPage"><div class="login"><p style="font-family: 'GmarketSans'"><small>마이페이지</small></p></div></a>
			<a href="/logout"><div class="join"><p style="font-family: 'GmarketSans'">로그아웃</p></div></a>
		</c:if>
		</div>
		<br><br><br><br><br><br>
	</div>
	
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "3bbf6452-0c82-4794-a001-469c5be43946"
  });
</script>
<!-- End Channel Plugin -->
</body>

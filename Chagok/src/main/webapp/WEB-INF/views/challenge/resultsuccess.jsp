<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="../include/header.jsp"%> --%>
<%-- <%@ include file="../include/sidebar.jsp"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.1/TweenLite.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.1/TimelineMax.min.js"></script>



<link href='https://fonts.googleapis.com/css?family=Raleway:600,400' rel='stylesheet' type='text/css'>

<script type="text/javascript">
	function qsa(el) {
		return document.querySelectorAll(el);
	}

	// Restart animation button
	function restart() {
		tl.restart();
	}

	var tl = new TimelineMax({
		repeat : 0
	});

	// Elements to animate
	var receipt = qsa('.receipt');
	var greetingBorder = qsa('.header__border');
	var greetingName = qsa('.header__name');
	var greetingCount = qsa('.header__count');
	var cart = qsa('.cart');
	var barCode = qsa('.bar-code');
	var cartHeader = qsa('.cart__header');
	var listItems = qsa('.list__item');
	var cartBorder = qsa('.cart__hr');
	var total = qsa('.cart__total');

	// Animation timeline
	tl.fromTo(receipt, .5, {
		scale : 0,
		alpha : 0,
		transformOrigin : "50% 20%"
	}, {
		scale : 1,
		alpha : 1,
	}).from(greetingBorder, .5, {
		x : 15,
		autoAlpha : 0
	}).from(greetingName, .5, {
		y : 15,
		autoAlpha : 0
	}, '-=0.5').from(greetingCount, .3, {
		y : 15,
		autoAlpha : 0
	}, '-=0.2').addLabel('header').fromTo(cart, .3, {
		rotationX : "-90deg",
		transformPerspective : 500,
		force3D : true,
		transformOrigin : "top center",
		transformStyle : "preserve-3d"
	}, {
		transformPerspective : 500,
		rotationX : '0deg'
	}).fromTo(barCode, .3, {
		rotationX : "-90deg",
		transformPerspective : 500,
		force3D : true,
		transformOrigin : "top center",
		transformStyle : "preserve-3d"
	}, {
		transformPerspective : 500,
		rotationX : '0deg'
	}).to(receipt, .5, {
		css : {
			className : '+=receipt_hoverable'
		}
	}).from(cartHeader, .5, {
		y : 10,
		autoAlpha : 0
	}, '-=0.4').staggerFrom(listItems, .5, {
		x : -10,
		autoAlpha : 0,
		ease : Power2.easeOut
	}, 0.3).from(cartBorder, .5, {
		y : 25,
		autoAlpha : 0
	}, '-=0.3').from(total, .5, {
		y : 50,
		autoAlpha : 0
	}, '-=.4');
</script>

<div class="receipt">

	<div class="header__top">
		<div class="header__logo">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25.58 30.18">
				<defs>
				<style>
.a {
	fill: #253b80;
}

.b {
	fill: #179bd7;
}

.c {
	fill: #222d65;
}
</style></defs>
				<title>PayPal</title>
				<path class="a"
					d="M7.27,29.15l0.52-3.32-1.16,0H1.06L4.93,1.29A0.32,0.32,0,0,1,5,1.1,0.32,0.32,0,0,1,5.24,1h9.38C17.73,1,19.88,1.67,21,3a4.39,4.39,0,0,1,1,1.92,6.92,6.92,0,0,1,0,2.64V8.27l0.53,0.3a3.69,3.69,0,0,1,1.07.81,3.78,3.78,0,0,1,.86,1.94,8.2,8.2,0,0,1-.12,2.81,9.9,9.9,0,0,1-1.15,3.18,6.55,6.55,0,0,1-1.83,2,7.4,7.4,0,0,1-2.46,1.11,12.26,12.26,0,0,1-3.07.35H15.12a2.2,2.2,0,0,0-2.17,1.85l-0.06.3L12,28.78l0,0.22a0.18,0.18,0,0,1-.06.13,0.15,0.15,0,0,1-.1,0H7.27Z" />
				<path class="b"
					d="M23,7.67h0q0,0.27-.1.55c-1.24,6.35-5.47,8.55-10.87,8.55H9.33A1.34,1.34,0,0,0,8,17.89H8L6.6,26.83,6.2,29.36a0.7,0.7,0,0,0,.7.81h4.88a1.17,1.17,0,0,0,1.16-1l0-.25,0.92-5.83L14,22.79a1.17,1.17,0,0,1,1.16-1h0.73c4.73,0,8.43-1.92,9.51-7.48,0.45-2.32.22-4.26-1-5.62A4.67,4.67,0,0,0,23,7.67Z" />
				<path class="c"
					d="M21.75,7.15L21.17,7l-0.62-.12a15.28,15.28,0,0,0-2.43-.18H10.77a1.17,1.17,0,0,0-1.16,1L8,17.6l0,0.29a1.34,1.34,0,0,1,1.32-1.13h2.75c5.4,0,9.64-2.19,10.87-8.55C23,8,23,7.85,23,7.67a6.59,6.59,0,0,0-1-.43Z" />
				<path class="a"
					d="M9.61,7.7a1.17,1.17,0,0,1,1.16-1h7.35a15.28,15.28,0,0,1,2.43.18L21.17,7l0.58,0.15L22,7.24a6.69,6.69,0,0,1,1,.43c0.37-2.35,0-3.94-1.27-5.39S17.85,0,14.62,0H5.24A1.34,1.34,0,0,0,3.92,1.13L0,25.9a0.81,0.81,0,0,0,.8.93H6.6L8,17.6Z" /></svg>
		</div>
		<div class="header__meta">
			<span class="header__date">25.04.2016</span> <span
				class="header__serial">0f-113</span> <span class="header__number">25042016</span>
		</div>
	</div>
	<div class="header__greeting">
		<span class="header__name">Hi, Carlin</span> <span
			class="header__count">You've purchased three (3) items in our
			store.</span> <span class="header__border"></span>
	</div>
	<div class="header__spacing"></div>

	<section class="cart">
		<h2 class="cart__header">Cart:</h2>
		<ol class="list">
			<li class="list__item"><span class="list__name">Lacoste
					t-shirt</span> <span class="list__price">$48.00</span></li>
			<li class="list__item"><span class="list__name">Nike
					sweatpants</span> <span class="list__price">$125.00</span></li>
			<li class="list__item"><span class="list__name">Converse
					All-Stars</span> <span class="list__price">$95.00</span></li>
		</ol>
		<hr class="cart__hr" />
		<footer class="cart__total">
			<h3 class="cart__total-label">Total</h3>
			<span class="cart__total-price">$268.00</span>
		</footer>
	</section>

	<div class="bar-code__code">
		<svg id="d17ac603-1444-403c-9daf-1afe6b3ad839" data-name="Layer 1"
			xmlns="http://www.w3.org/2000/svg" viewBox="0 0 575.2 93.16">
			<defs>
			<style>
.\33 6de76d2-eb0f-431d-be12-6535d9fc4369,
	.\38 78966b7-abd4-4ef3-86d3-2321f80177f3,
	.b8e87e45-e06c-4d7b-92d7-30eed261c8dd,
	.e435b0ed-5ad4-4699-bad7-b1c15cfe3f86 {
	fill: none;
	stroke: #000;
	stroke-miterlimit: 10;
}

.\38 78966b7-abd4-4ef3-86d3-2321f80177f3 {
	stroke-width: 1.7px;
}

.e435b0ed-5ad4-4699-bad7-b1c15cfe3f86 {
	stroke-width: 3.7px;
}

.\33 6de76d2-eb0f-431d-be12-6535d9fc4369 {
	stroke-width: 7.7px;
}

.b8e87e45-e06c-4d7b-92d7-30eed261c8dd {
	stroke-width: 5.7px;
}
</style></defs>
			<title>Example_barcode</title><path
				class="878966b7-abd4-4ef3-86d3-2321f80177f3"
				d="M0.85,93.16V0m4,93.16V0m6,93.16V0" />
			<line class="e435b0ed-5ad4-4699-bad7-b1c15cfe3f86" x1="17.85"
				y1="93.16" x2="17.85" />
			<line class="36de76d2-eb0f-431d-be12-6535d9fc4369" x1="25.85"
				y1="93.16" x2="25.85" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="32.85"
				y1="93.16" x2="32.85" />
			<line class="b8e87e45-e06c-4d7b-92d7-30eed261c8dd" x1="40.85"
				y1="93.16" x2="40.85" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="46.85"
				y1="93.16" x2="46.85" />
			<line class="e435b0ed-5ad4-4699-bad7-b1c15cfe3f86" x1="51.85"
				y1="93.16" x2="51.85" />
			<path class="878966b7-abd4-4ef3-86d3-2321f80177f3"
				d="M60.85,93.16V0m10,93.16V0m4,93.16V0m6,93.16V0m8,93.16V0m4,93.16V0m4,93.16V0m4,93.16V0m6,93.16V0" />
			<line class="b8e87e45-e06c-4d7b-92d7-30eed261c8dd" x1="116.85"
				y1="93.16" x2="116.85" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="122.85"
				y1="93.16" x2="122.85" />
			<line class="b8e87e45-e06c-4d7b-92d7-30eed261c8dd" x1="130.85"
				y1="93.16" x2="130.85" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="138.85"
				y1="93.16" x2="138.85" />
			<path class="e435b0ed-5ad4-4699-bad7-b1c15cfe3f86"
				d="M143.85,93.16V0m8,93.16V0m6,93.16V0m6,93.16V0" />
			<path class="878966b7-abd4-4ef3-86d3-2321f80177f3"
				d="M170.85,93.16V0m6,93.16V0m8,93.16V0m4,93.16V0" />
			<path class="878966b7-abd4-4ef3-86d3-2321f80177f3"
				d="M193.85,93.16V0m4,93.16V0m6,93.16V0" />
			<line class="e435b0ed-5ad4-4699-bad7-b1c15cfe3f86" x1="210.85"
				y1="93.16" x2="210.85" />
			<line class="36de76d2-eb0f-431d-be12-6535d9fc4369" x1="218.85"
				y1="93.16" x2="218.85" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="225.85"
				y1="93.16" x2="225.85" />
			<line class="b8e87e45-e06c-4d7b-92d7-30eed261c8dd" x1="233.85"
				y1="93.16" x2="233.85" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="239.85"
				y1="93.16" x2="239.85" />
			<line class="e435b0ed-5ad4-4699-bad7-b1c15cfe3f86" x1="244.85"
				y1="93.16" x2="244.85" />
			<path class="878966b7-abd4-4ef3-86d3-2321f80177f3"
				d="M253.85,93.16V0m10,93.16V0m4,93.16V0m6,93.16V0m8,93.16V0m4,93.16V0m4,93.16V0m4,93.16V0m6,93.16V0" />
			<line class="b8e87e45-e06c-4d7b-92d7-30eed261c8dd" x1="309.85"
				y1="93.16" x2="309.85" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="315.85"
				y1="93.16" x2="315.85" />
			<line class="b8e87e45-e06c-4d7b-92d7-30eed261c8dd" x1="323.85"
				y1="93.16" x2="323.85" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="331.85"
				y1="93.16" x2="331.85" />
			<path class="e435b0ed-5ad4-4699-bad7-b1c15cfe3f86"
				d="M336.85,93.16V0m8,93.16V0m6,93.16V0m6,93.16V0" />
			<path class="878966b7-abd4-4ef3-86d3-2321f80177f3"
				d="M363.85,93.16V0m6,93.16V0m8,93.16V0m4,93.16V0" />
			<path class="878966b7-abd4-4ef3-86d3-2321f80177f3"
				d="M386.35,93.16V0m4,93.16V0m6,93.16V0" />
			<line class="e435b0ed-5ad4-4699-bad7-b1c15cfe3f86" x1="403.35"
				y1="93.16" x2="403.35" />
			<line class="36de76d2-eb0f-431d-be12-6535d9fc4369" x1="411.35"
				y1="93.16" x2="411.35" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="418.35"
				y1="93.16" x2="418.35" />
			<line class="b8e87e45-e06c-4d7b-92d7-30eed261c8dd" x1="426.35"
				y1="93.16" x2="426.35" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="432.35"
				y1="93.16" x2="432.35" />
			<line class="e435b0ed-5ad4-4699-bad7-b1c15cfe3f86" x1="437.35"
				y1="93.16" x2="437.35" />
			<path class="878966b7-abd4-4ef3-86d3-2321f80177f3"
				d="M446.35,93.16V0m10,93.16V0m4,93.16V0m6,93.16V0m8,93.16V0m4,93.16V0m4,93.16V0m4,93.16V0m6,93.16V0" />
			<line class="b8e87e45-e06c-4d7b-92d7-30eed261c8dd" x1="502.35"
				y1="93.16" x2="502.35" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="508.35"
				y1="93.16" x2="508.35" />
			<line class="b8e87e45-e06c-4d7b-92d7-30eed261c8dd" x1="516.35"
				y1="93.16" x2="516.35" />
			<line class="878966b7-abd4-4ef3-86d3-2321f80177f3" x1="524.35"
				y1="93.16" x2="524.35" />
			<path class="e435b0ed-5ad4-4699-bad7-b1c15cfe3f86"
				d="M529.35,93.16V0m8,93.16V0m6,93.16V0m6,93.16V0" />
			<path class="878966b7-abd4-4ef3-86d3-2321f80177f3"
				d="M556.35,93.16V0m6,93.16V0m8,93.16V0m4,93.16V0" /></svg>
	</div>

</div>

<a href="https://dribbble.com/shots/2738907-PayPal-Email-Receipt"
	target="_blank" class="link">Built from reference: Vladyslav
	Tyzun's Dribbble shot, completed for Awesomed</a>

<button class="button" type="button" onclick="restart()">Replay</button>
























<!-- <div class="receipt"> -->

<!-- 	<header class="receipt.header"> -->
<!-- 		<div class="receipt.header__top"> -->
<!-- 			<div class="receipt.header__logo"> -->
<!-- 				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25.58 30.18"> -->
<!-- 					<title>PayPal</title><path class="a" -->
<!-- 						d="M7.27,29.15l0.52-3.32-1.16,0H1.06L4.93,1.29A0.32,0.32,0,0,1,5,1.1,0.32,0.32,0,0,1,5.24,1h9.38C17.73,1,19.88,1.67,21,3a4.39,4.39,0,0,1,1,1.92,6.92,6.92,0,0,1,0,2.64V8.27l0.53,0.3a3.69,3.69,0,0,1,1.07.81,3.78,3.78,0,0,1,.86,1.94,8.2,8.2,0,0,1-.12,2.81,9.9,9.9,0,0,1-1.15,3.18,6.55,6.55,0,0,1-1.83,2,7.4,7.4,0,0,1-2.46,1.11,12.26,12.26,0,0,1-3.07.35H15.12a2.2,2.2,0,0,0-2.17,1.85l-0.06.3L12,28.78l0,0.22a0.18,0.18,0,0,1-.06.13,0.15,0.15,0,0,1-.1,0H7.27Z" /> -->
<!-- 					<path class="b" -->
<!-- 						d="M23,7.67h0q0,0.27-.1.55c-1.24,6.35-5.47,8.55-10.87,8.55H9.33A1.34,1.34,0,0,0,8,17.89H8L6.6,26.83,6.2,29.36a0.7,0.7,0,0,0,.7.81h4.88a1.17,1.17,0,0,0,1.16-1l0-.25,0.92-5.83L14,22.79a1.17,1.17,0,0,1,1.16-1h0.73c4.73,0,8.43-1.92,9.51-7.48,0.45-2.32.22-4.26-1-5.62A4.67,4.67,0,0,0,23,7.67Z" /> -->
<!-- 					<path class="c" -->
<!-- 						d="M21.75,7.15L21.17,7l-0.62-.12a15.28,15.28,0,0,0-2.43-.18H10.77a1.17,1.17,0,0,0-1.16,1L8,17.6l0,0.29a1.34,1.34,0,0,1,1.32-1.13h2.75c5.4,0,9.64-2.19,10.87-8.55C23,8,23,7.85,23,7.67a6.59,6.59,0,0,0-1-.43Z" /> -->
<!-- 					<path class="a" -->
<!-- 						d="M9.61,7.7a1.17,1.17,0,0,1,1.16-1h7.35a15.28,15.28,0,0,1,2.43.18L21.17,7l0.58,0.15L22,7.24a6.69,6.69,0,0,1,1,.43c0.37-2.35,0-3.94-1.27-5.39S17.85,0,14.62,0H5.24A1.34,1.34,0,0,0,3.92,1.13L0,25.9a0.81,0.81,0,0,0,.8.93H6.6L8,17.6Z" /></svg> -->
<!-- 			</div> -->
<%-- 			<c:forEach var="vo" items="${challengeList }"> --%>

<%-- 				<c:if test="${vo.c_sort eq 0 }"> --%>
<%-- 					<c:set var="sort" value="저축형"/> --%>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${vo.c_sort eq 1 }"> --%>
<%-- 					<c:set var="sort" value="절약형"/> --%>
<%-- 				</c:if> --%>

<%-- 			</c:forEach> --%>
<!-- 			<div class="receipt.header__meta"> -->
<%-- 				<span class="receipt.header__date">[${sort} : ${vo2.ct_top}]</span>  --%>
<%-- 				<span class="receipt.header__serial">${vo.c_title }</span>  --%>
<!-- 				<span class="receipt.header__number"> <b> -->
<%-- 				<fmt:formatDate value="${startDate }" pattern="YYYY-MM-dd" /> --%>
<!-- 					</b> / <b> -->
<%-- 				<fmt:formatDate value="${c_end }" pattern="YYYY-MM-dd" /> --%>
<!-- 					</b> -->
<!-- 				</span> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="receipt.header__greeting"> -->
<%-- 			<span class="receipt.header__name">${vo.c_title }</span> <span --%>
<!-- 				class="receipt.header__count">🎉축하합니다! 성공적으로 챌린지를 마치셨습니다!</span> <span -->
<!-- 				class="receipt.header__border"></span> -->
<!-- 		</div> -->
<!-- 		<div class="receipt.header__spacing"></div> -->
<!-- 	</header> -->

<!-- 	<section class="cart"> -->
<!-- 		<h2 class="cart__header">챌린지 결과</h2> -->
<!-- 		<ol class="list"> -->
<!-- 			<li class="list__item"> -->
<!-- 				<span class="list__name">  -->
<!-- 					참여 인원  -->
<!-- 				</span>  -->
<!-- 				<span class="list__price"> -->
<%-- 					${CList }	 --%>
<!-- 				</span> -->
<!-- 			</li> -->
<!-- 			<li class="list__item"> -->
<!-- 				<span class="list__name">  -->
<!-- 					성공 인원  -->
<!-- 				</span>  -->
<!-- 				<span class="list__price"> -->
<%-- 					${Success } --%>
<!-- 				</span> -->
<!-- 			</li> -->
<!-- 			<li class="list__item"> -->
<!-- 				<span class="list__name">  -->
<!-- 					모인 꿀머니  -->
<!-- 				</span> -->
<!-- 				<span class="list__price"> -->
<%-- 					${ChallengeMoney }꿀 --%>
<!-- 				</span> -->
<!-- 			</li> -->
<!-- 		</ol> -->
<!-- 		<hr class="cart__hr" /> -->
<!-- 		<footer class="cart__total"> -->
<!-- 			<h3 class="cart__total-label">챌린지 환급 꿀 머니</h3> -->
<!-- 			<span class="cart__total-price">  -->
<%-- 				${ChallengeMoney / Success}꿀  --%>
<!-- 			</span> -->
<!-- 		</footer> -->
<!-- 	</section> -->


<!-- </div> -->

<!-- 	<footer class="bar-code"> -->
<!-- 		<div class="bar-code__code"> -->
<!-- 			<svg id="d17ac603-1444-403c-9daf-1afe6b3ad839" data-name="Layer 1" -->
<!-- 				xmlns="http://www.w3.org/2000/svg" viewBox="0 0 575.2 93.16"> -->
<!-- 				<defs> -->

<!-- <button class="button" type="button" onclick="restart()">Replay</button> -->

<!-- <button class="button" type="button" -->
<!-- 	onclick="location.href='/review';">후기 작성하기</button> -->



<style>
body {
	background: #ff84a1;
	color: #3a3e59;
	font-family: "Raleway", Arial, sans-serif;
}

p {
	text-align: center;
	opacity: 0.3;
	transition: 0.3s;
	position: absolute;
	bottom: 2vh;
	left: 0;
	right: 0;
	margin: 0 auto;
}

p:hover {
	opacity: 1;
}

.receipt {
	max-width: 400px;
	margin: 5vh auto 0 auto;
}

.receipt_hoverable {
	transition: 0.3s;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
}

.receipt_hoverable:hover {
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
}

.header {
	width: 100%;
}

.header__top {
	display: flex;
	align-items: center;
	background: white;
	width: 100%;
	border-radius: 4px 4px 0 0;
}

.header__logo {
	width: 10%;
	padding: 30px;
}

.header__meta {
	position: relative;
	width: 90%;
	height: 100%;
	margin-left: 15px;
	line-height: 1.7rem;
	opacity: 0.3;
}

.header__serial {
	display: block;
}

.header__number {
	position: absolute;
	top: 7.5px;
	right: 0;
	transform: rotate(270deg);
	opacity: 0.2;
}

.header__greeting {
	clear: both;
}

.header__greeting {
	position: relative;
	background: white;
	padding: 0 15px;
	padding-left: 30px;
}

.header__name {
	display: block;
	font-weight: bold;
	font-size: 1.3rem;
	margin-bottom: 7.5px;
}

.header__count {
	opacity: 0.4;
	font-size: 90%;
}

.header__border {
	position: absolute;
	left: 0;
	top: 0;
	height: 100%;
	width: 3px;
	background-color: #429fff;
}

.header__spacing {
	display: block;
	background: white;
	width: 100%;
	height: 22.5px;
}

.cart {
	background: white;
	padding: 30px;
	padding-top: 15px;
	border-bottom: 2px dashed #ff84a1;
	border-radius: 0 0 5px 5px;
}

.cart__header {
	margin-top: 0;
	text-align: center;
}

.cart__hr {
	border: none;
	padding: 0;
	margin: 0;
	margin-bottom: 22.5px;
	border-bottom: 3px solid #fee469;
}

.list {
	margin: 0;
	padding: 0;
	counter-reset: item-counter;
}

.list__item {
	display: flex;
	width: 100%;
	padding-top: 22.5px;
	padding-bottom: 22.5px;
	border-bottom: 1px dashed rgba(0, 0, 0, 0.1);
}

.list__item:last-child {
	border-bottom: none;
}

.list__item:before {
	content: counter(item-counter);
	counter-increment: item-counter;
	margin-right: 15px;
}

.list__name {
	flex: 1;
	align-self: flex-start;
}

.list__price {
	align-self: flex-end;
	text-align: right;
	font-weight: bold;
}

.cart__total {
	display: flex;
	width: 100%;
}

.cart__total-label {
	margin: 0;
	flex: 1;
	text-transform: uppercase;
}

.cart__total-price {
	align-self: flex-end;
	font-weight: bold;
	text-align: right;
}

.bar-code {
	background: white;
	padding: 30px;
	border-radius: 6px 6px 4px 4px;
}

.button {
	position: fixed;
	bottom: 15px;
	right: 15px;
	background: #ff517a;
	border: none;
	border-radius: 3px;
	color: white;
	padding: 15px;
	transition: 0.3s;
}

.button:hover {
	box-shadow: 0 2px 10px #b7002b;
}

.link {
	display: block;
	margin: 25px auto 15px auto;
	text-align: center;
}
</style>




<%-- <%@ include file="../include/footer.jsp"%> --%>


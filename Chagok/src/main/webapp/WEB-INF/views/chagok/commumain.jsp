<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>

<%@ include file="../include/sidebar.jsp" %>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!-- <h1> 커뮤니티 메인 </h1> -->
<%-- ${challengeList} --%>
<%-- ${ranking } --%>

<h1 class="visually-hidden"></h1>
<main>
<form method="get">


<!-- 명예의 전당 -->
<h1>명예의 전당</h1>

<div class="clprofile-container">
<c:forEach var="uvo" items="${ranking }" begin="0" end="2">
      <div class="clprofile-card">
        <img src="https://i.imgur.com/bZBG9PE.jpg" width="100px" height="100px" alt="image1" class="clprofile-icon" />
        <div class="clprofile-name">${uvo.nick }</div>
        <div class="clprofile-position"><b>${uvo.success_cnt }</b> 번 도전에 성공하셨습니다.</div>
      </div>
</c:forEach>
      <div class="ranking-button">
		<button type="button" class="btn btn-success btn-lg" onclick="location.href='/challenge/plusregist';">저축형</button>
		<button type="button" class="btn btn-warning btn-lg" onclick="location.href='/challenge/minusregist';">절약형</button>
	  </div>
</div>
<!-- 명예의 전당 -->


<!-- 챌린지 리스트 -->
  <h2 class="visually-hidden"></h2>
  <div class="row row-cols-lg-4 g-2">
  <c:forEach var="vo" items="${cList }">
  
  <!-- 날짜 계산하기 -->
		<jsp:useBean id="now" class="java.util.Date" />
			 <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>

			 <fmt:parseDate value="${vo.c_start}" var="startDate" pattern="yyyy-MM-dd"/>
			 <fmt:parseNumber value="${(startDate.time + 1000*60*60*24)/ (1000*60*60*24)}" integerOnly="true" var="startTime" scope="request"/>
			 <fmt:parseNumber value="${c_end.time / (1000*60*60*24)}" integerOnly="true" var="endTime" scope="request" />
  
  
  <!-- 날짜 계산하기 : 조건에 만족하는 챌린지만 출력 -->
  <c:if test="${startTime - nowfmtTime >= 1}">

  
    <div class="col">
      <div class="card">
      
      	<c:if test="${vo.c_sort eq 0 }">
      		<p class="card-item-chevron card-item-chevron--hit" >저축형</p>
      	</c:if>
      	<c:if test="${vo.c_sort eq 1 }">
      		<p class="card-item-chevron card-item-chevron--sale">절약형</p>
      	</c:if>

      	<c:if test="${startTime - nowfmtTime >= 2}">
      		<p class="card-item-chevron--new">D - <b>${startTime - nowfmtTime }</b></p>
      	</c:if>
      	<c:if test="${startTime - nowfmtTime == 1}">
      		<p class="card-item-chevron--new-2"><b>오늘<br>마감</b></p>
      	</c:if>
        <a class="card-item-link" href="/challenge/detail?cno=${vo.cno }">
        
      	  
      	  <c:if test="${startTime - nowfmtTime >= 2}">
      		 <img class="card-img-top img-fluid" src="${pageContext.request.contextPath }/resources${vo.c_thumbFile }" alt="" aria-labelledby="title_1" id="c_img">
      	  </c:if>
      	  <c:if test="${startTime - nowfmtTime == 1}">
      		<img class="card-img-top img-fluid-2" src="${pageContext.request.contextPath }/resources${vo.c_thumbFile }" alt="" aria-labelledby="title_1" id="c_img">
      	  </c:if>
        
        </a>
        <div class="card-body">
        <div class="card-item-header">
       
            <p class="card-item-code">[${vo.ct_top}]</p>

            <div class="rate">
             	<p class="card-item-rating">
                <img src="https://png.pngtree.com/png-clipart/20190705/original/pngtree-vector-business-men-icon-png-image_4186858.jpg" alt=""> </p> 
              	<p class="card-item-rating"> <b>${vo.c_cnt }</b> / ${vo.c_pcnt } 명</p>
            </div>
          </div>
          <h3 class="card-title" id="title_1">${vo.c_title }</h3>
          <div class="card-item-footer">
            <p class="card-item-period" >
           		<c:if test="${vo.c_period eq 2 }">
      			2주
      			</c:if>
      			<c:if test="${vo.c_period eq 4 }">
      			4주
      			</c:if>
      			<c:if test="${vo.c_period eq 8 }">
      			2달
      			</c:if>
      			<c:if test="${vo.c_period eq 12 }">
      			3달
      			</c:if>
      		<s></s></p>
			
            <p style="text-align:right;" class="card-item-price" ><b>${vo.c_deposit }</b> 원</p>
          </div>
          </div>
        </div>
      </div>
      </c:if>
   </c:forEach>
 </div>
   


            <div class="box-footer clearfix">
              <ul class="pagination pagination-sm no-margin pull-right">
                
                <c:if test="${pageMaker.prev}">
                	<li><a href="/commumain${pageMaker.makeSearch(pageMaker.startPage - 1)}">«</a></li>
                </c:if>
                
                <c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" step="1">
               		<li><a href="/commumain${pageMaker.makeSearch(idx)}">${idx}</a></li>
                </c:forEach>
                
                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                	<li><a href="/commumain${pageMaker.makeSearch(pageMaker.endPage + 1)}">»</a></li>
                </c:if>
                
              </ul>
            </div>
</form>
</main>
</div>
<%@ include file="../include/footer.jsp" %>

<style>


*,
html {
  margin: 0;
  padding: 0;
  font-family: 'GmarketSans';
}

body {
  color: #0d0417;
  font-family: "Noto Sans", "Arial", sans-serif;
  font-size: 16px;
  line-height: 1.3;
  overflow-x: hidden;
  width: 100%;
  height: 100%;
  font-family: 'GmarketSans';
}

.visually-hidden {
  position: absolute;
  width: 1px;
  height: 1px;
  margin: -1px;
  padding: 0;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}

.img-fluid {
  width: 270px;
  height: 240px;
  object-fit: scale-down;
  background-color: #ffdb8333;
}

.img-fluid-2 {
  width: 270px;
  height: 240px;
  object-fit: scale-down;
  background-color: #dd4b3921;
}

main {
  padding: 0;
  margin: 1em auto;
}

@media (min-width: 576px) {
  main {
    max-width: 540px;
  }
}

@media (min-width: 768px) {
  main {
    max-width: 720px;
  }
}

@media (min-width: 992px) {
  main {
    max-width: 960px;
  }
}

@media (min-width: 1200px) {
  main {
    max-width: 1140px;
  }
}

@media (min-width: 1400px) {
  main {
    max-width: 1320px;
  }
}

main .row {
  --bs-gutter-x: 1.5rem;
  --bs-gutter-y: 0;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-wrap: wrap;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  margin-top: -webkit-calc(var(--bs-gutter-y) * 3);
  margin-top: calc(var(--bs-gutter-y) * 3);
  margin-right: -webkit-calc(var(--bs-gutter-x) / -2);
  margin-right: calc(var(--bs-gutter-x) / -2);
  margin-left: -webkit-calc(var(--bs-gutter-x) / 1);
  margin-left: calc(var(--bs-gutter-x) / 1);
}

main .row > * {
  -webkit-flex-shrink: 0;
  -ms-flex-negative: 0;
  flex-shrink: 0;
  width: 100%;
  max-width: 100%;
  padding-right: -webkit-calc(var(--bs-gutter-x) / 2);
  padding-right: calc(var(--bs-gutter-x) / 2);
  padding-left: -webkit-calc(var(--bs-gutter-x) / 5);
  padding-left: calc(var(--bs-gutter-x) / 5);
  margin-top: var(--bs-gutter-y);
}

main .col {
  -webkit-box-flex: 1;
  -webkit-flex: 1 0 0%;
  -ms-flex: 1 0 0%;
  flex: 1 0 0%;
}

main .g-2 {
  --bs-gutter-x: 2rem;
  --bs-gutter-y: 2rem;
}

@media (min-width: 992px) {
  main .row-cols-lg-4 > * {
    -webkit-box-flex: 0;
    -webkit-flex: 0 0 auto;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
    width: 30%;
  }
}

@media (min-width: 1200px) {
  main .row-cols-xl-4 > * {
    -webkit-box-flex: 0;
    -webkit-flex: 0 0 auto;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
    width: 25%;
  }
}

@media (min-width: 1400px) {
  main .row-cols-xxl-4 > * {
    -webkit-box-flex: 0;
    -webkit-flex: 0 0 auto;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
    width: 25%;
  }
}

main .card {
  position: relative;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #fff;
  -webkit-background-clip: border-box;
  background-clip: border-box;
  border: 1px solid rgba(0, 0, 0, 0.125);
  -webkit-border-radius: 0.25rem;
  border-radius: 0.25rem;
  z-index: 1;
}

@media (min-width: 576px) {
  main .card {
    -webkit-box-flex: 1;
    -webkit-flex: 1 0 0%;
    -ms-flex: 1 0 0%;
    flex: 1 0 0%;
    margin-bottom: 0;
  }
  main .card + .card {
    margin-left: 0;
    border-left: 0;
  }
  main .card:not(:last-child) {
    -webkit-border-top-right-radius: 0;
    border-top-right-radius: 0;
    -webkit-border-bottom-right-radius: 0;
    border-bottom-right-radius: 0;
  }
  main .card:not(:last-child) .card-img-top {
    -webkit-border-top-right-radius: 0;
    border-top-right-radius: 0;
  }
  main .card:not(:first-child) {
    -webkit-border-top-left-radius: 0;
    border-top-left-radius: 0;
    -webkit-border-bottom-left-radius: 0;
    border-bottom-left-radius: 0;
  }
  main .card:not(:first-child) .card-img-top {
    -webkit-border-top-left-radius: 0;
    border-top-left-radius: 0;
  }
}

main .card:hover {
  -webkit-transition: all 0.2s ease-in-out 0s;
  -o-transition: all 0.2s ease-in-out 0s;
  transition: all 0.2s ease-in-out 0s;
  -webkit-box-shadow: 0 4px 15px rgba(76, 75, 77, 0.1);
  box-shadow: 0 4px 15px rgba(76, 75, 77, 0.1);
}

main .card:hover::before {
  top: -5px;
  left: -5px;
  padding: 5px;
  -webkit-transition: all 0.2s ease-in-out 0s;
  -o-transition: all 0.2s ease-in-out 0s;
  transition: all 0.2s ease-in-out 0s;
}

main .card::before {
  content: "";
  position: absolute;
  z-index: -1;
  top: 0;
  left: 0;
  width: -webkit-calc(100% - 2px);
  width: calc(100% - 2px);
  height: 100%;
  -webkit-transition: all 0.2s ease-in-out 0s;
  -o-transition: all 0.2s ease-in-out 0s;
  transition: all 0.2s ease-in-out 0s;
  border: 1px solid #e8e8e8;
  -webkit-border-radius: inherit;
  border-radius: inherit;
  background-color: inherit;
}

main .card .card-item-link {
  display: block;
  border: 1px solid #e8e8e8;
  -webkit-border-radius: 8px 8px 0 0;
  border-radius: 8px 8px 0 0;
}

main .card .card-item-link .card-img-top {
  width: 100%;
  -webkit-border-top-left-radius: -webkit-calc(0.25rem - 1px);
  border-top-left-radius: calc(0.25rem - 1px);
  -webkit-border-top-right-radius: -webkit-calc(0.25rem - 1px);
  border-top-right-radius: calc(0.25rem - 1px);
}

@media (min-width: 576px) {
  main .card .card-item-link .card-img-top {
    -webkit-border-top-right-radius: 0;
    border-top-right-radius: 0;
    -webkit-border-top-left-radius: 0;
    border-top-left-radius: 0;
  }
}

main .card .card-body {
  -webkit-box-flex: 1;
  -webkit-flex: 1 1 auto;
  -ms-flex: 1 1 auto;
  flex: 1 1 auto;
  padding: 0.5em 0.5em;
}

main .card .card-body .card-item-header {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
  -ms-flex-pack: justify;
  justify-content: space-between;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  margin-top: 0.9em;
  margin-bottom: 0.6em;
  padding: 0 10px;
}

main .card .card-body .card-item-header .card-item-code {
    margin: 0;
    color: #66BB7A;
    font-weight: 600;
    font-size: 14px;
}

main .card .card-body .card-item-header .rate {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
}

main .card .card-body .card-item-header .rate .card-item-rating {
  position: relative;
  margin: 0;
  padding-left: -webkit-calc(13px + 0.6em);
  padding-left: calc(13px + 0.6em);
  color: #0d0417;
  font-size: 12px;
  font-weight: 500;
}

main .card .card-body .card-item-header .rate .card-item-rating img {
  position: absolute;
  top: -1px;
  width: 15px;
  height: 15px;
}

main .card .card-body .card-item-header .rate .link {
  outline: none;
  -webkit-box-shadow: 0 1px 0 #787878;
  box-shadow: 0 1px 0 #787878;
  text-decoration: none;
  margin-left: 1em;
}

main .card .card-body .card-item-header .rate .link:visited {
  color: #797980;
}

main .card .card-body .card-item-header .rate .link:hover {
  -webkit-box-shadow: 0 1px 0 #0d0417;
  box-shadow: 0 1px 0 #0d0417;
  color: #0d0417;
}

main .card .card-body .card-item-header .rate .link:focus,
main .card .card-body .card-item-header .rate .link :active {
  -webkit-box-shadow: 0 2px 0 #f8d456;
  box-shadow: 0 2px 0 #f8d456;
  color: #0d0417;
}

main .card .card-body .card-title {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  max-width: 98%;
  margin: 0;
  padding: 10px 10px;
  height: 80px;
/*   font-family: "Noto Sans", "Arial", sans-serif; */
  font-size: 18px;
  font-style: normal;
  font-weight: 600;
  color: #0d0417;
}

main .card .card-body .card-item-footer {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  padding: 0 10px 18px;
}

main .card .card-body .card-item-footer .card-item-period {
  margin: 0 auto 0 0;
  color: #0d0417;
  font-size: 18px;
  font-weight: 500;
}


main .card .card-body .card-item-price {
  color: #0d0417;
  font-size: 18px;
  font-weight: 500;
}

main .card .card-body .card-item-footer .card-item-period s {
  margin-left: 0.5em;
  color: #f39c12;
  font-size: 14px;
  font-weight: 400;
  text-decoration: none;
}

main .card .card-body .card-item-footer .card-item-btn {
  width: 32px;
  height: 32px;
  -webkit-border-radius: 50%;
  border-radius: 50%;
}

main .card .card-body .card-item-footer .card-item-btn:last-of-type {
  margin-left: 1em;
}

main .card .card-body .card-item-footer .card-item-btn::before {
  display: inline-block;
  width: 100%;
  height: 100%;
  text-align: center;
  vertical-align: -15px;
}

main .card .card-body .card-item-footer .card-item-button--favourite {
  position: relative;
  background-color: #ffffff;
  -webkit-box-shadow: 0 2px 4px rgba(32, 14, 50, 0.08);
  box-shadow: 0 2px 4px rgba(32, 14, 50, 0.08);
}

main .card .card-body .card-item-footer .card-item-button--favourite img {
  position: absolute;
  top: 8.5px;
  right: 7.5px;
  width: 16px;
  height: 16px;
}

main .card .card-body .card-item-footer .card-item-button--cart {
  position: relative;
  background-color: #f8d456;
  -webkit-box-shadow: 0 2px 4px rgba(32, 14, 50, 0.08);
  box-shadow: 0 2px 4px rgba(32, 14, 50, 0.08);
}

main .card .card-body .card-item-footer .card-item-button--cart img {
  position: absolute;
  top: 7px;
  right: 7.6px;
  width: 16px;
  height: 16px;
}

main .card .card-body .card-item-footer .btn {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  padding: 0;
  border: 0 none;
  cursor: pointer;
}

main .card .card-item-chevron {
  position: absolute;
  z-index: 2;
  top: 16px;
  left: 15px;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  margin: 0;
  padding: 3px 10px 4px 10px;
  -webkit-border-radius: 4px;
  border-radius: 4px;
  color: #ffffff;
/*   font-family: "Noto Sans", "Arial", sans-serif; */
  font-size: 10px;
  font-weight: 700;
  line-height: 1.4;
}

main .card .card-item-chevron--sale {
  background-color: #ffcb4d;
}

main .card .card-item-chevron--hit {
  background-color: #66BB7A;
}

main .card .card-item-chevron--new {
	background-color: #ffb033;
    position: absolute;
    z-index: 2;
    top: 180px;
    right: 15px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0;
    padding: 15px 0px;
    -webkit-border-radius: 4px;
    border-radius: 5rem;
    color: #ffffff;
    /* font-family: "Noto Sans", "Arial", sans-serif; */
    font-size: 13px;
    font-weight: 700;
    line-height: 1.4;
    width: 5rem;
    /* height: 5rem; */
    text-align: center;
}

main .card .card-item-chevron--new-2 {
	background-color: #ff523d;
    position: absolute;
    z-index: 2;
    top: 180px;
    right: 15px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0;
    padding: 7px 0px;
    -webkit-border-radius: 4px;
    border-radius: 5rem;
    color: #ffffff;
    /* font-family: "Noto Sans", "Arial", sans-serif; */
    font-size: 13px;
    font-weight: 700;
    line-height: 1.4;
    width: 5rem;
    height: 5rem;
    text-align: center;
}

.btn-success {
	height: 90px;
	margin-bottom: 20px;
}

.btn-warning {
	height: 90px;
}

.clprofile-container {
    display: flex;
    align-items: center;
/*     justify-content: center; */
/*     height: 100vh; */
    margin: 0 30px;
}

.clprofile-card {
    flex: 1 1 30%; 
    max-width: 300px;
    background: #fff;
    padding: 20px 40px;
    display: flex;
    flex-direction: column;
    align-items: center;
    border-radius: 4px;
    box-shadow: 0 0 2px 0 #ccc;
    transition: .3s;
}

.clprofile-card:hover {
    transform: scale(1.1);
    box-shadow: 0 0 25px -5px #ccc;
}

.clprofile-icon {
    height: 100px;
    width: 100px;
    object-fit: cover;
    border-radius: 50%;
}

.clprofile-name {
    font-size: 20px;
    font-weight: bold;
    margin: 25px 0 10px 0;
}

.clprofile-position {
    font-size: 14px;
    color: #777;
}

.ranking-button{
    display: flex;
    flex-direction: column;
    width: 14%;
    margin-left: 20px;
}

@media screen and (max-width: 1000px) {
    .clprofile-name {
        font-size: 18px;
    }
}

@media screen and (max-width: 800px) {
    .clprofile-card {
        padding: 20px 15px;
    }

    .clprofile-name {
        font-size: 16px;
    }
}
.search{
	display: flex;
    justify-content: flex-end;
    margin-right: 30px;
}


</style>

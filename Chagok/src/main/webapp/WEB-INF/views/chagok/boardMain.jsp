<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>

<%@ include file="../include/sidebar.jsp" %>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>



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
   <img src="./resources/imgUpload/new-loading.gif">
</div>

<script type="text/javascript">
    $(window).on('load', function() {
        setTimeout(function(){
            $("#waiting").fadeOut();
        }, 300);
    });
</script>
<!-- 로딩 코드 end -->




<style>
.board_wrap {
	width: 1000px;
	margin: 20px;
}

.board_title {
	margin-bottom: 30px;
}

.board_title strong {
	font-size: 3rem;
	font-weight: 1000;
}

.board_title p {
	margin-top: 10px;
	font-size: 1.4rem;
}

.bt_wrap {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

.bt_wrap input {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #FFDB83;
    border-radius: 2px;
    font-size: 1.4rem;
}

.bt_wrap input:first-child {
    margin-left: 0;
}

.bt_wrap input.sbtn {
	display: inline-block;
    min-width: 100px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #FFDB83;
    border-radius: 2px;
    font-size: 1.4rem;
    background-color: #FFDB83;
    color: #fff;
    margin-bottom: 20px;
}

.bt_wrap input.sbtn2 {
	display: inline-block;
    min-width: 100px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #FFDB83;
    border-radius: 2px;
    font-size: 1.4rem;
    background-color: #fff;
    color: #FFDB83;
}

footer {
    width: 100%;
    height: 20px; /* footer의 높이 */
    position: absolute;  
    bottom: 10px;
    left: 0;
}
</style>
 
 <body>
 <div class="board_wrap">
        <div class="board_title">
            <strong> 커뮤니티 </strong>
            <p> 한 눈에 보는 커뮤니티 </p>
        </div>
	</div>
<div style="width:100%; height:100%;">

<!-- 게시판 내용 (후기) -->
	<table class="table table-hover" style="float:left; margin-left:30px; border-bottom: 1px solid #ddd;border-top: 2px solid #66BB7A; width:45%;">
			  <thead style="background-color: #dddddd30;font-size: 16px;">
<!-- 			   <th scope="col" style="width:300px; padding: 15px 0;">후기게시판</th> -->
				<tr>
					<td colspan='2'> 챌린지 후기 게시판</td>
					<td colspan='2' align=right> <a href="/reviewboard?page=1">더 보기</a></td>
				</tr>
			    <tr>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 20%;">번호</th>
			      <th scope="col" style="text-align:center; padding: 15px 0;">제목</th>
<!-- 				  <th scope="col" style="text-align:center; padding: 15px 0;">Last</th> -->
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">작성자</th>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">작성일</th>
			    </tr>
			  </thead>
			<tbody>
	
				<c:forEach var="RboardList" items="${RboardList }" >
					
						    <tr>
						   	 <th scope="row" style="text-align:center; padding: 15px 0;">${RboardList.bno } </th>
						   	 <td style="text-align:center; padding: 15px 0;"><a href="/reviewcontent?bno=${RboardList.bno }&cno=${RboardList.cno}">${RboardList.b_title }</a></td>
						  	 <td style="text-align:center; padding: 15px 0;">${RboardList.b_writer }</td>
						  	 <td style="text-align:center; padding: 15px 0;"><fmt:formatDate value="${RboardList.b_date }" pattern="yyyy-MM-dd"/></td>
						    </tr>
					
				</c:forEach>  
				
		</tbody>
	</table>
<!-- 게시판 내용 -->

<!-- 게시판 내용 (공지) -->	
	<table class="table table-hover" style="float:right; margin-left:10px; margin-right:30px; border-bottom: 1px solid #ddd;border-top: 2px solid #66BB7A; width:45%;">
			  <thead style="background-color: #dddddd30;font-size: 16px;">
<!-- 			   <th scope="col" style="width:300px; padding: 15px 0;">공지사항</th> -->
				<tr>
					<td colspan='2'> 공지사항</td>
					<td colspan='2' align=right> <a href="/notice?page=1">더 보기</a></td>
				</tr>
			    <tr>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 20%;">번호</th>
			      <th scope="col" style="text-align:center; padding: 15px 0;">제목</th>
<!-- 				  <th scope="col" style="text-align:center; padding: 15px 0;">Last</th> -->
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">작성자</th>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">작성일</th>
		    	</tr>
			  </thead>
			<tbody>
	
				<c:forEach var="NboardList" items="${NboardList }" >
<%-- 					<c:if test="${boardList.b_sort eq '2'}"> --%>
						    <tr>
						   	 <th scope="row" style="text-align:center; padding: 15px 0;">${NboardList.bno } </th>
						   	 <td style="text-align:center; padding: 15px 0;"><a href="/noticecontent?bno=${NboardList.bno }">${NboardList.b_title }</a></td>
						  	 <td style="text-align:center; padding: 15px 0;">${NboardList.b_writer }</td>
						  	 <td style="text-align:center; padding: 15px 0;"><fmt:formatDate value="${NboardList.b_date }" pattern="yyyy-MM-dd"/></td>
						    </tr>
<%-- 					</c:if> --%>
				</c:forEach>  
			  
		</tbody>
	</table>
<!-- 게시판 내용 -->

<!-- 게시판 내용 (자유) -->	
	<table class="table table-hover" style="float:left; margin-left:30px; border-bottom: 1px solid #ddd;border-top: 2px solid #66BB7A; width:45%;">
			  <thead style="background-color: #dddddd30;font-size: 16px;">
<!-- 			   <th scope="col" style="width:300px; padding: 15px 0;">자유게시판</th> -->
				<tr>
					<td colspan='2'> 자유 게시판 </td>
					<td colspan='2' align=right> <a href="/freeboard?page=1">더 보기</a></td>
				</tr>
			    <tr>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 20%;">번호</th>
			      <th scope="col" style="text-align:center; padding: 15px 0;">제목</th>
<!-- 				  <th scope="col" style="text-align:center; padding: 15px 0;">Last</th> -->
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">작성자</th>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">작성일</th>
		    	</tr>
			  </thead>
			<tbody>
	
				<c:forEach var="FboardList" items="${FboardList }" >
<%-- 					<c:if test="${boardList.b_sort eq '3'}"> --%>
						    <tr>
						   	 <th scope="row" style="text-align:center; padding: 15px 0;">${FboardList.bno } </th>
						   	 <td style="text-align:center; padding: 15px 0;"><a href="/freeboard?page=1">${FboardList.b_title }</a></td>
						  	 <td style="text-align:center; padding: 15px 0;">${FboardList.b_writer }</td>
						  	 <td style="text-align:center; padding: 15px 0;"><fmt:formatDate value="${FboardList.b_date }" pattern="yyyy-MM-dd"/></td>
						    </tr>
<%-- 					</c:if> --%>
				</c:forEach>  
			
		</tbody>
	</table>
<!-- 게시판 내용 -->

<!-- 게시판 내용 (뉴스 / 재태크) -->
	<table class="table table-hover" style="float:right; margin-left:10px; margin-right:30px; border-bottom: 1px solid #ddd;border-top: 2px solid #66BB7A; width:45%;">
<!-- 			   <th scope="col" style="width:300px; padding: 15px 0;">뉴스 / 재테크</th> -->
			  <thead style="background-color: #dddddd30;font-size: 16px;">
<!-- 				<tr> -->
<!-- 				   <th style="text-align:left;">뉴스 / 재테크</th> -->
<!-- 				   <th style="text-align:right;"> 더 보기 </th> -->
<!-- 				<tr> -->
				<tr>
					<td colspan='2'> 뉴스 / 재테크 게시판</td>
					<td colspan='2' align=right> <a href="/economy?page=1">더 보기</a></td>
				</tr> 
			    <tr>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 20%;">번호</th>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 50%;">제목</th>
<!-- 				  <th scope="col" style="text-align:center; padding: 15px 0;">Last</th> -->
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">작성자</th>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">작성일</th>
		    	</tr>
			  </thead>
			<tbody>
	
				<c:forEach var="EboardList" items="${EboardList }" begin="0" end="5" step="1">
					
<%-- 					<c:if test="${boardList.b_sort eq '4'}"> --%>
						    <tr>
						   	 <th scope="row" style="text-align:center; padding: 15px 0;">${EboardList.bno } </th>
						   	 <td style="text-align:center; padding: 15px 0;"><a href="/economycontent?bno=${EboardList.bno }">${EboardList.b_title }</a></td>
						  	 <td style="text-align:center; padding: 15px 0;">${EboardList.b_writer }</td>
						  	 <td style="text-align:center; padding: 15px 0;"><fmt:formatDate value="${EboardList.b_date }" pattern="yyyy-MM-dd"/></td>
						    </tr>
<%-- 					</c:if> --%>
				</c:forEach> 
		</tbody>
		
	</table>
</div>
<%@ include file="../include/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<h1> 후기글 상세 </h1>

	<section class="content" >
	 <form role="form" method="post">
		<input type="hidden" name="bno" value="${boardChallenge.bno }">
	</form>
	<div class="row">
		<div class="col-lg-5 mx-6 aos-init aos-animate" data-aos="fade-right" >
<%-- 	        <img class="img-responsive" src="${vo.c_file}" alt="Photo" > --%>
		<h3><span style="color: #66BB7A; font-weight: bold;">[후기 제목]</span> ${boardChallenge.b_title }</h3>
		<h4><span style="color: #66BB7A; font-weight: bold;">[작성자]</span> ${boardChallenge.b_writer }</h4>
		<h4><span style="color: #66BB7A; font-weight: bold;">[후기 내용]</span></h4>
	        <textarea class="form-control" rows="3" style="margin-top:15px; width: 600px; height: 280px" readonly>${boardChallenge.b_content }</textarea>
		</div>
		<div class="col-lg-6 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left" >
			<c:forEach var="vo" items="${challengeList }">
			
				<c:if test="${vo.c_sort eq 0 }">
					<c:set var="sort" value="저축형"/>
				</c:if>
				<c:if test="${vo.c_sort eq 1 }">
					<c:set var="sort" value="절약형"/>
				</c:if>
				
			</c:forEach>
			<h3><span style="color: #66BB7A; font-weight: bold;"> 참여한 챌린지 정보</span></h3>
			<h3><span style="color: #66BB7A; font-weight: bold;"> [${sort } : ${vo2.ct_top}]</span> <br> ${vo.c_title }</h3>
			 <jsp:useBean id="now" class="java.util.Date" />
			 <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
			 <fmt:parseDate value="${vo.c_start}" var="startDate" pattern="yyyy-MM-dd"/>
			 <fmt:parseNumber value="${(startDate.time + 1000*60*60*24)/ (1000*60*60*24)}" integerOnly="true" var="startTime" scope="request"/>
			 <fmt:parseNumber value="${c_end.time / (1000*60*60*24)}" integerOnly="true" var="endTime" scope="request" />

			<br><br>
			<div class="row">
				<div class="col-lg-6" style="line-height: 180%">
	             <div class="progress-group" style="width: 280px;" >
	               <span class="progress-text">챌린지 장 </span>
	               <span class="progress-number"><b>${user.nick }</b>님</span>
	             </div>
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 인원</span>
	               <span class="progress-number"><b>${CList} </b>/ ${vo.c_pcnt }</span>
	             </div>
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 성공인원</span>
	               <span class="progress-number"><b>${Success } </b>/ ${CList }</span>
	             </div>
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">예치금</span>
	               <span class="progress-number"><b>${vo.c_deposit }</b>꿀</span>
	             </div>  
	          	 <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 기간</span>
	               <span class="progress-number"><b>${vo.c_period }</b>주</span>
	             </div>  
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 시작일</span>
	               <span class="progress-number">
	               	<b><fmt:formatDate value="${startDate }" pattern="YYYY-MM-dd"/></b>
	               </span>
	              </div>
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 종료일</span>
	               <span class="progress-number">
	               	<b><fmt:formatDate value="${c_end }" pattern="YYYY-MM-dd"/></b>
	               </span>
	              </div>
	             
	         	</div>
	       </div>
		</div>
	</div>
	<br>

 	<c:set var="writer" value="${boardChallenge.b_writer }"/>
	<c:if test= "${nick == '관리자' || nick == writer}">
        <input class="btn btn-danger" type="submit" value="수정하기" onclick="location.href='/reviewupdate?bno=${boardChallenge.bno}&cno=${boardChallenge.cno }';" style="width:218px; margin-left: 950px;">
<!--         <input class="btn btn-danger" type="submit" value="수정하기"  style="width:218px; margin-left: 950px;"> -->
		<input class="btn btn-warning" type="submit" value="삭제하기" style="width:218px; margin-left: 950px;">
	</c:if>
        <input class="btn bg-purple" type="submit" value="돌아가기" onclick="location.href='/reviewboard'" style="width:218px; margin-left: 950px;">
</section>
<%@ include file="../include/footer.jsp"%>
<script>
			$(document).ready(function(){
				var formObj = $("form[role='form']");
				
// 				// 수정
// 				$(".btn-danger").click(function(){
					
// 					formObj.attr("action","/reviewupdate"); 
// 					formObj.attr("method","get"); 
// 					formObj.submit();
					
// 				});
			
				// 삭제
				$(".btn-warning").click(function(){
					formObj.attr("action","/reviewremove");
					formObj.submit();
				});
				
				// 목록가기
				$(".bg-purple").click(function(){
					location.href = "/reviewboard";
				});
				
				
			});
</script> 
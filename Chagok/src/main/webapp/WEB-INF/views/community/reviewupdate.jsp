<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>

<h1>후기글 수정</h1>
<!-- <div class="box box-info"> -->

<!-- 	<div class="box-body"> -->
<!-- 		<form role="form" action="/reviewupdate" method="post"> -->
<!-- 		<div class="input-group"> -->
		
			
<%-- 				<c:if test="${review.c_sort eq 0 }"> --%>
<%-- 					<c:set var="sort" value="저축형"/> --%>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${review.c_sort eq 1 }"> --%>
<%-- 					<c:set var="sort" value="절약형"/> --%>
<%-- 				</c:if> --%>
				
<!-- 			<span class="input-group-addon"> 챌린지 유형 </span>  -->
<%-- 			<span class="input-group-addon"> ${sort } </span>  --%>

<!-- 		</div> -->
<!-- 		<div class="input-group" > -->
			
<!-- 			<span class="input-group-addon"> 챌린지 제목 </span> -->
<%-- 			<span class="input-group-addon"> ${boardChallenge.c_title } </span> --%>
<!-- 		</div> -->
<!-- 		<div class="input-group" > -->
<!-- 		<span class="input-group-addon"> 후기 제목 </span> -->
<%-- 		<input type="text" class="form-control" name="b_title" value="${boardChallenge.b_title }"/>  --%>
<!-- 		</div> -->

<!-- 		<hr> -->

<!-- 		<div class="row"> -->
<!-- 	<div class="col-lg-6"> -->
<!-- 		<div class="input-group"> -->
<!-- 			<span class="input-group-addon">  -->
<!-- 				챌린지 기간 -->
<!-- 			</span>  -->
<%-- 			<input type="text" class="form-control" value="${boardChallenge.c_period }" readonly>  --%>
<!-- 		</div> -->

<!-- 	</div> -->

<!-- 	<div class="col-lg-6"> -->
<!-- 		<div class="input-group"> -->
<!-- 			<span class="input-group-addon">  -->
<!-- 				챌린지 성공인원 -->
<!-- 			</span>  -->
<%-- 			<input type="text" class="form-control"  value="${Success }명" readonly>  --%>
<!-- 		</div> -->

<!-- 	</div> -->
<!-- 	<div class="col-lg-6"> -->
<!-- 		<div class="input-group"> -->
<!-- 			<span class="input-group-addon">  -->
<!-- 				작성자 -->
<!-- 			</span>  -->
<%-- 			<input type="text" class="form-control" name="b_writer"  value="${boardChallenge.b_writer }" readonly> --%>
<!-- 		</div> -->

<!-- 	</div> -->

<!-- 	<div class="col-lg-6"> -->
<!-- 		<div class="input-group"> -->
<!-- 			<span class="input-group-addon">  -->
<!-- 				챌린지 기간	 -->
<!-- 			</span>  -->
<%-- 			<input type="text" class="form-control" value="<fmt:formatDate value="${c_end }" pattern="YYYY-MM-dd"/>"  readonly/> --%>
<!-- 		</div> -->

<!-- 	</div> -->

<!-- </div> -->
<!-- 	<hr> -->
<!-- 	<h5> 후기 </h5> -->
	
<%-- 	<textarea rows="15" cols="100" name="b_content">${boardChallenge.b_content }</textarea> --%>
	
	<div class="row" style="margin:20px; padding:30px;">
		<div class="col-lg-5 mx-6 aos-init aos-animate" data-aos="fade-right" >
<%-- 	        <img class="img-responsive" src="${vo.c_file}" alt="Photo" > --%>
<!-- 		<h3><span style="color: #66BB7A; font-weight: bold;" style="width:100px;">[후기 제목]</span>  -->
			<h3>
			<div class="form-group" >
				<label for="exampleInputEmail1" style="color: #66BB7A; font-weight: bold;" style="width:100px; margin-left:20px; ">후기 제목 </label>
				<input type="text" class="form-control" name="b_title" value="${boardChallenge.b_title }" style="padding-left:10px; margin-left:30px; width:300px;'">
			</div>
			</h3>
		<h4>
<%-- 		<span style="color: #66BB7A; font-weight: bold;">[작성자]</span> ${boardChallenge.b_writer } --%>
			<div class="form-group">
				<label for="exampleInputPassword1" style="color: #66BB7A; font-weight: bold;" style="width:100px;" >작성자</label>
				<input type="text" class="form-control" name="b_writer" value="${boardChallenge.b_writer }" style="padding-left:10px; width: 150px; margin-left:30px; " readonly>
			</div>
		</h4>
		<h4>
			<label for="exampleInputPassword1" style="color: #66BB7A; font-weight: bold;" style="width:100px;" >후기 내용</label>
	        <textarea class="form-control" rows="3" style="margin-top:15px; width: 600px; height: 280px" readonly>${boardChallenge.b_content }</textarea>
		</h4>
		</div>
		
     	<input type="hidden" name="bno" value="${boardChallenge.bno }">
     	<input type="hidden" name="cno" value="${boardChallenge.cno }">
	
	 <div class="box-footer">
          <input type="submit" value="수정하기" class="btn btn-block btn-success btn-sm" style="width:218px; margin-left: 950px;">
          <input class="btn btn-block btn-success btn-lg" type="button" value="메인가기" onclick="location.href='/commumain';" style="width:218px; margin-left: 950px;">
     </div>
	</form>
	</div>
</div>



<%@ include file="../include/footer.jsp"%>
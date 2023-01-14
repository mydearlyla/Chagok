<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>

<h1>후기글 남기기</h1>
<div class="box box-info">

	<div class="box-body">
		<form role="form" action="/review" method="post">
		<div class="input-group">
		
			
				<c:if test="${review.c_sort eq 0 }">
					<c:set var="sort" value="저축형"/>
				</c:if>
				<c:if test="${review.c_sort eq 1 }">
					<c:set var="sort" value="절약형"/>
				</c:if>
				
			<span class="input-group-addon"> 챌린지 유형 </span> 
			<span class="input-group-addon"> ${sort } </span> 

		</div>
		<div class="input-group" >
			
			<span class="input-group-addon"> 챌린지 제목 </span>
			<span class="input-group-addon"> ${review.c_title } </span>
		</div>
		<div class="input-group" >
		<span class="input-group-addon"> 후기 제목 </span>
		<input type="text" class="form-control" name="b_title" /> 
		</div>

		<hr>

		<div class="row">
	<div class="col-lg-6">
		<div class="input-group">
			<span class="input-group-addon"> 
				챌린지 기간
			</span> 
			<input type="text" class="form-control" value="${review.c_period }" readonly> 
		</div>

	</div>

	<div class="col-lg-6">
		<div class="input-group">
			<span class="input-group-addon"> 
				챌린지 성공인원
			</span> 
			<input type="text" class="form-control"  value="${Success }명" readonly> 
		</div>

	</div>
	<div class="col-lg-6">
		<div class="input-group">
			<span class="input-group-addon"> 
				작성자
			</span> 
			<input type="text" class="form-control" name="b_writer"  value="${nick }" readonly>
		</div>

	</div>

	<div class="col-lg-6">
		<div class="input-group">
			<span class="input-group-addon"> 
				챌린지 기간	
			</span> 
			<input type="text" class="form-control" value="<fmt:formatDate value="${c_end }" pattern="YYYY-MM-dd"/>"  readonly/>
		</div>

	</div>

</div>
	<hr>
	<h5> 후기 </h5>
	
	<textarea rows="15" cols="100" name="b_content" style="resize: none;"></textarea>
	
	 <div class="box-footer">
          <button type="submit" class="btn btn-primary" >글쓰기</button>
          <input class="btn btn-block btn-success btn-lg" type="button" value="메인가기" onclick="location.href='/commumain';" style="width:218px; margin-left: 950px;">
     </div>
     <input type="hidden" name="b_sort" value="1">
	</form>
	</div>
</div>



<%@ include file="../include/footer.jsp"%>
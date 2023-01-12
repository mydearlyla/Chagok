<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<h1> 공지사항 상세 </h1>

<form role="form" method="post">
	<input type="hidden" name="bno" value="${vo.bno }">
</form>
	 <div class="row" style="width: 1200px; padding-left: 50px; padding-right: 20px; padding-top: 50px;">
	    <div class="d-flex justify-content-center">
		    <div class="box">
		        <div class="col-md-12 text-center" style="background: #FAF8F1; height: 50px; text-align:left;">
				    	<h4 style="marfin-top: 14px;">
						<span style="color: #10A19D; text-align:left;">제목 | ${vo.b_title }</span>
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

				    	<span style="color: #10A19D; text-align:right;">글쓴이 | ${vo.b_writer }</span>
				    	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				    	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				    	<span style="color: #10A19D; text-align:right;">작성일 | <fmt:formatDate value="${vo.b_date }" pattern="yyyy-MM-dd"/></span>
				    	</h4>
		    	</div>
        <div class="form-group" style="padding-top: 50px; padding-left: 36px; width: 1100px; margin-bottom: 30px;">
           	<span style = "font-size: 16px; font-family: 'Pretendard','Source Sans Pro', sans-serif;">
           		<strong>
           		
           		</strong>
           	</span>
				 <textarea class="form-control" rows="3" style="margin-top:15px;" readonly>${vo.b_content }</textarea>
        </div>
		    </div>
		</div>
		<div class="box-footer">
	<c:if test="${nick.equals('관리자') }">
        <input class="btn btn-block btn-success btn-lg" type="button" value="수정하기" onclick="location.href='/noticeupdate?bno=${vo.bno}';" style="width:218px; margin-left: 950px;">
        <input class="btn btn-warning" type="submit" value="삭제하기" style="background-color: #1e282c; width:218px; margin-left: 950px;">
	</c:if>
        <input class="btn btn-block btn-success btn-lg" type="button" value="돌아가기" onclick="location.href='/notice';" style="width:218px; margin-left: 950px;">
		</div>
    </div>
        
        <script>
			$(document).ready(function(){
				var formObj = $("form[role='form']");
				
				
				$(".btn-warning").click(function(){
					formObj.attr("action","/noticedelete");
					formObj.submit();
				});
				
			});
		</script>
        
<%@ include file="../include/footer.jsp"%>

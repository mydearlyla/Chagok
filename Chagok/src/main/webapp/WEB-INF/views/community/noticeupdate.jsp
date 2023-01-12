<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<h1> 공지사항 수정 </h1>

<form role="form" method="post">
	 <div class="row" style="width: 1200px; padding-left: 50px; padding-right: 20px; padding-top: 50px;">
	    <div class="d-flex justify-content-center">
		    <div class="box">
		        <div class="col-md-12 text-center" style="background: #FAF8F1; height: 50px;">
				    	<h4 style="marfin-top: 14px;">
						<span style="color: #10A19D;" class="text-left">
							제목 | <input type="text" name="b_title" value="${board.b_title }"> 
						</span>
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						
						
				    	<span style="color: #10A19D;"class = "text-right">글쓴이 | ${board.b_writer }</span>
				    	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				    	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				    	<span style="color: #10A19D;"class = "text-right">작성일 | <fmt:formatDate value="${board.b_date }" pattern="yyyy-MM-dd"/></span>
				    	</h4>
		    	</div>
        <div class="form-group" style="padding-top: 50px; padding-left: 36px; width: 1100px; margin-bottom: 30px;">
           	<span style = "font-size: 16px; font-family: 'Pretendard','Source Sans Pro', sans-serif;">
           		<strong>
           		
           		</strong>
           	</span>
				 <textarea class="form-control" rows="3" name="b_content" style="margin-top:15px;">${board.b_content }</textarea>
        		 </div>
		    </div>
		</div>
    </div>
        <input class="btn btn-block btn-success btn-lg" type="submit" value="수정하기" onclick="location.href='/noticeupdate?bno=${board.bno}';" style="width:218px; margin-left: 950px;">
        <input class="btn btn-block btn-success btn-lg" type="button" value="돌아가기" onclick="location.href='/notice';" style="width:218px; margin-left: 950px;">
</form>

<%@ include file="../include/footer.jsp"%>
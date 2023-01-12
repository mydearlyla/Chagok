<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<h1> 공지사항 작성 </h1>
	 <div class="row" style="width: 1200px; padding-left: 50px; padding-right: 20px; padding-top: 50px;">
		<form role="form" action="/noticewrite" method="post">
	    <div class="d-flex justify-content-center">
		    <div class="box">
		        <div class="col-md-12 text-center" style="background: #FAF8F1; height: 50px;">
				    	<h4 style="marfin-top: 14px;">
						<span style="color: #10A19D; text-align:left">제목 |
							<input type="text" name="b_title">  
						</span>
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				    	<span style="color: #10A19D; text-align: right;"> 작성자 |
				    		<input type="text" name="b_writer" value="${nick }" readonly>
				    	</span>
<!-- 				    	<span style="color: #10A19D;">작성일 | -->
<!-- 				    		 <input type="" name="b_date"> -->
<!-- 				    	 </span> -->
				    	</h4>
		    	</div>
        <div class="form-group" style="padding-top: 50px; padding-left: 36px; width: 1200px; margin-bottom: 30px;">
           	<span style = "font-size: 16px; font-family: 'Pretendard','Source Sans Pro', sans-serif; text-align: right;">
           		<strong>
           		
           		</strong>
           	</span>
				 <textarea class="form-control" rows="3" style="margin-top:15px;" name="b_content" placeholder="내용을 작성해주세요"></textarea>
        		 </div>
		    </div>
		</div>
		<input type="hidden" value="2" name="b_sort" >
        <input class="btn btn-block btn-success" type="submit" value="작성하기" style="width:218px; margin-left: 950px;">
        <input class="btn btn-block btn-success btn-lg" type="button" value="돌아가기" onclick="location.href='/notice';" style="width:218px; margin-left: 950px;">
</form>
    </div>
		

<%@ include file="../include/footer.jsp"%>

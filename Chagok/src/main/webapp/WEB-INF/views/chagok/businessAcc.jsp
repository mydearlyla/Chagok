<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>

<!-- 전체 페이지 (밑부분 스타일까지) 긁어가야 합니다~ -->
<!-- 전체 페이지 (밑부분 스타일까지) 긁어가야 합니다~ -->
			
 <head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="../assets/css/theme.min.css">
 
 <style>
.board_wrap {
	width: 1000px;
	margin: 50px;
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
.table.table-hover {
    width: 90%;
    border-bottom: 1px solid #ddd;
    border-top: 2px solid #66BB7A;
    margin-right: auto;
    margin-left: auto;
}
.btn {
	width: auto;
	display: inline-block;
	adding: 3px 10px 0 10px;
	border: none;
	color: #fff;
}
.board_page {
	width: 90%;
    display: inline-block;
}
</style>

 </head>




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



 <body>
 <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
 <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
 <script src="../assets/js/theme.min.js"></script>

<!-- 게시판 안내 -->
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="board_wrap">
			<div class="board_title">
				<strong>차곡 계좌 관리</strong>
					<p>관리자 전용 페이지입니다.</p>
			</div>
		</div>
	</div>
<!-- 게시판 안내 -->			
				
<!-- 게시판 내용 -->				
	<table class="table table-hover">
	  <thead style="background-color: #dddddd30;font-size: 16px;">
		    <tr>
		      <th scope="col" style="text-align:center; padding: 15px 0;">no.</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">거래일시</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">내용</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">출금</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">입금</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">잔액</th>
	    	</tr>
	  </thead>
		<tbody>
			<c:forEach items="${bizList }" var="biz">
			    <tr>
			      <td style="text-align:center; padding: 15px 0;">${biz.bizno }</td>
			      <td style="text-align:center; padding: 15px 0;">
						<fmt:formatDate value="${biz.biz_date }" pattern="yyyy-MM-dd hh:mm" type="both"/>				      
			      </td>
			      <td style="text-align:center; padding: 15px 0;">${biz.biz_holder_name }</td>
			      
					<c:if test="${biz.biz_inout==1 }">
						<td style="text-align:center; padding: 15px 0;">-<fmt:formatNumber value="${biz.biz_amount }"/></td>
						<td style="text-align:center; padding: 15px 0;"></td>
					</c:if>
					<c:if test="${biz.biz_inout==2 }">
						<td style="text-align:center; padding: 15px 0;"></td>					
						<td style="text-align:center; padding: 15px 0;">+<fmt:formatNumber value="${biz.biz_amount }"/></td>
					</c:if>
			      <td style="text-align:center; padding: 15px 0;"><fmt:formatNumber value="${biz.biz_balance }"/>원</td>
			    </tr>
	    	</c:forEach>   
		</tbody>
	</table>
<!-- 게시판 내용 -->

					
<!-- 페이징 -->					
		  <div class="board_page">
                	<ul class= "pagination pagination-sm no-margin pull-right">
					<c:if test="${pagevo.prev }">
			            <li><a href="/bizAccount?page=${pagevo.startPage-1 }">«</a></li>
			        </c:if>
					<c:forEach var="idx" begin="${pagevo.startPage }" end="${pagevo.endPage }" step="1">
						<li
							<c:out value="${idx == pagevo.cri.page? 'class=active':'' }"/>
							>
							<a href="/bizAccount?page=${idx }">${idx }</a>
						</li>
					</c:forEach>
			        <c:if test="${pagevo.next }">
			            <li><a href="/bizAccount?page=${pagevo.endPage+1 }">»</a></li>
			        </c:if>
                </ul>
           </div>
 <!-- 페이징 -->
 
 </body>

</div>
<%@ include file="../include/footer.jsp"%>
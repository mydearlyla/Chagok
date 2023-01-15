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

<script>
	$(function(){
		$(".btn").click(function(){
			var cno = $(this).children().val();
			var status = 0;
			if($(this).children().hasClass("confirm")){
				status=1;
			}
			else if ($(this).children().hasClass("reject")){
				status=6;
			}
			
			$.ajax({
				type : "get",
				url : "/confirm",
				data : {
					status : status,
					cno : cno
				},
				dataType: "json",
				success : function(data){
					console.log(data);
					if (data==1){
					   Swal.fire({
					        title: '승인 완료!', 
					        icon: 'success'
				   	   });		
						document.location.reload();
					} else if (data==6){
						   Swal.fire({
						        title: '거절 완료!', 
						        icon: 'success'
					   	   });	
						document.location.reload();
					}
				}
			});
			
		});
	});
</script> 


 <body>
 <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
 <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
 <script src="../assets/js/theme.min.js"></script>

<!-- 게시판 안내 -->
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="board_wrap">
			<div class="board_title">
				<strong>챌린지 관리</strong>
					<p>관리자 전용 페이지입니다.</p>
			</div>
		</div>
	</div>
<!-- 게시판 안내 -->			
				
<!-- 게시판 내용 -->				
	<table class="table table-hover">
	  <thead style="background-color: #dddddd30;font-size: 16px;">
		    <tr>
		      <th scope="col" style="text-align:center; padding: 15px 0;">챌린지 번호</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">분류</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">챌린지명</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">참여기간</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">인원현황</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">상태</th>
		      <th scope="col" style="text-align:center; padding: 15px 0; width:15%;">승인 / 거절</th>
	    	</tr>
	  </thead>
		<tbody>
			<c:forEach items="${chListAll }" var="cl">
			    <tr>
			      <td style="text-align:center; padding: 15px 0;">${cl.cno }</td>
			      <td style="text-align:center; padding: 15px 0;">
						<c:choose>
							<c:when test="${cl.c_sort eq 0 }">저축형</c:when>
							<c:when test="${cl.c_sort eq 1 }">절약형</c:when>
						</c:choose>				      
			      </td>
			      <td style="text-align:center; padding: 15px 0;">
						<c:choose>
							<c:when test="${cl.c_sort eq 0 }"><a href="/challenge/plusdetail?cno=${cl.cno }">${cl.c_title }</a>
							</c:when>
							<c:when test="${cl.c_sort eq 1 }"><a href="/challenge/minusdetail?cno=${cl.cno }">${cl.c_title }</a>
							</c:when>
						</c:choose>				      
			      </td>
			      <td style="text-align:center; padding: 15px 0;">${cl.c_period }주</td>
			      <td style="text-align:center; padding: 15px 0;">${cl.c_cnt } / ${cl.c_pcnt }</td>
			      <td style="text-align:center; padding: 15px 0;">
						<c:choose>
							<c:when test="${cl.c_status eq 0 }">승인 대기</c:when>
							<c:when test="${cl.c_status eq 1 }">모집중</c:when>
							<c:when test="${cl.c_status eq 2 }">진행중</c:when>
							<c:when test="${cl.c_status eq 3 }">챌린지 성공</c:when>
							<c:when test="${cl.c_status eq 4 }">챌린지 실패</c:when>
							<c:when test="${cl.c_status eq 5 }">모집 실패</c:when>
							<c:when test="${cl.c_status eq 6 }">승인 거절</c:when>
							<c:when test="${cl.c_status eq 7 }">챌린지 종료</c:when>
						</c:choose>     				      
			      </td>
			      <td style="text-align:center">
						<c:if test="${cl.c_status eq 0 }">
							<button type="button" class="btn" style="background-color:#66BB7A;">승인
								<input type="hidden" value="${cl.cno }" class="cno confirm">
							</button>
							<button type="button" class="btn" style="background-color:#dd4b39;">거절
								<input type="hidden" value="${cl.cno }" class="cno reject">
							</button>
						</c:if>			      
			      
			      </td>
			    </tr>
	    	</c:forEach>   
		</tbody>
	</table>
<!-- 게시판 내용 -->

					
<!-- 페이징 -->					
		  <div class="board_page">
                	<ul class= "pagination pagination-sm no-margin pull-right">
					<c:if test="${pagevo.prev }">
			            <li><a href="/chManagement?page=${pagevo.startPage-1 }">«</a></li>
			        </c:if>
					<c:forEach var="idx" begin="${pagevo.startPage }" end="${pagevo.endPage }" step="1">
						<li
							<c:out value="${idx == pagevo.cri.page? 'class=active':'' }"/>
							>
							<a href="/chManagement?page=${idx }">${idx }</a>
						</li>
					</c:forEach>
			        <c:if test="${pagevo.next }">
			            <li><a href="/chManagement?page=${pagevo.endPage+1 }">»</a></li>
			        </c:if>
                </ul>
           </div>
 <!-- 페이징 -->
 
 </body>

<script>
$(document).ready(function(){
	$('.detail').click(function(){
		  var obj = $(this);
		  if( obj.hasClass("plus") ){
		    obj.hide();
		    obj.next().show();            
		    obj.parent().parent().next().show();
		  }else{
		     obj.hide();
		     obj.prev().show();
		     obj.parent().parent().next().hide();
		  }
// 		});
	})
})


</script>

</div>
<%@ include file="../include/footer.jsp"%>
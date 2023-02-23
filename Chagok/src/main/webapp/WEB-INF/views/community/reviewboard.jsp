<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<html lang="ko">
	

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


			
 <head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="../assets/css/theme.min.css">

<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

	<script type="text/javascript">
		var result = '${result}';
		if(result == 'createOK'){
			Swal.fire({
				title: '글쓰기 완료!', 
				icon: 'success'
			});
		}
		
		if(result == 'modOK'){
			Swal.fire({
				title: '수정 완료!', 
				icon: 'success'
			});
		}
		
		if(result == 'delOK'){
			Swal.fire({
				title: '삭제 완료!', 
				icon: 'success'
			});
		}
		
</script>
	
</head>
<body>
 <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
 <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
 <script src="../assets/js/theme.min.js"></script>	
 

	 	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="board_wrap">
				<div class="board_title">
					<strong> 후기 </strong>
		     	   <p> 참여한 챌린지에 남긴 후기를 보는 곳입니다</p>
				</div>
			</div>
		</div>
 
 			<table class="table table-hover" style="margin-left:10px; border-bottom: 1px solid #ddd;border-top: 2px solid #66BB7A;">
			  <thead style="background-color: #dddddd30;font-size: 16px;">
			    <tr>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">글 번호</th>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 10%;">카테고리</th>
			      <th scope="col" style="text-align:center; padding: 15px 0;">챌린지 제목</th>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">작성자</th>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">챌린지 기간</th>
			      <th scope="col" style="text-align:center; padding: 15px 0; width: 15%;">작성일</th>
			    </tr>
			  </thead>
			  
			<c:forEach var="vo" items="${boardList2 }">
			
				<c:if test="${vo.c_sort eq 0 }">
					<c:set var="sort" value="저축형"/>
				</c:if>
				<c:if test="${vo.c_sort eq 1 }">
					<c:set var="sort" value="절약형"/>
				</c:if>
				
			</c:forEach>
			  
			<tbody>
				
				<c:set var="boardno" value="${count - ((pageMaker.startPage-1)*10) }"></c:set>
				<fmt:parseNumber var="boardno" value="${count }" type="number" />
				<c:forEach items="${boardList2 }" var="boardList2"  begin="0" end="10" step="1" >
						    <tr>
						      <th scope="row" style="text-align:center; padding: 15px 0;">${boardno }</th>
						      <th scope="row" style="text-align:center; padding: 15px 0;">[${sort }]</th>
						      <td style="text-align:center; padding: 15px 0;"><a href="/reviewcontent?bno=${boardList2.bno }&cno=${boardList2.cno}">${boardList2.c_title }</a></td>
						      <th scope="row" style="text-align:center; padding: 15px 0;"> ${boardList2.b_writer}</th>
						      <th scope="row" style="text-align:center; padding: 15px 0;"> ${boardList2.c_period } 주</th>
							  <td style="text-align:center; padding: 15px 0;"><fmt:formatDate value="${boardList2.b_date }" pattern="yyyy-MM-dd"/></td>
						    </tr>
				<c:set var="boardno" value="${boardno - 1 }"></c:set>
                </c:forEach>
            
<%-- 			<c:if test="${param.page.equals('1')}"> --%>
<%-- 				<c:set var="boardno" value="${boardList2.size() }"></c:set> --%>
<%-- 				<fmt:parseNumber var="boardno" value="${boardno }" type="number" /> --%>
<%-- 				<c:forEach items="${boardList2 }" var="boardList2"  begin="0" end="10" step="1" > --%>
<!-- 						    <tr> -->
<%-- 						      <th scope="row" style="text-align:center; padding: 15px 0;">${boardno + 10 }</th> --%>
<%-- 						      <th scope="row" style="text-align:center; padding: 15px 0;">[${sort }]</th> --%>
<%-- 						      <td style="text-align:center; padding: 15px 0;"><a href="/reviewcontent?bno=${boardList2.bno }&cno=${boardList2.cno}">${boardList2.c_title }</a></td> --%>
<%-- 						      <th scope="row" style="text-align:center; padding: 15px 0;"> ${boardList2.b_writer}</th> --%>
<%-- 						      <th scope="row" style="text-align:center; padding: 15px 0;"> ${boardList2.c_period } 주</th> --%>
<%-- 							  <td style="text-align:center; padding: 15px 0;"><fmt:formatDate value="${boardList2.b_date }" pattern="yyyy-MM-dd"/></td> --%>
<!-- 						    </tr> -->
<%-- 				<c:set var="boardno" value="${boardno -1 }"></c:set> --%>
<%--                 </c:forEach> --%>
<%--             </c:if> --%>
<%-- 			<c:if test="${param.page.equals('2')}"> --%>
<%-- 				<c:set var="boardno" value="${boardList2.size() }"></c:set> --%>
<%-- 				<fmt:parseNumber var="boardno" value="${boardno }" type="number" /> --%>
<%-- 				<c:forEach items="${boardList2 }" var="boardList2"  begin="0" end="10" step="1" > --%>
<!-- 						    <tr> -->
<%-- 						      <th scope="row" style="text-align:center; padding: 15px 0;">${boardno }</th> --%>
<%-- 						      <th scope="row" style="text-align:center; padding: 15px 0;">[${sort }]</th> --%>
<%-- 						      <td style="text-align:center; padding: 15px 0;"><a href="/reviewcontent?bno=${boardList2.bno }&cno=${boardList2.cno}">${boardList2.c_title }</a></td> --%>
<%-- 						      <th scope="row" style="text-align:center; padding: 15px 0;"> ${boardList2.b_writer}</th> --%>
<%-- 						      <th scope="row" style="text-align:center; padding: 15px 0;"> ${boardList2.c_period } 주</th> --%>
<%-- 							  <td style="text-align:center; padding: 15px 0;"><fmt:formatDate value="${boardList2.b_date }" pattern="yyyy-MM-dd"/></td> --%>
<!-- 						    </tr> -->
<%-- 				<c:set var="boardno" value="${boardno -1 }"></c:set> --%>
<%--                 </c:forEach> --%>
<%--             </c:if> --%>
			</tbody>
	</table>
  <div class="board_page" style="text-align:center;" >
<!--                 	<ul class= "pagination pagination-sm no-margin pull-right" > -->
                	<ul class= "pagination pagination-sm no-margin pull-center" >
<!--                 <a href="#" class="bt first"><<</a> -->
                	<c:if test="${pageMaker.prev }">
					<li><a href="/reviewboard?page=${pageMaker.startPage-1 }"class="bt prev"><</a></li>
					</c:if>
               <c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
					<li 
						<c:out value="${idx == pageMaker.cri.page? 'class=active':'' }"/>
						><a href="/reviewboard?page=${idx }" class="num">${idx }</a></li>
				</c:forEach>
                <c:if test="${pageMaker.next }">
					<li><a href="/reviewboard?page=${pageMaker.endPage+1 }" class="bt next">></a></li>
				</c:if>
<!--                 <a href="#" class="bt last">>></a> -->
                </ul>
           </div>
          <div class="bt_wrap">
             <c:if test= "${not empty nick}">
				<input class="sbtn2" type="button" value="후기 작성하기" onclick="location.href='/challenge/mychallenge';" >
			  </c:if>
				
          </div>  
          
<!--            <div class="bt_wrap"> -->
<%--              <input class="sbtn2" type="button" value="후기작성하기" onclick="location.href='/review?cno=${boardList.cno}';" > --%>
<!-- 			</div> -->
</body>
</html>

<style>
.board_wrap {
	width: 1000px;
	margin-top: 30px;
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

</style>

</div>
<%@ include file="../include/footer.jsp"%>
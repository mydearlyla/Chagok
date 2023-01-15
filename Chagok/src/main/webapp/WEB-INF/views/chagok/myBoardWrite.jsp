<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarMyPage.jsp" %>

<head>
 
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="../assets/css/theme.min.css">
 
 <style>
.board_wrap {
	width: 1000px;
	margin: 20px auto;
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
<script type="text/javascript">
$(document).ready(function() {
    $('#b_update').click(function() {
       var val= $('#b_update').val();
   	   if() {
		   Swal.fire({
		        title: '정말 수정하시겠습니까?', 
		        icon: 'warning'
		      });
   		  $(this).val('');
	   }
  	});
});

$(document).ready(function() {
    $('#b_delete').change(function() {
       var val= $('#b_delete').val();
       if() {
		   Swal.fire({
		        title: '정말 삭제하시겠습니까?', 
		        icon: 'warning'
		      });
   		  $(this).val('');
	   }
  	});
});
</script>

</head>
 <body>
 <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
 <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
 <script src="../assets/js/theme.min.js"></script>
 
 <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    <div class="board_wrap">
        <div class="board_title">
            <strong>내가 쓴 글</strong>
            <p> 내가 쓴 글을 확인할 수 있는 곳입니다</p>
     </div>
  </div>
<%--   ${boardList}            --%>
 </div>
        <table class="table table-hover" style="margin-left:10px; border-bottom: 1px solid #ddd;border-top: 2px solid #66BB7A;">
			  <thead style="background-color: #dddddd30;font-size: 16px;">
			    <tr>
			      <th scope="col" style="text-align:center; padding: 15px 0;"> 게시판 종류 </th>
			      <th scope="col" style="text-align:center; padding: 15px 0;"> 제목 </th>
				  <th scope="col" style="text-align:center; padding: 15px 0;"> 작성일 </th>
				  <th scope="col" style="text-align:center; padding: 15px 0;"> 수정 / 삭제 </th>
			    </tr>
			  </thead>
			<tbody>
								
			<c:forEach items="${boardList }" var="boardList" >
				<tr>
				<c:if test="${boardList.b_sort eq 1 }">
					<th scope="row" style="text-align:center; padding: 15px 0;">후기</th>
					<td style="text-align:center; padding: 15px 0;"><a href="/reviewcontent?bno=${boardList.bno }&cno=${boardList.cno}">${boardList.b_title }</a></td>
					<td style="text-align:center; padding: 15px 0;"><fmt:formatDate value="${boardList.b_date }" pattern="yyyy-MM-dd"/></td>
					<td style="text-align:center; padding: 15px 0;">
						<button type="submit" id="b_update" class="btn" style="background-color:#66BB7A;"
								onclick="location.href='/reviewupdate?bno=${boardList.bno}&cno=${boardList.cno }';">수정
						</button>
						/
						<button type="submit" class="btn" style="background-color:#dd4b39;"
								onclick="location.href='/reviewremove?bno=${boardList.bno}&cno=${boardList.cno }';">삭제
						</button>
					</td>
				</c:if>	
				<c:if test="${boardList.b_sort eq 3 }">
					<th scope="row" style="text-align:center; padding: 15px 0;">자유</th>
					<td style="text-align:center; padding: 15px 0;"><a href="/freeboard">${boardList.b_title }</a></td>
					<td style="text-align:center; padding: 15px 0;"><fmt:formatDate value="${boardList.b_date }" pattern="yyyy-MM-dd"/></td>
					<td style="text-align:center; padding: 15px 0;">
						<button type="submit" id="b_update" class="btn" style="background-color:#66BB7A;"
								onclick="location.href='/freeboardupdate?bno=${boardList.bno}';">수정
						</button>
						/
						<button type="submit" class="btn" style="background-color:#dd4b39;"
								onclick="location.href='/freedelete?bno=${boardList.bno}';"	>삭제
						</button>
					</td>
				</c:if>
				<c:if test="${boardList.b_sort eq 4 }">
					<th scope="row" style="text-align:center; padding: 15px 0;">뉴스 / 재테크</th>
					<td style="text-align:center; padding: 15px 0;"><a href="/economycontent?bno=${boardList.bno }">${boardList.b_title }</a></td>
					<td style="text-align:center; padding: 15px 0;"><fmt:formatDate value="${boardList.b_date }" pattern="yyyy-MM-dd"/></td>
					<td style="text-align:center; padding: 15px 0;">
						<button type="submit" id="b_update" class="btn" style="background-color:#66BB7A;"
								onclick="location.href='/economyupdate?bno=${boardList.bno}';">수정
						</button>
						/
						<button type="submit" class="btn" style="background-color:#dd4b39;"
								onclick="location.href='/economydelete?bno=${boardList.bno}';"	>삭제
						</button>
					</td>
				</c:if>
					
				</tr>
			</c:forEach>
					
			</tbody>
	</table>
	
			<div class="board_page">
                	<ul class= "pagination pagination-sm no-margin pull-right">

                	<c:if test="${pageMaker.prev }">
					<li><a href="/myBoardWrite?page=${pageMaker.startPage-1 }"class="bt prev"><</a></li>
					</c:if>
               <c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
					<li 
						<c:out value="${idx == pageMaker.cri.page? 'class=active':'' }"/>
						><a href="/myBoardWrite?page=${idx }" class="num">${idx }</a></li>
				</c:forEach>
                <c:if test="${pageMaker.next }">
					<li><a href="/myBoardWrite?page=${pageMaker.endPage+1 }" class="bt next">></a></li>
				</c:if>

                </ul>
           </div>
</body>
</html> 

</div>
<%@ include file="../include/footer.jsp" %>
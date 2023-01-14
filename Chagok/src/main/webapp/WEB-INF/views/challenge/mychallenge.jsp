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
.btn {
	width: auto;
	display: inline-block;
	adding: 3px 10px 0 10px;
	border: none;
	color: #fff;
}
</style>

 </head>

<script type="text/javascript">
	$(document).ready(function(){
		$('.btn.cancel').click(function(){
			var cno = $(this).children('.cno_hy').val();
// 			var mno = $(this).children('.mno_hy').val();
			var c_sort = $(this).children('.c_sort_hy').val();
// 			console.log("cno : "+cno);
// 			console.log("mno : "+mno);
// 			console.log("c_sort : "+c_sort);
// 			$('.location').attr("href", "/challenge/cancelChallenge?cno="+cno+"&mno="+mno+"&c_sort="+c_sort);

			$.ajax({
				type : "get",
				url : "/challenge/cancelChallenge",
				data : {
					cno : cno,
					c_sort : c_sort
				},
				dataType: "json",
				success : function(data){
					console.log(data);
					if (data==1){
						alert('참가 취소 완료!');
						document.location.reload();
					} else {
						alert('본인이 개설한 챌린지는 취소할 수 없습니다.');
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
				<strong>내 챌린지</strong>
					<p>내 챌린지</p>
			</div>
		</div>
	</div>
<!-- 게시판 안내 -->			
				
<!-- 게시판 내용 -->				
	<table class="table table-hover">
	  <thead style="background-color: #dddddd30;font-size: 16px;">
		    <tr>
		      <th scope="col" style="text-align:center; padding: 15px 0;">유형</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">카테고리</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">제목</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">기간</th>
		      <th scope="col" style="text-align:center; padding: 15px 0;">상태</th>
		      <th scope="col" style="text-align:center; padding: 15px 0; width:20%;"></th>
	    	</tr>
	  </thead>
		<tbody>
			<c:forEach var="vo" items="${mychallengeList }">
			    <tr>
					<td style="text-align:center; padding: 15px 0;">
						<c:if test="${vo.c_sort eq 0 }">저축형</c:if>
						<c:if test="${vo.c_sort eq 1 }">절약형</c:if>			      
					</td>
					<td style="text-align:center; padding: 15px 0;">${vo.ct_top }</td>
					<td style="text-align:center; padding: 15px 0;">
					<c:choose>
						<c:when test="${vo.c_status eq 0 || vo.c_status eq 1 || vo.c_status eq 3 || vo.c_status eq 4 || vo.c_status eq 5 || vo.c_status eq 6 }">
						<%-- detail페이지 이동 --%>
							<c:if test="${vo.c_sort eq 0 }">
								<a href = "/challenge/plusdetail?cno=${vo.cno }">${vo.c_title }</a>
							</c:if>
							<c:if test="${vo.c_sort eq 1 }">
								<a href = "/challenge/minusdetail?cno=${vo.cno }">${vo.c_title }</a>
							</c:if>						
						</c:when>
						<c:when test="${vo.c_status eq 2 }">
						<%-- 진행 중에만 피드 이동 --%>
							<c:if test="${vo.c_sort eq 0 }">
								<a href = "/challenge/plusFeed?cno=${vo.cno }">${vo.c_title }</a>
							</c:if>
							<c:if test="${vo.c_sort eq 1 }">
								<a href = "/challenge/minusFeed?cno=${vo.cno }">${vo.c_title }</a>
							</c:if>						
						</c:when>
						<c:otherwise>${vo.c_title }</c:otherwise>					
					</c:choose>
					</td>
					<td style="text-align:center; padding: 15px 0;">${vo.c_period }주</td>
					<td style="text-align:center; padding: 15px 0;">
					<c:choose>
						<c:when test="${vo.c_status eq 0 }">승인 대기</c:when>
						<c:when test="${vo.c_status eq 1 }">모집중</c:when>
						<c:when test="${vo.c_status eq 2 }">진행중</c:when>
						<c:when test="${vo.c_status eq 3 }">챌린지 성공</c:when>
						<c:when test="${vo.c_status eq 4 }">챌린지 실패</c:when>
						<c:when test="${vo.c_status eq 5 }">모집실패</c:when>
						<c:when test="${vo.c_status eq 6 }">승인 거절</c:when>
						<c:when test="${vo.c_status eq 7 }">챌린지 종료</c:when>
						<c:otherwise>알 수 없음</c:otherwise>
					</c:choose>
					</td>
					<td style="text-align:center;">
						<c:if test="${vo.c_status eq 1 }">
							<button type="button" class="btn cancel" style="background-color:#66BB7A;">
								참여 취소
								<input type="hidden" value="${vo.cno}" class="cno_hy">
								<input type="hidden" value="<%=session.getAttribute("mno") %>" class="mno_hy">
								<input type="hidden" value="${vo.c_sort}" class="c_sort_hy">
							</button>
						</c:if>
						
						<c:if test="${vo.c_status eq 7 }">
							<c:forEach var="result" items="${challengeResultList }">
								<c:if test="${result.finish eq 'Y' && vo.cno == result.cno }">
	 								<button type="button" class="btn" style="background-color:#66BB7A;"
	 								onclick="location.href='/challenge/success?cno=${vo.cno }';">
	 									<input type="hidden" value="${vo.cno}" class="cno_hy">
	 								결과 보기</button>
								</c:if>
								<c:if test="${result.finish eq 'N' && vo.cno == result.cno }">
	 								<button type="button" class="btn" style="background-color:#66BB7A;"
	 								onclick="location.href='/challenge/defeat?cno=${vo.cno }';">결과 보기</button>
								</c:if>		
							</c:forEach>						
							<button type="button" class="btn" style="background-color:#dd4b39;">
								후기 쓰기
							</button>
						</c:if>			
					</td>
			    </tr>
		    </c:forEach>
		</tbody>
	</table>
<!-- 게시판 내용 -->

					
<!-- 페이징 -->					
<!-- 		  <div class="board_page">
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
           </div> -->
 <!-- 페이징 -->
 
 </body>

<%@ include file="../include/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$(document).ready(function(){
		$('.btn.btn-danger.hyo').click(function(){
			var cno = $(this).children('.cno_hy').val();
			var mno = $(this).children('.mno_hy').val();
			var c_sort = $(this).children('.c_sort_hy').val();
			
// 			alert(cno);
// 			alert(mno);
// 			alert(c_sort);
			
			$('.location').attr("href", "/challenge/cancelChallenge?cno="+cno+"&mno="+mno+"&c_sort="+c_sort);
		});
	});
	
</script>

	<h1>내 챌린지</h1>
	
<%-- ${challengeResultList}  --%> <!-- 챌린지 결과 Y/N -->
<%-- 	${mychallengeList } --%>
	<div class="col-xs-12 table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th><h3>챌린지유형</h3></th>
				<th><h3>카테고리</h3></th>
				<th><h3>챌린지 제목</h3></th>
				<th><h3>챌린지 기간</h3></th>
				<th><h3>챌린지 상태</h3></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${mychallengeList }">
			<tr>
				<c:if test="${vo.c_sort eq 0 }">
				<td>저축형</td>
				</c:if>
				<c:if test="${vo.c_sort eq 1 }">
				<td>절약형</td>
				</c:if>
				<td>${vo.ct_top }</td>
				<!-- 0: 승인대기, 1 : 모집중, 5: 모집실패 -->
				<c:if test="${vo.c_status eq 0 || vo.c_status eq 1 || vo.c_status eq 3 || vo.c_status eq 4 || vo.c_status eq 5 || vo.c_status eq 6  }"> 
					<c:if test="${vo.c_sort eq 0 }">
						<td><a href = "/challenge/plusdetail?cno=${vo.cno }">${vo.c_title }</a></td>
					</c:if>
					<c:if test="${vo.c_sort eq 1 }">
						<td><a href = "/challenge/minusdetail?cno=${vo.cno }">${vo.c_title }</a></td>
					</c:if>
				</c:if>
				<c:if test="${vo.c_status eq 2 }">  <!-- 진행 중에만 피드 이동 -->
					<c:if test="${vo.c_sort eq 0 }">
						<td><a href = "/challenge/plusFeed?cno=${vo.cno }">${vo.c_title }</a></td>
					</c:if>
					<c:if test="${vo.c_sort eq 1 }">
						<td><a href = "/challenge/minusFeed?cno=${vo.cno }">${vo.c_title }</a></td>
					</c:if>
				</c:if>
			<c:forEach var="result" items="${challengeResultList }">
				<c:if test="${vo.c_status eq 7 }"> 
				<%--${ vo.cno == result.cno} --%>
					<c:if test="${result.finish eq 'Y' && vo.cno == result.cno }">
						<td><a href = "/challenge/success?cno=${vo.cno }">${vo.c_title } <span style="color: #66BB7A">결과 확인</span></a></td>
					</c:if>
					<c:if test="${result.finish eq 'N' && vo.cno == result.cno }">
						<td><a href = "/challenge/defeat?cno=${vo.cno }">${vo.c_title }  <span style="color: #66BB7A">결과 확인</span> </a></td>
					</c:if>
				</c:if>
			</c:forEach>
				<td>${vo.c_period }주</td>
				<c:if test="${vo.c_status eq 0 }">
				<td><span style="color: #000000; font-weight: bold;">승인 대기</span></td>
				</c:if>
				<c:if test="${vo.c_status eq 1 }">
				<td><span style="color: #F39C12; font-weight: bold; padding-right: 15px;">모집 중</span>
				<a href="" class="location">
				<button type="button" class="btn btn-danger hyo" style="background-color: #FFDB83; color:#ffffff; font-weight:bold;">신청 취소
					<input type="hidden" value="${vo.cno}" class="cno_hy">
					<input type="hidden" value="<%=session.getAttribute("mno") %>" class="mno_hy">
					<input type="hidden" value="${vo.c_sort}" class="c_sort_hy">
				</button>
				</a></td>
				</c:if>
				<c:if test="${vo.c_status eq 2 }">
				<td><span style="color: #00A65A; font-weight: bold;">진행 중</span></td>
				</c:if>
				<c:if test="${vo.c_status eq 3 }">
				<td><span style="color: #3498DB; font-weight: bold;">챌린지 성공</span></td>
				</c:if>
				<c:if test="${vo.c_status eq 4 }">
				<td><span style="color: #DD4B39; font-weight: bold;">챌린지 실패</span></td>
				</c:if>
				<c:if test="${vo.c_status eq 5 }">
				<td><span style="color: #444444; font-weight: bold;">모집 실패</span></td>
				</c:if>
				<c:if test="${vo.c_status eq 6 }">
				<td><span style="color: #444444; font-weight: bold;">승인 거절</span></td>
				</c:if>
				<c:if test="${vo.c_status eq 7 }">
				<td><span style="color: #444444; font-weight: bold;">챌린지 종료</span></td>
				</c:if>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
	
	
	</div>
<%@ include file="../include/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarMyPage.jsp" %>

<script type="text/javascript">

</script>


<div class="box box-primary" style="margin: 15px 0 0 100px; width: 50%; border-top-color: #FFDB83;">
<h2 class="profile-username text-center">마 이 페 이 지</h2><br>
	<div class="box-body box-profile">
	
		<img class="profile-user-img img-responsive img-circle"
			<c:if test="${userVO.profile != null }">
	        	src="${pageContext.request.contextPath }/resources${userVO.profile }" alt="User profile picture"
	        </c:if>
	        <c:if test="${minusPeoList.profile == null }">
	        	src="https://ptetutorials.com/images/user-profile.png" alt="User profile picture"
	        </c:if>
				style="margin: 0 auto;" width="200px" height="200px">
		
		<br><br>
		<h3 class="profile-username text-center">${userVO.nick }</h3>
		
		<form action="/myPageUpdate" method="get" id="form">
			<input type="hidden" value="${userVO.mno }" name="mno">
		<ul class="list-group list-group-unbordered">
			<li class="list-group-item"><b>아이디</b> 
				<a class="pull-right">${userVO.id } </a>
			</li>
			<!-- <li class="list-group-item"><b>비밀번호</b> 
				<a class="pull-right">
					<button type="button" class="btn btn-block btn-default btn-flat" style="padding: 0 10px 0 10px;">비밀번호 변경</button>
				</a>
			</li> -->
			<li class="list-group-item"><b>가입일</b> 
				<a class="pull-right">${userVO.regdate }</a>
			</li>
			<li class="list-group-item"><b>전화번호</b> 
				<a class="pull-right">${userVO.tel }</a>
			</li>
			<li class="list-group-item"><b>예금주명</b> 
				<a class="pull-right">${userVO.rname }</a>
			</li>
			<li class="list-group-item"><b>환불계좌</b> 
				<a class="pull-right">${userVO.rbank } &nbsp;&nbsp;&nbsp; ${userVO.raccount }</a>
			</li>
			<li class="list-group-item"><b>챌린지 성공 횟수</b> 
				<a class="pull-right">${userVO.success_cnt }</a>
			</li>
			<li class="list-group-item"><b>핀테크 연동 여부</b> 
				<c:if test="${userVO.isCheck.equals('Y')}">
					<a class="pull-right">연동 완료</a>
				</c:if>
				<c:if test="${userVO.isCheck.equals('N')}">
					<a class="pull-right">연동이 필요합니다</a>
				</c:if>
			</li>
		</ul>
			<a href="#" class="btn btn-primary btn-block ym" style="background-color: #FFDB83; border-color: #FFDB83; 
			font-size: 20px; letter-spacing: 5px;">
			<input type="submit" value="회원정보 수정" style="background-color: #FFDB83; border-color: #FFDB83; border: none;">
			</a>
		</form>
	</div>

</div>




</div>
<%@ include file="../include/footer.jsp" %>


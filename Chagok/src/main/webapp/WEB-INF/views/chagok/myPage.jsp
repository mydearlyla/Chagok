<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarMyPage.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$('.btn.btn-primary.btn-block.ym').click(function(){
			
			if ( $('#tel').val() == "" ) {
				alert('전화번호를 입력하세요.')
			} else if ( $('#rname').val() == "" ) {
				alert('환불계좌 예금주명을 입력하세요.');
			} else if ( $('#rbank').val() == "" ) {
				alert('환불계좌 은행을 입력하세요.');
			} else if ( $('#rname').val() == "" ) {
				alert('환불계좌 계좌번호를 입력하세요.');
			} else {
				var check = confirm("환불계좌 정보는 수정이 불가능합니다.\n등록 하시겠습니까?");
				
				if (check) {
					$('#form').submit();
				}
			}
			
			
		});
	});
</script>


<div class="box box-primary" style="margin: 15px 0 0 100px; width: 50%; border-top-color: #FFDB83;">
<h2 class="profile-username text-center">마 이 페 이 지</h2><br>
	<div class="box-body box-profile">
		<img class="profile-user-img img-responsive img-circle"
			src="${pageContext.request.contextPath }/resources/dist/img/user4-128x128.jpg" alt="User profile picture"
			style="margin: 0 auto;" width="200px" height="200px">
		<h3 class="profile-username text-center">${userVO.nick }</h3>
		
		<form action="/myPage" method="post" id="form">
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
				<c:if test="${userVO.tel == null}">
					<a class="pull-right">
						<input type="text" id="tel" name="tel" placeholder="'-' 없이 입력하세요." style="text-align: center;">
					</a>
				</c:if>
				<c:if test="${userVO.tel != null}">
					<a class="pull-right">${userVO.tel }</a>
				</c:if>
			</li>
			<li class="list-group-item"><b>예금주명</b> 
				<c:if test="${userVO.rname == null}">
					<a class="pull-right">
						<input type="text" id="rname" name="rname" placeholder="예금주명을 입력하세요." style="text-align: center;">
					</a>
				</c:if>
				<c:if test="${userVO.rname != null}">
					<a class="pull-right">${userVO.rname }</a>
				</c:if>
			</li>
			<li class="list-group-item"><b>환불계좌</b> 
				<c:if test="${userVO.rbank == null or userVO.raccount == null }">
					<a class="pull-right">
						<input type="text" id="rbank" name="rbank" placeholder="은행명" style="text-align: center;">
						<input type="text" id="raccount" name="raccount" placeholder="'-' 없이 입력하세요." style="text-align: center;">
					</a>
				</c:if>
				<c:if test="${userVO.rbank != null and userVO.raccount != null }">
					<a class="pull-right">${userVO.rbank } &nbsp;|&nbsp; ${userVO.raccount }</a>
				</c:if>
			</li>
			<li class="list-group-item"><b>챌린지 성공 횟수</b> 
				<a class="pull-right">${userVO.success_cnt }</a>
			</li>
			<li class="list-group-item"><b>핀테크 연동 여부</b> 
				<c:if test="${userVO.isCheck.equals('Y')}">
					<a class="pull-right">O</a>
				</c:if>
				<c:if test="${userVO.isCheck.equals('N')}">
					<a class="pull-right">X</a>
				</c:if>
			</li>
		</ul>
		</form>
		
		<c:if test="${userVO.tel == null}"> 
			<a href="#" class="btn btn-primary btn-block ym" style="background-color: #FFDB83; border-color: #FFDB83;"><b>저 장</b></a>
		</c:if>
		<c:if test="${userVO.tel != null}"> 
			<a href="javascript: history.back();" class="btn btn-primary btn-block" style="background-color: #FFDB83; border-color: #FFDB83;"><b>돌 아 가 기</b></a>
		</c:if>
	</div>

</div>




</div>
<%@ include file="../include/footer.jsp" %>

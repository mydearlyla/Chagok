<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarMyPage.jsp" %>




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



<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#pw2').blur(function(){
			
			var pw = $('#pw').val();
			var pw2 = $('#pw2').val();
			
			var jsonPW = {"pw":pw,"pw2":pw2};
			
			$.ajax({
				type : 'post',
				url : '/checkPW',
					dataType : 'text',
				data : jsonPW,
				success : function(data) {
					if (data == "1") {
						$('#ajaxcall').text("비밀번호가 일치합니다.");
						$('#ajaxcall').css("color", "green");
// 						$('#form').submit();
						$('.btn.btn-primary.btn-block.ym').attr("href", "javascript:formSubmit();")
						
					} else if (data == "2") {
						$('#ajaxcall').text("비밀번호를 다시 확인하세요.");
						$('#ajaxcall').css("color", "red")
					}
				}, error : function (data){
					console.log(data);
				}
				
				
			});
			
			
		});
	});
	
	function formSubmit() {
		$('#form').submit()
	}

</script>

<script type="text/javascript">
	if ( ${deleteOK.equals("NO") } ) {
	   Swal.fire({
	        title: '비밀번호가 틀렸습니다!', 
	        icon: 'warning'
   	   });
	}
</script>

삭제 ${deleteOK }
<div class="box box-primary" style="margin: 15px 0 0 100px; width: 50%; border-top-color: #FFDB83;">
<h2 class="profile-username text-center">회 원 탈 퇴</h2><br>
	<div class="box-body box-profile">
		<img class="profile-user-img img-responsive img-circle"
			src="${pageContext.request.contextPath }/resources/dist/img/user4-128x128.jpg" alt="User profile picture"
			style="margin: 0 auto;" width="200px" height="200px">
		<h3 class="profile-username text-center">${userVO.nick}</h3>
		
		<form action="/unregist" method="post" id="form">
			<input type="hidden" value="${userVO.mno }" name="mno">
		<ul class="list-group list-group-unbordered">
			<li class="list-group-item"><b>아이디</b> 
				<a class="pull-right">${userVO.id } </a>
			</li>
			<li class="list-group-item"><b>비밀번호</b> 
				<a class="pull-right">
					<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요." style="text-align: center;">
				</a>
			</li>
			<li class="list-group-item"><b>비밀번호 확인</b> 
				<a class="pull-right">
					<input type="password" name="pw2" id="pw2" placeholder="비밀번호를 입력하세요." style="text-align: center;">
				</a>
				<a class="pull-right">
					<!-- <div style="margin-right: 10px;">비밀번호가 일치하지 않습니다! </div> -->
					<div style="margin-right: 10px;" id="ajaxcall"></div>
				</a>
			</li>
		</ul>
		</form>
		
		<a href="#" class="btn btn-primary btn-block ym" style="background-color: #FFDB83; border-color: #FFDB83;"><b>탈 퇴 하 기</b></a>
	</div>

</div>




</div>
<%@ include file="../include/footer.jsp" %>
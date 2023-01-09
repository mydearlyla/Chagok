<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Chagok | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="${pageContext.request.contextPath }/resources/plugins/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/iconicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/iCheck/square/blue.css">
  <!-- jQuery 3 -->
  <script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jquery.min.js"></script> 
  <!-- login 유효성 검사 -->
  <script src="${pageContext.request.contextPath }/resources/plugins/duplicate/login.js"></script>
  <!-- textstyle.css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/duplicate/textstyle.css">
  
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
  
  <!-- sweetalert -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
  	<a href="#" style="font-family: 'Hi Melody', cursive;"><img src="${pageContext.request.contextPath }/resources/plugins/img/chagok_pig-removebg.png"><b>차곡</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg" style="font-family: 'Gowun Dodum', sans-serif; font-size: 18px;"><b>로그인</b></p>
	<!-- <p class="login-box-msg">Sign in to start your session</p> -->
	
    <form action="/login" method="post"> 
      <div class="form-group has-feedback">
        <input type="email" class="form-control" id="username" name="username" placeholder="이메일">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
              <div class="remember-me">
              <input type="checkbox" name="remember-me" id="remember-me"><label for="remember-me">로그인 상태 유지 </label>
              </div>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-12">
          <div class="checkbox icheck">
          </div>
        </div>
        <div class="col-xs-12 pull-right">
<!--           <button type="button" class="btn btn-primary btn-block btn-flat" onclick="f_loginCheck();">로그인</button> -->
          <input type="submit" class="btn btn-primary btn-block btn-flat" value="로그인"/>
        </div>
        <!-- /.col -->
      </div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    <!-- /.social-auth-links -->

    <a href="#">비밀번호 찾기</a><br>
    <a href="/register" class="text-center">회원 가입</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<script type="text/javascript">
// function f_loginCheck(){
// 	var id = $('input[name=id]').val();
// 	var pw = $('input[name=pw]').val();
	
// 	var loginData = {"id":id, "pw":pw};
// 	console.log(id);
// 	console.log(pw);
// 	console.log(loginData);
// 	$.ajax({
// 		type : "post", // 서버에 전송하는 http방식
//   		 url :"/login", // 서버 요청 url
//  		 dataType : "application/json", //서버로 부터 응답받을 데이터의 형태 
//   		 data : JSON.stringify(loginData), // 서버로 전송할 데이터 // 위에서 지정한 const id 
// 		 success : function(result){
// 			console.log('통신 성공! ' + result);
// // 			if(result == 0){
// // 				Swal.fire({
// // 		            title: '아이디와 비밀번호를 다시 확인 후 시도해 주세요.', 
// // 		            icon: 'warning'
// // 		          });
// // 		         return false;
// // 			} else {
// // 				// 로그인 성공 시
// // 				Swal.fire({
// // 					  title: '환영합니다!',
// // 					  icon: 'success',
// // 					  showConfirmButton: false,
// // 					  timer: 1000
// // 					})
// // //				setTimeout('url()',9000);
// // 					//console.log(result);
// // 					return true;
// // 			}
// 		},
// 		error : function(jqXHR, status, error){
// 			console.log("알 수 없는 에러 [" + error + "]");
// 		}
// 	});
	
// }

// function url(){
// 	window.location.href="/main";
// }
</script>

<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath }/resources/plugins/iCheck/icheck.min.js"></script>
</body>
</html>

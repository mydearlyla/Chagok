<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>chagok | Registration Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="${pageContext.request.contextPath }/resources/plugins/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/iCheck/square/blue.css">
  <!-- jQuery 3 -->
  <script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jquery.min.js"></script>
  <!-- register 유효성 검사 -->
  <script src="${pageContext.request.contextPath }/resources/plugins/duplicate/register.js"></script>
  <!-- textstyle.css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/duplicate/textstyle.css">
  
  
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
  <link rel="shortcut icon" href="#">
  <link rel="stylesheet" type="text/css" href="../resources/mainpagecss/css/font.css">
  
  <!-- sweetalert -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  
  
<style>
 .btn-primary{
 background-color: #66BB7A;
    border-color: #66BB7A;
 }
 
  .btn-primary:hover{
 background-color: #539763;
    border-color: #539763;
 }
 
 .text-center{
   text-align: center;
   display: flex;
   justify-content: flex-end;
 }
 
 .checkbox label, .radio label{
 	min-height: 20px;
/*     padding-left: 10px; */
    margin-bottom: 0;
    font-weight: 400;
    cursor: pointer;
 }
 
 
 </style>
 
  
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="#" style="font-family: 'GmarketSans';"><img src="${pageContext.request.contextPath }/resources/plugins/img/chagok_pig-removebg.png"><b>차곡</b></a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg" style="font-family: 'GmarketSans'; font-size: 18px;"><b>회원가입</b></p>
    <!-- <p class="login-box-msg">Register a new membership</p> -->
    <form action="/register" method="post">
      <div class="form-group has-feedback">
        <input type="email" class="form-control" id="id" name="id" style="font-size: 12px;" placeholder="이메일을 입력해주세요.">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        <div class="idCheck" id="textstyle"> </div>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" id="pw" name="pw" style="font-size: 12px;" placeholder="영문 및 숫자 4~10자로 입력해주세요.">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        <div class="pwCheck" id="textstyle" style="white-space: normal;"> </div>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control"id="rpw" style="font-size: 12px;" placeholder="비밀번호를 다시 입력해주세요.">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
        <div class="pwReCheck" id="textstyle"> </div>
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" id="nick" name="nick" style="font-size: 12px;" placeholder="한글과 영문,숫자로  2~10자 입력해주세요.">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
        <div class="nickNameCheck" id="textstyle"></div>
      </div>
      <div class="row">
        <div class="col-xs-9">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"><small><a href="#"> 이용약관</a>에 동의합니다.</small>
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-12 pull-right">
          <button type="submit" class="btn btn-primary btn-block btn-flat" id="sbtn">가입하기</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

<!--     <div class="social-auth-links text-center"> -->
<!--       <p>- OR -</p> -->
<!--       <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using -->
<!--         Facebook</a> -->
<!--       <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using -->
<!--         Google+</a> -->
<!--     </div> -->
	<br>
    <a href="/login" class="text-center">로그인</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

 
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath }/resources/plugins/iCheck/icheck.min.js"></script>
</body>
</html>
    
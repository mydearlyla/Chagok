<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
   <meta charset="UTF-8">
   <title>AdminLTE 2 | Dashboard</title>
   <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
   <!-- Bootstrap 3.3.4 -->
   <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <!-- Font Awesome Icons -->
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <!-- Ionicons -->
   <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" ty.gpe="text/css" />
   <!-- Theme style -->
   <link href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
   <!-- AdminLTE Skins. Choose a skin from the css/skins 
        folder instead of downloading all of them to reduce the load. -->
 	<link href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
	<!-- 채팅 js -->
    <%-- <script src="${pageContext.request.contextPath }/resources/plugins/chat/feed.js"></script> --%>
    <!-- 채팅 css  -->
    <link href="${pageContext.request.contextPath }/resources/plugins/chat/feed.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/resources/plugins/modal/minusModal.css" rel="stylesheet" type="text/css" />

   <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
   <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   <!--[if lt IE 9]>
       <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
       <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->
   
 </head>
     <!-- jQuery 2.1.4 -->
   <script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

  <body class="skin-blue sidebar-mini">
  
    <div class="wrapper">

      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img 
              	<c:if test="${uprofile != null }">
					src="${pageContext.request.contextPath }/resources${uprofile}" alt="User profile picture"
				</c:if>
				<c:if test="${uprofile == null }">
					src="https://ptetutorials.com/images/user-profile.png" alt="User profile picture"
				</c:if>
              class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
            <c:if test="${nick != null }">
              <p><a href="#" style="color: black;">${nick }</a></p>
              <a href="#" ><i class="fa fa-circle text-success" ></i> Online</a>
            </c:if>
            <c:if test="${nick == null }">
              <p><a href="/login">로그인을 해주세요</a></p>
            </c:if>

            </div>
          </div>

          <ul class="sidebar-menu">
           
            <li class="treeview active">
              <a href="#">
                <i class="fa fa-asterisk"></i>
                <span>마이페이지</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu active">
                <li><a href="/myPage"></i> 회원정보 관리</a></li>
                <li><a href="/challenge/mychallenge?page=1"></i> 내 챌린지</a></li>
                <li><a href="/myBoardWrite?page=1"></i> 내가 쓴 글</a></li>
                <li><a href="/payment"></i> 꿀 충전</a></li>
                <li><a href="/unregist"></i> 회원탈퇴</a></li>
              </ul>
            </li>
            
            <li class="treeview active">
              <a href="#">
                <i class="fa fa-asterisk"></i>
                <span>고객센터</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu active">
                <li><a href="/notice"></i> 공지 게시판</a></li>
              </ul>
            </li>
            

          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
           	<a href="/commumain"><img src="${pageContext.request.contextPath }/resources/plugins/img/double-arrow.png"><small> 메인</small></a>
          </h1>
        </section>
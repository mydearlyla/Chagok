<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<%@ include file="../include/sidebar.jsp" %>

    <!-- Main content -->
    <section class="content">

      <div class="error-page">
        <h2 class="headline text-red">${msg }</h2>

        <div class="error-content">
          <h3><i class="fa fa-warning text-red"></i> 잘못된 접근입니다.</h3>

          <p>
            	5초 뒤 자동으로 페이지가 이동합니다.
             <a href="/main">메인으로 가기</a>
          </p>
          
            <%
				response.addHeader("Refresh", "5; url=/main");
			%>
          

          <form class="search-form">
            <div class="input-group">
              <input type="text" name="search" class="form-control" placeholder="Search">

              <div class="input-group-btn">
                <button type="submit" name="submit" class="btn btn-danger btn-flat"><i class="fa fa-search"></i>
                </button>
              </div>
            </div>
            <!-- /.input-group -->
          </form>
        </div>
      </div>
      <!-- /.error-page -->

    </section>
    <!-- /.content -->


</div>
<%@ include file="../include/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>


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



<h1> 자유게시판 작성 </h1>
<div class="box box-warning" style="margin-left:150px; width:600px;">
	<div class="box-header with-border" >
		<h3 class="box-title">자유 게시판 작성</h3>
	</div>
	<div class="box-body">
		<form role="form" action="/freeboardwrite" enctype="multipart/form-data" method="post">

			<div class="input-group">
				<span class="input-group-addon"> 작성자 </span> 
					<input type="text" class="form-control" name="b_writer" value="${nick }" readonly style="width:100px; text-align:center;">
			</div>
			<br>
			<div class="form-group">
				<label>글 제목</label> 
					<input type="text" class="form-control" placeholder="제목을 작성해주세요" name="b_title" style="width:300px;">
			</div>
			<div class="form-group">
				<label>글 내용</label>
				<textarea class="form-control" rows="3" placeholder="내용을 입력해주세요" name="b_content" style="width:500px; height:300px; resize: none;"></textarea>
			</div>
<!-- 			<div class="form-group has-success"> -->
<!-- 				<label class="control-label" for="inputSuccess"> -->
<!-- 					<i class="fa fa-check"></i>  -->
<!-- 					첨부파일 첨부 -->
<!-- 				</label>  -->
<!-- 					<input type="button" class="btn btn-block btn-success btn-sm" id="inputSuccess" name="b_file" value="파일 첨부" onclick="file_add();" style="width:218px;"> -->
<!-- 				<div id="d_file"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<input type="submit" value=" 게시하기 " class="btn btn-block btn-success btn-sm" style="width:218px;">
			<input type="hidden" value="3" name="b_sort">
		</form>
	</div>

</div>
<%@ include file="../include/footer.jsp"%>
<script type="text/javascript">
	  var cnt=1;
	  function file_add(){
		  $('#d_file').append("<input type='file' name='file"+cnt+"'>");
		  cnt++;  
	  } 

</script>
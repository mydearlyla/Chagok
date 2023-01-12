<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>

<h1> 자유게시판 작성 </h1>
<div class="box box-warning">
	<div class="box-header with-border">
		<h3 class="box-title">자유 게시판 작성</h3>
	</div>
	<div class="box-body">
		<form role="form" action="/freeboardwrite" enctype="multipart/form-data" method="post">

			<div class="input-group">
				<span class="input-group-addon"> 작성자 </span> 
					<input type="text" class="form-control" name="b_writer" value="${nick }" readonly>
			</div>
			<br>
			<div class="form-group">
				<label>글 제목</label> 
					<input type="text" class="form-control" placeholder="제목을 작성해주세요" name="b_title">
			</div>
			<div class="form-group">
				<label>글 내용</label>
				<textarea class="form-control" rows="3" placeholder="내용을 입력해주세요" name="b_content"></textarea>
			</div>
			<div class="form-group has-success">
				<label class="control-label" for="inputSuccess">
					<i class="fa fa-check"></i> 
					첨부파일 첨부
				</label> 
					<input type="button" class="btn btn-block btn-success btn-sm" id="inputSuccess" name="b_file" value="파일 첨부" onclick="file_add();">
				<div id="d_file">
				</div>
			</div>
			<input type="submit" value=" 게시하기 " class="btn btn-block btn-success btn-sm">
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
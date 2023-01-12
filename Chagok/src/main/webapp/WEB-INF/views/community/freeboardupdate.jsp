<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>

<h1> 자유게시판 수정 </h1>

<!-- <div class="box box-warning"> -->
<!-- 	<div class="box-header with-border"> -->
<!-- 		<h3 class="box-title">자유 게시판 수정</h3> -->
<!-- 	</div> -->

<!-- 	<div class="box-body"> -->
<!-- 		<form role="form" enctype="multipart/form-data" method="post"> -->
<!-- 			<div class="form-group"> -->
<!-- 				<label>글 제목</label>  -->
<%-- 					<input type="text" class="form-control" placeholder="제목을 작성해주세요" name="b_title" value="${board.b_title }"> --%>
<!-- 			</div> -->
<!-- 			<div class="form-group"> -->
<!-- 				<label>글 내용</label> -->
<%-- 				<textarea class="form-control" rows="3" placeholder="내용을 입력해주세요" name="b_content">${board.b_content }</textarea> --%>
<!-- 			</div> -->
<!-- 			<div class="form-group has-success"> -->
<!-- 				<label class="control-label" for="inputSuccess"> -->
<!-- 					<i class="fa fa-check"></i>  -->
<!-- 					첨부파일 첨부 -->
<!-- 				</label>  -->
<!-- 					<input type="button" class="btn btn-block btn-success btn-sm" id="inputSuccess"  value="파일 첨부" onclick="file_add();"> -->
<!-- 				<div id="d_file"> -->
<!-- 				</div> -->
<%-- 				<input type="hidden" name="bno" value="${board.bno }"> --%>
<!-- 			</div> -->
<%-- 			<input type="submit" value="수정하기" class="btn btn-block btn-success btn-sm" onclick="location.href='/freeboardupdate?bno=${board.bno}';"> --%>
<!-- 			<input class="btn btn-block btn-success btn-lg" type="button" value="돌아가기" onclick="location.href='/freeboard';" style="width:218px; margin-left: 950px;"> -->
<!-- 		</form> -->
<!-- 	</div> -->
<section class="content">

	<div class="row">
		<div class="col-md-12">
		
		<form role="form" enctype="multipart/form-data" method="post">
		  
			<ul class="timeline">
					<li class="time-label">
						<span class="bg-red"> 
							<b>수정하기</b>
						</span>
					</li>
				<li><i class="fa fa-envelope bg-blue"></i>
					<div class="timeline-item">
						<span class="time">
							<i class="fa fa-clock-o"></i>
								${board.b_writer }
						</span>
						<h3 class="timeline-header">
							<p> 제목 </p>
							<input type="text" class="form-control" placeholder="제목을 작성해주세요" name="b_title" value="${board.b_title }">
						</h3>
						<div class="timeline-body">
							<p> 내용 </p>
							<textarea class="form-control" rows="3" placeholder="내용을 입력해주세요" name="b_content">${board.b_content }</textarea>
							<label class="control-label" for="inputSuccess">
								
								<input type="button" class="btn btn-block btn-success btn-sm" id="inputSuccess"  value="파일 첨부" onclick="file_add();">
								<div id="d_file">
								</div>
							</label>
						</div>
						
						<div class="timeline-footer">
							<input type="hidden" name="bno" value="${board.bno }">
							<input type="submit" value="수정하기" class="btn btn-block btn-success btn-sm" onclick="location.href='/freeboardupdate?bno=${board.bno}';"style="width:218px; margin-left: 950px;">
							<input class="btn btn-block btn-success btn-lg" type="button" value="돌아가기" onclick="location.href='/freeboard';" style="width:218px; margin-left: 950px;">
						</div>
					</div></li>

				<li><i class="fa fa-clock-o bg-gray"></i></li>
			</ul>
		 
		  </form> 
		</div>

	</div>
</section>



<%@ include file="../include/footer.jsp"%>
<script type="text/javascript">
	  var cnt=1;
	  function file_add(){
		  $('#d_file').append("<input type='file' name='file"+cnt+"'>");
		  cnt++;  
	  } 

</script>
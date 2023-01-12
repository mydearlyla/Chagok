<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<h1>후기글 게시판</h1>
${boardList2}


<div class="col-xs-12 table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>카테고리</th>
				<th>챌린지 제목</th>
				<th>챌린지 기간</th>
				<th>성공 인원</th>				
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>

			<c:set var="boardno" value="${boardList2.size() }"></c:set>
			<fmt:parseNumber var="boardno" value="${boardno }" type="number" />
			<c:forEach items="${boardList2 }" var="boardList2" varStatus="status">

			<tr>
 				<td>${boardno }</td>
				<td>11</td>
				<td>
					<a href="/reviewcontent?bno=${boardList2.bno }&cno=${boardList2.cno}">${boardList2.b_title } </a>
				</td>
				<td>${boardList2.b_content }</td>
				<td>11</td>
				<td>${boardList2.b_writer }</td>
					<c:set var="boardno" value="${boardno -1 }"></c:set>
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
	 <div class="box-footer clearfix">
<!--                 <a href="#" class="bt first"><<</a> -->
			<ul class="pagination pagination-sm no-margin pull-right">
                
                <c:if test="${pageMaker.prev }">
					<li><a href="/reviewboard?page=${pageMaker.startPage-1 }"class="bt prev"><</a></li>
				</c:if>
				<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
					<li 
						<c:out value="${idx == pageMaker.cri.page? 'class=active':'' }"/>
					
					><a href="/reviewboard?page=${idx }">${idx }</a></li>
				</c:forEach>
                <c:if test="${pageMaker.next }">
					<li><a href="/revireboard?page=${pageMaker.endPage+1 }" class="bt next">></a></li>
				</c:if>
               
<!--                 <a href="#" class="bt last">>></a> -->
			</ul>
            </div>
</div>

	<script type="text/javascript">
		
		var result = '${result}';
		if(result == 'createOK'){
			alert(" 글쓰기 완료! ");
		}
		
		if(result == 'modOK'){
			alert(' 글 수정 완료!');
		}
		
		if(result == 'delOK'){
			alert(' 글 삭제 완료!');
		}
		
	</script>
	
	

<%@ include file="../include/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<html lang="ko">
<head>
<script>
	$(function(){
		$(".btn.btn-block.btn-success").click(function(){
			alert('아작스 힘내라');
			var mno = $(this).children().val();
			
			$.ajax({
				type : "get",
				url : "/adminmodal",
				data : mno,
				dataType : "json",
				success : function(data){
					console.log("어드민 모달창 등장"+data);
// 					$.modal(data);
				}
			});
		})
	});

</script>
	<title>회원 관리</title>
</head>	
	<body>
${userlist.size() }
    <div class="board_wrap">
        <div class="board_title">
        <strong>회원 관리</strong>
    	</div>
 	    <div class="board_list_wrap">
         <div class="board_list">
             <div class="top">
                 <div class="num" style="padding-right: 10px; width: auto; padding-left: 10px;">회원 번호</div>
                 <div class="num" style="padding-left:10px; width: auto;">아이디</div>
                 <div class="title" style="width: auto;">닉네임</div>
                 <div class="num">포인트</div>
                 <div class="date" style="width: auto;">가입일자</div>
                 <div class="num" style="padding-left:25px; width: auto;">가계부 인증</div>
                 <div class="num" style="width: auto; padding-left:25px;">구독상태</div>
                 <div class="num" style="padding-left:25px; width: auto;">관리</div>
         	</div>
         
         <c:forEach items="${userlist }" var="user">
                <div>
                    <div class="num" style="padding-left: 65px; width: auto; padding-right: 65px;">${user.mno }</div>
                    <div class="num" style="padding-left: 65px; width: auto; padding-right: 10px;">${user.id }</div>
                    <div class="title" style="padding-left: 65px; width: auto;;">${user.nick }</div>
                    <div class="num" style="padding-left: auto;">${user.buypoint }</div>
                    <div class="date" style="padding-left: auto; width: auto;">${user.regdate }</div>
                    <div class="num" style="padding-left:25px; width: auto;">${user.isCheck }</div>
                    <div class="num" style="padding-left:25px; width: auto;">${user.isSub }</div>
                    <div class="num" style="padding-left:25px; width: auto;">
                    	<button class="btn btn-block btn-success" data-toggle="modal">상세정보
                    		<input type="hidden" value="${user.mno }">
                    	</button>
                    </div>
                </div>
                </c:forEach>
         </div>
         
         <!-- 모달 css 파일 : resources -> plugins -> modal -> minusModal.css  -->
	<div class="modal fade" id="modal-default" style="margin-top: 10%;">
		<div class="modal-dialog" style=" height: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"><b>&times;</b></span>
					</button>
					<h4 class="modal-title">상세정보</h4>
				</div>
				<div class="modal-body" >
				<div class="frame2">
  					<div class="calculator2">
						<div class="whitespace" id="whitespace">
						<table style="border:2px;">
						<tr>
							<th>생년</th>
							<th>전화번호</th>
							<th>예금주명</th>
							<th>은행</th>
							<th>환급계좌</th>
						</tr>
						
						<tr>
						<c:forEach items="${userlist }" var="user">
							<td>${user.year }</td>
							<td>${user.tel }</td>
							<td>${user.rname }</td>
							<td>${user.rbank }</td>
							<td>${user.raccount }</td>
						</c:forEach>
						</tr>
						</table>
  						</div>
					    <div class="content2">
					      <div class="key-wrap" id="key-wrap"></div>
<!-- 					      <div class="calc-wrap" id="calc-wrap"></div> -->
					    </div>
				    </div>
			    </div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">닫기</button> -->
				</div>
			</div>
    	</div>
   	</div>
<!-- 입금하기 기능용 모달창 -->	
         
           <div class="board_page">
<!--                 <a href="#" class="bt first"><<</a> -->
                <a href="#" class="bt prev"><</a>
                <a href="#" class="num on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a>
                <a href="#" class="bt next">></a>
<!--                 <a href="#" class="bt last">>></a> -->
            </div>
    </div>  
</div>      
</body>
</html>

<style>

* {
    margin: 0;
    padding: 0;
}

html {
    font-size: 10px;
}

ul, li {
    list-style: none;
}

a {
    text-decoration: none;
    color: inherit;
}

.board_wrap {
    width: 1000px;
    margin: 20px auto;
}

.board_title {
    margin-bottom: 30px;
}

.board_title strong {
    font-size: 3rem;
    font-weight: 1000;
}

.board_title p {
    margin-top: 10px;
    font-size: 1.4rem;
}

.bt_wrap {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

.bt_wrap input {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #000;
    border-radius: 2px;
    font-size: 1.4rem;
}

.bt_wrap input:first-child {
    margin-left: 0;
}

.bt_wrap input.sbtn {
    background: #000;
    color: #fff;
    width: 30%;
}

.board_list {
    width: 100%;
    border-top: 2px solid #000;
}

.board_list > div {
    border-bottom: 1px solid #ddd;
    font-size: 0;
}

.board_list > div.top {
    border-bottom: 1px solid #999;
}

.board_list > div:last-child {
    border-bottom: 1px solid #000;
}

.board_list > div > div {
    display: inline-block;
    padding: 15px 0;
    text-align: center;
    font-size: 1.4rem;
}

.board_list > div.top > div {
    font-weight: 1000;
    font-size: 15px;
    
}

.board_list .num {
    width: 10%;
}

.board_list .title {
	width: 70%;
    text-align: center;
}

.board_list .top .title {
    text-align: center;
    font-weight: 1000;
}

.board_list .writer {
    width: 10%;
}

.board_list .date {
    width: 20%;
}

.board_list .count {
    width: 10%;
}

.board_page {
    margin-top: 30px;
    text-align: right;
    font-size: 0;
}

.board_page a {
    display: inline-block;
    width: 32px;
    height: 32px;
    box-sizing: border-box;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-left: 0;
    line-height: 100%;
    text-align: center;
}

.board_page a.bt {
    padding-top: 10px;
    font-size: 1.2rem;
    letter-spacing: -1px;
}

.board_page a.num {
    padding-top: 9px;
    font-size: 1.4rem;
}

.board_page a.num.on {
    border-color: #000;
    background: #000;
    color: #fff;
}

.board_page a:first-child {
    border-left: 1px solid #ddd;
}

.board_view {
    width: 100%;
    border-top: 2px solid #000;
}

.board_view .title {
    padding: 20px 15px;
    border-bottom: 1px dashed #ddd;
    font-size: 2rem;
}

.board_view .info {
    padding: 15px;
    border-bottom: 1px solid #999;
    font-size: 0;
}

.board_view .info dl {
    position: relative;
    display: inline-block;
    padding: 0 20px;
}

.board_view .info dl:first-child {
    padding-left: 0;
}

.board_view .info dl::before {
    content: "";
    position: absolute;
    top: 1px;
    left: 0;
    display: block;
    width: 1px;
    height: 13px;
    background: #ddd;
}

.board_view .info dl:first-child::before {
    display: none;
}

.board_view .info dl dt,
.board_view .info dl dd {
    display: inline-block;
    font-size: 1.4rem;
}

.board_view .info dl dt {

}

.board_view .info dl dd {
    margin-left: 10px;
    color: #777;
}

.board_view .cont {
    padding: 15px;
    border-bottom: 1px solid #000;
    line-height: 160%;
    font-size: 1.4rem;
}

.board_write {
    border-top: 2px solid #000;
}

.board_write .title,
.board_write .info {
    padding: 15px;
}

.board_write .info {
    border-top: 1px dashed #ddd;
    border-bottom: 1px solid #000;
    font-size: 0;
}

.board_write .title dl {
    font-size: 0;
}

.board_write .info dl {
    display: inline-block;
    width: 50%;
    vertical-align: middle;
}

.board_write .title dt,
.board_write .title dd,
.board_write .info dt,
.board_write .info dd {
    display: inline-block;
    vertical-align: middle;
    font-size: 1.4rem;
}

.board_write .title dt,
.board_write .info dt {
    width: 100px;
}

.board_write .title dd {
    width: calc(100% - 100px);
}

.board_write .title input[type="text"],
.board_write .info input[type="text"],
.board_write .info input[type="password"] {
    padding: 10px;
    box-sizing: border-box;
}

.board_write .title input[type="text"] {
    width: 80%;
}

.board_write .cont {
    border-bottom: 1px solid #000;
}

.board_write .cont textarea {
    display: block;
    width: 100%;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: 0;
    resize: vertical;
}

@media (max-width: 1000px) {
    .board_wrap {
        width: 100%;
        min-width: 320px;
        padding: 0 30px;
        box-sizing: border-box;
    }

    .board_list .num,
    .board_list .writer,
    .board_list .count {
        display: none;
    }

    .board_list .date {
        width: 40%;
    }

    .board_list .title {
        text-indent: 10px;
        
    }

    .board_list .top .title {
        text-indent: 0;
    }

    .board_page a {
        width: 26px;
        height: 26px;
    }

    .board_page a.bt {
        padding-top: 7px;
    }
    
    .board_page a.num {
        padding-top: 6px;
    }

    .board_view .info dl {
        width: 50%;
        padding: 0;
    }

    .board_view .info dl:nth-child(-n+2) {
        margin-bottom: 5px;
    }

    .board_view .info dl::before {
        display: none;
    }

    .board_view .info dl dt,
    .board_view .info dl dd {
        font-size: 1.2rem;
    }

    .board_write .info dl {
        width: 49%;
    }

    .board_write .info dl:first-child {
        margin-right: 2%;
    }

    .board_write .title dt,
    .board_write .info dt {
        display: none;
    }

    .board_write .title dd,
    .board_write .info dd {
        width: 100%;
    }

    .board_write .title input[type="text"],
    .board_write .info input[type="text"],
    .board_write .info input[type="password"] {
        width: 100%;
    }
}

</style>

</div>
<%@ include file="../include/footer.jsp"%>
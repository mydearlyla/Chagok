<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>



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



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/css.css">
    
<script>
			$(document).ready(function(){
				var formObj = $("form[role='form']");
							
				// 삭제
				$(".sbtn2").click(function(){
					
					formObj.attr("action","/reviewremove");
					formObj.submit();
				});
	
			});
</script> 

<script type="text/javascript">
	function back(){
		window.history.back();
	}
	
</script>

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
    margin: 40px auto;
}

.board_title {
    margin-bottom: 30px;
}

.board_title strong {
    font-size: 3rem;
}

.board_title p {
    margin-top: 5px;
    font-size: 1.4rem;
}

.bt_wrap {
    margin-top: 30px;
    text-align: center;
}

.bt_wrap a {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #FFDB83;
    border-radius: 2px;
    font-size: 1.4rem;
}

.bt_wrap a:first-child {
    margin-left: 0;
}

.bt_wrap a.on {
    background: #FFDB83;
    color: #fff;
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
    font-weight: 600;
}

.board_list .num {
    width: 10%;
}

.board_list .title {
    width: 60%;
    text-align: left;
}

.board_list .top .title {
    text-align: center;
}

.board_list .writer {
    width: 10%;
}

.board_list .date {
    width: 10%;
}

.board_list .count {
    width: 10%;
}

.board_page {
    margin-top: 30px;
    text-align: center;
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
    border-top: 2px solid #66BB7A;
    margin-left: 20px;
}

.board_view .title {
    padding: 20px 15px;
    border-bottom: 1px dashed #ddd;
    font-size: 2.2rem;
}

.board_view .info,
.board_view .info2 {
	padding: 15px 0px 0px 20px;
    border-bottom: 1px solid #66BB7A;
    font-size: 0;
    display: flex;
    justify-content: space-between;
}

.board_view .info dl ,
.board_view .info2 dl {
    position: relative;
    display: inline-block;
    padding: 0 20px;
}

.board_view .info dl:first-child,
.board_view .info2 dl:first-child {
    padding-left: 0;
}

.board_view .info dl::before ,
.board_view .info2 dl::before {
    content: "";
    position: absolute;
    top: 1px;
    left: 0;
    display: block;
    width: 1px;
    height: 13px;
    background: #ddd;
}

.board_view .info dl:first-child::before ,
.board_view .info2 dl:first-child::before {
    display: none;
}

.board_view .info dl dt,
.board_view .info dl dd,
.board_view .info2 dl dt,
.board_view .info2 dl dd {
    display: inline-block;
    font-size: 1.4rem;
}

.board_view .info dl dt ,
.board_view .info2 dl dt {

}

.board_view .info dl dd ,
.board_view .info2 dl dd {
    margin-left: 15px;
    color: #777;
}

.board_view .cont {
    padding: 15px;
    border-bottom: 1px solid #66BB7A;
    line-height: 160%;
    font-size: 1.4rem;
}

.board_write {
    border-top: 2px solid #66BB7A;
    border-bottom: 2px solid #66BB7A;
}

.board_write .title,
.board_write .info ,
.board_write .info2 {
    padding: 15px 0px 0px 15px;
}

.board_write .info {
/* 	border-top: 1px solid #66BB7A; */
    border-top: 1px dashed #ddd; 
    font-size: 0;
}

.board_write .info2 {
    border-top: 1px dashed #ddd;
    border-bottom: 1.5px solid #66BB7A;
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

.board_write .info2 dl {
    display: inline-block;
    width: 25%;
    vertical-align: middle;
}

.board_write .title dt,
.board_write .title dd,
.board_write .info dt,
.board_write .info dd,
.board_write .info2 dt,
.board_write .info2 dd {
    display: inline-block;
    vertical-align: middle;
  	font-size: 1.3rem;
    color: #777;

}

.board_write .title dt,
.board_write .info dt,
.board_write .info2 dt {
    width: 100px;
}

.board_write .title dd {
    width: calc(100% - 100px);
}

.board_write .title input[type="text"],
.board_write .info input[type="text"],
.board_write .info input[type="password"],
.board_write .info2 input[type="text"],
.board_write .info2 input[type="password"] {
    padding: 10px;
    box-sizing: border-box;
}

.board_write .title input[type="text"] {
    width: 80%;
}

.board_write .cont {
    border-bottom: 1px solid #66BB7A;
}

.board_write .cont textarea {
    display: block;
    width: 100%;
    height: 300px;
    padding: 30px;
    box-sizing: border-box;
    border: 0;
    resize: vertical;
    font-size: 15px;
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
    .board_write .info dt,
    .board_write .info2 dt {
        display: none;
    }

    .board_write .title dd,
    .board_write .info dd ,
    .board_write .info2 dd {
        width: 100%;
    }

    .board_write .title input[type="text"],
    .board_write .info input[type="text"],
    .board_write .info input[type="password"],
        .board_write .info2 input[type="text"],
    .board_write .info2 input[type="password"] {
        width: 100%;
    }
}

.bt_wrap input.sbtn {
	display: inline-block;
    min-width: 100px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #FFDB83;
    border-radius: 2px;
    font-size: 1.4rem;
    background-color: #FFDB83;
    color: #fff;
}

.bt_wrap input.sbtn2 {
	display: inline-block;
    min-width: 100px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #FFDB83;
    border-radius: 2px;
    font-size: 1.4rem;
    background-color: #fff;
    color: #FFDB83;
}

</style>
</head>	


<body>


    <div class="board_wrap">
        <div class="board_title">
            <strong> 후기 </strong>
            <p>참여했던 챌린지에 대한 후기를 남기는 곳입니다.</p>
        </div>
	</div>
	
		<c:forEach var="vo" items="${challengeList }">
			
				<c:if test="${vo.c_sort eq 0 }">
					<c:set var="sort" value="저축형"/>
				</c:if>
				<c:if test="${vo.c_sort eq 1 }">
					<c:set var="sort" value="절약형"/>
				</c:if>
				
		</c:forEach>
		
		 <jsp:useBean id="now" class="java.util.Date" />
		 <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
		 <fmt:parseDate value="${vo.c_start}" var="startDate" pattern="yyyy-MM-dd"/>
		 <fmt:parseNumber value="${(startDate.time + 1000*60*60*24)/ (1000*60*60*24)}" integerOnly="true" var="startTime" scope="request"/>
		 <fmt:parseNumber value="${c_end.time / (1000*60*60*24)}" integerOnly="true" var="endTime" scope="request" />
	
        <div class="board_wrap">
            <div class="board_write">
                <div class="title" style="border-bottom: 1px solid #66BB7A;">
            		<dl>
            			<dt style="width: 120px; font-size: 20px; background-color: #66bb7a3b; color: #333;">후기 제목</dt>
            			<dd style="width: calc(100% - 120px); font-size: 20px; background-color: #66bb7a3b; color: #333;">${boardChallenge.b_title }<dd>
                	</dl>
                </div>

				<div class="info">
                    <dl>
                        <dt style="width: 120px;">참여 챌린지 제목</dt>
                        <dd>${vo.c_title }</dd>
                    </dl>
                   <dl>
                        <dt>챌린지 카테고리</dt>
                        <dd>[${sort } : ${vo2.ct_top}]</dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt style="width: 120px;">후기 작성자</dt>
                        <dd>${boardChallenge.b_writer }</dd>
                    </dl>
                   <dl>
                        <dt>챌린지 기간</dt>
                        <dd><b>${vo.c_period }</b>주</dd>
                    </dl>
                </div>
                <div class="info2">
                    <dl>
                        <dt style="width: 120px;">챌린지 성공인원</dt>
                        <dd>${Success } 명</dd>
                    </dl>
                    <dl>
                        <dt>챌린지 인원</dt>
                        <dd>${CList} 명</dd>
                    </dl>
                    <dl>
                        <dt>챌린지 시작일</dt>
                        <dd><fmt:formatDate value="${startDate }" pattern="YYYY-MM-dd"/></dd>
                    </dl>
                    <dl>
                        <dt>챌린지 종료일</dt>
                        <dd><fmt:formatDate value="${c_end }" pattern="YYYY-MM-dd"/></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea name="b_content" style="resize: none;" readonly>${boardChallenge.b_content }</textarea>
                </div>
            </div>
            
		    <div class="bt_wrap">       
		 	<c:set var="writer" value="${boardChallenge.b_writer }"/>
			<c:if test= "${nick == '관리자' || nick == writer}">
		        <input class="sbtn" type="button" value="수정하기" onclick="location.href='/reviewupdate?bno=${boardChallenge.bno}&cno=${boardChallenge.cno }';">
				<input class="sbtn2" type="button" value="삭제하기" onclick="location.href='/reviewremove?bno=${boardChallenge.bno}&cno=${boardChallenge.cno }';">
			</c:if>
		        <input class="sbtn" type="submit" value="돌아가기" onclick="back()">
		     </div>
        </div>
     
</body>
</html>

</div>
<%@ include file="../include/footer.jsp"%>

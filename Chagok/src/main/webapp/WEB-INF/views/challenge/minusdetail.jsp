<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



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
   <img src="../resources/imgUpload/new-loading.gif">
</div>

<script type="text/javascript">
    $(window).on('load', function() {
        setTimeout(function(){
            $("#waiting").fadeOut();
        }, 300);
    });
</script>
<!-- 로딩 코드 end -->



<h1 style="padding-left: 50px;">절약형 차곡 챌린지</h1>

<%-- ${mno } --%>
<%-- ${vo } --%>
<div class="row" style="margin-left:30px; margin-top:30px;">
	<div class="col-lg-4 aos-init aos-animate" data-aos="fade-right">
     <img class="card-img-top img-fluid" src="${pageContext.request.contextPath }/resources${vo.c_thumbFile }" alt="" aria-labelledby="title_1" id="c_img"
     	  style="margin-top:30px;">
	</div>
	<div class="col-lg-8 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left" style="padding-left: 50px; width: 600;">
		<h3><span style="color: #66BB7A; font-weight: bold;">[${vo2.ct_top}]</span> ${vo.c_title }</h3>
		<jsp:useBean id="now" class="java.util.Date" />
			 <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
			 <fmt:parseDate value="${vo.c_start}" var="startDate" pattern="yyyy-MM-dd"/>
			 <fmt:parseNumber value="${(startDate.time + 1000*60*60*24)/ (1000*60*60*24)}" integerOnly="true" var="startTime" scope="request"/>
			 <fmt:parseNumber value="${c_end.time / (1000*60*60*24)}" integerOnly="true" var="endTime" scope="request" />
			
			<c:if test="${startTime - nowfmtTime <= 0 && nowfmtTime - endTime <= 0}">
				<p class="fst-italic">챌린지가 <b>시작</b>되었습니다!</p>
			</c:if>
			<c:if test="${startTime - nowfmtTime > 0}">
				<p class="fst-italic">챌린지가 &nbsp;&nbsp;  <span style="color: #66BB7A; font-weight: bold; font-size: 20px;"> ${startTime - nowfmtTime }</span> 일 후에 시작됩니다!</p>
			</c:if>
			<c:if test="${nowfmtTime - endTime > 0}">
				<p class="fst-italic">챌린지가 <b>종료</b>되었습니다!</p>
			</c:if>
			<br><br>
		<div class="row">
			<div class="col-lg-6">
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 장 </span>
               <span class="progress-number"><b>${host.nick }</b>님</span>
             </div>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 인원</span>
               <span class="progress-number"><b>${vo.c_cnt }</b>/ ${vo.c_pcnt }</span>
             </div>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">예치금</span>
               <span class="progress-number"><b>${vo.c_deposit }</b>꿀</span>
             </div>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">절약 카테고리</span>
               <span class="progress-number"><b>${vo2.ct_top }</b></span>
             </div>
          	 <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 기간</span>
               <span class="progress-number"><b>${vo.c_period }</b>주</span>
              </div> 
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 시작일</span>
               <span class="progress-number">
	              <b><fmt:formatDate value="${startDate }" pattern="YYYY-MM-dd"/></b>
               </span>
              </div>
               <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 종료일</span>
	               <span class="progress-number">
	               	<b><fmt:formatDate value="${c_end }" pattern="YYYY-MM-dd"/></b>
	               </span>
	           </div>
       		</div>
			</div>
		</div>
	</div>

	<div class="box box-default" style="margin-top:30px; border-top-width: 0px; margin-left: 45px;">
		<div class="box-header with-border" style="background: #66BB7A; height: 50px; opacity: 85%; color: #fff; width: 1127px;">
			<div class="text-center">
			  <h3 class="box-title" style="margin-top: 1%;">
			  	<span style="color: #3e6c49;">${vo.c_period }</span>주 동안 
		    	<span style="color: #3e6c49;">${vo2.ct_top }</span>를
		    	총 <span style="color: #3e6c49;">${vo.c_amount }</span>원 절약합니다.
			  </h3>
			</div>
		</div>
	</div>
		    	
        <div class="form-group has-warning" style="padding-top: 50px; border-left-width:3px; margin-left:36px; width:1133px;">
                  <label class="control-label" for="inputWarning"><i class="fa fa-bell-o"></i>챌린지 설명</label>
                  <textarea class="form-control" id="inputWarning" style="height: auto; font-size: 15px; resize: none;" readonly>
${vo.c_content }
        		  </textarea>
        <a href="#" id="kakaotalk-sharing-btn"><i class="fa fa-share-alt" style="font-size:1.2em; padding-left:1068px; padding-top:11px;"><b> Share</b></i></a>   		  
        </div>
        <div class="form-group has-error" style="border-left-width:3px; margin-left:36px; width:1133px;">
                  <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i>주의사항</label>
                  <textarea class="form-control" id="inputError" style="height: auto; font-size: 15px; resize: none; overflow: hidden;" readonly>
저축형과 절약형 챌린지 모두 가계부 하나의 상세 카테고리로만 참여 가능합니다.
ex) 절약형 챌린지 [교통] 카테고리 참여 중이라면 [교통] 카테고리의 다른 절약형 & 저축형 챌린지 참여 불가!
        		  </textarea>
        </div>
        
      <!--  성공시 onclick="location.href='/minusdetailPOST';" 변경 -->
        <div>
	        <c:if test="${startDate gt now }">
	        	<button class="btn btn-block btn-success btn-lg" type="button" id="samechallenge" style="width:218px; margin-left: 950px;">참여하기</button>
	        </c:if>
	        <c:if test="${startDate lt now  &&  c_end gt now}">
	        	<button class="btn btn-block btn-success btn-lg" type="button" id="samechallenge" style="width:218px; margin-left: 950px;">피드가기</button>
	        </c:if>
			<div id="result_samechallenge"></div>
		</div>

</div> <!-- ./ contents -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<!-- 카카오톡 공유하기 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	Kakao.init('5c7fadc901b4e26f9995aa27ef5cf82b');
	Kakao.isInitialized();
</script>
	
 <script>
$(function(){
   	$("#samechallenge").click(function(){
   		
   		var ctno = ${vo.ctno};
   		var mno = ${mno};
   		var cno = ${vo.cno};
   		var camount = ${vo.c_amount};
   		
   		var test = {"ctno":ctno,"mno":mno, "cno":cno,"camount":camount};

   		
		Swal.fire({
			title: '참여 가능한 챌린지입니다!',
			text: '단, 저축형 챌린지는 하나만 참여 가능합니다. \n 참여하시겠습니까?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#00A65A',
			cancelButtonColor: '#DD4B39',
			confirmButtonText: '참여하기',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				$.ajax({
	    			type : "post",
	    			url : "/challenge/minusdetailPOST",
	    			contentType : "application/json",
	    			dataType :'text',
	    			data : JSON.stringify(test),
	    			timeout : 3000,
	    			async : false,
	    			success : function(data){
						console.log('통신 성공! ' + data);
	    				if(data == "N"){ // 중복된 카테고리num이 아닐 때
	    					Swal.fire({
	    						title: '챌린지 참여 완료!', 
	    						icon: 'success'
	    					});
	    					location.href="/commumain";
	    				}else if(data == "Y"){ // 중복된 챌린지 or 중복된 상세카테고리 챌린지 
	    					Swal.fire({
	    						title: '해당 카테고리로 참여 중인 챌린지가 있습니다.', 
	    						icon: 'warning'
	    					});
	    					return false;
	    				}
	    			},
    				error : function(error, data){
    					console.log(error);
    					console.log(data);
   					}
    			});	//ajax
			} else {
				Swal.fire({
					title: '챌린지 참여를 취소하였습니다.', 
					icon: 'info'
				});
			}
		})   		
   		
   		
 	});
});
</script>

<script type="text/javascript">   
	$(document).ready(function(){
		$('#kakaotalk-sharing-btn').click(function () {
			Kakao.Share.createCustomButton({
			  container: '#kakaotalk-sharing-btn',
			  templateId: ${87844},
			  templateArgs: {
			  title: '${vo.c_title}',
			  description: '지금 친구와 함께 챌린지에 도전해보세요! ( ´͈ ᵕ `͈ )◞♡ '
			  
			  }
		});
	});
});
</script>


<%@ include file="../include/footer.jsp" %>

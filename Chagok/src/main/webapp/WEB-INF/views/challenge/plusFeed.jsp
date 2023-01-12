<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 영민 입금하기 (비지니스계좌 구현중) -->
<script type="text/javascript">
	$(document).ready(function(){
		
			
		$('#a_biz').click(function(){ // 입금하기 버튼 클릭
			if(${vo.c_amount} > ${myPlusVO.pl_sum} ) { // 입금해야할 금액보다 현재 입금한 금액이 적을때 (더입금 가능)
	
				if ($('#result').text() == "") {
					alert('금액을 입력하세요 !');
					
					return false;
					
				} else {
					
					var biz_amount = $('#result').text().replace(/,/gi, "");
					
					if (${(vo.c_amount / vo.c_period)} == biz_amount) {
						
						var bizCheck = confirm("진짜 입금 할래?");
						
						if (bizCheck) {
							$('#a_biz').attr('href', '/challenge/sendBiz?biz_amount='+biz_amount+'&cno='+${vo.cno});
						} else {
							return false;
						}
					
					} else {
						alert("입금 금액이 일치하지 않습니다.\n금액을 확인하세요.");
						
						return false;
					}
				}
			} else { // 더 입금 불가능
				alert("더 이상 입금할 수 없습니다!");
			}
		}); // 입금하기 버튼 끝
		
		
		
		
	});
</script>

<script>
	if (${sendOK == "OK"}) {
		alert("송금 완료!");
	}
</script>

<!-- 영민 입금하기 (비지니스계좌 구현중) -->



<h1 style="padding: 0 15px 0 15px;"> 저축형 차곡 챌린지 </h1>

 <!-- Main content -->
<button class="btn btn-success pull-right" id="alertStart" >알림테스트용 </button>
<section class="content">
	<div class="row">
		<div class="col-lg-5 mx-6 aos-init aos-animate" data-aos="fade-right" >
	        <img class="img-responsive" src="${vo.c_file}" alt="Photo" >
		</div>
		<div class="col-lg-6 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left" >
			 <h3><span style="color: #66BB7A; font-weight: bold;">[저축형]</span> ${vo.c_title }</h3>
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
				<div class="col-lg-6" style="line-height: 180%">
	             <div class="progress-group" style="width: 280px;" >
	               <span class="progress-text">챌린지 장 </span>
	               <span class="progress-number"><b>${host.nick }</b>님</span>
	             </div>
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 인원</span>
	               <span class="progress-number"><b>${plusPeoList.size() } </b>/ ${vo.c_pcnt }</span>
	             </div>
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">예치금</span>
	               <span class="progress-number"><b>${vo.c_deposit }</b>꿀</span>
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
	<br>
    <div class="row">
	    <div class="d-flex justify-content-center">
		    <div class="box">
		        <div class="col-md-12 text-center" style="background: #FAF8F1;">
				    	<h4>
		        		총 <span style="color: #10A19D;"> ${vo.c_total }</span> 번, 
				    	<span style="color: #10A19D;">
				    	<c:if test="${vo.c_freq == 1 }">
				    		7
				    	</c:if>
				    	<c:if test="${vo.c_freq == 2 }">
				    		3
				    	</c:if>
				    	<c:if test="${vo.c_freq == 3 }">
				    		2
				    	</c:if>
				    		</span>일 마다 
				    	<span style="color: #10A19D;">
				    	<fmt:formatNumber value="${vo.c_amount / vo.c_period}" pattern=",000"/>
				    	</span>원씩 저축하세요</h4>
		    	</div>
		    </div>
		</div>
    </div>
    
<!-- 입금하기 기능용 모달창 -->
<c:if test="${vo.c_amount > myPlusVO.pl_sum}">
    <button class="btn btn-success" data-toggle="modal" data-target="#modal-default" style="margin-left: 90%">
   			입금하기</button>
  </c:if>
<c:if test="${vo.c_amount == myPlusVO.pl_sum}">
	<button class="btn btn-success" data-toggle="modal" data-target="#modal-default" style="margin-left: 90%" disabled="disabled">
   			입금완료</button>
</c:if>

<!-- 모달 css 파일 : resources -> plugins -> modal -> minusModal.css  -->
	<div class="modal fade" id="modal-default" style="margin-top: 10%;">
		<div class="modal-dialog" style=" height: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"><b>&times;</b></span>
					</button>
					<h4 class="modal-title">입금</h4>
				</div>
				<div class="modal-body" >
				<div class="frame2">
  					<div class="calculator2">
						<div class="whitespace" id="whitespace">
						<h5>차곡은행 (차곡 챌린지 계좌)</h5>
  						<h3>1234-1231-12345</h3>
  						<h4>보내는 사람 : ${nick}</h4>
  					</div>
						<div class="result2" id="result" align="right"><fmt:formatNumber value="${vo.c_amount / vo.c_period}" pattern=",000"/></div>
							<div class="calc-wrap" id="calc-wrap">
								<span style="text-align: right;">원</span>
							</div>
						<div class="accountInfo2" id="accountInfo2"></div>
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
					<a href="" id="a_biz">
						<button type="button" class="btn btn-block btn-success btn-sm biz" disabled="disabled">입금하기</button>
					</a>
				</div>
			</div>
    	</div>
   	</div>
<!-- 입금하기 기능용 모달창 -->	
   	
   	
   	<!-- 모달 창 -->
    	<br>
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">챌린지 진행상황</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm hidden-xs" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th class="col-md-1">No.</th>
                  <th class="col-md-1">참가자</th>
                  <th class="col-md-4">진행률</th>
                  <th class="col-md-1">횟수</th>
                  <th class="col-md-2" style="text-align: center;">저축 금액</th>
                  <th class="col-md-1">Status</th>
                </tr>
                <c:forEach var="plusPeoList" begin="0" end="${plusPeoList.size()-1}" items="${plusPeoList}">
           		<fmt:formatNumber value="${plusPeoList.pl_sum}" pattern="00" var="saveMoney" />
                <c:set var="i" value="${i+1 }"/>
                <tr>
                  <td>${i }</td>
                   <td>${plusPeoList.nick }</td> 
                   <td> 
                  	  <c:if test="${nowfmtTime - endTime < 0}">
 	                  	<c:if test="${saveMoney == vo.c_amount }">
		                  	<c:if test="${plusPeoList.pl_cnt == vo.c_total }">
			                    <div class="progress progress-xs">
			                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
			                    </div>
		                  	</c:if>
		                  	<c:if test="${plusPeoList.pl_cnt == 0 }">
			                    <div class="progress progress-xs progress-striped active">
			                      <div class="progress-bar progress-bar-yellow" style="width: 5%"></div>
			                    </div>
		                  	</c:if>
		                  	<c:if test="${(plusPeoList.pl_cnt / vo.c_total) != 0 && (plusPeoList.pl_cnt / vo.c_total) < 1.0 }">
			                    <div class="progress progress-xs progress-striped active">
			                      <div class="progress-bar progress-bar-primary" style="width: ${(plusPeoList.pl_cnt / vo.c_total)*100}%"></div>
			                    </div>
		                  	</c:if>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount }">
		                    <c:if test="${plusPeoList.pl_sum != 0 }">
			                    <div class="progress progress-xs">
			                      <div class="progress-bar progress-bar-red" style="width: ${(plusPeoList.pl_cnt / vo.c_total)*100}%"></div>
			                    </div>
			                </c:if>
		                    <c:if test="${plusPeoList.pl_sum == 0 }">
			                    <div class="progress progress-xs ">
			                      <div class="progress-bar progress-bar-red" style="width: 5%"></div>
			                    </div>
		                  	</c:if>
	                  	</c:if> 
	                  </c:if>
	                  <c:if test="${nowfmtTime - endTime >= 0}">
	                  	<c:if test="${saveMoney == vo.c_amount }">
	                  		<div class="progress progress-xs">
		                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
		                    </div>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount }">
	                  		<div class="progress progress-xs">
		                      <div class="progress-bar progress-bar-danger" style="width: ${(plusPeoList.pl_cnt / vo.c_total)*100}%"></div>
		                    </div>
	                  	</c:if> 
	                  </c:if>
                  </td>
                  
                  <td>
                  	<c:if test="${nowfmtTime - endTime >= 0}">
                  		<c:if test="${saveMoney == vo.c_amount && plusPeoList.pl_finish == true }">
	                  		<span class="badge bg-green">${plusPeoList.pl_cnt} / ${vo.c_total }</span>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount && plusPeoList.pl_finish == false}">
	                  		<span class="badge bg-red">${plusPeoList.pl_cnt} / ${vo.c_total }</span>
	                  	</c:if>
               		</c:if>
               		<c:if test="${nowfmtTime - endTime < 0}">
                  		<c:if test="${saveMoney == vo.c_amount}">
<%-- 	                  		<span class="badge bg-light-blue">${plusPeoList.pl_cnt} / ${vo.c_total }</span> --%>
	                  		<span class="badge bg-green">${plusPeoList.pl_cnt} / ${vo.c_total }</span>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount && plusPeoList.pl_finish == false}">
	                  		<span class="badge bg-red">${plusPeoList.pl_cnt} / ${vo.c_total }</span>
	                  	</c:if>
                  	</c:if>
                  		
                  </td>
                  <td style="text-align: right; padding-right: 4%; vertical-align: 10%;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${plusPeoList.pl_sum}" /><b>&nbsp;원</b></td>
                  <td>
                  	<c:if test="${nowfmtTime - endTime > 0}">
	                  	<c:if test="${saveMoney == vo.c_amount && plusPeoList.pl_finish == true }">
	                  		<span class="label label-success">성공</span>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount && plusPeoList.pl_finish == false}">
	                  		<span class="label label-danger">실패</span>
	                  	</c:if>
                  	</c:if>
                  	<c:if test="${nowfmtTime - endTime <= 0}">
                  		<c:if test="${saveMoney == vo.c_amount }">
	                  		<span class="label label-primary">진행중</span>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount && plusPeoList.pl_finish == false}">
	                  		<span class="label label-danger">실패</span>
	                  	</c:if>
                  	</c:if>
                  </td>
                </tr>
                </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
    </section>
    <!-- /.content -->
    
    
 <!-- 칭찬하기/주시하기  @@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <div class="col-xs-12" style="margin-left: 10px; ">
	 <div class="row">
	  <h3 class=" text-center"> << ${vo.c_title } >> </h3>
	   <div class="messaging" id="messaging">
	      <div class="inbox_msg">
	        <div class="inbox_people">
	          <div class="headind_srch">
	            <div class="recent_heading">
	              <h4>참가자</h4>
	            </div>
	          </div>
         <!-- <div class="chat_list active_chat"> 어두운색 배경으로 비활성화 가능 -->
	          <div class="inbox_chat">
          <c:forEach var="plusPeoList" begin="0" end="${plusPeoList.size()-1}" items="${plusPeoList}">
	            <div class="chat_list">
	              <div class="chat_people">
	                <div class="chat_img"> 
	                <c:if test="${plusPeoList.profile != null }">
	                	<img src="/${plusPeoList.profile }" alt="sunil"> 
	                </c:if>
	                <c:if test="${plusPeoList.profile == null }">
	                	<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> 
	                </c:if>
	                </div>
	                <div class="chat_ib">
<%-- 	                  <h5>${plusPeoList.nick} <span class="chat_date"><fmt:formatDate value="${now }" pattern="MMM DD일"/></span></h5><!-- 최근 접속일자로 바꿀 것 --> --%>
	                  <h5>${plusPeoList.nick} <span class="chat_date"><a href="#"><i class="fa fa-circle text-success"></i> Online</a></span></h5><!-- 최근 접속일자로 바꿀 것 -->
	                  <a href="#"><i class="fa fa-circle text-gray"></i> Offline</a>
	                </div>
	              </div>
	            </div>
	          </c:forEach>
	          </div>
	        </div>
	        <div class="mesgs">
	          <div class="msg_history" id="msg_history">
				<main class="chat" id="chat">
				
            <!-- 받은 메시지 -->
				<div id="nextMsg"></div>
			<!-- 받은 메시지 -->
			
			</main>
	          </div>
	          <div class="type_msg">
	            <div class="input_msg_write">
	              <input type="text" class="msg" id="msg" placeholder="Type a message" />
	              <button class="msg_send_btn" id="btnSend"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
	            </div>
	          </div>
	        </div>
	      </div>
	      </div>
	  <!-- <!-- 칭찬하기/주시하기  @@@@@@@@@@@@@@@@@@@@@@@@@ -->
	  <!-- /.content-wrapper -->
	</div>
</div>
</div>
</div>
<%@ include file="../include/footer.jsp" %>

<!--계산기 -->
<script type="text/javascript">
	//get element
	var numWrap = document.querySelector('.key-wrap');
// 	var calcWrap = document.querySelector('.calc-wrap');
	var result = document.querySelector('.result2');
	
	//init data
	const keyboard = [1, 2, 3, 4, 5, 6, 7, 8, 9, '00', 0, '<'];
	//const calc = ['<', '+', '-'];
	let formula = [];
	
	//append dom, event
	for (const i in keyboard) {
	  const btn = document.createElement('button');
	  btn.classList.add('num2');
	  btn.classList.add('label-' + i);
	  btn.value = keyboard[i];
	  btn.innerText = keyboard[i];
	  btn.addEventListener('click', calculate);
	  numWrap.appendChild(btn);
	}
	// calculate function
	function calculate(e) {
	  const value = e.target.value;
	  if (value === '=') {
	    const data = eval(formula.join('')) || '';
	    formula = data.toString().split('');
	  }
	/*   else if (value === '00') formula = []; */
	  else if (value === '<') formula.pop();
	  else formula.push(value);
	  
	  result.innerText = formula.join('');
	}
</script>

<style>
.whitespace{
/* 	border: solid red; */
	width: 100%;
	height: 40%;
	padding: 0 1.4rem;
	font-weight: 500;
	font-size: 2rem;
	overflow: auto;
	box-sizing: border-box;
	color: #363A3C;
}
.accountInfo2{
	width: 100%;
/* 	border: solid red; */
	/* height: 1%; */
	padding: 0 1.4rem;
	font-weight: 500;
	font-size: 2rem;
	overflow: auto;
	box-sizing: border-box;
	color: #363A3C;
}


.modal-content{
	height: 570px;
}
.modal-body{
	height: 80%;
}
.modal-body .frame2 {
  width: 85%;
  height: 400px;
  position: fixed;
  top: 35%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 2px;
  box-shadow: 4px 8px 16px 0 rgba(0,0,0,0.1);
/*   background: #FC5C7D;  */
  background: -webkit-linear-gradient(to right, #6A82FB, #FC5C7D); 
/*   background: linear-gradient(to right, #6A82FB, #FC5C7D); */
}
.calculator2 {
  margin-left: 2%;
  width: 75%;
  height: 75%;
  display: flex;
  justify-content: flex-end;
  flex-direction: column;
  background: rgba( 250, 250, 250, 0.8);
  box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.7 );
  backdrop-filter: blur(4px);
  border-radius: 0.5rem;
  border: 1px solid rgba( 255, 255, 255, 0.18 );
/*   transform: translate(calc(var(--x)/45), calc(var(--y)/45)); */
}
.result2 {
  width: 100%;
  height: 10%;
  padding: 0 1.4rem;
  font-weight: 500;
  font-size: 2rem;
  overflow: auto;
  box-sizing: border-box;
  color: #363A3C;
}
.content2 {
  width: 100%;
  display: flex;
}
.key-wrap,
.calc-wrap {
  height: 13rem;
  display: grid;  
}
.key-wrap {
  flex: 4;
  grid-template-columns: auto auto auto;
}
.calc-wrap {
  flex: 1;
}
.num2,
.calc2 {
  position: relative;
  background: transparent;
  color: #363A3C;
  border: 1px solid rgba(0,0,0, 0.2);
  font-size: 2rem;
  font-weight: 500;
  cursor: pointer;
  transition: 0.25s;
  &:hover {
    background: #000;
    color: #3d3d3d;
  }
}

.label-112 {
  background: #6A82FB;
  &:hover {
    background: #FC5C7D;
  }
}
</style>
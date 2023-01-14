<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarAsset.jsp" %>
	
<script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	
<script>
	function userCheck() {
		var cfm = confirm(" 사용자 인증이 필요한 서비스입니다.\n 인증 서비스로 이동 하시겠습니까? ");
		if (cfm) {
			return true;
		} else {
			return false;
		}
	}
</script>

<script type="text/javascript">
	$(document).ready(function(){
		// 마우스 올리면 색변경
		$('.info-box.bg-yellow').mouseover(function(){
			$(this).attr("class", "info-box bg-yellow-active");
		});
		$('.info-box.bg-yellow').mouseleave(function(){
			$(this).attr("class", "info-box bg-yellow");
		});
		
		// 펼치고 접기 관련
		$('#account_pa').click(function(){
			
			$(this).attr("class", "info-box bg-yellow-active");
			
			if ($('#account_ch').css("display") == "block") {
				$('#account_ch').slideUp();
			} else {
				$('#account_ch').slideDown();
			}
		});
		
		$('#card_pa').click(function(){
			if ($('#card_ch').css("display") == "block") {
				$('#card_ch').slideUp();
			} else {
				$('#card_ch').slideDown();
			}
		});
		
		$('#cash_pa').click(function(){
			if ($('#cash_ch').css("display") == "block") {
				$('#cash_ch').slideUp();
			} else {
				$('#cash_ch').slideDown();
			}
		});
		// 펼치고 접기 관련
		
		
		
		// 모달창 관련
		// 계좌 모달창
		$('.startModal_account').click(function(){
			$('#str_account').text($(this).children('.account_alias_account').val());
			$('#str_accountNum').text($(this).children('.account_num_masked_account').val());
			
			$('#iframe_account').attr("src", "/asset/accountHistory?fintech_use_num="+$(this).children().val());
			
			$('#modal-account').modal();
		})
		
		// 카드 모달창
		$('.startModal_card').click(function(){
			$('#str_card').text($(this).children('.card_name_card').val());
			$('#str_cardNum').text($(this).children('.card_num_masked_card').val());
			
			$('#iframe_card').attr("src", "/asset/cardHistory?card_id="+$(this).children().val()
					+"&cardSum="+$(this).children('.card_part_sum_card').val() );
			
			$('#modal-card').modal();
		});
		
			
		// 현금 모달창
		$('.startModal_cash').click(function(){

			$('#iframe_cash').attr("src", "/asset/insertCash");
			
			$('#modal-cash').modal();
		});
		// 모달창 관련
		
		$(".btn.btn-primary.mo").click(function(){

			location.reload();
		});
			
			
		
		
	});
	
	
	
	

</script>


	
	
	
	<c:if test="${userVO == null}">
		<h1>로그인이 필요합니다 !</h1>
	</c:if>
	<c:if test="${userVO != null}">	
	
	<c:if test="${userVO.isCheck.equals('N') }">
		<section class="content">
			<div class="error-page" style="margin-left: 10%">
				<div class="error-content">
					<h3>
						<i class="fa fa-warning text-yellow"></i> 등록된 자산정보가 없습니다!
					</h3>
					<p style="margin-left: 15%">
						자산 정보를 불러오시겠습니까?
					</p>
					<form action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" method="get" onsubmit="return userCheck();">
						<!-- 고정값 : code -->
						<input type="hidden" name="response_type" value="code">
						<!-- 오픈뱅킹에서 발급한 이용기관 앱의 Client ID -->
						<input type="hidden" name="client_id" value="d357debb-9ab8-401d-a882-ce684fb5b3f7">
						<!-- 사용자 인증이 성공하면 이용기관으로 연결되는 URL callback_uri -->
						<input type="hidden" name="redirect_uri" value="http://localhost:8080/asset/callback">
						<!-- Access Token 권한 범위 -->
						<input type="hidden" name="scope" value="login inquiry transfer cardinfo">
						<!-- 보안위협에 대응하기 위해 세팅하는 난수값 (32자리) -->
						<input type="hidden" name="state" value="12345678123456781234567812345678">
						<!-- 사용자인증타입 구분주 2) (0:최초인증, 1:재인증, 2:인증생략) -->
						<input type="hidden" name="auth_type" value="0">
						
						<input type="submit" class="btn btn-block btn-success btn-lg" id="assetCheck" 
						style="width: 200px; margin: 20px 10%; background-color: #FFDB83; border-color: #1e282c" value="내 자산 불러오기">	
					</form>
				</div>
			</div>
		</section>
	</c:if>
	
	<c:if test="${userVO.isCheck.equals('Y') }">
		
		<!-- 계좌합 -->
		<c:set var="accountSum" value="${0 }" />
		<c:forEach var="sumVO1" items="${accountList }">
				<c:set var="accountSum" value="${accountSum +  sumVO1.balance_amt}"></c:set>
		</c:forEach>
	
		<!-- 카드합 -->
		<c:set var="cardSum" value="${0 }"/>
		<c:forEach items="${cardHistoryList }" var="cardHistoryList2">
			<c:forEach items="${cardHistoryList2 }" var="cardHistoryVO">
					<c:if test="${cardHistoryVO.card_tran_date.substring(0,6).equals(now_date) }">
						<c:set var="cardSum" value="${cardSum + cardHistoryVO.card_tran_amt }"/>
					</c:if>
			</c:forEach>
		</c:forEach>
		
		<!-- 현금합 -->
		
	
		<!-- 전체 순자산 (계좌합 - 카드값 + 현금) -->	
		<div style="margin: 50px 0 0 100px;">
			<h1>📌 내 자산</h1>
			<h2> 💎 ${userVO.nick } 님의 순자산은 : <fmt:formatNumber value="${accountSum - cardSum + cashVO.cash_amt}"/> 원 입니다 💎 </h2>
		</div>
	
		<div style="margin: 50px 100px 0 80px;">
		
		
			<!-- 계좌 -->
			<div class="info-box bg-yellow" style="cursor:pointer; margin-bottom: 1px; min-height:70px; height: 70px;" id="account_pa">
				<span class="info-box-icon" style="width: 70px; height: 70px; line-height: 80px;">
					<i class="fa fa-bank"></i>
				</span>
				<div class="info-box-content" style="padding-top: 15px">
					<span class="info-box-text" style="font-size: 2em; margin-left: 20px; display: inline;">계 좌</span> 
					<span class="info-box-text" style="font-size: 2em; margin-left: 200px; display: inline;">총 <fmt:formatNumber value="${accountSum }"/>  원</span> 
				</div>
			</div>
			
			<!-- 계좌목록 -->
			<div id="account_ch" style="display: none;">
			<c:forEach var="vo" items="${accountList }">
				<div class="info-box" style="margin: 0 0 1px 0; width: 95%;">
					<a href="#" class="startModal_account">
						<input type="hidden" value="${vo.fintech_use_num }" class="fintech_use_num_account">
						<input type="hidden" value="${vo.account_alias }" class="account_alias_account">
						<input type="hidden" value="${vo.bank_name} ${vo.account_num_masked }" class="account_num_masked_account">
						<span class="info-box-icon" style="width: 70px; height: 70px; line-height: 80px;">
							<i class="fa fa-bank"></i>
						</span>
						<div class="info-box-content" style="padding-top: 15px; display: flex;">
							<span class="info-box-text" style="font-size: 2em; margin-left: 20px; display: inline-block; width: 15%;">${vo.account_alias }</span> 
							<span class="info-box-text" style="font-size: 2em; margin-left: 50px; display: inline-block; width: 35%;">총 <fmt:formatNumber value="${vo.balance_amt }"/> 원</span> 
							<span class="info-box-text" style="font-size: 2em; margin-left: 50px; display: inline-block;">${vo.account_num_masked }</span> 
						</div>
					</a>
				</div>
			</c:forEach>
			</div>
			
			<!-- 카드 -->
			<div class="info-box bg-yellow" style="cursor:pointer; margin-top: 50px; margin-bottom: 1px;" id="card_pa">
				<span class="info-box-icon" style="width: 70px; height: 70px; line-height: 80px;">
					<i class="fa fa-credit-card"></i>
				</span>
				<div class="info-box-content" style="padding-top: 15px">
					<span class="info-box-text" style="font-size: 2em; margin-left: 20px; display: inline;">카 드</span> 
					<span class="info-box-text" style="font-size: 2em; margin-left: 200px; display: inline;">이번달 카드 값 : <fmt:formatNumber value="${cardSum }"/> 원</span> 
				</div>
			</div>
			
			<!-- 카드목록 -->
			<div id="card_ch" style="display: none;">
			
			<c:set var="cardIDX" value="${0 }"></c:set>
			<c:forEach items="${cardList }" var="cardVO" >
				
				<!-- 카드별 합계 구하기 -->
				<c:set var="cardPartSum" value="${0}"/>
				<c:forEach var="cardHistoryVO" items="${cardHistoryList.get(cardIDX) }">
					<c:if test="${cardHistoryVO.card_tran_date.substring(0,6).equals(now_date) }">
						<c:set var="cardPartSum" value="${cardPartSum+cardHistoryVO.card_tran_amt}"/>
					</c:if>
				</c:forEach>
				
					<div class="info-box" style="margin: 0 0 1px 0; width: 95%">
						<a href="#" class="startModal_card">
							<input type="hidden" value="${cardVO.card_id }" class="card_id_card">
							<input type="hidden" value="${cardVO.card_name }" class="card_name_card">
							<input type="hidden" value="${cardVO.card_num_masked }" class="card_num_masked_card">
							<input type="hidden" value="${cardPartSum}" class="card_part_sum_card">
							<span class="info-box-icon" style="width: 70px; height: 70px; line-height: 80px;">
								<i class="fa fa-credit-card"></i>
							</span>
							<div class="info-box-content" style="padding-top: 15px;">
								<span class="info-box-text" style="font-size: 2em; margin-left: 20px; display: inline-block; width: 20%">${cardVO.card_name }</span> 
								<span class="info-box-text" style="font-size: 2em; margin-left: 50px; display: inline-block; width: 35%">총 ${cardPartSum } 원</span> 
								<span class="info-box-text" style="font-size: 2em; margin-left: 50px; display: inline-block;">${cardVO.card_num_masked }</span> 
							</div>
						</a>
					</div>
				<c:set var="cardIDX" value="${cardIDX+1}"/>
			</c:forEach>
			</div>
			
			
			<!-- 현금 -->
			<div class="info-box bg-yellow" style="cursor:pointer; margin-top: 50px; margin-bottom: 1px;" id="cash_pa">
				<span class="info-box-icon">
					<i class="fa fa-database"></i>
				</span>
				<div class="info-box-content" style="padding-top: 15px">
					<span class="info-box-text" style="font-size: 2em; margin-left: 20px; display: inline;">현 금</span> 
					<span class="info-box-text" style="font-size: 2em; margin-left: 200px; display: inline;">
						총
						<c:if test="${cashVO == null }">
						 	0 
						</c:if>
						<c:if test="${cashVO != null }">
							<fmt:formatNumber value="${cashVO.cash_amt }"/>
						</c:if>
						원
					</span> 
				</div>
			</div>
			
			<!-- 현금목록 -->
			<div id="cash_ch" style="display: none;">
				<div class="info-box" style="margin: 0 0 1px 0; width: 95%">
					<a href="#" class="startModal_cash">
						<span class="info-box-icon">
							<i class="fa fa-database"></i>
						</span>
						<div class="info-box-content" style="padding-top: 15px;">

							<span class="info-box-text" style="font-size: 2em; margin-left: 20px; display: inline-block; width: 15%;">
								<c:if test="${cashVO == null }">
									현금 내역이 없습니다.
								</c:if>
								<c:if test="${cashVO != null }">
									${cashVO.cash_inout }
								</c:if>
							</span> 

							<span class="info-box-text" style="font-size: 2em; margin-left: 50px; display: inline-block;">
								<c:if test="${cashVO != null }">
									총  <fmt:formatNumber value="${cashVO.cash_amt }"/> 원
								</c:if>
							</span> 
						</div>
					</a>
				</div>
			</div>
					
		</div>
	</c:if>
	
	</c:if>


<!-- 계좌 내역 정보 불러오기 모달창 -->
	<div class="modal fade" id="modal-account" style="margin-top: 0%; padding-top: 5%">
		<div class="modal-dialog" style="width:1200px; height: 800px;">
			<div class="modal-content" style="height: 700px; text">
				<div class="modal-header" style="height: 100px; background-color: #04c584;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" style="color: #fff; font-size: 3em; letter-spacing: 3px; margin-top: 5px">
						<strong id="str_account">임시통장</strong>
						<strong id="str_accountNum" style="float: right;">123132313123</strong>
					</h4>
				</div>
				<div class="modal-body" style="height: 530px;">
					<p>
					
					<iframe id="iframe_account" src="" width="300px;" height="530px;">
					</iframe>
					
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="saveABook" data-dismiss="modal" style="background-color: #363A3C; margin-right: 30px; width: 100px">확 인</button>
				</div>
			</div>

		</div>
	</div>
<!-- 계좌 내역 정보 불러오기 모달창 -->


<!-- 카드 내역 정보 불러오기 모달창 -->
	<div class="modal fade" id="modal-card" style="margin-top: 0%; padding-top: 5%">
		<div class="modal-dialog" style="width:1200px; height: 800px;">
			<div class="modal-content" style="height: 700px; text">
				<div class="modal-header" style="height: 100px; background-color: #04c584;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" style="color: #fff; font-size: 3em; letter-spacing: 3px; margin-top: 5px">
						<strong id="str_card">임시카드</strong>
						<strong id="str_cardNum" style="float: right;">123132313123</strong>
					</h4>
				</div>
				<div class="modal-body" style="height: 530px;">
					<p>
					
					<iframe id="iframe_card" src="" width="300px;" height="530px;">
					</iframe>
					
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="saveABook" data-dismiss="modal" style="background-color: #363A3C; margin-right: 30px; width: 100px">확 인</button>
				</div>
			</div>

		</div>
	</div>
<!-- 카드 내역 정보 불러오기 모달창 -->

<!-- 현금 내역 정보 불러오기 모달창 -->
	<div class="modal fade" id="modal-cash" style="margin-top: 0%; padding-top: 5%">
		<div class="modal-dialog" style="width:600px; height: 700px;">
			<div class="modal-content" style="height: 600px; text">
				<div class="modal-header" style="height: 100px; background-color: #04c584;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" style="color: #fff; font-size: 3em; letter-spacing: 3px; margin-top: 5px">
						<strong id="str_cash">내 현금</strong>
					</h4>
				</div>
				<div class="modal-body" style="height: 430px;">
					<p>
					
					<iframe id="iframe_cash" src="" width="500px;" height="430px;">
					</iframe>
					
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary mo" id="saveABook" data-dismiss="modal" style="background-color: #363A3C; margin-right: 30px; width: 100px">닫 기</button>
				</div>
			</div>

		</div>
	</div>
<!-- 현금 내역 정보 불러오기 모달창 -->
 


<!-- 
<h1 style="margin: 100px 20px 0 0"> 여기는 임시 </h1>
	
	<form action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" method="get" onsubmit="return userCheck();">
		고정값 : code
		<input type="hidden" name="response_type" value="code">
		오픈뱅킹에서 발급한 이용기관 앱의 Client ID
		<input type="hidden" name="client_id" value="d357debb-9ab8-401d-a882-ce684fb5b3f7">
		사용자 인증이 성공하면 이용기관으로 연결되는 URL callback_uri
		<input type="hidden" name="redirect_uri" value="http://localhost:8080/asset/callback">
		Access Token 권한 범위
		<input type="hidden" name="scope" value="login inquiry transfer cardinfo">
		보안위협에 대응하기 위해 세팅하는 난수값 (32자리)
		<input type="hidden" name="state" value="12345678123456781234567812345678">
		사용자인증타입 구분주 2) (0:최초인증, 1:재인증, 2:인증생략)
		<input type="hidden" name="auth_type" value="0">
		
		<input type="submit" class="btn btn-block btn-success btn-lg" id="assetCheck" 
		style="width: 200px; margin: 20px 40px" value="내 자산 불러오기">	
	</form>
	
	
	<form action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" method="get" onsubmit="return userCheck();">
		고정값 : code
		<input type="hidden" name="response_type" value="code">
		오픈뱅킹에서 발급한 이용기관 앱의 Client ID
		<input type="hidden" name="client_id" value="d357debb-9ab8-401d-a882-ce684fb5b3f7">
		사용자 인증이 성공하면 이용기관으로 연결되는 URL callback_uri
		<input type="hidden" name="redirect_uri" value="http://localhost:8080/asset/callbackCard">
		Access Token 권한 범위
		<input type="hidden" name="scope" value="login cardinfo">
		보안위협에 대응하기 위해 세팅하는 난수값 (32자리)
		<input type="hidden" name="state" value="12345678123456781234567812345678">
		사용자인증타입 구분주 2) (0:최초인증, 1:재인증, 2:인증생략)
		<input type="hidden" name="auth_type" value="0">
		카드 인증
		<input type="hidden" name="register_info" value="C">
		
		<input type="submit" class="btn btn-block btn-success btn-lg" id="assetCheck" 
		style="width: 200px; margin: 20px 40px" value="카드 불러오기(미완성)">	
	</form>
	
	
	
	<form action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" method="get" onsubmit="return userCheck();">
		고정값 : code
		<input type="hidden" name="response_type" value="code">
		오픈뱅킹에서 발급한 이용기관 앱의 Client ID
		<input type="hidden" name="client_id" value="d357debb-9ab8-401d-a882-ce684fb5b3f7">
		사용자 인증이 성공하면 이용기관으로 연결되는 URL callback_uri
		<input type="hidden" name="redirect_uri" value="http://localhost:8080/asset/callbackCenter">
		Access Token 권한 범위
		<input type="hidden" name="scope" value="login inquiry transfer">
		보안위협에 대응하기 위해 세팅하는 난수값 (32자리)
		<input type="hidden" name="state" value="12345678123456781234567812345678">
		사용자인증타입 구분주 2) (0:최초인증, 1:재인증, 2:인증생략)
		<input type="hidden" name="auth_type" value="0">
		
		<input type="submit" class="btn btn-block btn-success btn-lg" id="assetCheck" 
		style="width: 200px; margin: 20px 40px" value="센터 인증 기관용(미완성)">	
	</form> -->
	
</div>
<%@ include file="../include/footer.jsp" %>
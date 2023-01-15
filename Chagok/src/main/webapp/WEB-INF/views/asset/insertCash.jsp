<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/bkcss/bkcss1.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/bkcss/bkcss2.css">

<script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<!-- jQuery.number -->
<script src="/resources/js/jquery.number.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		// 금액 입력 / x 버튼
		$('.input_3Pz_8').blur(function(){
			var amt = $(this).val();
			
			$('.show_28yFC').html($.number(amt));
			
			$('.input_3Pz_8').val($.number(amt));
			
		});
		
		$('.amountClear_TPmfy').click(function(){
			$('.show_28yFC').html(0);
			$('.input_3Pz_8').val(0);
			
		});
		
		// 저장버튼 눌렀을 때
		$('.next_2m58y').click(function(){
			
			if ( $('#form-card-benefit-type-discount').is(":checked") == false &&
					$('#form-card-benefit-type-mileage').is(":checked") == false ) {
				   Swal.fire({
				        title: '거래 유형을 선택하세요.', 
				        icon: 'warning'
			   	   });		
			} else if ( $('.input_3Pz_8').val() == "0" ) {
				   Swal.fire({
				        title: '금액을 입력하세요.', 
				        icon: 'warning'
			   	   });						
			} else {
				
				var cash_inout = $("input[name='form-card-benefit-type']:checked").val();
				var cash_amt = $('.input_3Pz_8').val();
				
				$(this).attr("href", "/asset/insertCashPro?cash_inout="+cash_inout+"&cash_amt="+cash_amt);
				
				$('#modal-cash').modal('hide');
			}
			
			
			
		});
		
		
	});



</script>



</head>

<body>
	
	
<c:if test="${insertOK.equals('OK') }">
	
	<div class="wrap_1JcE-" style="padding-bottom: 0px; padding-top: 15px;">
		<div class="container_3PD-f">
		
			<div class="container_3m_kA">
				<div class="question_1wxEH">
					<span class="tag_2Ltsy">알림</span>입력이 완료되었습니다 !
				</div>
			</div>
		</div>
	</div>
	
</c:if>
	
	
	<!-- 
	<div class="wrap_1y4z9">
		<div class="container__tXwE right_2TA44">
			<div class="sort_16prT">
				<div class="container_3Jw5o boldText_o4ss5">
					<input id="82a34e79-f7c2-48f2-b0c8-8eac6528b3e5" type="checkbox"
						class="input_1Rc57">
					<div class="clickAbleLayer_3AJtV"></div>
					<label for="82a34e79-f7c2-48f2-b0c8-8eac6528b3e5"
						class="title_2t2z9" data-test="dropdown-label">신용카드<span
						class="arrow_16bdk"></span></label>
					<ul class="list_1IQps">
						<li class="item_3nRpz"><button
								class="defaultButton_2p1Dh button_ecG6a" data-test="drop-down0">신용/체크
								전체</button></li>
						<li class="item_3nRpz"><button
								class="selectedButton_3sCf9 button_ecG6a boldText_o4ss5"
								data-test="drop-down1">신용카드</button></li>
						<li class="item_3nRpz"><button
								class="defaultButton_2p1Dh button_ecG6a" data-test="drop-down2">체크카드</button></li>
					</ul>
				</div>
			</div>
		</div> 
		-->

<c:if test="${insertOK == null }">
	
	<div class="wrap_1JcE-" style="padding-bottom: 0px; padding-top: 15px;">
		<div class="container_3PD-f">
		
			<div class="container_3m_kA">
				<div class="question_1wxEH">
					<span class="tag_2Ltsy">기본</span>필수 입력 항목입니다
				</div>
				<dl class="form_o-kDL" style="padding: 20px 16px 20px 16px; margin-bottom: 10px;">
					
					<dt class="essential_23bSY">거래 유형을 선택하세요. </dt>
					<dd>
						<ul class="wrap_2eCTW">
							<li>
								<input type="radio" id="form-card-benefit-type-discount" name="form-card-benefit-type" value="입금">
								<label for="form-card-benefit-type-discount">입 금</label>
							</li>
							<li>
								<input type="radio" id="form-card-benefit-type-mileage" name="form-card-benefit-type" value="출금">
								<label for="form-card-benefit-type-mileage">출 금</label>
							</li>
						</ul>
					</dd>
					<dt class="essential_23bSY">보유한 현금을 입력하세요. </dt>	
					<dd>
						<div>
							<div class="amount_3sIVH">
								<span class="desktop_1HAhS">
									<div class="wrap_M4OpS">
										<input type="text" class="input_3Pz_8" value="0"
											style="color: rgb(4, 197, 132); font-size: 20px; text-align: right; letter-spacing: 5px; padding-right: 10px;">
										<span class="show_28yFC"
											style="color: rgb(4, 197, 132); font-size: 20px; text-align: right; letter-spacing: 5px; padding-right: 10px;">0
										</span>
									</div>
								</span>
								<span class="tabletMobile_1kcWU">
									<div class="wrap_M4OpS">
										<input type="text" class="input_3Pz_8" value="0" 
											style="color: rgb(4, 197, 132); font-size: 18px; text-align: right; letter-spacing: 5px; padding-right: 10px;">
										<span class="show_28yFC" 
											style="color: rgb(4, 197, 132); font-size: 18px; text-align: right; letter-spacing: 5px; padding-right: 10px;">0
										</span>
									</div>
								</span>
								<span class="amountCurrency_1OwBP">원</span>
								<button class="amountClear_TPmfy">초기화</button>
								
							</div>
							<br>
							<a class="next_2m58y" href="#" style="background-color: #04c584;">저장하기</a>
						</div>
					</dd>
				</dl>
			</div>
			
			
		</div>
	</div>

</c:if>
		
</body>
</html>
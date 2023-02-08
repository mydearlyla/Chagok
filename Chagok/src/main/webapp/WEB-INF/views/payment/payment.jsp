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



<head>
<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {
	$('#subsc').click(function(){
	    swal.fire({
	        title: "구독서비스는 준비 중입니다!",
	        type: "info"
	        });			
	    });

	});

</script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="../resources/mainpagecss/css/font.css">


<head>
<style>

*{
    margin: 0;
    padding: 0;
    font-family: 'GmarketSans';
}
body{
	background-color: rgb(228, 228, 228);
}
main{
    display: flex;
    flex-direction: column;
    margin:  50px ;
    padding: 50px;
    background-color: #ffdb830a;
    flex-direction: row;
    flex-wrap: wrap;
}

.ptop{
    display: flex;
/*     align-items: center; */
    margin-bottom: 50px;
}

.pimg{
    width: 200px;
    height: 200px;
    contain: content;
}
pimg{
    width: 100%;
    height: 100%;
}

.ptop .pinfo{
    display: flex;
    flex-direction: column;
    margin-left: 60px;
}
.ptop .pinfo p{
    line-height: 1.5;
}


h1{
    font-size: 50px;
}

h2{
    margin-bottom: 20px;
}


.pbottom{
    display: flex;
    justify-content: space-between;
    margin-bottom: 50px;
}

.pbottom .pleft{
    width: 250pX;
}
.pbottom .pleft p{
    margin-right: 10px;
    line-height: 1.5;
    font-size: 18px;
}

/*****/

.pright{
	margin: 20px ;
	margin-top: 50px;
}

.pright p{
	margin-bottom: 30px;
	word-break: keep-all;
}

.pcontainer{
    display: grid;
/*     grid-template-columns: repeat(1,1fr); */
    grid-gap: 1rem;
}
 
.pcontainer .pskill{
/*     width :         200px; */
    height:         100px;
    box-shadow:     3px 3px 4px #333;
    cursor:          pointer;
    transition:      ease-in 0.2s;
    display:         flex;
/*     flex-direction:  column; */
    text-align:      center;
    align-items:     center;
    justify-content: center;
    border-radius:   20px;
}

.pcontainer .pskill:hover{
    box-shadow:       0px 0px 0px;
    background-color: #66bb7a40;
}

.pcontainer .pskill i{
    font-size:     40px;
    margin-bottom: 10px;
    color:        gray;
    transition:    all ease-in 0.5s;
}

.pcontainer .pskill:hover i{
    color: black;
}

.pcontainer .pskill img{
	width: 20%;
}

@media only screen and (max-width: 1050px) {
    .pcontainer {
        align-items: center;
        text-align: center;
        grid-template-columns: repeat(3, 1fr);
        margin: 20px;
    }
    .pbottom{
        display: flex;
        flex-direction: column;
    }
    .pbottom .pleft{
        width: 100%;
        margin-bottom: 50px;
    }
  }

@media only screen and (max-width: 850px) {
    .pcontainer {
        align-items:           center;
        text-align :           center;
        grid-template-columns: repeat(2, 1fr);
    }
    .pcontainer .pskill{
        width: 300px;
        height: 200px;
    }
} 

@media only screen and (max-width: 800px) {
    .pcontainer {
        align-items:           center;
        text-align :           center;
        grid-template-columns: repeat(2, 1fr);
    }
    .pcontainer .pskill{
        width:  250px;
        height:  150px;
    }
    .ptop{
        display: flex;
        flex-direction: column;
    }
}

@media only screen and (max-width: 700px) {
    .pcontainer {
        align-items:           center;
        text-align :           center;
        grid-template-columns: repeat(1, 1fr);
    }
    .pcontainer .pskill{
        width:  100%;
        height:  250px;
    }
}


@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;600;800&display=swap");


.pcard, .pcard__title, .pcard__btn {
 box-sizing: border-box;
  transition: all 0.1s ease;
}

.pcard {
  width: 250px;
  height: 250px;
  margin-left: 2rem;
  border-radius: 7px;
  border: 3px solid #333;
  color: #333;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
}

.pcard__title {
  font-size: 1.8rem;
  font-weight: 600;
}

.pcard__price {
  font-size: 3rem;
  font-weight: 800;
  margin-top: 2rem;
}

.pcard__price sup {
  font-size: 1rem;
  font-weight: 400;
  top: 0.5em;
}

.pcard__btn {
  font-size: 1.2rem;
  font-weight: 600;
  background: none;
  cursor: pointer;
  padding: 0.5rem 3rem;
  margin-top: 2rem;
  border: 3px solid #333;
  border-radius: 5px;
  color: #333;
}

.pcard::after {
  content: "";
  position: absolute;
  background: #66BB7A;
  width: 100%;
  height: 100%;
  z-index: -1;
  top: 1rem;
  left: 1rem;
  border-radius: 7px;
}

.pcard:hover {
  border: 3px solid #66BB7A;
  background: white;
  cursor: pointer;
}

.pcard:hover .pcard__title {
  transform: translateY(-10px);
}

.pcard:hover .pcard__btn {
  background: #66BB7A;
  border: 3px solid #66BB7A;
  color: white;
  transform: scale(1.05);
}

.pcard:hover::after {
  background: #66BB7A;
}
</style>


<script type="text/javascript">
// const IMP = window.IMP; // 생략 가능
IMP.init("imp44431277"); // 예: imp00000000a (가맹점 식별코드)
</script>


<script type="text/javascript">
$(document).ready(function(){
	$("#pay").click(requestPay);
});
function requestPay() 
{
	IMP.request_pay({
  		pg : 'html5_inicis',
  	    pay_method : 'card',
  	    merchant_uid: "order_no_0002"+ new Date().getTime(), // 상점에서 관리하는 주문 번호를 전달
  	    name : '꿀 충전',
  	    amount : 5000,
  	    buyer_email : 'param.userVO.id',
  	    buyer_name : 'param.userVO.rname',
  	    buyer_tel : '010-1234-5678',
  	    buyer_addr : '서울특별시 강남구 삼성동',
  	    buyer_postcode : '123-456'
    },
    function(rsp) {
	if ( rsp.success ) {
    	var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        console.log(msg+"AAAA"); 
        Swal.fire({
        	title: '결제가 완료되었습니다!', 
        	icon: 'success'
        });
        
        	$.ajax({
        	    type : 'post',           // 타입 (get, post, put 등등)
        	    url : '/paymentPOST',           // 요청할 서버url
        	    async : true,            // 비동기화 여부 (default : true)
        	    contentType : "application/json",
        	    data : JSON.stringify({  // 보낼 데이터 (Object , String, Array)
        	      "pay_cash" : rsp.paid_amount,
        	      "pay_mean" : rsp.pay_method,
        	      "pay_regdate" : new Date().getTime()
        	    })
        	});
    } else {
    	 var msg = '결제에 실패하였습니다.\n';
         msg += '에러내용 : ' + rsp.error_msg;
    }
    }
	) 
}
</script>

<script type="text/javascript">
$(document).ready(function(){
	$("#pay10000").click(requestPay1);
});
function requestPay1() 
{
	IMP.request_pay({
  		pg : 'html5_inicis',
  	    pay_method : 'card',
  	    merchant_uid: "order_no_0002"+ new Date().getTime(), // 상점에서 관리하는 주문 번호를 전달
  	    name : '꿀 충전',
  	    amount : 10000,
  	    buyer_email : 'param.userVO.id',
  	    buyer_name : 'param.userVO.rname',
  	    buyer_tel : '010-1234-5678',
  	    buyer_addr : '서울특별시 강남구 삼성동',
  	    buyer_postcode : '123-456'
    },
    function(rsp) {
	if ( rsp.success ) {
    	var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        console.log(msg+"AAAA"); 
        Swal.fire({
        	title: '결제가 완료되었습니다!', 
        	icon: 'success'
        });
        
        	$.ajax({
        	    type : 'post',           // 타입 (get, post, put 등등)
        	    url : '/paymentPOST',           // 요청할 서버url
        	    async : true,            // 비동기화 여부 (default : true)
        	    contentType : "application/json",
        	    data : JSON.stringify({  // 보낼 데이터 (Object , String, Array)
        	      "pay_cash" : rsp.paid_amount,
        	      "pay_mean" : rsp.pay_method,
        	      "pay_regdate" : new Date().getTime()
        	    })
        	});
    } else {
    	 var msg = '결제에 실패하였습니다.\n';
         msg += '에러내용 : ' + rsp.error_msg;
    }
    }
	) 
}
</script>

<script type="text/javascript">
$(document).ready(function(){
	$("#pay50000").click(requestPay2);
});
function requestPay2() 
{
	IMP.request_pay({
  		pg : 'html5_inicis',
  	    pay_method : 'card',
  	    merchant_uid: "order_no_0002"+ new Date().getTime(), // 상점에서 관리하는 주문 번호를 전달
  	    name : '꿀 충전',
  	    amount : 50000,
  	    buyer_email : 'param.userVO.id',
  	    buyer_name : 'param.userVO.rname',
  	    buyer_tel : '010-1234-5678',
  	    buyer_addr : '서울특별시 강남구 삼성동',
  	    buyer_postcode : '123-456'
    },
    function(rsp) {
	if ( rsp.success ) {
    	var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        console.log(msg+"AAAA"); 
        Swal.fire({
        	title: '결제가 완료되었습니다!', 
        	icon: 'success'
        });
        
        	$.ajax({
        	    type : 'post',           // 타입 (get, post, put 등등)
        	    url : '/paymentPOST',           // 요청할 서버url
        	    async : true,            // 비동기화 여부 (default : true)
        	    contentType : "application/json",
        	    data : JSON.stringify({  // 보낼 데이터 (Object , String, Array)
        	      "pay_cash" : rsp.paid_amount,
        	      "pay_mean" : rsp.pay_method,
        	      "pay_regdate" : new Date().getTime()
        	    })
        	});
    } else {
    	 var msg = '결제에 실패하였습니다.\n';
         msg += '에러내용 : ' + rsp.error_msg;
    }
    }
	) 
}
</script>

</head>


<body>
    <main>
<%--     ${userVO } --%>
        <div class="ptop">
            <div class="pimg">
              <a href="https://imgbb.com/">
              <c:if test="${minusPeoList.profile != null }">
               	<img src="${pageContext.request.contextPath }/resources${minusPeoList.profile }" alt="sunil"> 
               </c:if>
               <c:if test="${minusPeoList.profile == null }">
               	<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> 
               </c:if>
              </a>
            </div>
            <div class="pinfo">
                <h1>꿀 충전 페이지</h1>
                <h3>
                    <strong>차곡 닉네임: </strong> ${userVO.nick } <br>
                    <strong>보유 꿀머니: </strong>  <fmt:formatNumber value="${userVO.buypoint+userVO.getpoint}"/> 꿀 <br>
                    <strong>환급가능 꿀머니: </strong>  <fmt:formatNumber value="${userVO.getpoint}"/> 꿀 <br>
                </h3>
            </div>
        </div>
        
        <div class="pbottom" style="width: 90%;">
            <div class="pleft" style="width: 40%;">
                <h2>환급 & 구독</h2>
                <div class="pcontainer">
                	<a href="/refund">
                    	<div class="pskill">
<!--                         <i class="pfa-solid pfa-video pvideo"></i> -->
						<p>환급</p>
						<img src="https://cdn-icons-png.flaticon.com/512/5500/5500861.png">
                    	</div>
                    </a>
                    <a href="#">
                    <div class="pskill" id="subsc" onclick="subAlert();">
                    	<p>구독</p>
                        <img src="https://cdn-icons-png.flaticon.com/512/3058/3058282.png">
                    </div>
                    </a>
                </div>
            </div>
            
       		<div class="pright" style="width: 50%;">
                <h3>환급</h3>
                <p>
                    꿀머니가 10,000꿀을 넘으면 현금으로 환급 받으실 수 있습니다.
                </p>
                 <h3>차곡 구독 서비스</h3>
                <p>
                    꿀머니로 차곡 구독 서비스를 구매하시면 해당월의 상세리포트를 받아보실 수 있습니다.<br>
                    상세리포트는 해당 연령대비, 성별대비 소비 결과를 확인하실 수 있습니다.
                </p>
            </div>
        </div>
        <hr>
<!--         <div> -->
<!-- 		<button onclick="requestPay()" id="pay">결제하기</button>  -->
<!-- 		결제하기 버튼 생성 -->
<!-- 		</div> -->
		<div style="border: 1px solid #FEFCF5;"></div>
		<div class="pcard" style="width: 30%;">
			<h1 class="pcard__title">Option 1</h1>
			<h2 class="pcard__price">
				<sup></sup>5,000<sup>꿀</sup>
			</h2>
			<button class="pcard__btn" onclick="requestPay()" id="pay">충전하기</button> 
		</div>
		<div class="pcard" style="width: 30%;">
			<h1 class="pcard__title">Option 2</h1>
			<h2 class="pcard__price">
				<sup></sup>10,000<sup>꿀</sup>
			</h2>
			<button class="pcard__btn" onclick="requestPay1()" id="pay10000">충전하기</button> 
		</div>
		<div class="pcard" style="width: 30%;">
			<h1 class="pcard__title">Option 3</h1>
			<h2 class="pcard__price">
				<sup></sup>50,000<sup>꿀</sup>
			</h2>
			<button class="pcard__btn" onclick="requestPay2()" id="pay50000">충전하기</button> 
		</div>
		
</main>
</body>    
    


</div>
<%@ include file="../include/footer.jsp"%>
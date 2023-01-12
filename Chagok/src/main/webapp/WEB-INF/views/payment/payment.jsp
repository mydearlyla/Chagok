<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
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
  	    name : '주문명:결제테스트',
  	    amount : 100,
  	    buyer_email : 'iamport@siot.do',
  	    buyer_name : '구매자이름',
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
        alert('결제가 완료되었습니다');
        
        	$.ajax({
        	    type : 'post',           // 타입 (get, post, put 등등)
        	    url : '/paymentPOST',           // 요청할 서버url
        	    async : true,            // 비동기화 여부 (default : true)
        	    contentType : "application/json",
//         	    headers : {              // Http header
//         	      "Content-Type" : "application/json",
//         	      "X-HTTP-Method-Override" : "POST"
//         	    },
        	   // dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
        	    data : JSON.stringify({  // 보낼 데이터 (Object , String, Array)
        	      "mno" : ${mno},
        	      "pay_cash" : rsp.paid_amount,
        	      "pay_mean" : rsp.pay_method,
        	      "pay_regdate" : new Date().getTime()
        	    })
//         	    ,
//         	    success : function(result) { // 결과 성공 콜백함수
//         	        console.log(result);
//         	    	alert('성공!');
//         	    },
//         	    error : function(request, status, error) { // 결과 에러 콜백함수
//         	        console.log(error)
//         	    }
        	});
        
        
//         $.ajax({
//         	type : 'POST',
//         	url : "/verifyIamport", 
//         	dataType: 'json',
//         	data: {
//         		imp_uid : "ab"
        		
//         	}
//         	success:function(){location.href="http://localhost:8080/refund"},
//         	error:function(){alert("AAA")}
//         });

    } else {
    	 var msg = '결제에 개같이 실패하였습니다.\n';
         msg += '에러내용 : ' + rsp.error_msg;
    }
    }
	) 
}
</script>











<!-- <script>
function requestPay() 
{
	 alert('click!');
    IMP.request_pay({
  		pg : 'html5_inicis',
  	    pay_method : 'card',
  	    merchant_uid: "order_no_0002"+ new Date().getTime(), // 상점에서 관리하는 주문 번호를 전달
  	    name : '주문명:결제테스트',
  	    amount : 100,
  	    buyer_email : 'iamport@siot.do',
  	    buyer_name : '구매자이름',
  	    buyer_tel : '010-1234-5678',
  	    buyer_addr : '서울특별시 강남구 삼성동',
  	    buyer_postcode : '123-456'
    }, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        console.log(msg);
	        $.ajax({
	        	type : 'POST',
	        	url : "/verifyIamport", 
	        	dataType: 'json',
	        	data: {
	        		imp_uid : rsp.imp_uid
	        		
	        	}
	        });
	    } else {
	    	 var msg = '결제에 개같이 실패하였습니다.\n';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	}); // function(rsp)
} // function requestPay()
</script> -->

    <main>
        <div class="ptop">
            <div class="pimg">
              <a href="https://imgbb.com/"><img src="https://i.ibb.co/tbSR7Ch/hero.png" alt="hero" border="0"></a>
            </div>
            <div class="pinfo">
<%--             ${mno} --%>
                <h1>차곡 결제 페이지</h1>
                <h4>
                    <strong>닉네임: </strong>Amine <br>
                    <strong>꿀머니: </strong>25.08.1999 <br>
                </h4>
            </div>
        </div>
        
        <div class="pbottom">
            <div class="pleft">
                <h2>환급 & 구독</h2>
                <div class="pcontainer">
                	<a href="/refund">
                    	<div class="pskill">
<!--                         <i class="pfa-solid pfa-video pvideo"></i> -->
						<p>환급</p>
						<img src="https://cdn-icons-png.flaticon.com/512/650/650917.png">
                    	</div>
                    </a>
                    <div class="pskill">
                    	<p>구독</p>
                        <img src="https://cdn-icons-png.flaticon.com/512/6165/6165272.png">
                    </div>
                </div>
            </div>
            
       		<div class="pright">
                <h3>환급</h3>
                <p>
                    꿀머니가 10,000을 넘으면 현금으로 환급 받으실 수 있습니다.<br>
                    (단, 부가세 10%를 제외한 나머지 금액으로 환급됩니다.)
                </p>
                 <h3>차곡 구독 서비스</h3>
                <p>
                    꿀머니로 차곡 구독 서비스를 구매하시면 해당월의 상세리포트를 받아보실 수 있습니다.<br>
                    상세리포트는 해당 연령대비, 성별대비 소비 결과를 확인하실 수 있습니다.
                </p>
            </div>
        </div>
        <hr>
        <div>
		<button onclick="requestPay()" id="pay">결제하기</button> <!-- 결제하기 버튼 생성 -->
		</div>
		<div class="pcard">
			<h1 class="pcard__title">Option 1</h1>
			<h2 class="pcard__price">
				<sup></sup>5,000<sup>꿀</sup>
			</h2>
			<button class="pcard__btn">Buy</button>
		</div>
		<div class="pcard">
			<h1 class="pcard__title">Option 2</h1>
			<h2 class="pcard__price">
				<sup></sup>10,000<sup>꿀</sup>
			</h2>
			<button class="pcard__btn">Buy</button>
		</div>
		<div class="pcard">
			<h1 class="pcard__title">Option 3</h1>
			<h2 class="pcard__price">
				<sup></sup>50,000<sup>꿀</sup>
			</h2>
			<button class="pcard__btn">Buy</button>
		</div>
		
</main>
    
    
<style>

*{
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}
body{
	background-color: rgb(228, 228, 228);
}
main{
    display: flex;
    flex-direction: column;
    margin:  50px ;
    padding: 50px;
    background-color: #ffdb8317;
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
    background-color: #acacac;
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
  font-size: 1.5rem;
  font-weight: 600;
}

.pcard__price {
  font-size: 2rem;
  font-weight: 800;
  margin-top: 2rem;
}

.pcard__price sup {
  font-size: 1rem;
  font-weight: 400;
}

.pcard__btn {
  font-size: 1rem;
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
  background: #ededf0;
  width: 100%;
  height: 100%;
  z-index: -1;
  top: 1rem;
  left: 1rem;
  border-radius: 7px;
}

.pcard:hover {
  border: 3px solid #7000FF;
  background: white;
  cursor: pointer;
}

.pcard:hover .pcard__title {
  transform: translateY(-10px);
}

.pcard:hover .pcard__btn {
  background: #7000FF;
  border: 3px solid #7000FF;
  color: white;
  transform: scale(1.05);
}

.pcard:hover::after {
  background: #c4c6fc;
}
</style>

</div>
<%@ include file="../include/footer.jsp"%>
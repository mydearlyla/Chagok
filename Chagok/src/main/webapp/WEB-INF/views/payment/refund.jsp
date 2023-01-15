<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="../resources/mainpagecss/css/font.css">
<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
  
  
<!-- jQuery -->
<script src="../resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#swap').click(function(){
		
		var compare = ${getPoint };
		var getpoint = $('#pamount_one').val();
		var raccount = $('#raccount').val();
		var rbank = $('#rbank').val();
		var rname = $('#rname').val();
		
		if(getpoint.length == 0){
			Swal.fire({
				  icon: 'warning',
				  text: "금액을 다시 확인하세요!",
				  background: '#fff',
				  color: '#000'
				});
				$('#pamount_one').focus();
				return false;
		}

		if(getpoint.length == 0 || getpoint > compare || getpoint < 10000 ){
			Swal.fire({
				  icon: 'warning',
				  html: "10,000꿀 이하이거나, <br> 보유한 꿀머니 초과해서 환급할 수 없습니다!",
				  background: '#fff',
				  color: '#000'
				});
				
				$('#pamount_one').focus();
				return false;
		}
		
		if(rname.length == 0){
			Swal.fire({
				  icon: 'warning',
				  text: "예금주를 입력해주세요",
				  background: '#fff',
				  color: '#000'
				});
				
				$('#rname').focus();
				return false;
		}
		
		if(rbank.length == 0){
			Swal.fire({
				  icon: 'warning',
				  text: "환급 은행을 입력해주세요",
				  background: '#fff',
				  color: '#000'
				});
				
				$('#rbank').focus();
				return false;
		}
		
		if(raccount.length == 0){
			Swal.fire({
				  icon: 'warning',
				  text: "환급 계좌를 입력해주세요",
				  background: '#fff',
				  
				});
				
				$('#raccount').focus();
				return false;
		}
		
		Swal.fire({
			  html : getpoint +'원을 환급이 신청되었습니다. <br> 영업일 기준 1~2일 이내에 확인하실 수 있습니다! ',
			  icon: 'success',
			  background: '#fff',
			  color: '#000',
			  timer: 5000
			});
				
		 setTimeout(function(){
				form.attr("action", "/refund");
				form.attr("method", "post");
				form.submit();
		   },5000);
	});
	
});


</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#pamount_one").keyup(function(){
		
		$("#pamount-two").text($("#pamount_one").val());

		$('input[id=pamount-two]').attr('value',$("#pamount_one").val());

	});

});
</script>


	<div class="pwrapper">
      <img
        src="https://i.ibb.co/rvJd2XR/rate.png"
        alt="Exchange Rate Calculator"
        class="pmoney-img"
      />
	<form role="form" method="post">
	<ul class="list-group list-group-unbordered">
      <h1>꿀머니 환급소</h1>
      <p>보유하신 꿀머니를 현금으로 환급해드립니다.</p>
      <div class="pcontainer">
        <div class="pcurrency">
<!--           <select id="pcurrency-one"> -->
<!--             <option value="ggul">꿀</option> -->
<!--           </select> -->
          <input type="text" name="getpoint" id="pamount_one" placeholder="${getPoint }" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/> 꿀
        </div>
       
        <div style="display: flex; justify-content: center;">
			<img src="${pageContext.request.contextPath }/resources/plugins/img/down-arrow.png" style="justify-content: center; width: 30px;">
        </div>

        <div class="pcurrency">
<!--           <select id="pcurrency-two"> -->
<!--             <option value="won">원</option> -->
<!--           </select> -->
          <input type="text" placeholder="0" id="pamount-two" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>원
        </div>
      </div>
	</ul>
	<div class="swap-rate-container">
	<c:set var="M" value="${msg }" />
	<c:if test="${not fn:contains( M, '환불') }">
		<a class="pull-right">
		   <input type="text"  class="re" id="rname" name="rname" placeholder="예금주를 입력해주세요." value="${userVO.rname }" >
		</a>
		<a class="pull-right">
		    <input type="text" class="re" id="rbank"" name="rbank"" placeholder="은행을 입력해주세요." value="${userVO.rbank }">
		</a>
		<a class="pull-right">
		    <input type="text" class="re" id="raccount" name="raccount" placeholder="계좌번호 -를 제외하고 입력해주세요." value="${userVO.raccount }" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		</a>
    </c:if>
	<c:if test="${fn:contains( M, '환불') }">
		<a class="pull-right">
		    <input type="text" class="re" id="rname" name="rname" placeholder="예금주를 입력해주세요." ">
		</a>
		<a class="pull-right">
		    <input type="text" class="re" id="rbank" name="rbank" placeholder="은행을 입력해주세요." >
		</a>
		<a class="pull-right">
		    <input type="text" class="re" id="raccount" name="raccount" placeholder="계좌번호 -를 제외하고 입력해주세요." oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		</a>
    </c:if>
	</div>
	<button class="pbtn" id="swap" >환급</button>
	</form>
</div>

    

<style>
@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap");

:root {
  --primary-color: #fd5900;
}

* {
  box-sizing: border-box;
  font-family: 'GmarketSans';
}

body {
  background-color: #070606;
  font-family: 'GmarketSans';
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  margin: 0;
  padding: 20px;
}

.pwrapper {
  background-color: #fff3d7;
  padding: 2rem;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

h1 {
	color: #66BB7A;
    text-align: center;
}

p {
  text-align: center;
}

.pbtn {
	color: #fff;
    background-color: #66BB7A;
    /* cursor: pointer; */
    border-radius: 5px;
    font-size: 14px;
    padding: 6px 12px;
    border: none;
    width: 30%;
    margin-left: 35%;
    margin-top: 20px;
    font-size: 18px;
}

.re{
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    margin-top: 3px;
}

.pmoney-img {
  width: 150px;
  margin: auto 0;
}

.pcurrency {
	padding: 30px 0;
    display: flex;
    align-items: center;
    justify-content: space-around;
}

.pcurrency select {
  padding: 10px 20px 10px 10px;
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  border: 1px solid #dedede;
  font-size: 16px;
  background: transparent;
  background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%20000002%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E");
  background-position: right 10px top 50%, 0, 0;
  background-size: 12px auto, 100%;
  background-repeat: no-repeat;
}

.pcurrency input {
  border: 0;
  background: transparent;
  font-size: 30px;
  text-align: right;
}

.pswap-rate-container {
  display: flex;
  align-items: stretch;
}

.prate {
  color: var(--primary-color);
  font-size: 14px;
}

.swap-rate-container{
    display: flex;
    justify-content: space-evenly;
    flex-direction: column;
    align-items: stretch;
}


select:focus,
input:focus,
button:focus {
  outline: 0;
}

.rbank, .raccount {
	padding: 10px 20px 10px 10px; 
	justify-content: center;
}

@media (max-width: 600px) {
  .pcurrency input {
    width: 200px;
  }
  .pmoney-img {
  width: 75px;
}
}

</style>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<!-- jQuery -->
<script src="../resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#swap').click(function(event){
		var compare = ${getPoint };
		var getpoint = $('#pamount_one').val();
		var raccount = $('#raccount').val();
		var rbank = $('#rbank').val();
		var rname = $('#rname').val();
		
		
		
		if(getpoint == 0 || getpoint == ''){
			Swal.fire({
				  icon: 'warning',
				  title: "금액을 다시 확인하세요!",
				  background: '#fff',
				  color: '#66BB7A'
				});
				$('#pamount_one').focus();
				return false;
		}

		if(getpoint < 10000 || getpoint > compare){
			Swal.fire({
				  icon: 'warning',
				  title: "10,000꿀 이하이거나, <br> 보유한 꿀머니 초과해서 환급할 수 없습니다!",
				  background: '#fff',
				  color: '#66BB7A'
				});
				
				$('#pamount_one').focus();
				return false;
		}
		
		if(rname == null || rname == ''){
			Swal.fire({
				  icon: 'warning',
				  title: "예금주를 입력해주세요",
				  background: '#fff',
				  color: '#66BB7A'
				});
				
				$('#rname').focus();
				return false;
		}
		
		if(rbank == null || rbank == ''){
			Swal.fire({
				  icon: 'warning',
				  title: "환급 은행을 입력해주세요",
				  background: '#fff',
				  color: '#66BB7A'
				});
				
				$('#rbank').focus();
				return false;
		}
		
		if(raccount == null || raccount == ''){
			Swal.fire({
				  icon: 'warning',
				  title: "환급 계좌를 입력해주세요",
				  background: '#fff',
				  color: '#66BB7A'
				});
				
				$('#raccount').focus();
				return false;
		}
		
		Swal.fire({
			  title: getpoint+' 원을 환급 할까요?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네, 환급받습니다.'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      '신청되었습니다',
			      '영업일 기준 1~2일 이내에 확인하실 수 있습니다!'
			    )
				
			    form.attr("action", "/refund");
				form.attr("method", "post");
				form.submit();
			  }
			});	
			
		
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
      <p>보유하신 꿀머니를 환급해드립니다.</p>
      <div class="pcontainer">
        <div class="pcurrency">
          <select id="pcurrency-one">
            <option value="ggul">꿀</option>
          </select>
          <input type="text" name="getpoint" id="pamount_one" placeholder="${getPoint }" /> 꿀
        </div>
       
        <div style="display: flex; justify-content: center;">
			<img src="${pageContext.request.contextPath }/resources/plugins/img/down-arrow.png" style="justify-content: center;">
        </div>

        <div class="pcurrency">
          <select id="pcurrency-two">
            <option value="won">원</option>
          </select>
          <input type="text" id="pamount-two" placeholder="0" value="${getPoint }" />원
        </div>
      </div>
	</ul>
	<div class="pcontainer">
	<ul style="justify-content: center; float: left;">
	<c:set var="M" value="${msg }" />
	<c:if test="${not fn:contains( M, '환불') }">
		<a class="pull-right">
		        환급 	<input type="text" id="rname" name="rname" placeholder="예금주" value="${userVO.rname }" style="text-align: center; width: 10%;">
		</a>
		<a class="pull-right">
		        	<input type="text" id="rbank"" name="rbank"" placeholder="은행" value="${userVO.rbank }" style="text-align: center; width: 10%;">
		</a>
		<a class="pull-right">
		        	<input type="text" id="raccount" name="raccount" placeholder="계좌번호" value="${userVO.raccount }" style="text-align: center;">
		</a>
    </c:if>
	<c:if test="${fn:contains( M, '환불') }">
		<a class="pull-right">
		        환급	<input type="text" id="rname" name="rname" placeholder="예금주" style="text-align: center; width: 10%;">
		</a>
		<a class="pull-right">
		        <input type="text" id="rbank" name="rbank" placeholder="은행" style="text-align: center; width: 10%;">
		</a>
		<a class="pull-right">
		        <input type="text" id="raccount" name="raccount" placeholder="계좌번호" style="text-align: center;">
		</a>
    </c:if>
	<button class="pbtn" id="swap" >환급</button>
		<div class="prate" id="rate"></div>
	</ul>
	</form>
</div>
        
</div>

    

<style>
@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap");

:root {
  --primary-color: #fd5900;
}

* {
  box-sizing: border-box;
}

body {
  background-color: #070606;
  font-family: "Roboto", sans-serif;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  margin: 0;
  padding: 20px;
}

.pwrapper {
  background-color: #f4efea;
  padding: 2rem;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

h1 {
  color: var(--primary-color);
}

p {
  text-align: center;
}

.pbtn {
  color: #fff;
  background-color: var(--primary-color);
  cursor: pointer;
  border-radius: 5px;
  font-size: 12px;
  padding: 5px 12px;
  border: none;
  margin-left: 130px;
}

.pmoney-img {
  width: 150px;
  margin: auto 0;
}

.pcurrency {
  padding: 30px 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarAsset.jsp" %>

<div>
	<a href="/asset/budget?mm=0">이번 달</a>
	<a href="/asset/budget?mm=1">지난 달</a>
	<a href="/asset/budget?mm=2">2개월 전</a>
	<a href="/asset/budget?mm=3">3개월 전</a>
<hr>
</div>

<c:set var="a" value="${pMonth }"/>
<c:set var="y" value="${fn:substring(a,0,4) }"/>
<c:set var="m" value="${fn:substring(a,4,6) }"/>
<c:set var="pMonth" value="${y }년 ${m }월"/>

<div class="box box-info">
<form class="form-horizontal" id="budform" method="post">
	<c:set var="mm" value="${param.mm }"/>
	<div class="box-body">
		<div class="form-group">
			<label for="sumpamt" class="col-sm-2 control-label">${pMonth } 예산</label>
			<div class="col-sm-10">
				<input type="hidden" name="pMonth" value="${a }">
				<input type="text" class="form-control" id="sumpamt" placeholder="예산을 입력하세요" maxlength="10" onkeyup="inputNumFmt(this);">
			</div>
			<div class="col-sm-10">
				<span>지난달 예산 : </span><span id="prevsum"></span><br>
				<span>최근 3개월 간 평균 지출 : </span><span id="prevavg"></span>
			</div>
		</div>
	</div>
	
	<div id="textdiv"></div>
	
	<div class="box-footer">
		<input type="submit" class="btn btn-info pull-right" value="등록하기"/>
		<button type="button" class="btn btn-info pull-right" onclick="location.href='/asset/delBud?mm='+${mm}+'';">예산 삭제하기</button>
		<button type="button" class="btn btn-info pull-right" id="copy" >지난달 예산 복사하기</button>
	</div>	
		      
	<c:forEach var="top" items="${ctTopList }" varStatus="status">
		<c:set var="i" value="${status.count}"/>
		<div class="box-body">
			<div class="form-group">
				<label for="pamt${i}" id="label${i}" class="col-sm-2 control-label">${top }</label>
				<div class="col-sm-10">
					<input type="hidden" id="pno${i}" name="pno${i}">
					<input type="hidden" name="ctno${i}" value="${i}">
					<input type="text" class="form-control" id="pamt${i}" name="p_amount${i}" placeholder="예산을 입력하세요" maxlength="10" onkeyup="inputNumFmt(this);">
				</div>
				<p class="col-sm-2 control-label">지난달 예산 <span id="prevamt${i}"></span> 원</p>
			</div>
		</div>
	</c:forEach>
	
</form>
</div>

<!-- jQuery.number -->
<script src="/resources/js/jquery.number.min.js"></script>

<script type="text/javascript">
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    } 
    
    function inputNumFmt(obj) {
        obj.value = comma(uncomma(obj.value));
    }
    
    function inputOnlyNumFmt(obj) {
        obj.value = onlynumber(uncomma(obj.value));
    }
    
    function onlynumber(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
	}
</script>

<script type="text/javascript">

$(document).ready(function(){
	
	// 한 달 이전 예산
	$.ajax({
		type : "get",
		url : "/asset/getBud?mm="+(${mm}+1),
		dataType : "json",
		success : function(data) {
			var sum = 0;
			console.log('한 달 이전 예산');
			console.log(data);
			$(data).each(function(index, item){
				for(i=1; i<12; i++){
					var b = $('#label'+i+'').text();
					var top = item.ct_top;
					var amp = item.p_amount;
					if(b==top){
						$('#prevamt'+i+'').text(''+$.number(amp)+'');
						sum+=amp;
					}
				}
			});
			for(i=1; i<12; i++){
				if($('#prevamt'+i+'').text()==''){
					$('#prevamt'+i+'').text(''+0+'');
				}
			}
			$('#prevsum').text(''+$.number(sum)+'');
		}, error : function(data){
			console.log('ajax 오류');
		}
	});   //ajax
	
	// 해당 월 예산
	$.ajax({
		type : "get",
		url : "/asset/getBud?mm="+${mm},
		dataType : "json",
		success : function(data) {
			var sum = 0;
			console.log('해당 월 예산');
			console.log(data);
			$(data).each(function(index, item){
				for(i=1; i<12; i++){
					var b = $('#label'+i+'').text();
					var top = item.ct_top;
					var amp = item.p_amount;
					var pno = item.pno;
					if(b==top){
						$('#pno'+i+'').val(pno);
						$('#pamt'+i+'').val(''+$.number(amp)+'');
						sum+=amp;
					}
				}
			});
			for(i=1; i<12; i++){
				if($('#pamt'+i+'').val()==''){
					$('#pamt'+i+'').val(''+0+'');
				}
			}
			if(sum!='0'){
				$('#sumpamt').val(''+$.number(sum)+'');
			}
		}, error : function(data){
			console.log('ajax 오류');
		}
	});   //ajax
   
	$('#copy').click(function(){
		for(i=1; i<12; i++){
			$('#pamt'+i+'').val($('#prevamt'+i+'').text());
		}
		$('#sumpamt').val($('#prevsum').text());
	});	// copy
	
	$('#budform').submit(function() {
		var a = 0;
// 		var b = 0;	
		var sum2 = 0;	
		for(i=1; i<12; i++){
			var b = $('#pamt'+i+'').val();
			// 입력하지 않았을 때
			if($('#pamt'+i+'').val()==''){
				alert('예산을 입력하세요');
				return false;
			} else {
				// 총예산<카테고리별 예산의 합
				a = Number($('#sumpamt').val().replace(/,/g, ""));		// 총예산(숫자)
				b = Number(b.replace(/,/g, ""));	// 카테고리별 예산(숫자)
				sum2=sum2+b;	// 카테고리별 예산의 합
			}
		}
		console.log('sum2 : '+sum2);
		if(sum2==a) {
// 			alert('일치');
			// 숫자로 변환 후 컨트롤러로 넘기기
			for(i=1; i<12; i++){
				var b = $('#pamt'+i+'').val();
				$('#pamt'+i+'').val(b.replace(/,/g, ""));
			}
			return true;
		} else if(sum2>a) {
			 $('#textdiv').empty();
			 if (confirm("카테고리별 예산의 합이 총 예산을 초과했습니다. 초과한 금액으로 등록하시겠습니까?") == true) {
// 				 return true;
			 } else {
			     return false;
			 }
		} else if(sum2<a) {
			$('#textdiv').html("카테고리별 예산의 합이 총 예산보다 적어요. 모든 금액을 분배해주세요.");
			return false;
		}
	});	// submit
});

</script>








<%@ include file="../include/footer.jsp" %>
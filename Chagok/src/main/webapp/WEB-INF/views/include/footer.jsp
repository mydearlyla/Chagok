<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
      
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
      </footer>
      
      


    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath }/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/demo.js" type="text/javascript"></script>

<script>
var socket = null;
$(document).ready(function(){
	$('#btnSend').click(function(e){
	    //let modal = $('.modal-content').has(e.target);
	    var type = ${vo.cno};
	    var target = ${mno}; // 대상은 수정필요 QQQQQQ
	    var content = $('#msg').val();
	    var url = '${contextPath}/challenge/plusFeed?cno='+cno;
	    var submitObj = {
				            target: target,
				            content: content,
				            type: type,
				            url: url
				        };
	    
	    // 전송한 정보를 db에 저장	
	    $.ajax({
	        type: 'post',
	       url: '${contextPath}/alert',
	        contentType: 'application/json; charset=utf-8',
	        dataType: 'text',
	        data: JSON.stringify(submitObj),
	        success: function(){    // db전송 성공시 실시간 알림 전송
	        	console.log("메시지 전달성공");
	        }
	    });
	});
});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		connectSockJS();
		
		var today = new Date(); 
		var currT = ('0' + today.getHours()).slice(-2) + ":" + ('0' + today.getMinutes()).slice(-2);
		
		var nick = '${nick}';
		
		$('#btnSend').on('click', function(event) {
			
			var msg = $('#msg').val();
			
			event.preventDefault();
			
			console.log("보낸 메시지>>>>", msg);
			
			if (!isStomp && socket.readyState!== 1 ) return;
				if(isStomp){
					// send(path, header, message(cno, writer, message, time))형태
					socket.send('/send/'+cno , {cno}, JSON.stringify({"cno": cno, "writer": nick, "message" : msg, "time": currT}));

					//alert('application : '+${alertAPP});
				}else
					socket.send(msg);
			
			console.log("ReceiveMessage:" + msg);
		});
	
	});
	
	var socket = null;
	var isStomp = false;
	var cno = ${vo.cno};
	
	var today = new Date(); 
	var currT = ('0' + today.getHours()).slice(-2) + ":" + ('0' + today.getMinutes()).slice(-2);
	
	var nick = '${nick}';
	var currD = new Date().getMonth() + 1 + "월 " + new Date().getDate()+"일";
	
	function connectSockJS(){

		//STOMP Client
		var sock = new SockJS("/plusFeed", null, { timeout: 15000 }); // endpoint
		var client = Stomp.over(sock);
		isStomp = true;
		socket = client;
		
		
		// 소켓 연결확인
// 		console.log(client);
		
		client.connect({}, function(frame){
			console.log("Connected stomp!");
			
			// 해당 토픽을 구독한다! subscribe(path, callback)로 메시지를 받을 수 있다.
			// callback 첫번째 파라미터의 body로 메시지의 내용이 들어온다.
			client.subscribe('/topic/feed/'+cno, function(chat){ // 컨트롤러(sendTo)
				// 서버에서 돌아온 것 (구독하고 있는 클라이언트들에게 )
				console.log('subscribe_chat(서버에서 돌아온 내용) >>', chat);
				var content = JSON.parse(chat.body);
				console.log(content);
				//socket.onmessage = onMessage;

				if(content.writer != null){
					
					if( content.writer == nick ){ 
						var html = '<div class="outgoing_msg">';
						html += '<div class="sent_msg">'
						            + '<p>'+content.message+'</p>'
						            + '<span class="time_date"> '+ currT + " | "; 
			            if(currD == (new Date().getMonth() + 1 + "월 " + new Date().getDate()+"일") ){
							html += '오늘' +'</span></div></div>';
						}else{
							html += currD +'</span></div></div>';
						}
			            
			            
					}else {
						var html = content.writer;
						html += '<div class="incoming_msg">'
								+ '<div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>'
								+ '<div class="received_msg"> <div class="received_withd_msg">'
								+ '<p>'+content.message+'</p>'
								+ '<span class="time_date">'+ currT + " | ";
						if(currD == (new Date().getMonth() + 1 + "월 " + new Date().getDate()+"일") ){
							html += '오늘' +'</span></div></div></div>';
						}else{
							html += currD +'</span></div></div>';
						}
						
						const Toast = Swal.mixin({
							  toast: true,
							  position: 'top-end',
							  showConfirmButton: false,
							  timer: 5000,
							  timerProgressBar: true,
							  didOpen: (toast) => {
							    toast.addEventListener('mouseenter', Swal.stopTimer)
							    toast.addEventListener('mouseleave', Swal.resumeTimer)
							  }
							})
						
						Toast.fire({
							  icon: 'success',
							  title: '${vo.c_title}' + '챌린지에서 메시지가 도착했습니다.'
							});	
						
					
						
					}
					
					$("#nextMsg").append(html+"\n");
				}
				
				$("#msg").val("");
				
				var chat = {"writer": content.writer, "message":content.message , "time": currT, "cno": cno, "receiver": "all", "f_date": currD };
				
				
				
				
				
			}); 	//client.subscribe 끝
		}); 		// client.connect 끝

	}	
	
</script>
<script type="text/javascript">
$(document).ready(function(){
	var cno = ${vo.cno};
	var nick = '${nick}';
	
	var isScrollUp = false;
	var lastScrollTop;
	
	// 이전 대화내용 가져오기
	$.ajax({
		type : "post",
		url : "/challenge/getPreChat", 
		contentType : "application/json",
		data : JSON.stringify(cno),
		success : function(result){
			console.log("과거 채팅기록");
			console.log(result);
			for(var i=0; result.length; i++){
				if( (result[i].writer) == nick){
					var data = '<div class="outgoing_msg">';
					data += '<div class="sent_msg">'
			            	 + '<p>'+ result[i].message +'</p>'
			           		 + '<span class="time_date"> '+ result[i].time +'</span></div></div>';
					$('#nextMsg').append(data);
				}else{
					var data = result[i].writer;
					data += '<div class="incoming_msg">'
							+ '<div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>'
							+ '<div class="received_msg"> <div class="received_withd_msg">'
							+ '<p>'+ result[i].message +'</p>'
							+ '<span class="time_date">'+ result[i].time +'</span></div></div>'
					
					$('#nextMsg').append(data);
					
				}
			}
			
			
			
			
			var chat = document.getElementById("chat");
			
			// 기본적으로 스크롤 최하단으로 이동 (애니메이션 적용)
			if (!isScrollUp) { 
			      $('#chat').animate({
			        scrollTop: chat.scrollHeight - chat.clientHeight
			      }, 100);
			    }
			
		},
		error : function(jqXHR, status, error){
			console.log("알 수 없는 에러 [" + error + "]");
		}
	}); // ajax 끝
	
	
	
	
});
</script>
  </body>
</html>
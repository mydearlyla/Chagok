<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
      
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
      </footer>
      
      <!-- Control Sidebar -->      
      <aside class="control-sidebar control-sidebar-dark">                
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
          
          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
          <!-- Home tab content -->
          <div class="tab-pane" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">Recent Activity</h3>
            <ul class='control-sidebar-menu'>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                    <p>Will be 23 on April 24th</p>z
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-user bg-yellow"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>
                    <p>New phone +1(800)555-1234</p>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>
                    <p>nora@example.com</p>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-file-code-o bg-green"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>
                    <p>Execution time 5 seconds</p>
                  </div>
                </a>
              </li>
            </ul><!-- /.control-sidebar-menu -->

            <h3 class="control-sidebar-heading">Tasks Progress</h3> 
            <ul class='control-sidebar-menu'>
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Custom Template Design
                    <span class="label label-danger pull-right">70%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                  </div>                                    
                </a>
              </li> 
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Update Resume
                    <span class="label label-success pull-right">95%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                  </div>                                    
                </a>
              </li> 
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Laravel Integration
                    <span class="label label-waring pull-right">50%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                  </div>                                    
                </a>
              </li> 
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Back End Framework
                    <span class="label label-primary pull-right">68%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                  </div>                                    
                </a>
              </li>               
            </ul><!-- /.control-sidebar-menu -->         

          </div><!-- /.tab-pane -->
          <!-- Stats tab content -->
          <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div><!-- /.tab-pane -->
          <!-- Settings tab content -->
          <div class="tab-pane" id="control-sidebar-settings-tab">            
            <form method="post">
              <h3 class="control-sidebar-heading">General Settings</h3>
              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Report panel usage
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Some information about this general settings option
                </p>
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Allow mail redirect
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Other sets of options are available
                </p>
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Expose author name in posts
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Allow the user to show his name in blog posts
                </p>
              </div><!-- /.form-group -->

              <h3 class="control-sidebar-heading">Chat Settings</h3>

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Show me as online
                  <input type="checkbox" class="pull-right" checked />
                </label>                
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Turn off notifications
                  <input type="checkbox" class="pull-right" />
                </label>                
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Delete chat history
                  <a href="javascript::;" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                </label>                
              </div><!-- /.form-group -->
            </form>
          </div><!-- /.tab-pane -->
        </div>
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class='control-sidebar-bg'></div>
    </div><!-- ./wrapper -->





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
			console.log(msg);
			
			if( msg.length != 0 ){
			
				event.preventDefault();
				
				console.log("보낸 메시지>>>>", msg);
				
				if (!isStomp && socket.readyState!== 1 ) return;
					if(isStomp){
						// send(path, header, message(cno, writer, message, time))형태
						socket.send('/send/'+cno , {cno}, JSON.stringify({"cno": cno, "writer": nick, "message" : msg, "time": currT}));
						
					}else
						socket.send(msg);
				
				console.log("ReceiveMessage:" + msg);
			}
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
		var sock = new SockJS("/plusFeed"); // endpoint
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
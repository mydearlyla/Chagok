package com.chagok.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletInputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.messaging.MessageHeaders;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageType;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.WebSocketSession;

import com.chagok.domain.FeedDTO;
import com.chagok.domain.MessageVO;
import com.chagok.interceptor.HttpHandshakeInterceptor;
import com.chagok.service.AlertService;
import com.chagok.service.FeedService;
import com.sun.net.httpserver.HttpHandler;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class StompController {

	private final SimpMessagingTemplate template; //특정 Broker로 메세지를 전달

	private static final Logger mylog = LoggerFactory.getLogger(StompController.class);
	
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	@Inject
	private FeedService service;
	
	@Inject
	private AlertService alsevice;
	
	// 필요한 헤더 설정해주고, 세션아이디로 특정유저에게 메시지를 전달할 때 세션 아이디로 전송할 수 잇도록 헤더를 설정함
	private MessageHeaders createHeaders(@NonNull String sessionId) {
		SimpMessageHeaderAccessor headerAccessor = SimpMessageHeaderAccessor.create(SimpMessageType.MESSAGE);
		if(sessionId != null) headerAccessor.setSessionId(sessionId);
		headerAccessor.setLeaveMutable(true);
		return headerAccessor.getMessageHeaders();
	}
	
	@MessageMapping("")
	public void handleShout(Shout incomming) {
		mylog.debug("Received Message : " +incomming.getMessage());
	}
	
	// 일회용 구독(알림용)
	@SubscribeMapping({"/mno"})
	public Shout handleSubscription() {
		Shout outgoing = new Shout();
		outgoing.setMessage("일회용!");
		 return outgoing;
	}
	
	
	/**
     * <pre>
     * 로그인 한 사용자가 웹 소켓 통신을 할 수 있도록 url 정보를 리턴한다.
     * e.g) /user/queue/alarm/{uuid}
     * </pre>
     *
     * @param headerAccessor
     * @param message
     * @return
     */
//    @MessageMapping("/login")
//    @SendToUser(WS_QUEUE_ALARM)
//    public SimpleJsonResponse login(SimpMessageHeaderAccessor headerAccessor, final SimpleJsonResponse message) {
//        logger.info("Login - SessionID : [{}], Message : [{}]", headerAccessor.getSessionId(), message.toString());
//
//        SimpleJsonResponse response = new SimpleJsonResponse(WS_CODE_LOGIN_RESPONSE);
//        if (message.getResultCode() == WS_CODE_LOGIN) {
//            try {
//                String authToken = (String) message.getData();
//
//                if ("REFRESH_TOKEN".equals(jwtTokenUtil.getAuthFromToken(authToken))) {
//                    throw new Exception("token is not authorized.");
//                }
//
//                String username = jwtTokenUtil.getUsernameFromToken(authToken);
//
//                MemberManagement member = memberService.getMember(username);
//
//                if (member == null) {
//                    throw new Exception("member does not exists.");
//                }
//
//                String uuid = headerAccessor.getSessionId();
//
//                BrowserSession browserSession = new BrowserSession();
//                browserSession.setSessionId(headerAccessor.getSessionId());
//                browserSession.setUserId(member.getId());
//                browserSession.setUuid(uuid);
//
//                // register session
//                sessionListener.registerBrowserSession(browserSession, headerAccessor.getSessionId());
//
//                response.setStatus(true);
//                response.setData(WS_QUEUE_USER + WS_QUEUE_ALARM + "/" + uuid);
//            } catch (Exception e) {
//                logger.error("Unhandled exception occurred while handle /app/login.", e);
//
//                response.setStatus(false);
//                response.setResultMessage(e.getMessage());
//            }
//        } else {
//            response.setStatus(false);
//            response.setResultMessage("Message code must be [" + WS_CODE_LOGIN + "] for /app/login.");
//        }
//
//        return response;
//    }
//
//    
//    public void sendAlarmToMember(UserVO user) {
//		List<String> sessionList = sessionListener.findSessionIdsByMemberId(member.getId());
//
//		for (String sessionId : sessionList) {
//			Message message = new Message("Today ME", "Hello world! :)");
//
//			logger.info("Send Alarm To member : [{}], message : [{}]", member.getId(), message);
//
//			// set websocket response message.
//			SimpleJsonResponse response = new SimpleJsonResponse();
//			response.setResultCode(WS_CODE_COMMAND_RESPONSE);
//			response.setStatus(true);
//			response.setData(message);
//
//			// send websocket message
//			simpMessagingTemplate.convertAndSendToUser(sessionId, WS_QUEUE_ALARM + "/" + sessionId,
//					response, sessionListener.createHeaders(sessionId));
//		}
//}
	
    
//	@MessageMapping(value = "/user")
//	public void showUsers(String msg, Integer cno) {
//		
//		System.out.println("cno:" + cno);
//		HashMap<String, Object> payload = new HashMap<String, Object>();
//		//payload.put("name", nick);
//		payload.put("msg", msg);
//		template.convertAndSend("/topic/feed/{cno}",payload);
//		
//		
//	}
	
	// 1:n으로 메시지를 뿌릴때 사용 (/topic 사용)
//    @SendTo("/topic/feed/2")
//    public MessageVO ttt(@RequestBody MessageVO message, @PathVariable("cno") String cno) throws Exception{
//    	System.out.println("/topic/feed/"+cno+"의 stomp message>>"+ message);
//    	
//    	//service.saveMsg(messageVO, feedDTO);
//    	
//    	return message;
//    }
    
    // 1:1으로 메시지를 보낼 때 (/queue 사용)
    @SendToUser("/queue/feed/2")
    public MessageVO ttt2(@RequestBody MessageVO message, @PathVariable("cno") String cno) throws Exception{
    	System.out.println("/topic/feed/"+cno+"의 stomp message>>"+ message);
    	
    	//service.saveMsg(messageVO, feedDTO);
    	
    	return message;
    }

    @MessageMapping("/send/{cno}")
    @SendTo("/topic/feed/{cno}")
    public void ttte(@RequestBody MessageVO message, @DestinationVariable("cno") Integer cno) throws Exception{
    	System.out.println("/send/"+cno+ " user의 메시지 :  message>> "+ message.getMessage());
    	System.out.println("/send/"+cno+ " writer>> "+ message.getWriter());
    	
    	Map<String, Object> payload = new HashMap<String, Object>();
    	
    	
    	// 채팅 저장
    	service.saveMsg1(message, cno);

//    	HttpServletRequest req = null;
//    	ServletContext appliation = req.getSession().getServletContext();
//    	
//    	// 영역객체 저장 
//    	appliation.setAttribute("alertAPP", "test");
    	
    	// 알림 저장
    	alsevice.alertByMessage(message);
    	
    	template.convertAndSend("/topic/feed/"+cno, message);
    }

    @MessageMapping("/{cno}")
    public void ttte2(@RequestBody MessageVO message, @DestinationVariable("cno") Integer cno) throws Exception{
    	System.out.println("/send/"+cno+ " user의 메시지 :  message>> "+ message.getMessage());
    	System.out.println("/send/"+cno+ " writer>> "+ message.getWriter());
    	Date now = new Date();
    	
    	message.setTime(now.toString());
    	Map<String, Object> payload = new HashMap<String, Object>();
    	
    	
    	//template.convertAndSendToUser(sessionId, "/queue/"+cno, message, createHeaders(sessionId));
    }
    
    
    @MessageMapping("/chat/enter") // 호출함(socket.send)
    public void enter(MessageVO message, FeedDTO feed) throws Exception{
    	System.out.println(message.getWriter()+"님이 채팅방에 참여했습니다.");
    	template.convertAndSend("/queue/chat/room"+feed.getRoomId(), message);
    }
    

    @MessageMapping("/{nick}")
    public void message(@DestinationVariable("nick") String nick) {
    	template.convertAndSend("/queue/" + nick, "alarm socket connection completed.");
    }
    
    // 메시지를 전달하는 단순 유일 특성 자바빈
    public class Shout{
    	  private String message;

    	   public String getMessage(){
    	      return message;
    	}

    	public void setMessage(String message){
    	   this.message=message;
    	}
    }
    
}

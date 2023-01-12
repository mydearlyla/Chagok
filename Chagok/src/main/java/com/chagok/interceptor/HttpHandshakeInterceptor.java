package com.chagok.interceptor;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.handler;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.URI;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.util.concurrent.SettableListenableFuture;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketExtension;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.server.HandshakeInterceptor;
import org.springframework.web.socket.sockjs.client.TransportRequest;
import org.springframework.web.socket.sockjs.client.WebSocketClientSockJsSession;

import com.chagok.controller.webSocket;
import com.chagok.domain.FeedDTO;
import com.sun.org.apache.xml.internal.serializer.utils.Utils;

public class HttpHandshakeInterceptor implements HandshakeInterceptor {

	private static final Logger mylog = LoggerFactory.getLogger(HttpHandshakeInterceptor.class);
	
	private final Map<String, WebSocketSession> sessions = new ConcurrentHashMap<String, WebSocketSession>();
	
	//private WebSocketSession wssession;
	
//	@Inject
//	private FeedDTO dto;
	
	//  클라이언트의 연결요청이 들어왔을 때 먼저 수행하는 것. 
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
			mylog.debug("beforeHandshake 로 들어옴");
		
			mylog.debug("URL : " + request.getRemoteAddress().toString());
			mylog.debug("Header : " + request.getHeaders().toString());
			mylog.debug("attributes : "+ attributes.entrySet());
			mylog.debug("wsHandler : "+ wsHandler);
			
			if(request instanceof ServerHttpRequest) {
			ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
			HttpSession session = servletRequest.getServletRequest().getSession();
			
			// 쿠키- 세션id를 옮기는 역할 (JESSIONID)
			attributes.put("HTTP.SESSION.ID", session.getId());
			mylog.debug(attributes.get("HTTP.SESSION.ID").toString());
			mylog.debug("attributes httpsessionid를 담은 후 : "+ attributes.entrySet());
			
			//dto.setSession(wssession);
			
		}
		
		return true;
	}
	
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
		mylog.debug("afterHandshake 로 들어옴");
		
//		// 세션 저장
//		String sessionId = session.getId();
//		sessions.put(sessionId, session);
		
//		sessions.values().forEach(s ->{
//			try {
//				if(!s.getId().equals(sessionId)) {
//					s.sendMessage(new TextMessage("메시지 보냄"));
//				}
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		});
//		
//		mylog.debug(sessions.entrySet().toString());
		
		
	}



}

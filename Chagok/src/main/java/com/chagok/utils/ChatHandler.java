//package com.chagok.utils;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Profile;
//import org.springframework.stereotype.Component;
//import org.springframework.web.socket.TextMessage;
//import org.springframework.web.socket.WebSocketSession;
//import org.springframework.web.socket.config.annotation.EnableWebSocket;
//import org.springframework.web.socket.handler.TextWebSocketHandler;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//
//@Profile("!stomp")
//@Component
//public class ChatHandler extends TextWebSocketHandler {
//	
//	private static final Logger mylog = LoggerFactory.getLogger(ChatHandler.class);
//	
//	private final ObjectMapper objectMapper;
//    //private final ChatRoomRepository repository;
//
//    @Autowired
//    public ChatHandler(ObjectMapper objectMapper, ChatRoomRepository chatRoomRepository) {
//        this.objectMapper = objectMapper;
//        this.repository = chatRoomRepository;
//    }
//
//    @Override
//    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//
//        String payload = message.getPayload();
//        mylog.debug("payload : {}", payload);
//
//    }
//
//    @Override
//    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//        repository.remove(session);
//    }
//}

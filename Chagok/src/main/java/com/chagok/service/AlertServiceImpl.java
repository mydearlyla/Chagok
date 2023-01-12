package com.chagok.service;

import javax.inject.Inject;

import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;

import com.chagok.domain.AlertVO;
import com.chagok.domain.MessageVO;
import com.chagok.persistence.AlertDAO;

@Service
public class AlertServiceImpl implements AlertService {

	@Inject
	private AlertDAO dao;
	
	private final SimpMessageSendingOperations messagingTemplate = null;
	
	@Override
	public void alert(AlertVO vo) throws Exception {
		dao.alert(vo);
	}

	// 해당 방의 모든 회원에게 보내기
	@Override
	public void alertByMessage(MessageVO messageVO) throws Exception {
		//messagingTemplate.convertAndSend("/queue/" + messageVO.getType(), messageVO);
		
	}
	

}

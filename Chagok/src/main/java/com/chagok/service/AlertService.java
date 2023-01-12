package com.chagok.service;


import com.chagok.domain.AlertVO;
import com.chagok.domain.MessageVO;

public interface AlertService {

	// 알림 저장
	public void alert(AlertVO vo) throws Exception;
	
	// 알림 보내기
	public void alertByMessage(MessageVO messageVO) throws Exception;
}

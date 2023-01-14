package com.chagok.service;


import java.util.List;

import com.chagok.domain.AlertVO;
import com.chagok.domain.MessageVO;

public interface AlertService {

	// 알림 저장
	public void alert(AlertVO vo) throws Exception;
	
	// 알림 보내기
	public void alertByMessage(MessageVO messageVO) throws Exception;
	
	// 알림보내기
	public List<AlertVO> getAlarm(Integer cno) throws Exception;
}

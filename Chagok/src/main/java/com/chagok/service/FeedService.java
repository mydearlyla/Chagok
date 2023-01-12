package com.chagok.service;

import java.util.List;
import java.util.Map;

import com.chagok.domain.FeedDTO;
import com.chagok.domain.MessageVO;

public interface FeedService {

	// 지난 메시지 가져오기
	public List<MessageVO> getMsgList(Integer cno) throws Exception;
	
	// 메시지 저장
	public void saveMsg1(MessageVO messageVO, Integer cno) throws Exception;
}

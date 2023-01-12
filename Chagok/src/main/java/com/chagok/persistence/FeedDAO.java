package com.chagok.persistence;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.chagok.domain.FeedDTO;
import com.chagok.domain.MessageVO;

@Repository
public interface FeedDAO {

	// 채팅방 생성 순서 최근 순으로 반환
	public List<FeedDTO> findRooms(Integer cno) throws Exception;
	
	// 피드아이디 찾기
	public FeedDTO findRoomById(String id) throws Exception;
	
	// 채팅룸
	public FeedDTO createChatRoomDTO(String f_receiver, Date date, FeedDTO feedDTO) throws Exception;
	
	// 지난 메시지 가져오기
	public List<MessageVO> getMsgList(Integer cno) throws Exception;
	
	// 메시지 저장(보내는 사람에 따라 구분)
	public void saveMsg1(FeedDTO feedDTO, String f_receiver) throws Exception;
}

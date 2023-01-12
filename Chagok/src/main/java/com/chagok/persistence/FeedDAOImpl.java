package com.chagok.persistence;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.domain.FeedDTO;
import com.chagok.domain.MessageVO;

@Repository
public class FeedDAOImpl implements FeedDAO {
	
	private Map<String, FeedDTO> FeedDTOMap;
	private static final Logger mylog = LoggerFactory.getLogger(FeedDAOImpl.class);

	// 디비 연결정보 필요함 => 의존관계 // mapper
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.chagok.mapper.chagokMapper";
	
	
	// cno가 같은 채팅룸 모두 가져옴
	@Override
	public List<FeedDTO> findRooms(Integer cno) throws Exception {
		
		List<FeedDTO> result = new ArrayList<FeedDTO>(FeedDTOMap.values());
		
		return result;
	}
	
	// 피드아이디 찾기
	@Override
	public FeedDTO findRoomById(String id){
        return FeedDTOMap.get(id);
    }
	
	// 채팅룸
	@Override
    public FeedDTO createChatRoomDTO(String f_receiver ,Date date, FeedDTO feedDTO){
    	FeedDTO room = FeedDTO.create(date, f_receiver);
    	room.setCno(feedDTO.getCno());
    	room.setContents(feedDTO.getContents());

        return room;
    }

	@Override
	public List<MessageVO> getMsgList(Integer cno) throws Exception {
		List<FeedDTO> feedList =  sqlSession.selectList(NAMESPACE+".getMsgList", cno);
		FeedDTO dto = new FeedDTO();
		List<MessageVO> message = new ArrayList<MessageVO>();
		JSONParser parser = new JSONParser();
		JSONObject object;
		String jsonString;
		SimpleDateFormat ysdf = new SimpleDateFormat("yy-MM-dd");
		SimpleDateFormat year = new SimpleDateFormat("yy");
		SimpleDateFormat sdf = new SimpleDateFormat("MM월 dd일"); // QQQ 날짜 포멧
		String fmtDate;
		
		for(int i = 0; i < feedList.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			MessageVO vo = new MessageVO();
			dto =  feedList.get(i);
			jsonString = dto.getContents();
			object = (JSONObject)parser.parse(jsonString);
			
			vo.setWriter((String)object.get("writer"));
			
			// 날짜
			Date date = dto.getF_date();
			Date today = new Date();
			
			// 날짜 판단해서 Today 또는 날짜로 표시하도록 함
			if((ysdf.format(date)).equals(ysdf.format(today))) { // 날짜 같으면
				fmtDate = "오늘"; 
			}else if((year.format(date)).equals(year.format(today))) { // 연도 같으면
				fmtDate = sdf.format(date);
			}else {
				fmtDate = ysdf.format(date);
			}

			vo.setTime((String)object.get("time") + " | " + fmtDate);
			vo.setMessage((String)object.get("message"));
			
			message.add(vo);
		}
		
		return message;
	}

	@Override
	public void saveMsg1(FeedDTO feedDTO, String f_receiver) throws Exception {
		mylog.debug(" saveMsg1() 호출 - stompcontroller에서 Msg저장");
		mylog.debug(" saveMsg1() 호출  :" + feedDTO);
		
		Date date = new Date(); // 오늘 날짜 저장
		FeedDTO dto = createChatRoomDTO(f_receiver, date, feedDTO);
		
		sqlSession.insert(NAMESPACE+".saveMsg1",dto);
		
	}
	
	
}

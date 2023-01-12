package com.chagok.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.domain.FeedDTO;
import com.chagok.domain.MessageVO;
import com.chagok.persistence.FeedDAO;

@Service
public class FeedServiecImpl implements FeedService {

	private static final Logger mylog = LoggerFactory.getLogger(FeedServiecImpl.class);

	@Inject
	private FeedDAO dao;

	@Override
	public List<MessageVO> getMsgList(Integer cno) throws Exception {
		
		return dao.getMsgList(cno);
	}

	@Override
	public void saveMsg1(MessageVO messageVO, Integer cno) throws Exception {
		FeedDTO feedDTO = new FeedDTO();
		
		String msgContent = "{\"message\": \""+ messageVO.getMessage() + "\", \"time\": \"" + messageVO.getTime() + "\", \"writer\": \""+ messageVO.getWriter()+"\"}";
		System.out.println(messageVO.getTime());
		feedDTO.setContents(msgContent);
		feedDTO.setCno(cno);
		
		String f_receiver = "all"; // 나중에 '@이름'을 사용할 경우에는 따로 받아서 처리할 것
		
		dao.saveMsg1(feedDTO, f_receiver);
		
	}

	
	
}

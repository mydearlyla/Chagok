package com.chagok.persistence;

import java.util.List;
import java.util.Map;

import com.chagok.domain.AlertVO;

public interface AlertDAO {

	// 알림 저장
	public void alert(AlertVO vo) throws Exception;
	
	//알림 내용 가져오기
	public List<AlertVO> getAlarm(Integer cno) throws Exception;
}

package com.chagok.persistence;

import com.chagok.domain.AlertVO;

public interface AlertDAO {

	// 알림 저장
	public void alert(AlertVO vo) throws Exception;
}

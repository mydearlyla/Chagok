package com.chagok.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.chagok.domain.AlertVO;

@Repository
public class AlertDAOImpl implements AlertDAO {

	@Inject
	private SqlSession sqlsession;
	
	private final static String NAMESPACE = "com.chagok.mapper.chagokMapper";
	
	@Override
	public void alert(AlertVO vo) throws Exception {
		sqlsession.insert(NAMESPACE+".alert",vo);
	}

	@Override
	public List<AlertVO> getAlarm(Integer cno) throws Exception {

		return sqlsession.selectList(NAMESPACE+".getAlarm", cno);
	}
	
	

}

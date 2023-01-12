package com.chagok.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAOImpl implements PayDAO {

	private static final Logger mylog = LoggerFactory.getLogger(PayDAOImpl.class);
	
	//DB 연결
	@Inject
	private SqlSession sqlSession;
		
	//NAMESPACE
	private static final String NAMESPACE = "com.chagok.mapper.payMapper";

	
	@Override
	public void insertPay(Integer mno, Integer pay_cash, String pay_mean, String pay_regdate) {
		mylog.debug(" insertPay 호출 ");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("pay_cash", pay_cash);
		map.put("pay_mean", pay_mean);
		map.put("pay_regdate", pay_regdate);
		
		sqlSession.insert(NAMESPACE+".insertPay",map);
	}

}

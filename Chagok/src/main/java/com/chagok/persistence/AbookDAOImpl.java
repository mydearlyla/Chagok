package com.chagok.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.domain.AbookVO;
import com.chagok.domain.CategoryVO;

@Repository
public class AbookDAOImpl implements AbookDAO{
	private static final Logger mylog = LoggerFactory.getLogger(AbookDAOImpl.class);
	
	//DB 연결
	@Inject
	private SqlSession sqlSession;
	
	//NAMESPACE
	private static final String NAMESPACE = "com.chagok.mapper.abookMapper";

	@Override
	public List<AbookVO> getAbookList(int mno) throws Exception {
		mylog.debug("mno="+mno);
		List<AbookVO> AbookList = sqlSession.selectList(NAMESPACE+".abookList", mno);
		mylog.debug("Mapper♡♡♡♡♡♡♡♡♡♡♡♡♡"+AbookList);
		
		return AbookList;
	}

	@Override
	public List<CategoryVO> CateList() throws Exception {
		List<CategoryVO> CateList = sqlSession.selectList(NAMESPACE+".cateList");
		mylog.debug("Mapper♡♡♡♡♡♡♡♡♡♡♡♡♡"+CateList);
		
		return CateList;
	}
	
	
	
}

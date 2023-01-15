
package com.chagok.persistence;

import java.security.KeyStore.Entry;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.apiDomain.AccountHistoryVO;
import com.chagok.apiDomain.AccountVO;
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
	
	// 가계부 조회 map
	@Override
	public List<Map<String, AbookVO>> getAbookList(int mno, int mm) throws Exception {
//		mylog.debug("Mapper♡♡♡♡♡♡♡♡♡♡♡♡♡AbookList");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
//		map.put("mm", mm);
		
		
		List<Map<String, AbookVO>> AbookList2 = sqlSession.selectList(NAMESPACE+".getAbookList2", map); 
		
		return AbookList2;
	}
	
	// 카테고리 리스트 
	@Override
	public List<Map<String, Object>> cateList() throws Exception {
		
		List<Map<String, Object>> cttopList = sqlSession.selectList(NAMESPACE+".cttopList");
		List<Map<Object,Object>> ctList = new ArrayList<Map<Object,Object>>();
			
		return cttopList;

	}
	
	// 하위 카테고리
	@Override
	public List<Map<String, Object>> ctbottomList(String ct_top) throws Exception {
		mylog.debug("DAOIM처리전"+ct_top);
		
		List<Map<String, Object>> ctbottomList = null;
		
		mylog.debug("ct_top####"+ct_top);
		ctbottomList = sqlSession.selectList(NAMESPACE+".ctbottomList", ct_top);

	return ctbottomList;
}	
	
	// 가계부 수정 저장
	@Override
	public void setAbookList(AbookVO vo) throws Exception {
		sqlSession.update(NAMESPACE+".setAbookList", vo);
	}

	// 가계부 입력 
	@Override
	public void insAbookList(AbookVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".insAbookList", vo);
	}
	
	@Override
	public List<AbookVO> toCate(int ctno) throws Exception {
		List<AbookVO> toCateList = sqlSession.selectList(NAMESPACE+".toCate", ctno);
		return toCateList; 
	}

	@Override
	public void delAbookList(int abno) throws Exception {
		sqlSession.delete(NAMESPACE+".delAbookList", abno);
	}




	
	
	
	
	///////////////////MJ/////////////////////


	@Override
	public List<String> getctTop() throws Exception {
		return sqlSession.selectList(NAMESPACE+".getctTop");
	}	
	
	@Override
	public int chkBud(Integer mno, String pMonth) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("p_month", pMonth);
		int chkBud = sqlSession.selectOne(NAMESPACE+".chkBud", map);
		return chkBud;
	}

	@Override
	public List<Map<String, Object>> getBud(Integer mno, String pMonth) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("p_month", pMonth);
		return sqlSession.selectList(NAMESPACE+".getBud", map);
	}
	
	@Override
	public void setBud(Map<String, Object> insertMap) throws Exception {
//		mylog.debug("insertMap : "+insertMap.toString());
		sqlSession.insert(NAMESPACE+".setBud", insertMap);
	}
	
	@Override
	public void updBud(List<Map<String, Object>> updateList) throws Exception {
//		mylog.debug("updateList : "+updateList.toString());
		for(Map<String, Object> updatemap : updateList) {
	        sqlSession.update(NAMESPACE+".updBud", updatemap);
		}
	}

	@Override
	public void delBud(Integer mno, String pMonth) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("p_month", pMonth);
		sqlSession.delete(NAMESPACE+".delBud", map);
		mylog.debug("예산 삭제");
	}

	@Override
	public Integer totalBud(Integer mno, String pMonth) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("p_month", pMonth);
		return sqlSession.selectOne(NAMESPACE+".totalBud", map);
	}

	@Override
	public List<Map<String, Object>> calInout(Integer mno, Integer mm, Integer inout) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		
		if(inout==0) {
			mylog.debug("calAll");
			return sqlSession.selectList(NAMESPACE+".calAll", map);
		} else {
			map.put("inout", inout);
			mylog.debug("calInout");
			return sqlSession.selectList(NAMESPACE+".calInout", map);
		}
	}

	@Override
	public int chkAb(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectOne(NAMESPACE+".chkAb", map);
	}
	
	
	
	
	
}

package com.chagok.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	
	private static final Logger mylog = LoggerFactory.getLogger(UserDAOImpl.class);
	
	// 디비 연결정보 필요함 => 의존관계 // mapper
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE
	= "com.chagok.mapper.chagokMapper";
	
	@Override
	public String getServerTime() { // 시간정보 리턴
		
		String time = sqlSession.selectOne("com.chagok.mapper.chagokMapper.getTime");
		
		return time;
	}
	
	@Override
	public void createUser(UserVO vo) throws Exception {
		//System.out.println("DAO : "+vo);
		mylog.info(" 서비스 -> DAO -> mapper ");
		// (디비연결 - sql 작성) - 실행
		sqlSession.insert(NAMESPACE+".createUser", vo);
		//System.out.println(" DAOImpl : 회원가입 성공! ");
		mylog.info(" mapper -> DAO -> 서비스 " );
		
	}
	
	@Override
	public int checkId(String id) throws Exception {
		int result = sqlSession.selectOne(NAMESPACE+".checkId",id);
		return result;
	}
	
	@Override
	public int checkNick(String nick) throws Exception {
		int result = sqlSession.selectOne(NAMESPACE+".checkNick",nick);
		return result;
	}

	//특정 회원정보 조회(id)
	@Override
	public UserVO getUser(String id) throws Exception {
		UserVO vo = sqlSession.selectOne(NAMESPACE+".getUser",id);
				
		System.out.println(" DAO : " +vo);
		return vo;
	}
	
	//특정 회원정보 조회(mno)
	@Override
	public UserVO getUser(int mno) throws Exception {

		return sqlSession.selectOne(NAMESPACE+".getUserM",mno);
	}

	// 로그인 처리
	@Override
	public UserVO loginUserCheck(Map<String, String> loginMap) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".loginUserCheck",loginMap);
	}


	@Override
	public void updateIsCheck(int mno) throws Exception {
		sqlSession.update(NAMESPACE+".updateIsCheck", mno);
	}

	// 관리자 전체 회원 조회
	@Override
	public List<UserVO> getUserList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE +".getUserList");
	@Override
	public void updateSeqNo(Map<String, Object> map) {
		sqlSession.update(NAMESPACE+".updateSeqNo", map);
	}

	@Override
	public void updateUserInfo(UserVO vo) {
		sqlSession.update(NAMESPACE+".updateUserInfo", vo);
	}
	
	@Override
	public int unregistUser(UserVO vo) throws Exception {
		
		int result = sqlSession.delete(NAMESPACE+".unregistUser", vo);
		
		return result;
	}
	
	
	
	
}

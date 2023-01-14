package com.chagok.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.domain.BusinessAccountVO;
import com.chagok.domain.Criteria;
import com.chagok.domain.UserVO;
import com.chagok.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger mylog = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Inject
	private UserDAO dao;
	
	@Override
	public void userJoin(UserVO vo) throws Exception {
		mylog.info(" 컨트롤러 호출 -> 서비스 -> DAO 호출 ");
		dao.createUser(vo);
		mylog.info(" DAO 호출 -> 서비스 -> 컨트롤러 ");
	}
	
	@Override
	public int checkId(String id) throws Exception {
		int result = dao.checkId(id);
		return result;
	}
	
	@Override
	public int checkNick(String nick) throws Exception {
		int result = dao.checkNick(nick);
		return result;
	}

	// 로그인 처리
	@Override
	public UserVO loginUserCheck(Map<String, String> loginMap) throws Exception {
		mylog.info(" userLogin(vo) 호출 ");
		
		UserVO resultVO = dao.loginUserCheck(loginMap);
		
		mylog.debug(" DAO 처리 결과 : " + resultVO);
		
		return resultVO;
	}

	// 특정 회원정보 조회(id)
	@Override
	public UserVO getUser(String id) throws Exception {
		return dao.getUser(id);
	}

	// 특정 회원정보 조회(mno)
	@Override
	public UserVO getUser(int mno) throws Exception {
		return dao.getUser(mno);
	}

	@Override
	public void updateIsCheck(int mno) throws Exception {
		dao.updateIsCheck(mno);
	}

	// 관리자 전체 회원 조회
	
	
	
	@Override
	public void updateSeqNo(Map<String, Object> map) {
		dao.updateSeqNo(map);
	}

	@Override
	public void updateUserInfo(UserVO vo) {
		dao.updateUserInfo(vo);
	}

	@Override
	public int unregistUser(UserVO vo) throws Exception {
		return dao.unregistUser(vo);
	}
	
	@Override
	public List<UserVO> getUserList(Criteria cri) throws Exception {
		return dao.getUserList(cri);
	}
	
	@Override
	public Integer getUserCnt() throws Exception {
		return dao.getUserCnt();
	}
	
	@Override
	public List<BusinessAccountVO> getBizList(Criteria cri) throws Exception {
		return dao.getBizList(cri);
	}

	@Override
	public Integer getBizCnt() throws Exception {
		return dao.getBizCnt();
	}

	@Override
	public void insertBuy(Integer mno, Integer buypoint) {
		dao.insertBuy(mno, buypoint);
	}
	
	// 챌린지 성공시 포인트 지급
	@Override
	public void givePoint(Map<String, Object> map) throws Exception {
		mylog.debug("givePoint() 호출");
		
		dao.givePoint(map);
	}

	// 포인트 차감
	@Override
	public void usePoint(Map<String, Object> map) throws Exception {
		mylog.debug("usePoint() 호출");
		
		dao.usePoint(map);
	}
	
	
	
}

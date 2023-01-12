package com.chagok.persistence;

import java.util.List;
import java.util.Map;

import com.chagok.domain.UserVO;

public interface UserDAO {
	
	// 디비서버의 시간정보 조회
	public String getServerTime();
	
	// 회원가입
	public void createUser(UserVO vo) throws Exception;
	
	// 아이디 체크
	public int checkId(String id) throws Exception;
	
	// 닉네임 체크
	public int checkNick(String nick) throws Exception;
		
	// 특정 회원정보 조회(id)
	public UserVO getUser(String id) throws Exception;

	// 특정 회원정보 조회(mno)
	public UserVO getUser(int mno) throws Exception;
	
	// 로그인 처리
	public UserVO loginUserCheck(Map<String, String> loginMap) throws Exception;
	
	// 인증성공 isCheck N => Y
	public void updateIsCheck(int mno) throws Exception;
	
	// 관리자 전체 회원 조회
	public List<UserVO> getUserList() throws Exception;
	
	// user_seq_no 저장
	public void updateSeqNo(Map<String, Object> map);
	
	// 유저 정보 업데이트
	public void updateUserInfo(UserVO vo);
	
	// 회원 탈퇴
	public int unregistUser(UserVO vo) throws Exception;

}

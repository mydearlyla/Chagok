package com.chagok.service;

import java.util.List;
import java.util.Map;

import com.chagok.domain.UserVO;

public interface UserService {

	// 회원가입
	public void userJoin(UserVO vo) throws Exception;
	
	// 아이디 중복 체크
	public int checkId(String id) throws Exception;
	
	// 닉네임 중복 체크
	public int checkNick(String nick) throws Exception;
	
	// 로그인 체크
	public UserVO loginUserCheck(Map<String, String> loginMap) throws Exception;
	
	// 특정 회원정보 조회(id)
	public UserVO getUser(String id) throws Exception;

	// 특정 회원정보 조회(mno)		
	public UserVO getUser(int mno) throws Exception;
	
	// 인증성공 isCheck N => Y
	public void updateIsCheck(int mno) throws Exception;
	
	// 관리자 전체 회원 조회
	public List<UserVO> getUserList() throws Exception;
	
	// user_seq_no 저장
	public void updateSeqNo(Map<String, Object> map);
	
	// 유저정보 (전화번호, 계좌번호, 은행, 예금주) 업데이트
	public void updateUserInfo(UserVO vo);
	
	// 닉네임 파라미터로 게시글 정보 조회
	
	// 회원 탈퇴
	public int unregistUser(UserVO vo) throws Exception;
	
}

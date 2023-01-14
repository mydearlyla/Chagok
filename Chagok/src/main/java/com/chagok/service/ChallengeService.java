package com.chagok.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.chagok.domain.AbookVO;
import com.chagok.domain.BoardVO;
import com.chagok.domain.BusinessAccountVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.Criteria;
import com.chagok.domain.MinusVO;
import com.chagok.domain.PlusVO;
import com.chagok.domain.SearchCriteria;
import com.chagok.domain.UserVO;

public interface ChallengeService {
	
	// 챌린지 정보 불러오기 (사진 / 카테고리 / 제목 / 장 / 인원 / 기간 / 시작일 /예치금)
	public ChallengeVO getChallengeInfo(Integer cno);
	
	// ct_top 가져오기
	public ChallengeVO getCt_top(Integer cno);
	
	// [저축형]챌린지 참가자 조회 
	public List<Map<String, Object>> getPlusPeople(Integer cno);

	// 후기글 작성
	public void createReview(BoardVO vo);
	
	// 챌린지 정보 (리스트)
	public List<ChallengeVO> getChallengeList(Integer cno);
	
	// 내 챌린지 ( 챌린지유형 / 카테고리 / 챌린지제목 / 챌린지기간 / 챌린지상태 )
	public List<ChallengeVO> getmyChallenge(String nick);
	
	// 챌린지 신청 취소 (챌린지 테이블에 닉네임 잘라주기)
	public void cancelChallenge(String nick, Integer cno);
	
	// 저축형 챌린지 신청 취소 (플러스테이블에 mno랑 cno 없애주기)
	public void cancelPlus(Integer mno, Integer cno);
	
	// 절약형 챌린지 신청 취소 (마이너스 테이블에 mno랑 cno 없애주기)
	public void cancelMinus(Integer mno, Integer cno);

	// [절약형]챌린지 참가자 조회 
	public List<Map<String, Object>> getMinusPeople(Integer cno);
	
	// 챌린지 종료일자 정보 가져오기
	public Date getChallengeEndDate(Integer cno);

	// 게시판 리스트
	public List<BoardVO> getBoardList(Integer b_sort);
	
	// 게시판 글 확인
	public BoardVO getBoardContent(Integer bno);

	// 챌린지 등록
	public void challengeRegist(ChallengeVO vo) throws Exception;
	
	// 챌린지 목록
	public List<ChallengeVO> getChallengeList() throws Exception;
	
	// 중복 챌린지 체크
	public Integer samechallenge(Map<String, Object> map);
	
	// 저축형 챌린지 참여 - plus테이블에 mno랑 cno insert
	public void joinplusInsert(Map<String, Object> map);
	
	// 저축형&절약형 챌린지 참여 - challenge테이블 c_person에 ",닉네임" 업데이트 , c_cnt에 +1하기
	public void joinplusUpdate(Map<String, Object> map);
	
	// 절약형 챌린지 참여 - minus테이블에 mno랑 cno insert
	public void joinminusInsert(Map<String, Object> map);
	
	// 챌린지 피드 인원 조회
//	public List<Map<String, Object>> getCList(Integer cno);
	public int getCList(Integer cno) throws Exception;
	
	// 게시판 글 수정
	public Integer updateBoard(BoardVO vo) throws Exception;
	
	// 게시판 글 삭제
	public void deleteBoard(Integer bno) throws Exception;
	
	// 게시판 글 작성
	public void insertBoard(BoardVO vo) throws Exception;
	
	// 명예의 전당 순위
	public List<UserVO> ranking() throws Exception;
	
	// 챌린지 목록 (페이징)
	public List<ChallengeVO> cList(SearchCriteria scri) throws Exception;
	
	// 챌린지 총 갯수 (페이징)
	public Integer cListCount(SearchCriteria scri) throws Exception;
	
	// 챌린지 예치금 합산
	public int getChallengeMoney(Integer cno) throws Exception;
	
	// 챌린지 실패/성공 조건 조회
	public List<Map<String, Object>> getResult(Integer cno) throws Exception;
	
	// 챌린지 성공 인원 조회
	public Integer getSuccess(Integer cno) throws Exception;

	// 챌린지 성공여부 (절약형)
	public ChallengeVO getMoney(Integer mno) throws Exception;
	
	// 가계부 가져오기
	public List<Map<String, Object>> getMinusAbook(Integer mno, Integer cno, Integer ctno);
	
	// 게시판 + 챌린지 리스트
	public Map<String, Object> getBoardChallenge(Integer cno) throws Exception;
	
	// 가계부 값 연동하기
	public void updateMoney(Integer mno, Integer ab_amount, Integer cno);
	
	// 공지글 정보 조회(페이징처리 cri)
	public List<BoardVO> getNBoardPage(Criteria cri) throws Exception;
		
	// 전체 공지 게시판 글 개수 조회
	public int NboardCount() throws Exception;
	
	// 관리자 챌린지 승인
	public void confirmChallenge(Integer status, Integer cno) throws Exception;
	
	// 관리자 모달창 회원mno
	public List<UserVO> adminmodal(Map<String, Object> map) throws Exception;

	// 후기글 정보 조회(페이징처리 cri)
//	public List<BoardVO> getRBoardPage(Criteria cri) throws Exception;
	public List<Map<String, Object>> getRBoardPage(Criteria cri) throws Exception;
		
	// 전체 후기 게시판 글 개수 조회
	public int RboardCount() throws Exception;	
	
	// 비즈니스 계좌 송금
	public void sendBiz(BusinessAccountVO vo) throws Exception;
	
	// 비지니스 계좌 송금시 플러스 테이블 업데이트 (pl_sum)
	public void updatePlusSum(BusinessAccountVO vo) throws Exception;
	
	// 내 plus 테이블 정보 가져오기
	public PlusVO getPlusOne(int mno, int cno) throws Exception;
	
	// 관리자 챌린지 전체 목록
	public List<ChallengeVO> chListAll(Criteria cri) throws Exception;
	
	// 관리자 챌린지 총 개수
	public Integer chListCnt() throws Exception;

	// 자유게시판 정보 조회(페이징처리 cri)
	public List<BoardVO> getFBoardPage(Criteria cri) throws Exception;
		
	// 전체 자유 게시판 글 개수 조회
	public int FboardCount() throws Exception;
	
	// 자유게시판 경제 조회(페이징처리 cri)
	public List<BoardVO> getEBoardPage(Criteria cri) throws Exception;
	
	// 전체 경제 게시판 글 개수 조회
	public int EboardCount() throws Exception;
	
	// ctno 가져오기
	public int getCtno(Integer cno);
	
	// 챌린지 성공/실패 여부 가져옴(모든 회원)
	public List<Map<String, Object>> challengeResultList(Integer cno) throws Exception;
	
	// 챌린지 성공/실패 여부 가져옴(한 명만)
	public Map<String, Object> challengeResult(Integer cno, Integer mno) throws Exception;

	// 내가 쓴 글(페이징처리 cri)
	public List<BoardVO> getMyBoardWrite(Criteria cri) throws Exception;
//	public List<BoardVO> getMyBoardWrite(String nick) throws Exception;
		
	// 내가 쓴 글 개수 조회
	public int MyBoardWriteCnt() throws Exception;
	
}


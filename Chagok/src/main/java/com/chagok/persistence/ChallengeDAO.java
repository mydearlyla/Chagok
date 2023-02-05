package com.chagok.persistence;

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

public interface ChallengeDAO {
	
	// 챌린지 정보 불러오기 (사진 / 카테고리 / 제목 / 장 / 인원 / 기간 / 시작일 /예치금)
	public ChallengeVO getChallengeInfo(int cno);	
	
	// ct_top (카테고리 대분류) 불러오기
	public ChallengeVO getCt_top(Integer cno);
	
	// [저축형]챌린지 참가자 조회 
	public List<Map<String, Object>> getPlusPeople(Integer cno);
		
	// 챌린지정보 리스트(참여인원리스트)
	public List<ChallengeVO> getChallengeList(Integer cno); 
	
	// 내 챌린지 ( 챌린지유형 / 카테고리 / 챌린지제목 / 챌린지기간 / 챌린지상태 )
	public List<ChallengeVO> getmyChallenge(String nick);
	
	// 챌린지 신청 취소 (챌린지 테이블에 닉네임 잘라주기)
	public int cancelChallenge(String nick, Integer cno);
	
	// 저축형 챌린지 신청 취소 (플러스테이블에 mno랑 cno 없애주기)
	public int cancelPlus(Integer mno, Integer cno);
	
	// 절약형 챌린지 신청 취소 (마이너스 테이블에 mno랑 cno 없애주기)
	public int cancelMinus(Integer mno, Integer cno);
	
	// [절약형]챌린지 참가자 조회 
	public List<Map<String, Object>> getMinusPeople(Integer cno);
	
	// 챌린지 종료일자 정보 가져오기
	public Date getChallengeEndDate(Integer cno);
		
	// 중복 챌린지 체크
	public Integer samechallenge(Map<String, Object> map);
	
	// 저축형 챌린지 참여 - plus테이블에 mno랑 cno insert
	public void joinplusInsert(Map<String, Object> map);
	
	// 저축형&절약형 챌린지 참여 - challenge테이블 c_person에 ",닉네임" 업데이트 , c_cnt에 +1하기
	public void joinplusUpdate(Map<String, Object> map);
	
	// 절약형 챌린지 참여 - minus테이블에 mno랑 cno insert
	public void joinminusInsert(Map<String, Object> map);
	
	// 챌린지 등록
	public Integer challengeRegist(ChallengeVO vo) throws Exception;
		
	// 챌린지 목록
	public List<ChallengeVO> getChallengeList() throws Exception;
	
	// 챌린지 피드 인원 조회
	public int getCList(Integer cno) throws Exception;

	// 명예의 전당 순위
	public List<UserVO> ranking() throws Exception;
	
	// 챌린지 목록 (페이징)
	public List<ChallengeVO> cListM(SearchCriteria scri) throws Exception;
	
	// 챌린지 총 갯수 (페이징)
	public Integer cListCountM(SearchCriteria scri) throws Exception;
	
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
	public ChallengeVO getMoney(Integer mno);
	
	// 가계부 가져오기
	public List<Map<String, Object>> getMinusAbook(Integer mno, Integer cno, Integer ctno);
	
	// 가계부 값 연동하기
	public void updateMoney(Integer mno, Integer ab_amount, Integer cno);
	
	// 관리자 챌린지 승인
	public void confirmChallenge(Integer c_status, Integer cno) throws Exception;
	
	// 관리자 모달창 회원mno
	public List<UserVO> adminmodal(Map<String, Object> map) throws Exception;
	
	// 비즈니스 계좌 송금
	public void sendBiz(BusinessAccountVO vo) throws Exception;
	
	// 비지니스 계좌 송금시 플러스 테이블 업데이트 (pl_sum)
	public void updatePlusSum(BusinessAccountVO vo) throws Exception;
	
	// 내 plus 테이블 정보 가져오기
	public PlusVO getPlusOne(int mno, int cno) throws Exception;

	// 관리자 - 챌린지 전체 목록
	public List<ChallengeVO> chListAll(Criteria cri) throws Exception;
	
	// 관리자 - 챌린지 총 개수
	public Integer chListCnt() throws Exception;
	
	// 챌린지 성공/실패 여부 가져옴(모든 회원)
	public List<Map<String, Object>> challengeResultList(Integer cno) throws Exception;
	
	// 챌린지 성공/실패 여부 가져옴(한 명만)
	public Map<String, Object> challengeResult(Integer cno, Integer mno) throws Exception;

	// ctno 가져오기
	public int getCtno(Integer cno);
	
	// update minus m_sum
	public void updateMsum(Map<String, Object> map) throws Exception;
	
	
}
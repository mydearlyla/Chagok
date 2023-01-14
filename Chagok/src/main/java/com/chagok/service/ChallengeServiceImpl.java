package com.chagok.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.domain.AbookVO;
import com.chagok.domain.BoardVO;
import com.chagok.domain.BusinessAccountVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.Criteria;
import com.chagok.domain.MinusVO;
import com.chagok.domain.PlusVO;
import com.chagok.domain.SearchCriteria;
import com.chagok.domain.UserVO;
import com.chagok.persistence.ChallengeDAO;

@Service
public class ChallengeServiceImpl implements ChallengeService{
	
	private static final Logger mylog = LoggerFactory.getLogger(ChallengeServiceImpl.class);

	@Inject
	private ChallengeDAO dao;
	
	@Override
	public ChallengeVO getChallengeInfo(Integer cno) {
		mylog.debug("getChallengeInfo(int cno) 호출");
		ChallengeVO vo = dao.getChallengeInfo(cno);
		mylog.debug("getChallengeInfo(cno) 처리 결과 : "+vo);
		return dao.getChallengeInfo(cno);
	}
	
	@Override
	public ChallengeVO getCt_top(Integer cno) {
		mylog.debug("getCt_top(int cno) 호출");
		ChallengeVO vo = dao.getCt_top(cno);
		return dao.getCt_top(cno);
	}

	@Override
	public List<Map<String, Object>> getPlusPeople(Integer cno){
		mylog.debug("getPlusPeople("+cno+") 호출");
		return dao.getPlusPeople(cno);
	}

	@Override
	public void createReview(BoardVO vo){
		dao.createReview(vo);
		
	}

	@Override
	public List<ChallengeVO> getChallengeList(Integer cno) {
		return dao.getChallengeList(cno);
	}

	@Override
	public List<ChallengeVO> getmyChallenge(String nick) {
		List<ChallengeVO> mychallengeList = dao.getmyChallenge(nick);
		mylog.debug("getmyChallenge(String nick) : "+mychallengeList);
		return dao.getmyChallenge(nick);
	}
	// 챌린지 취소하기 (챌린지 테이블에 닉네임 잘라주기)
	@Override
	public void cancelChallenge(String nick, Integer cno) {
		mylog.debug("service : cancelChallnege 호출");
		dao.cancelChallenge(nick, cno);
	}
	
	// 저축형 챌린지 신청 취소 (플러스테이블에 mno랑 cno 없애주기)
	@Override
	public void cancelPlus(Integer mno, Integer cno) {
		mylog.debug("service : cancelPlus 호출");
		dao.cancelPlus(mno, cno);
	}

	// 절약형 챌린지 신청 취소 (마이너스 테이블에 mno랑 cno 없애주기)
	@Override
	public void cancelMinus(Integer mno, Integer cno) {
		mylog.debug("service : cancelMinus 호출");
		dao.cancelMinus(mno, cno);
	}

	@Override
	public List<Map<String, Object>> getMinusPeople(Integer cno) {
		mylog.debug("getMinusPeople("+cno+") 호출");
		return dao.getMinusPeople(cno);
	}

	@Override
	public Date getChallengeEndDate(Integer cno) {
		return dao.getChallengeEndDate(cno);
	}
	

	@Override
	public List<BoardVO> getBoardList(Integer b_sort) {
		
		return dao.getBoard(b_sort);
	}

	@Override
	public BoardVO getBoardContent(Integer bno) {
		
		return dao.getBoardContent(bno);
	}

	// 챌린지 등록
	@Override
	public void challengeRegist(ChallengeVO vo) throws Exception {
		mylog.debug(" challengeRegist(ChallengeVO vo) 호출 ");
				
		dao.challengeRegist(vo);
		mylog.debug(" 챌린지 등록 완료 ");
		
	}
	
	
	// 챌린지 목록
	@Override
	public List<ChallengeVO> getChallengeList() throws Exception {
		mylog.debug(" getChallengeList() 호출");
		
		return dao.getChallengeList();
	}


	// 중복챌린지 체크
	@Override
	public Integer samechallenge(Map<String, Object> map) {
		mylog.debug("service : samechallenge 호출");
		return dao.samechallenge(map);
	}

	@Override
	public int getCList(Integer cno) throws Exception {
		mylog.debug("getCList("+cno+") 호출");
		
		return  dao.getCList(cno);
		
	}
	// 저축형 챌린지 참여 - plus테이블에 mno랑 cno insert
	@Override
	public void joinplusInsert(Map<String, Object> map) {
		mylog.debug("service: joinplusInsert 호출");
		dao.joinplusInsert(map);
	}
	// 저축형&절약형 챌린지 참여 - challenge테이블 c_person에 ",닉네임" 업데이트하기
	@Override
	public void joinplusUpdate(Map<String, Object> map) {
		mylog.debug("service: joinplusUpdate 호출");
		dao.joinplusUpdate(map);
	}

	// 절약형 챌린지 참여 - minus테이블에 mno랑 cno insert
	@Override
	public void joinminusInsert(Map<String, Object> map) {
		mylog.debug("service: joinminusInsert 호출");
		dao.joinminusInsert(map);
		
	}

	// 게시판 글 수정
	@Override
	public Integer updateBoard(BoardVO vo) throws Exception {
		mylog.debug("updateBoard() 호출 ");
		
		return dao.updateBoard(vo);
	}


	// 게시판 글 삭제
	@Override
	public void deleteBoard(Integer bno) throws Exception {
		mylog.debug(" deleteBoard() 호출 ");
		
		dao.deleteBoard(bno);
		
	}

	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		mylog.debug(" insertBoard 호출 ");
		
		dao.insertBoard(vo);
		
	}

	// 챌린지 예치금 합산
	@Override
	public int getChallengeMoney(Integer cno) throws Exception {
		
		return  dao.getChallengeMoney(cno);
	}

	// 챌린지 성공/실패 조건 조회
	@Override
	public List<Map<String, Object>> getResult(Integer cno) throws Exception {
		
		return dao.getResult(cno);
	}

	// 챌린지 성공 인원 조회
	@Override
	public Integer getSuccess(Integer cno) throws Exception {
		
		return dao.getSuccess(cno);
	}

	
	// 명예의 전당 순위
	@Override
	public List<UserVO> ranking() throws Exception {
		mylog.debug(" ranking() 호출 ");
		
		return dao.ranking();
	}

	
	// 챌린지 목록 (페이징)
	@Override
	public List<ChallengeVO> cList(SearchCriteria scri) throws Exception {
		mylog.debug(" cList(SearchCriteria scri) 호출 ");
		
		return dao.cList(scri);
	}
	
	
	// 챌린지 총 갯수 (페이징)
	@Override
	public Integer cListCount(SearchCriteria scri) throws Exception {
		mylog.debug(" cListCount(SearchCriteria scri) 호출 ");
		
		return dao.cListCount(scri);
	}

	// 챌린지 + 게시판 리스트
	@Override
	public Map<String, Object> getBoardChallenge(Integer cno) throws Exception {
		mylog.debug(" boardChallenge 호출 ");
		return dao.getBoardChallenge(cno);
	}

	// 챌린지 성공여부 (절약형)
	@Override
	public ChallengeVO getMoney(Integer mno) throws Exception {
		mylog.debug(" getMoney(mno) 호출 ");
		return dao.getMoney(mno);
	}

	// 가계부 가져오기 
	@Override
	public List<Map<String, Object>> getMinusAbook(Integer mno, Integer cno, Integer ctno) {
		mylog.debug(" getMinusAbook(mno,cno) 호출 ");
		return dao.getMinusAbook(mno, cno, ctno);
	}

	// 가계부 값 연동하기 
	@Override
	public void updateMoney(Integer mno, Integer ab_amount, Integer cno) {
		mylog.debug(" updateMoney(mno,ab_amount,cno) 호출 ");
		dao.updateMoney(mno,ab_amount,cno);
	}

	// 공지글 정보 조회(페이징처리 cri)
	@Override
	public List<BoardVO> getNBoardPage(Criteria cri) throws Exception {
		mylog.debug(" getNBoardPage(Criteria cri) 호출 ");
		return dao.getNBoardPage(cri);
	}

	// 전체 공지게시판 글 개수 조회
	@Override
	public int NboardCount() throws Exception {
		mylog.debug("NboardCount() 호출");
		return dao.NBoardCount();
	}

	// 관리자 챌린지 승인
	@Override
	public void confirmChallenge(Integer status, Integer cno) throws Exception {
		mylog.debug("status : "+status+", cno : "+cno);
		dao.confirmChallenge(status, cno);
	}

	// 관리자 모달창 회원mno
	@Override
	public List<UserVO> adminmodal(Map<String, Object> map) throws Exception {
		mylog.debug("service : "+map);
		return dao.adminmodal(map);
	}

	// 후기글 정보 조회(페이징처리 cri)
//	@Override
//	public List<BoardVO> getRBoardPage(Criteria cri) throws Exception {
//		mylog.debug(" getRBoardPage(Criteria cri) 호출 ");
//		return dao.getRBoardPage(cri);
//	}
	@Override
	public List<Map<String, Object>> getRBoardPage(Criteria cri) throws Exception {
		mylog.debug(" getRBoardPage(Criteria cri) 호출 ");
		return dao.getRBoardPage(cri);
	}

	// 전체 후기게시판 글 개수 조회
	@Override
	public int RboardCount() throws Exception {
		mylog.debug("RboardCount() 호출");
		return dao.RBoardCount();
	}	

	// 비지니스 계좌 송금
	@Override
	public void sendBiz(BusinessAccountVO vo) throws Exception {
		dao.sendBiz(vo);
	}
	
	// 비지니스 계좌 송금시 플러스 테이블 업데이트 (pl_sum)
	@Override
	public void updatePlusSum(BusinessAccountVO vo) throws Exception {
		dao.updatePlusSum(vo);
	}

	// 내 plus 테이블 정보 가져오기
	@Override
	public PlusVO getPlusOne(int mno, int cno) throws Exception {
		return dao.getPlusOne(mno, cno);
	}

	
	@Override
	public List<ChallengeVO> chListAll(Criteria cri) throws Exception {
		return dao.chListAll(cri);
	}

	@Override
	public Integer chListCnt() throws Exception {
		return dao.chListCnt();
	}

	// 자유게시판 정보 조회(페이징처리 cri)
	@Override
	public List<BoardVO> getFBoardPage(Criteria cri) throws Exception {
		mylog.debug(" getFBoardPage(Criteria cri) 호출 ");
		return dao.getFBoardPage(cri);
	}

	// 전체 자유게시판 글 개수 조회
	@Override
	public int FboardCount() throws Exception {
		mylog.debug("NboardCount() 호출");
		return dao.FBoardCount();
	}

	// 경제게시판 정보 조회(페이징처리 cri)
	@Override
	public List<BoardVO> getEBoardPage(Criteria cri) throws Exception {
		mylog.debug(" getEBoardPage(Criteria cri) 호출 ");
		return dao.getEBoardPage(cri);
	}
	
	// 경제 자유게시판 글 개수 조회
	@Override
	public int EboardCount() throws Exception {
		mylog.debug("EboardCount() 호출");
		return dao.EBoardCount();
	}

	@Override
	public int getCtno(Integer cno) {
		mylog.debug(" getCtno() 호출 ");
		return dao.getCtno(cno);
	}

	

	// 챌린지 성공/실패 여부 가져옴(모든 회원)
	@Override
	public List<Map<String, Object>> challengeResultList(Integer cno) throws Exception {
		mylog.debug("challengeResultList() 호출");
		
		return dao.challengeResultList(cno);
	}

	// 챌린지 성공/실패 여부 가져옴(한 명만)
	@Override
	public Map<String, Object> challengeResult(Integer cno, Integer mno) throws Exception {
		mylog.debug("challengeResult() 호출");
		
		return dao.challengeResult(cno, mno);
	}
	
	// 내가 쓴 글 조회(페이징처리 cri)
	@Override
	public List<BoardVO> getMyBoardWrite(Criteria cri) throws Exception {
		mylog.debug(" getMyBoardWrite(Criteria cri) 호출 ");
		return dao.getMyBoardWrite(cri);
	}
//	@Override
//	public List<BoardVO> getMyBoardWrite(String nick) throws Exception {
//		mylog.debug(" getMyBoardWrite(Criteria cri) 호출 ");
//		return dao.getMyBoardWrite(nick);
//	}
		
	// 내가 쓴 글 개수 조회
	@Override
	public int MyBoardWriteCnt() throws Exception {
		mylog.debug(" MyBoardWriteCnt() 호출");
		return dao.MyBoardWriteCnt();
	}
	
	
}

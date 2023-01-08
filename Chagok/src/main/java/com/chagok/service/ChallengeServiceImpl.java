package com.chagok.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.domain.BoardVO;
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

	// 챌린지 피드 인원 조회
//	@Override
//	public List<Map<String, Object>> getCList(Integer cno) {
//		mylog.debug("getCList("+cno+") 호출");
//		return dao.getCList(cno);
//	}
	
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
	
	
	
	
	

	
	

	
	
}

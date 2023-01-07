package com.chagok.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.domain.BoardVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.Criteria;
import com.chagok.domain.MinusVO;
import com.chagok.domain.PlusVO;
import com.chagok.domain.UserVO;

@Repository
public class ChallengeDAOImpl implements ChallengeDAO{
	
	private static final Logger mylog = LoggerFactory.getLogger(ChallengeDAOImpl.class);
	
	// 디비 연결정보 필요함 => 의존관계 // mapper
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.chagok.mapper.chagokMapper";

	@Override
	public ChallengeVO getChallengeInfo(int cno) {
		mylog.debug("cno : "+cno);
		ChallengeVO vo = sqlSession.selectOne(NAMESPACE+".getChallengeInfo", cno);
		
		return vo;
	}
	
	@Override
	public ChallengeVO getCt_top(Integer cno) {
		ChallengeVO vo = sqlSession.selectOne(NAMESPACE+".getCt_top", cno);
		
		return vo;
	}

	@Override
	public List<Map<String, Object>> getPlusPeople(Integer cno){
		mylog.debug(cno+"번 챌린지 참가자 정보 호출(저축형)");
		List<Map<String, Object>> PPeopleList = sqlSession.selectList(NAMESPACE+".getPlusPeople",cno);
		mylog.debug(cno+"번 챌린지 참가자 수(저축형) : "+PPeopleList.size());
		
		return PPeopleList;
	}

	// 후기글 작성
	// 후기글 작성
	@Override
	public void createReview(BoardVO vo) {
		
		sqlSession.insert(NAMESPACE + ".create", vo);
		
	}

	// 챌린지 리스트
	// 챌린지 리스트
	@Override
	public List<ChallengeVO> getChallengeList(Integer cno) {
		mylog.debug(" getChallengeList(Integer cno) 호출");
		
		List<ChallengeVO> challengeList = sqlSession.selectList(NAMESPACE+".getChallengeInfo",cno);
		
		
		return challengeList;
		
	}

	@Override
	public List<ChallengeVO> getmyChallenge(String nick) {
		mylog.debug(" getmyChallenge(String nick) 호출");
		
		List<ChallengeVO> mychallengeList  = sqlSession.selectList(NAMESPACE+".getmyChallenge", nick);
		
		return mychallengeList;
	}
	
	@Override
	public List<Map<String, Object>> getMinusPeople(Integer cno) {
		mylog.debug(cno+"번 챌린지 참가자 정보 호출(절약형)");
		List<Map<String, Object>> MPeopleList = sqlSession.selectList(NAMESPACE+".getMinusPeople",cno);
		mylog.debug(cno+"번 챌린지 참가자 수(절약형) : "+MPeopleList.size());
		return MPeopleList;
	}

	@Override
	public Date getChallengeEndDate(Integer cno) {
		mylog.debug("getChallengeEndDate(cno) 호출");
		Date end = sqlSession.selectOne(NAMESPACE+".getChallengeEndDate", cno);
		mylog.debug(cno+"번 챌린지 종료일자 : "+end);
		
		return end;
	}
	 
	// 게시판 글 목록	
	@Override
	public List<BoardVO> getBoard(Integer b_sort) {
		mylog.debug(" getBoard() 호출");
		
		List<BoardVO> boardList = sqlSession.selectList(NAMESPACE+".boardList",b_sort);
		
		mylog.debug("게시판 글 개수 : "+boardList.size()+"");
		
		return boardList;
	}

	@Override
	public Integer samechallenge(Map<String, Object> map) {
		mylog.debug("dao : samechallenge 호출");
		return sqlSession.selectOne(NAMESPACE+".samechallenge", map);
	}

	// 게시글 내용
	@Override
	public BoardVO getBoardContent(Integer bno) {
		
		BoardVO vo = sqlSession.selectOne(NAMESPACE+".Board", bno);
		
		return vo;
		
	}
	
	
	
	// 챌린지 등록
	@Override
	public void challengeRegist(ChallengeVO vo) throws Exception {
		mylog.debug(" challengeRegist(ChallengeVO vo) 호출 ");
		
		sqlSession.insert(NAMESPACE + ".challengeRegist", vo);
		mylog.debug(" 챌린지 등록(저축형) 완료! ");
		
	}
	
	
	// 챌린지 목록
	@Override
	public List<ChallengeVO> getChallengeList() throws Exception {
		mylog.debug(" getChallengeList() 호출 ");
		
		List<ChallengeVO> challengeList = sqlSession.selectList(NAMESPACE +".getChallengeList");
		
		return challengeList;
	}


	// 챌린지 피드 인원 조회
//	@Override
//	public List<Map<String, Object> getCList(Integer cno) {
//		mylog.debug(" getCList(Integer cno) 호출 ");
//		
//		List<Map<String, Object>> CList = sqlSession.selectList(NAMESPACE+".CList");
//		return CList;
//	}
//	@Override
//	public void getCList(Integer cno) {
//		mylog.debug(" getCList(Integer cno) 호출 ");
//		
//		sqlSession.selectOne(NAMESPACE+".CList");
//		
//	}
	
	// 챌린지 참여 인원 조회(checkfeed 용)
	@Override
	public int getCList(Integer cno) throws Exception {
		mylog.debug("getCList(Integer cno) 호출");
		int CList = sqlSession.selectOne(NAMESPACE+".CList",cno);
		mylog.debug(CList+"");
		return CList;
	}

	// 게시글 수정
	@Override
	public Integer updateBoard(BoardVO vo) throws Exception {
		
		mylog.debug("updateBoard() 호출 ");
		
		return sqlSession.update(NAMESPACE+".updateBoard", vo);
	}

	// 게시글 삭제
	@Override
	public void deleteBoard(Integer bno) throws Exception {
		
		mylog.debug(" deleteBoard() 호출 ");
		
		sqlSession.delete(NAMESPACE+".deleteBoard",bno);
		
	}

	// 게시글 등록 (후기 제외)
	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		
		mylog.debug(" inserBoard 호출 ");
		
		sqlSession.insert(NAMESPACE+".insertBoard", vo);
		
	}

	// 챌린지 예치금 합산
	@Override
	public int getChallengeMoney(Integer cno) throws Exception {
		int ChallengeMoney = sqlSession.selectOne(NAMESPACE+".challengemoney",cno);
		
		return ChallengeMoney;
	}

	// 챌린지 성공/실패 조건 조회
	@Override
	public List<Map<String, Object>> getResult(Integer cno) throws Exception {
		List<Map<String, Object>> result = sqlSession.selectList(NAMESPACE+".result");
		return result;
	}

	// 챌린지 성공 인원 조회
	@Override
	public Integer getSuccess(Integer cno) throws Exception {
		Integer success = sqlSession.selectOne(NAMESPACE+".success", cno);
		return success;
	}
	// 저축형 챌린지 참여 - plus테이블에 mno랑 cno insert
	@Override
	public void joinplusInsert(Map<String, Object> map) {
		mylog.debug("joinplusInsert(map) 호출");
		sqlSession.insert(NAMESPACE+".joinplusInsert", map);
	}
	// 저축형 챌린지 참여 - challenge테이블 c_person에 ",닉네임" 업데이트하기
	@Override
	public void joinplusUpdate(Map<String, Object> map) {
		mylog.debug("joinplusUpdate 호출 닉네임 업데이트, c_cnt+1");
//		Map map = new HashMap();
//		map.put("nick", nick);
//		map.put("cno", cno);
		sqlSession.update(NAMESPACE+".joinplusUpdate", map);
	}
	
	// 저축형 챌린지 참여 - challenge테이블 c_cnt에 +1하기
//	@Override
//	public void joinplusUpdate2(Map<String, Object> map) {
//		mylog.debug("joinplusUpdate2(cno) 호출");
//		sqlSession.update(NAMESPACE+".joinplusUpdate2", map);
//	}

	
	
	// 명예의 전당 순위
	@Override
	public List<UserVO> ranking() throws Exception {
		mylog.debug(" ranking() 호출 ");
		
		List<UserVO> ranking = sqlSession.selectList(NAMESPACE +".ranking");
		
		return ranking;
	}

	
	
	// 챌린지 목록 (페이징)
	@Override
	public List<ChallengeVO> cList(Criteria cri) throws Exception {
		mylog.debug(" cList(Criteria cri) 호출 ");
		List<ChallengeVO> cList = sqlSession.selectList(NAMESPACE +".cList", cri);
		
		return cList;
	}

	// 챌린지 총 갯수 (페이징)
	@Override
	public Integer cListCount() throws Exception {
		mylog.debug("cListCount() 호출 ");
		Integer cListCount = sqlSession.selectOne(NAMESPACE + ".cListCount");
		
		return cListCount;
	}
	
	
	
	
	
	
	
	
	
	
	
}

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

import com.chagok.domain.AbookVO;
import com.chagok.domain.BoardVO;
import com.chagok.domain.BusinessAccountVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.Criteria;
import com.chagok.domain.MinusVO;
import com.chagok.domain.PlusVO;
import com.chagok.domain.SearchCriteria;
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

	// 챌린지 리스트
	@Override
	public List<ChallengeVO> getChallengeList(Integer cno) {
		mylog.debug(" getChallengeList(Integer cno) 호출");
		
		List<ChallengeVO> challengeList = sqlSession.selectList(NAMESPACE+".getChallengeInfo",cno);
		
		return challengeList;
		
	}
	// 내 챌린지 가져오기
	@Override
	public List<ChallengeVO> getmyChallenge(String nick) {
		mylog.debug(" getmyChallenge(String nick) 호출");
		
		List<ChallengeVO> mychallengeList  = sqlSession.selectList(NAMESPACE+".getmyChallenge", nick);
		
		return mychallengeList;
	}
	
	// 챌린지 신청 취소하기 (챌린지 테이블에 닉네임 잘라주기)
	@Override
	public int cancelChallenge(String nick, Integer cno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nick", nick);
		map.put("cno", cno);
		mylog.debug(" cancelChallenge 호출 닉네임 잘라내기, c_cnt-1 "+map);
		return sqlSession.update(NAMESPACE+".cancelChallenge", map);
	}
	
	// 저축형 챌린지 신청 취소 (플러스테이블에 mno랑 cno 없애주기)
	@Override
	public int cancelPlus(Integer mno, Integer cno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("cno", cno);
		mylog.debug(" cancelPlus(map) 호출 "+map);
		return sqlSession.delete(NAMESPACE+".cancelPlus", map);
	}
	
	// 절약형 챌린지 신청 취소 (마이너스 테이블에 mno랑 cno 없애주기)
	@Override
	public int cancelMinus(Integer mno, Integer cno) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("mno", mno);
		map.put("cno", cno);
		mylog.debug(" cancelMinus(map) 호출"+map);
		return sqlSession.delete(NAMESPACE+".cancelMinus", map);
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
	 
	@Override
	public Integer samechallenge(Map<String, Object> map) {
		mylog.debug("dao : samechallenge 호출");
		return sqlSession.selectOne(NAMESPACE+".samechallenge", map);
	}
	
	
	// 챌린지 등록
	@Override
   public Integer challengeRegist(ChallengeVO vo) throws Exception {
      mylog.debug(" challengeRegist(ChallengeVO vo) 호출 ");
      
      sqlSession.insert(NAMESPACE + ".challengeRegist", vo);
      
      Integer cno = vo.getCno();
      
      mylog.debug(cno + "번 챌린지 등록 완료! ");
      
      return cno;
   }

	
	// 챌린지 목록
	@Override
	public List<ChallengeVO> getChallengeList() throws Exception {
		mylog.debug(" getChallengeList() 호출 ");
		
		List<ChallengeVO> challengeList = sqlSession.selectList(NAMESPACE +".getChallengeList");
		
		return challengeList;
	}

	// 챌린지 참여 인원 조회(checkfeed 용)
	@Override
	public int getCList(Integer cno) throws Exception {
		mylog.debug("getCList(Integer cno) 호출");
		int CList = sqlSession.selectOne(NAMESPACE+".CList",cno);
		mylog.debug(CList+"");
		return CList;
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
		mylog.debug("dao :joinplusInsert(map) 호출");
		sqlSession.insert(NAMESPACE+".joinplusInsert", map);
	}
	// 저축형&절약형 챌린지 참여 - challenge테이블 c_person에 ",닉네임" 업데이트하기
	@Override
	public void joinplusUpdate(Map<String, Object> map) {
		mylog.debug("dao :joinplusUpdate 호출 닉네임 업데이트, c_cnt+1");
		sqlSession.update(NAMESPACE+".joinplusUpdate", map);
	}
	// 절약형 챌린지 참여 - minus테이블에 mno랑 cno insert
	@Override
	public void joinminusInsert(Map<String, Object> map) {
		mylog.debug("dao :joinminusInsert(map) 호출");
		sqlSession.insert(NAMESPACE+".joinminusInsert", map);
	}

	// 명예의 전당 순위
	@Override
	public List<UserVO> ranking() throws Exception {
		mylog.debug(" ranking() 호출 ");
		
		List<UserVO> ranking = sqlSession.selectList(NAMESPACE +".ranking");
		
		return ranking;
	}

	
	
	// 챌린지 목록 (페이징)
	@Override
	public List<ChallengeVO> cListM(SearchCriteria scri) throws Exception {
		mylog.debug(" cLisMt(SearchCriteria scri) 호출 ");
		List<ChallengeVO> cListM = sqlSession.selectList(NAMESPACE +".cListM", scri);
		
		return cListM;
	}

	// 챌린지 총 갯수 (페이징)
	@Override
	public Integer cListCountM(SearchCriteria scri) throws Exception {
		mylog.debug("cListCountM(SearchCriteria scri) 호출 ");
		Integer cListCountM = sqlSession.selectOne(NAMESPACE + ".cListCountM", scri);
		
		return cListCountM;
	}
	
	// 챌린지 목록 (페이징)
	@Override
	public List<ChallengeVO> cList(SearchCriteria scri) throws Exception {
		mylog.debug(" cList(SearchCriteria scri) 호출 ");
		List<ChallengeVO> cList = sqlSession.selectList(NAMESPACE +".cList", scri);
		
		return cList;
	}

	// 챌린지 총 갯수 (페이징)
	@Override
	public Integer cListCount(SearchCriteria scri) throws Exception {
		mylog.debug("cListCount(SearchCriteria scri) 호출 ");
		Integer cListCount = sqlSession.selectOne(NAMESPACE + ".cListCount", scri);
		
		return cListCount;
	}

	// 챌린지 성공여부 (절약형)
	@Override
	public ChallengeVO getMoney(Integer mno) {
		mylog.debug(" getMoney(mno) 호출 ");
		ChallengeVO vo3 = sqlSession.selectOne(NAMESPACE+".getMoney");
		
		return vo3;
	}

	// 가계부 가져오기 
	@Override
	public List<Map<String, Object>> getMinusAbook(Integer mno, Integer cno, Integer ctno) {
		mylog.debug(" getMinusAbook(mno,cno) 호출 ");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("cno", cno);
		map.put("ctno", ctno);
		List<Map<String, Object>> minusAbook = sqlSession.selectList(NAMESPACE+".getMinusAbook",map);
		return minusAbook;
	}
	
	// 가계부 값 연동하기 
	@Override
	public void updateMoney(Integer mno, Integer ab_amount, Integer cno) {
		mylog.debug(" updateMoney("+mno+","+ab_amount+","+cno+") 호출 ");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("ab_amount",ab_amount);
		map.put("cno", cno);
		sqlSession.update(NAMESPACE+".updateMoney", map);
	}

	// 관리자 챌린지 승인
	@Override
	public void confirmChallenge(Integer status, Integer cno) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("c_status", status);
		map.put("cno", cno);
		sqlSession.update(NAMESPACE+".confirmChallenge", map);
		mylog.debug("status : "+status+", cno : "+cno);
	}
	
	// 관리자 모달창 회원mno
	@Override
	public List<UserVO> adminmodal(Map<String, Object> map) throws Exception {
		mylog.debug("daoimpl : 모달창 mno가져가기");
		return sqlSession.selectOne(NAMESPACE+".adminmodal", map);
	}

	// 비즈니스 계좌 송금
	@Override
	public void sendBiz(BusinessAccountVO vo) throws Exception {
		// 가장 최근 추가된 계좌 조회
		BusinessAccountVO tmpvo = sqlSession.selectOne(NAMESPACE+".selectBizOne");
		
		if(tmpvo == null) {
			tmpvo = new BusinessAccountVO();
			tmpvo.setBiz_balance(0);
		}
		
		vo.setBiz_balance(tmpvo.getBiz_balance());
//		vo.setBiz_balance(tmpvo.getBiz_balance()+vo.getBiz_amount());
		// 계좌 업데이트
		sqlSession.insert(NAMESPACE+".sendBiz", vo);
		
	}

	// 비지니스 계좌 송금시 플러스 테이블 업데이트 (pl_sum)
	@Override
	public void updatePlusSum(BusinessAccountVO vo) throws Exception {
		sqlSession.update(NAMESPACE+".updatePlusSum", vo);
	}
	
	// 내 plus 테이블 정보 가져오기
	@Override
	public PlusVO getPlusOne(int mno, int cno) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("cno", cno);
		
		mylog.debug("map : "+map);
		
		
		PlusVO vo = sqlSession.selectOne(NAMESPACE+".getPlusOne", map);
		
		mylog.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ vo : " + vo);
		
		return vo;
	}
	
	@Override
	public List<ChallengeVO> chListAll(Criteria cri) throws Exception {
//	    mylog.debug("chListAll 페이징처리 ");
//	    mylog.debug("cri : "+cri.toString());
	    return sqlSession.selectList(NAMESPACE + ".chListAll", cri);
	}

	@Override
	public Integer chListCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE +".chListCnt");
	}
			
	// ctno 가져오기
	@Override
	public int getCtno(Integer cno) {
		return sqlSession.selectOne(NAMESPACE+".getCtno", cno);
	}

	// 챌린지 성공/실패 여부 가져옴
	@Override
	public List<Map<String, Object>> challengeResultList(Integer cno) throws Exception{
		
		return sqlSession.selectList(NAMESPACE+".challengeResultList", cno);
	}

	@Override
	public Map<String, Object> challengeResult(Integer cno, Integer mno) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("mno", mno);
		
		return sqlSession.selectOne(NAMESPACE+".challengeResult", map);
	}	
	

	// update minus m_sum
	@Override
	public void updateMsum(Map<String, Object> map) throws Exception {
		
		sqlSession.update(NAMESPACE+".updateMsum", map);
	}

	
	
	
	
}
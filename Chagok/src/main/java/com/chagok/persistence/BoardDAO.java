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

public interface BoardDAO {
	
	// 후기글 쓰기
	public void createReview(BoardVO vo);
	
	// 게시판 리스트 조회
	public List<BoardVO> getBoard(Integer b_sort);
	
	// 게시판 글 조회
	public BoardVO getBoardContent(Integer bno);

	// 게시판 글 수정
	public Integer updateBoard(BoardVO vo) throws Exception;

	// 게시판 글 삭제
	public void deleteBoard(Integer bno) throws Exception;
	
	// 게시판 글 작성
	public void insertBoard(BoardVO vo) throws Exception;

	// 게시판 글 + 챌린지
	public Map<String, Object> getBoardChallenge(Integer cno) throws Exception;
	
	// 공지리스트 조회 (페이징처리 cri)
	public List<BoardVO> getNBoardPage(Criteria cri) throws Exception;
	
	// 전체 공지게시판 글 개수 조회
	public int NBoardCount() throws Exception;
			
	// 후기리스트 조회 (페이징처리 cri)
	public List<Map<String, Object>> getRBoardPage(Criteria cri) throws Exception;
		
	// 전체 후기게시판 글 개수 조회
	public int RBoardCount() throws Exception;

	// 자유게시판 조회 (페이징처리 cri)
	public List<BoardVO> getFBoardPage(Criteria cri) throws Exception;
	
	// 전체 자유게시판 글 개수 조회
	public int FBoardCount() throws Exception;
		
	// 경제게시판 조회 (페이징처리 cri)
	public List<BoardVO> getEBoardPage(Criteria cri) throws Exception;
		
	// 경제 자유게시판 글 개수 조회
	public int EBoardCount() throws Exception;	
	
	// 내가 쓴 글 보기
	public List<BoardVO> getMyBoardWrite(String nick) throws Exception;
	
	// 내가 쓴 글 개수 조회
	public int MyBoardWriteCnt() throws Exception;
	
	// 댓글 조회
	
	// 모든 게시판 글 조회(종류불문)
	public List<BoardVO> getAllboardList(Criteria cri) throws Exception;
	

}
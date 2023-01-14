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

public interface BoardService {
	
	// 후기글 작성
	public void createReview(BoardVO vo);
	
	// 게시판 리스트
	public List<BoardVO> getBoardList(Integer b_sort);
	
	// 게시판 글 확인
	public BoardVO getBoardContent(Integer bno);

	// 게시판 글 수정
	public Integer updateBoard(BoardVO vo) throws Exception;
	
	// 게시판 글 삭제
	public void deleteBoard(Integer bno) throws Exception;
	
	// 게시판 글 작성
	public void insertBoard(BoardVO vo) throws Exception;
	
	// 게시판 + 챌린지 리스트
	public Map<String, Object> getBoardChallenge(Integer cno) throws Exception;

	// 공지글 정보 조회(페이징처리 cri)
	public List<BoardVO> getNBoardPage(Criteria cri) throws Exception;
		
	// 전체 공지 게시판 글 개수 조회
	public int NboardCount() throws Exception;
	
	// 후기글 정보 조회(페이징처리 cri)
	public List<Map<String, Object>> getRBoardPage(Criteria cri) throws Exception;
		
	// 전체 후기 게시판 글 개수 조회
	public int RboardCount() throws Exception;	
	
	// 자유게시판 정보 조회(페이징처리 cri)
	public List<BoardVO> getFBoardPage(Criteria cri) throws Exception;
		
	// 전체 자유 게시판 글 개수 조회
	public int FboardCount() throws Exception;
	
	// 자유게시판 경제 조회(페이징처리 cri)
	public List<BoardVO> getEBoardPage(Criteria cri) throws Exception;
	
	// 전체 경제 게시판 글 개수 조회
	public int EboardCount() throws Exception;	
}


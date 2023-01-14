package com.chagok.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chagok.domain.BoardVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.Criteria;
import com.chagok.domain.PageMaker;
import com.chagok.domain.SearchCriteria;
import com.chagok.domain.SysLogVO;
import com.chagok.domain.UserVO;
import com.chagok.service.ChallengeService;
import com.chagok.service.UserService;

@Controller
public class BoardController {
	
	private static final Logger mylog = LoggerFactory.getLogger(ChagokController.class);
	
	@Inject
	private ChallengeService service;
	
	@Inject
	private UserService uservice;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// =================================================================================
	// 후기글 리스트 (b_sort=1)
	// http://localhost:8080/reviewboard
	@GetMapping(value = "/reviewboard")
	public String reviewboardGET(HttpSession session,Model model,Criteria cri) throws Exception {
		mylog.debug(" /reviewboard 호출");
	
		List<Map<String, Object>> boardList2 = service.getRBoardPage(cri);	
		
		mylog.debug(boardList2+"");
			
		// 페이징 처리
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(10);
		pageMaker.setDisplayPageNum(10);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.RboardCount());
		mylog.debug("@@@@@@@@@@@@@@@@");
		mylog.debug("totalCnt : "+service.RboardCount());
		model.addAttribute("pageMaker", pageMaker);
					
		model.addAttribute("boardList2", boardList2);
		
		return "/community/reviewboard";
	}

	// 후기글 작성 GET
	// http://localhost:8080/review?cno=1
	@GetMapping(value = "/review")
	public String reviewGET(@RequestParam("cno") int cno, Model model, HttpSession session) throws Exception {
	
		mylog.debug(cno + "reviewGET 호출");
		ChallengeVO vo2 = service.getCt_top(cno);
		
		model.addAttribute("review", service.getChallengeInfo(cno));
		model.addAttribute("vo2", vo2);
		model.addAttribute("c_end", service.getChallengeEndDate(cno));

		return "/community/review";
	}
	
	// 후기글 작성 POST
	@PostMapping(value = "/review")
	public String reviewPOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
		mylog.debug(" reviewPOST 호출");

		mylog.debug(vo + "");

		service.createReview(vo);

		mylog.debug("게시판 글쓰기 완료");

		rttr.addFlashAttribute("result", "createOK");

		return "redirect:/reviewboard";
	}
	
	
	// 후기 글 수정 GET
	// http://localhost:8080/challenge/reviewupdate?bno=4
	@GetMapping(value= "/reviewupdate")
	public String reviewupdateGET(@RequestParam("bno") int bno, Model model, HttpSession session,Integer cno) throws Exception{
					
		mylog.debug(" reviewupdateGET 호출");
			
		mylog.debug(bno+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		Map<String, Object> boardChallenge = service.getBoardChallenge(bno);
		
		Integer Success = service.getSuccess(cno);
		ChallengeVO vo2 = service.getCt_top(cno);
		
		model.addAttribute("review", service.getChallengeInfo(cno));
		model.addAttribute("Success",Success);
		model.addAttribute("vo2", vo2);
		model.addAttribute("c_end", service.getChallengeEndDate(cno));
		
		model.addAttribute("boardChallenge", boardChallenge);
		mylog.debug("여기까진 출력되나?");
		
		return "/community/reviewupdate";
					
	}
				
	// 후기 글 수정 POST
	@PostMapping(value = "/reviewupdate")
	public String reviewupdatePOST(BoardVO vo,RedirectAttributes rttr,HttpSession session) throws Exception{
			
		mylog.debug("reviewupdatePOST 호출");
		mylog.debug(vo+"");
			
			
		Integer result = service.updateBoard(vo);
					
		if(result > 0) {
				
			rttr.addFlashAttribute("result", "modOK");
						
		}
							
		return "redirect:/reviewboard";
							
	}
		
	// 후기 글 삭제하기
	// http://localhost:8080/reviewremove?bno=4
	@PostMapping(value = "/reviewremove")
	public String reviewremovePOST(int bno,RedirectAttributes rttr) throws Exception{
		mylog.debug(bno+"");
					
		service.deleteBoard(bno);
					
		rttr.addFlashAttribute("result", "delOK");
					
		return "redirect:/reviewboard";
					
	}
	
	// 후기글 상세
	// http://localhost:8080/reviewcontent?bno=1
	@GetMapping(value = "/reviewcontent")
	public String reviewcontentGET(HttpSession session,Model model,@RequestParam("cno") int cno,Integer bno) throws Exception {
		mylog.debug("reviewcontent 호출");	
		Map<String, Object> boardChallenge = service.getBoardChallenge(bno);
		Integer Success = service.getSuccess(cno);

		ChallengeVO vo = service.getChallengeInfo(cno);
		
		List<ChallengeVO> challengeList = service.getChallengeList(cno);
		int CList = service.getCList(cno);
		ChallengeVO vo2 = service.getCt_top(cno);
		List<Map<String, Object>> result = service.getResult(cno);
		
		model.addAttribute("vo", vo);
		model.addAttribute("challengeList", challengeList);
		model.addAttribute("c_end", service.getChallengeEndDate(cno));
		model.addAttribute("user", uservice.getUser(vo.getMno())); 
		model.addAttribute("CList",CList);
		model.addAttribute("vo2", vo2);
		model.addAttribute("result", result);
		model.addAttribute("boardChallenge", boardChallenge);
		model.addAttribute("Success", Success);
		
		mylog.debug(boardChallenge+" boardChallenge + @@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		
		return "/community/reviewcontent";
	}
	// =================================================================================
	
	// =================================================================================
	// 공지 글 리스트 (b_sort=2)
	// http://localhost:8080/notice
	@GetMapping(value = "/notice")
	public String noticeGET(Model model,HttpSession session,Criteria cri) throws Exception {
			
		List<BoardVO> boardList2 = service.getNBoardPage(cri);
		mylog.debug(boardList2+"");
			
		
		// 페이징 처리
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(10);
		pageMaker.setDisplayPageNum(10);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.NboardCount());
		mylog.debug(pageMaker+"@@@@@@@@@@@@@@@@");
		mylog.debug("totalCnt : "+service.NboardCount());
		model.addAttribute("pageMaker", pageMaker);
			
		model.addAttribute("boardList2", boardList2);

		return "/community/notice";
	}
	
	// 공지 글 상세
	// http://localhost:8080/noticecontent?bno=4
	@GetMapping(value = "/noticecontent")
	public String noticecontentGET(HttpSession session,Model model,@RequestParam("bno") int bno) throws Exception {
			
		BoardVO vo = service.getBoardContent(bno);
		
		String nick = (String)session.getAttribute("nick");
		
		if(nick == "admin") {
			BoardVO vo2 = service.getBoardContent(bno);
			model.addAttribute("vo2", vo2);
			mylog.debug(vo2+"");
		}
		
		model.addAttribute("vo",vo);
			
		return "/community/noticecontent";
	}
	// 공지 글 작성하기
	// http://localhost:8080/noticewrite
	@GetMapping(value = "/noticewrite")
	public String noticewriteGET(Model model, HttpSession session,HttpServletRequest request) throws Exception {
		
		mylog.debug(" noticewriteGET 호출");
		
		
		
		return "/community/noticewrite";
			
	}
		
	// 공지글 작성하기 (post)
	@PostMapping(value = "/noticewrite")
	public String registPOST(BoardVO vo, RedirectAttributes rttr,HttpSession session) throws Exception {
			
		mylog.debug(" noticewriteGET -> noticewritePOST 호출 ");
			
		mylog.debug(vo+"");
			
		service.insertBoard(vo);
			mylog.debug("@@@@@@@@@@@@@@");
		rttr.addFlashAttribute("result", "createOK");
			mylog.debug("!!!!!!!!!!!");
		return "redirect:/notice";
	}	
	
	// 공지 글 수정하기 GET
	// http://localhost:8080/noticeupdate?bno=4
	@GetMapping(value = "/noticeupdate")
	public String noticeupdateGET(@RequestParam("bno") int bno, Model model, HttpSession session) throws Exception{
		mylog.debug("noticeupdate GET 호출");
			
		mylog.debug(bno+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			
		model.addAttribute("board", service.getBoardContent(bno));
		
		return "/community/noticeupdate";
			
	}
		
	// 공지 글 수정하기 POST
	@PostMapping(value = "/noticeupdate")
	public String noticeupdatePOST(BoardVO vo,RedirectAttributes rttr,HttpSession session) throws Exception {
		mylog.debug("noticeupdate POST 호출");
		
		mylog.debug(vo+"수정하기 post 호출");
					
		Integer result = service.updateBoard(vo);
					
		if(result > 0) {
				
		rttr.addFlashAttribute("result", "modOK");
						
		}
							
		return "redirect:/notice";
			
	}
	
	// 공지 글 삭제하기
	// http://localhost:8080/noticedelete
	@PostMapping(value = "/noticedelete")
	public String noticedeleteGET(int bno,RedirectAttributes rttr,HttpSession session) throws Exception {
		mylog.debug(bno+"");
			
		service.deleteBoard(bno);
					
		rttr.addFlashAttribute("result", "delOK");
					
		return "redirect:/notice";
	}
	
	// =================================================================================
	
	// =================================================================================
	// 자유 게시판 (b_sort = 3)
	//  http://localhost:8080/freeboard
	@GetMapping(value = "/freeboard")
	public String FreeBoardGET(HttpSession session,Model model,Criteria cri) throws Exception {
		mylog.debug(" /freeboard 호출");
			
		List<BoardVO> boardList = service.getFBoardPage(cri);	
		
		mylog.debug(boardList+"");
			
		model.addAttribute("boardList", boardList);
		
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(10);
		pageMaker.setDisplayPageNum(10);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.RboardCount());
		mylog.debug("@@@@@@@@@@@@@@@@");
		mylog.debug("totalCnt : "+service.RboardCount());
		model.addAttribute("pageMaker", pageMaker);
			
		return "/community/freeboard";
	}
	
	// 자유게시판 글 작성 GET
	// http://localhost:8080/freeboardwrite
	@GetMapping(value = "/freeboardwrite")
	public String freeboardwriteGET(HttpSession session,Model model) throws Exception {
		
		mylog.debug(" freeboardwriteGET 호출");
		
		return "/community/freeboardwrite";
	}
	
	// 자유게시판 글 작성 POST
	@PostMapping(value = "/freeboardwrite")
	public String freeboardwritePOST(BoardVO vo, RedirectAttributes rttr,HttpSession session) throws Exception {
		mylog.debug(" freeboardwritePOST 호출");

		mylog.debug(vo + "");

		service.createReview(vo);

		mylog.debug("자유게시판 글쓰기 완료");

		rttr.addFlashAttribute("result", "createOK");

		return "redirect:/freeboard";
	}
	
	// 자유 게시판 글 수정하기 GET
	// http://localhost:8080/freeboardupdate?bno=4
	@GetMapping(value = "/freeboardupdate")
	public String freeboardupdateGET(@RequestParam("bno") int bno, Model model, HttpSession session) throws Exception{
		mylog.debug(" freeboardupdateGET 호출");
				
		mylog.debug(bno+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		BoardVO board = service.getBoardContent(bno);
				
		mylog.debug(board+"");
				
		model.addAttribute("board", board);
			
		return "/community/freeboardupdate";
				
	}
			
	// 자유 게시판 글 수정하기 POST
	@PostMapping(value = "/freeboardupdate")
	public String freeboardupdatePOST(BoardVO vo,RedirectAttributes rttr,HttpSession session) throws Exception {
		mylog.debug(" freeboardupdatePOST 호출 ");
		
		mylog.debug(vo+"");
				
				
		Integer result = service.updateBoard(vo);
						
		if(result > 0) {
					
		rttr.addFlashAttribute("result", "modOK");
							
		}
								
		return "redirect:/freeboard";
				
	}
	
	// 자유 게시판 삭제
	@GetMapping(value = "/freedelete")
	public String freedeleteGET(int bno,RedirectAttributes rttr,HttpSession session) throws Exception {
		mylog.debug(bno+"");
		
		service.deleteBoard(bno);
				
		rttr.addFlashAttribute("result", "delOK");
				
		return "redirect:/freeboard";
	}
	// =================================================================================
	
	// =================================================================================
	// http://localhost:8080/economy
	// 경제 게시판 보드
	@GetMapping(value = "/economy")
	public String EconomyGET(HttpSession session,Model model,Criteria cri) throws Exception {
		mylog.debug(" /economy 호출");
			
		List<BoardVO> boardList = service.getEBoardPage(cri);	
		
		mylog.debug(boardList+"");
			
		model.addAttribute("boardList", boardList);
		
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(10);
		pageMaker.setDisplayPageNum(10);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.EboardCount());
		mylog.debug(pageMaker+"@@@@@@@@@@@@@@@@ economy");
		mylog.debug("totalCnt : "+service.EboardCount());
		model.addAttribute("pageMaker", pageMaker);
			
		return "/community/economy";
	}
	
	// 경제 글 작성하기
	// http://localhost:8080/economywrite
	@GetMapping(value = "/economywrite")
	public String economywriteGET(Model model, HttpSession session,HttpServletRequest request) throws Exception {
			
		mylog.debug(" economywriteGET 호출");
			
			
			
		return "/community/economywrite";
				
	}
			
	// 경제 글 작성하기 (post)
	@PostMapping(value = "/economywrite")
	public String economywritePOST(BoardVO vo, RedirectAttributes rttr,HttpSession session) throws Exception {
				
		mylog.debug(" economywritePOST 호출 ");
				
		mylog.debug(vo+"");
				
		service.insertBoard(vo);
			mylog.debug("@@@@@@@@@@@@@@ economyPost");
		rttr.addFlashAttribute("result", "createOK");
			mylog.debug("!!!!!!!!!!!");
		return "redirect:/economy";
	}	
	
	// 경제 글 상세
	// http://localhost:8080/economycontent
	@GetMapping(value = "/economycontent")
	public String economycontentGET(HttpSession session,Model model,@RequestParam("bno") int bno,Integer cno) throws Exception {
				
		BoardVO vo = service.getBoardContent(bno);
		
		model.addAttribute("vo",vo);
		
			
		return "/community/economycontent";
	}	
	
	// 경제 게시판 글 수정하기 GET
	// http://localhost:8080/economyupdate?bno=33
	@GetMapping(value = "/economyupdate")
	public String economyupdateGET(@RequestParam("bno") int bno, Model model, HttpSession session) throws Exception{
		mylog.debug(" economyupdateGET 호출");
					
		mylog.debug(bno+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ economyupdateGET");
		BoardVO vo = service.getBoardContent(bno);
					
		mylog.debug(vo+"");
					
		model.addAttribute("vo", vo);
		mylog.debug("post 갈준비됐니?");
		return "/community/economyupdate";
					
	}
				
	// 경제 게시판 글 수정하기 POST
	@PostMapping(value = "/economyupdate")
	public String economyupdatePOST(BoardVO vo,RedirectAttributes rttr,HttpSession session) throws Exception {
		mylog.debug(" economyupdatePOST 호출 ");
			
		mylog.debug(vo+"");
					
					
		Integer result = service.updateBoard(vo);
							
		if(result > 0) {
						
		rttr.addFlashAttribute("result", "modOK");
								
		}
									
		return "redirect:/economy";
					
	}
		
	// 경제 게시판 삭제
	@PostMapping(value = "/economydelete")
	public String economydeleteGET(int bno,RedirectAttributes rttr,HttpSession session) throws Exception {
		mylog.debug(bno+"");
			
		service.deleteBoard(bno);
					
		rttr.addFlashAttribute("result", "delOK");
					
		return "redirect:/economy";
	}	
}

package com.chagok.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;
import java.util.Map;
import java.util.Spliterator;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.chagok.domain.ChallengeVO;
import com.chagok.domain.Criteria;
import com.chagok.domain.PageMaker;
import com.chagok.domain.SearchCriteria;
import com.chagok.domain.UserVO;
import com.chagok.interceptor.SessionNames;
import com.chagok.service.ChallengeService;
import com.chagok.service.UserService;

@Controller
public class ChagokController implements SessionNames {
		
	private static final Logger mylog = LoggerFactory.getLogger(ChagokController.class);
	
	@Inject
	private UserService service;
	
	@Inject
	private ChallengeService service2;
	
	
	// 차곡 메인사이트 
	// http://localhost:8080/main
	@GetMapping(value = "/main")
	public String mainGET() {

		return "/chagok/main";
	}

	
	// 자산관리 파트 메인
	// http://localhost:8080/assetmain
	@GetMapping(value = "/assetmain")
	public String assetmainGET() throws Exception {

		return "/chagok/assetmain";
	}

	// 챌린지 목록 불러오기 (커뮤메인)
	// http://localhost:8080/commumain
	@GetMapping(value="/commumain")
	public String getChallengeList(Model model, Criteria cri, @ModelAttribute("result") String result, SearchCriteria scri) throws Exception {
		mylog.debug(" /commumain 호출 ");
		
		// 전달받은 정보 x
		mylog.debug(" 전달정보 : "+result);
		
		// 서비스 -> DAO 게시판 리스트 가져오기
		List<ChallengeVO> challengeList = service2.getChallengeList();
		List<UserVO> ranking = service2.ranking();
		List<ChallengeVO> cList = service2.cList(scri);
		
		// 연결되어 있는 뷰페이지로 정보 전달 (Model 객체)
		model.addAttribute("challengeList", challengeList);
		model.addAttribute("ranking", ranking);
		model.addAttribute("cList", cList);
		
		// 페이징 처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service2.cListCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/chagok/commumain";
	}
	
	// http://localhost:8080/login
	@GetMapping(value = "/login")
	public String loginGET(HttpServletRequest request) throws Exception {
		mylog.debug("login GET 호출 ");
		
		return "/chagok/login";
	}

	@PostMapping(value = "/login")
	public String loginPOST(@RequestBody Map<String, String> loginMap, HttpServletRequest request, HttpServletResponse response, UserVO UserVO, Model model) throws Exception {
		mylog.debug(" loginPOST() 호출");
		HttpSession session = request.getSession();

		mylog.debug(" 로그인 정보 : " +loginMap);
		
		try {
			UserVO =  service.loginUserCheck(loginMap);
			mylog.debug("controller : "+UserVO);
			
			if (UserVO != null) { // 로그인 성공
				model.addAttribute("UserVO", UserVO);
				mylog.debug("Controller_model : "+model);
				mylog.debug("Controller_model : "+UserVO);
				
				session.setAttribute("mno", UserVO.getMno());
				session.setAttribute("nick", UserVO.getNick());
				
			}else {
				model.addAttribute("loginResult", "Login Fail!");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "chagok/main";
//		// 세션 유지시간 30분
//		session.setMaxInactiveInterval(60*30);
//
//		if(UserVO != null) {
//			session.setAttribute("mno", UserVO.getMno());
//			session.setAttribute("nick", UserVO.getNick());
//			
//			return UserVO;
//		} else {
//			
//			return 0;
//		}
	}
	
	@PostMapping(value = "/loginCK")
	public @ResponseBody Object loginCK(@RequestBody Map<String, String> loginMap, UserVO userVO) throws Exception {
		mylog.debug(" loginCK() 호출");
		
		userVO =  service.loginUserCheck(loginMap);
		
		return userVO;
	}

	 // http://localhost:8080/register
	 @GetMapping(value = "/register")
	 public String registerGET() throws Exception {
		 mylog.info("/chagok/registerForm -> 정보입력창(view) 이동");
		 return "/chagok/register";
	 }
		
	 @PostMapping(value = "/register")
	 public String registerPOST(UserVO vo) throws Exception {
		 mylog.info("/chagok/registerPro -> DB 정보저장");
		
		 // 전달정보저장
		 mylog.info(vo.toString());
		 service.userJoin(vo);
		
		 return "redirect:/login";
	 }
		
	 @PostMapping("/checkId")
	 @ResponseBody
	 public String checkId(@RequestBody String id) throws Exception {	// 받을 데이터타입이 텍스트라 스트링으로함 반드시 리퀘스트바디를 붙힐것! ajax 통신시
		 mylog.debug("/user/checkId : post");
		 mylog.debug("param : " + id );
		
		 int checkNum = service.checkId(id);
		 System.out.println("checkNum : " + checkNum );
		 if(checkNum != 0) {
		 	 mylog.debug("아이디 중복");
			 return "duplicated";
			
		 }else {
			 mylog.debug("아이디 사용 가능");
			 return "available";
		 }
	 }
	
	 @PostMapping("/checkNick")
	 @ResponseBody
	 public String checkNick(@RequestBody String nick) throws Exception {	// 받을 데이터타입이 텍스트라 스트링으로함 반드시 리퀘스트바디를 붙힐것! ajax 통신시
		 mylog.debug("/user/checkNick : post");
		 mylog.debug("param : " + nick );
		
		 int checkNum = service.checkNick(nick);
		 mylog.debug("checkNum : " + checkNum );
		
		 if(checkNum != 0) {
			 mylog.debug("닉네임 중복");
			 return "duplicated";
			
		 }else {
			 mylog.debug("닉네임 사용 가능");
			 return "available";
		 }
	 }
	 
	 @GetMapping(value = "/logout")
	 public String logoutMain(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		 
		 mylog.debug("logout(session)");
		 session.removeAttribute(SessionNames.LOGIN);
		 session.invalidate();
		 
		 // Spring에 담기 쿠키를 가져옴(WebUtils)
		 Cookie loginCookie = WebUtils.getCookie(request, SessionNames.LOGIN);
		 if(loginCookie != null) {
			 loginCookie.setMaxAge(0); // 만료시킴
			 
			 response.addCookie(loginCookie);
		 }
		 return "redirect:/main";
	 }
	 
	 // 가계부 가져오기 (연동) - 수지 
	 @RequestMapping(value="/abookList")
		public String getAbookList() throws Exception{
			mylog.debug(" /abookList -> 연결된 뷰 abookList.jsp -> 데이터 생성 -> ChallengeController ");
			
			return "/asset/abookList";
		}
	
	 
	// http://localhost:8080/challenge/detail?cno=1
   @GetMapping(value = "/challenge/detail")
   public String getChoseChallenge(Integer cno) {
      ChallengeVO vo = service2.getChallengeInfo(cno);
      int sort = vo.getC_sort();
      
      if(sort == 0) {
         mylog.debug("저축형 챌린지로 이동");
         return "redirect:/challenge/plusdetail?cno="+cno;
      }else {
         mylog.debug("절약형 챌린지로 이동");
         return "redirect:/challenge/minusdetail?cno="+cno;
      }
   }
   
   @GetMapping("/accessError")
   public String accessDenied(Authentication auth, Model model) throws Exception {
//	   mylog.debug("access Denied : " + auth);
//	   mylog.debug("접근 아이디 : " + auth.getName());
//	   mylog.debug("접근자 권한 : " +auth.getAuthorities());
	   
	   model.addAttribute("msg", "접근 권한이 없는 페이지입니다.");
	   
	   return "/chagok/accessError";
			   
   }
   
	
}

package com.chagok.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.chagok.apiDomain.AccountVO;
import com.chagok.apiDomain.CardHistoryVO;
import com.chagok.apiDomain.CardInfoVO;
import com.chagok.apiDomain.CashVO;
import com.chagok.domain.AlertVO;
import com.chagok.domain.BoardVO;
import com.chagok.domain.BusinessAccountVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.Criteria;
import com.chagok.domain.PageMaker;
import com.chagok.domain.SearchCriteria;
import com.chagok.domain.UserVO;
import com.chagok.interceptor.SessionNames;
import com.chagok.service.AbookService;
import com.chagok.service.AccountService;
import com.chagok.service.AlertService;
//import com.chagok.service.AlertService;
import com.chagok.service.ChallengeService;
import com.chagok.service.ReportService;
import com.chagok.service.UserService;
import com.chagok.utils.UploadFileUtils;

@Controller
public class ChagokController {
		
	private static final Logger mylog = LoggerFactory.getLogger(ChagokController.class);
	
	@Inject
	private UserService service;
	
	@Inject
	private ChallengeService service2;
	
	@Inject
	private AlertService alertService;
	
	@Inject
	private AccountService accountService; 
	
	@Inject
	private AbookService abService;
	
	@Inject
	private ReportService rptService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 차곡 메인사이트 
	// http://localhost:8080/main
	@GetMapping(value = "/main")
	public String mainGET() {

		return "/chagok/main";
	}

	
	// 자산관리 파트 메인
	// http://localhost:8080/assetmain
	@GetMapping(value="/assetmain")
	public String assetmain(HttpSession session, Model model) throws Exception {
		Integer mno = (Integer)session.getAttribute("mno");
		if (mno==null) {
			model.addAttribute("chkLogin", "loginN");
			return "/chagok/assetmain";
		} else {
			Integer mm = 0;
			mylog.debug("@@@@mno"+mno);
			UserVO userVO = service.getUser(mno);
			Map<String, Object> map = new HashMap<String, Object>();
			model.addAttribute("result", "loginY");
			
			int chkAb = abService.chkAb(mno, mm);
			if(chkAb==0) {
				model.addAttribute("chkAb", "abN");
			}
			
			else {
				model.addAttribute("chkAb", "abY");
				Integer dtSum = rptService.dtSum(mno, mm);
				Integer dtAvg = rptService.dtAvg(mno, mm);
				Integer expSum = rptService.expSum(mno, mm);
				List<Map<String, Object>> cateCntList = rptService.cateCnt(mno, mm);
				List<Map<String, Object>> cateSumList = rptService.cateSum(mno, mm);
				
				String cateCntjson = rptService.listMapToJson(cateCntList);
				String cateSumjson = rptService.listMapToJson(cateSumList);
				
				map.put("cateCntjson", cateCntjson);
				map.put("cateSumjson", cateSumjson);
				map.put("dtSum", dtSum);
				map.put("dtAvg", dtAvg);
				map.put("expSum", expSum);
				model.addAttribute("map", map);
			}
		
			// 예산
			String pMonth = abService.getPMonth(mm);
			int chkBud = abService.chkBud(mno, pMonth);
			if(chkBud==0) {
				model.addAttribute("chkBud", "budN");
			}
			else {
				model.addAttribute("chkBud", "budY");
				Integer totalBud = abService.totalBud(mno, pMonth);
				Integer dtSum2 = rptService.dtSum(mno, mm);
				
				map.put("totalBud", totalBud);
				map.put("dtSum2", dtSum2);
				model.addAttribute("pMonth", pMonth);
			}
			
			// 현재 년월
			LocalDate now = LocalDate.now();
			String now_date = now.format(DateTimeFormatter.ofPattern("yyyyMM"));
			model.addAttribute("now_date", now_date);
			
			// 계좌 리스트 조회
			List<AccountVO> accountList = accountService.getAccountInfo(mno);
			model.addAttribute("accountList", accountList);
			mylog.debug("accountList : "+accountList.toString());
			// 카드 리스트 조회
			List<CardInfoVO> cardList = accountService.getCardInfo(userVO.getUser_seq_no());
			model.addAttribute("cardList", cardList);
			mylog.debug("cardList : "+cardList.toString());
			
			// 카드 내역/금액 조회
			List<List<CardHistoryVO>> cardHistoryList = accountService.getCardHistory(cardList);
			model.addAttribute("cardHistoryList", cardHistoryList);
			mylog.debug("cardHistoryList : "+cardHistoryList.toString());
			
			// 현금 내역 조회
			CashVO cashVO = accountService.getCashInfo(mno);
			if (cashVO != null) {
				cashVO.setCash_amt(cashVO.getCash_amt().replaceAll(",", ""));
				mylog.debug("cashVO : "+cashVO.toString());
			}
			model.addAttribute("cashVO", cashVO);
			model.addAttribute("userVO", userVO);
		
			return "/chagok/assetmain";
		
		}
	}	

	
//	// 챌린지 상태 업데이트
//	public void ingChallenge() throws Exception {
//		
//		List<ChallengeVO> st =  service2.getChallengeList();
//		Map<String, Object> result = new HashMap<String, Object>();
//		
//		Date now = new Date();
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//		String formatedNow = formatter.format(now);
//		
//		for(int i=0; i<st.size(); i++) {
//			String start = st.get(i).getC_start(); 
//			
//			Integer cno = st.get(i).getCno(); 
//			Date endDate = service2.getChallengeEndDate(cno);
//			
//			int a = start.compareTo(formatedNow);
//			int b = endDate.compareTo(now);
//			Integer status = st.get(i).getC_status();
//			
//			if(a<0) {
//				status = 2;				
//				if(st.get(i).getC_min() == 2) {
//					status = 5;
//				}
//			}
//			
//			if(b<0) {
//				status = 7;
//			}
//			
//			service2.confirmChallenge(status, cno);
//		}
//	}


	// 챌린지 목록 불러오기 (커뮤메인)
	// http://localhost:8080/commumain
	@GetMapping(value="/commumain")
	public String getChallengeList(Model model, HttpSession session, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		mylog.debug(" /commumain 호출 ");
				
		List<ChallengeVO> challengeList = service2.getChallengeList();
		List<UserVO> ranking = service2.ranking();
//		List<ChallengeVO> cList = service2.cList(scri);
//		ingChallenge();
		
		model.addAttribute("challengeList", challengeList);
		model.addAttribute("ranking", ranking);
//		model.addAttribute("cList", cList);
		model.addAttribute("cList", service2.cList(scri));
		
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
	@ResponseBody
	public String loginPOST(@RequestBody Map<String, String> loginMap, HttpServletRequest request, HttpServletResponse response, UserVO UserVO, Model model) throws Exception {
		mylog.debug(" loginPOST() 호출");
		HttpSession session = request.getSession();

		mylog.debug(" 로그인 정보 : " +loginMap);
		
		ServletContext appliation = request.getSession().getServletContext();
	    
		
		try {
			UserVO =  service.loginUserCheck(loginMap);
			mylog.debug("controller : "+UserVO);
			
			appliation.setAttribute("userInfo", UserVO.getMno());
			
			if (UserVO != null) { // 로그인 성공
				model.addAttribute("UserVO", UserVO);
				mylog.debug("Controller_model : "+model);
				mylog.debug("Controller_model : "+UserVO);
				
				session.setAttribute("mno", UserVO.getMno());
				session.setAttribute("nick", UserVO.getNick());
				session.setAttribute("uprofile", UserVO.getProfile());
				
				return "success";
			} 

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "0";
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
//	 @RequestMapping(value="/abookList")
//		public String getAbookList() throws Exception{
//			mylog.debug(" /abookList -> 연결된 뷰 abookList.jsp -> 데이터 생성 -> ChallengeController ");
//			
//			return "/asset/abookList";
//		}
	
	 
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
   
   @PostMapping(value = "/alert")
   @ResponseBody
   public void alert(@RequestBody Map<String, Object> map, AlertVO alertVO) throws Exception {
	   mylog.debug(" 알림기능 ajax 호출");
	   alertVO.setCno(Integer.parseInt(map.get("type").toString()));
	   alertVO.setA_content(map.get("content").toString());
	   alertVO.setA_receive(Integer.parseInt(map.get("target").toString()));
	   
	   alertService.alert(alertVO);
	   
   }
   
   // http://localhost:8080/adminUser
   
   ////////////// ym 마이페이지 구현중 ////////////// 
   @GetMapping("/myPage")
   public String myPageGET(HttpSession session, Model model) throws Exception{
	   
	   if (session.getAttribute("mno") != null) {
		   int mno = (int)session.getAttribute("mno");
		   
		   UserVO userVO = service.getUser(mno);
		   model.addAttribute("userVO", userVO);
	   }
	   
	   return "/chagok/myPage";
   }
   
   // 마이페이지 수정폼
   @GetMapping("/myPageUpdate")
   public String myPageUpdateGET(HttpSession session, Model model) throws Exception{
	   
	   if (session.getAttribute("mno") != null) {	
		   int mno = (int)session.getAttribute("mno");
		   
		   UserVO userVO = service.getUser(mno);
		   model.addAttribute("userVO", userVO);
	   }
	   
	   return "/chagok/myPageUpdate";
   }
   
   // 마이페이지 수정
   @PostMapping("/myPageUpdate")
   public String myPageUpdatePOST(HttpSession session, Model model, UserVO vo, MultipartFile file) throws Exception{
	   
	   mylog.debug(" myPageUpdatePOST 호출 ");
	   mylog.debug("file : " + file);
	   mylog.debug("vo : "+vo);
	   
	   // 사진등록
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file != null) {
		   fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		   
		} else {
		   fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		vo.setProfile(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

	   service.updateUserInfo(vo);		
		
		mylog.debug("new vo : " + vo);
		
	   return "redirect:/myPage";
   }
   
   // 내가 쓴 글 ( 브랜치 합치고 구현 )
   @GetMapping("/myBoardWrite")
   public String myBoardGET(HttpSession session, Model model,Criteria cri) throws Exception {
	   String nick = (String)session.getAttribute("nick");
	    
	    mylog.debug(nick+"닉네임뜨는거냐");
	  
//		   List<BoardVO> boardList = service2.getMyBoardWrite(cri);
	  
//		   List<BoardVO> boardList = service2.getMyBoardWrite(cri,nick);
		   List<BoardVO> boardList = service2.getMyBoardWrite(nick);
		   mylog.debug(boardList+"@@@@@@@@@@@@@@@@@@@@");
		   
		   model.addAttribute("boardList", boardList);
		   
		    PageMaker pageMaker = new PageMaker();
			cri.setPerPageNum(10);
			pageMaker.setDisplayPageNum(10);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service2.MyBoardWriteCnt());
			model.addAttribute("pageMaker", pageMaker);
	   
	 
	   return "/chagok/myBoardWrite";
   }
   
   // 회원 탈퇴
   @GetMapping("/unregist")
   public String unregistGET(HttpSession session, Model model) throws Exception{
	   if (session.getAttribute("mno") != null) {
		   
		   int mno = (int)session.getAttribute("mno");
		   
		   UserVO userVO = service.getUser(mno);
		   model.addAttribute("userVO", userVO);
	   }
	   
	   return "/chagok/unregist";
   }
   
   // ajax (비밀번호 체크)
   @PostMapping(value = "/checkPW", produces = "application/text; charset=UTF-8")
   @ResponseBody
   public String checkPW(@RequestParam Map<String, String> map, HttpServletResponse response) {
	   String result = "";
	   
	   mylog.debug(map+"");
	   
	   if ( map.get("pw").equals(map.get("pw2"))) {
		   result = "1";
	   } else {
		   result = "2";
	   }
	   
	   response.setCharacterEncoding("UTF-8");
	   
	   return result;
   }
   
   @PostMapping(value = "/unregist")
   public String unregistPOST(HttpSession session, Model model, UserVO vo, RedirectAttributes rttr) throws Exception{
	   
	   mylog.debug("vo : " + vo);
	   
	   int result = service.unregistUser(vo);
	   
	   String deleteOK = "";
	   
	   if (result == 1) { // 삭제 성공
		   deleteOK = "OK";
		   session.invalidate();
		   
		   return "redirect:/main";
	   } else { // 삭제 실패
		   deleteOK = "NO";
	   }
	   
	   rttr.addFlashAttribute("deleteOK", deleteOK);
	   
	   return "redirect:/unregist";
   }

   
   
	////////////////////// 관리자 페이지 ///////////////////////////

	// 관리자 챌린지 승인
	// http://localhost:8080/chManagement
	@GetMapping("/chManagement")
	public String chManagement(Criteria cri, Model model) throws Exception {
		mylog.debug("/chManagement 호출");
		
		List<ChallengeVO> chListAll = service2.chListAll(cri);
		
		// 페이징 처리
		cri.setPerPageNum(10);
	    PageMaker pagevo = new PageMaker();
	    pagevo.setDisplayPageNum(10);
	    pagevo.setCri(cri);
	    pagevo.setTotalCount(service2.chListCnt());
		
	    mylog.debug(pagevo.toString());
	    mylog.debug(""+chListAll.size());
	    
	    model.addAttribute("pagevo", pagevo);
		model.addAttribute("chListAll", chListAll);
		
		return "/chagok/adminconfirm";
	}
	
	@ResponseBody
	@GetMapping(value="/confirm")
	public int confirm(@RequestParam int status, @RequestParam int cno, RedirectAttributes rttr) throws Exception {
		mylog.debug("status : "+status+", cno : "+cno);
		int result=0;
		
		service2.confirmChallenge(status, cno);

		if(status==1) {
			result = 1;
		} else if(status==6) {
			result = 6;
		}
		mylog.debug("결과"+result);
		
		return result;
	}
	
	// http://localhost:8080/bizAccount
	@GetMapping(value="/bizAccount")
	public String businessAcc (Criteria cri, Model model) throws Exception {
		mylog.debug("/businessAcc 호출");
		
		List<BusinessAccountVO> bizList = service.getBizList(cri);
		
		// 페이징 처리
		cri.setPerPageNum(10);
	    PageMaker pagevo = new PageMaker();
	    pagevo.setDisplayPageNum(10);
	    pagevo.setCri(cri);
	    pagevo.setTotalCount(service.getBizCnt());
		
	    model.addAttribute("pagevo", pagevo);
		model.addAttribute("bizList", bizList);
	   
		return "/chagok/businessAcc";
	}
   
	// http://localhost:8080/userManagement
	// 관리자 회원관리
	@GetMapping("/userManagement")
	public String userManagementGET(Criteria cri, Model model) throws Exception {
		mylog.debug("/userManagementGET 호출");
		
		List<UserVO> userList = service.getUserList(cri);
		
		// 페이징 처리
		cri.setPerPageNum(10);
	    PageMaker pagevo = new PageMaker();
	    pagevo.setDisplayPageNum(10);
	    pagevo.setCri(cri);
	    pagevo.setTotalCount(service.getUserCnt());
		mylog.debug("@@@@"+pagevo.toString());
		mylog.debug("@@@@"+userList.size());
		
	    model.addAttribute("pagevo", pagevo);
		model.addAttribute("userList", userList);
		
		return "/chagok/userManagement";
	}
	
	
	// http://localhost:8080/refundManagement
	// 환불관리
	@GetMapping("/refundManagement")
	public String refundManagementGET(Criteria cri, Model model, RedirectAttributes rttr) throws Exception {
		mylog.debug("/userManagementGET 호출");
		
		List<Map<String, Object>> bizList = service.getBizRefundList(cri);
		
		rttr.addFlashAttribute("Msg", "환급 완료!");
		
		// 페이징 처리
		cri.setPerPageNum(10);
		PageMaker pagevo = new PageMaker();
		pagevo.setDisplayPageNum(10);
		pagevo.setCri(cri);
		pagevo.setTotalCount(service.getBizCnt());
		mylog.debug("@@@@"+pagevo.toString());
		mylog.debug("@@@@"+bizList.size());
		
		model.addAttribute("pagevo", pagevo);
		model.addAttribute("bizList", bizList);
		
		return "/chagok/refundManagement";
	}

	// http://localhost:8080/refundManagement
	// 환불관리
	@PostMapping("/refundManagement")
	@ResponseBody
	public String refundManagementPOST(@RequestBody String param) throws Exception {
		mylog.debug("/refundManagementPOST 호출");
		
		mylog.debug(param.toString());
		
		Integer tmp = Integer.parseInt(param);
//		
		service.updateBizAccount(tmp);
		
		
		return "/refundManagement";
	}

	////////////////////// 관리자 페이지 ///////////////////////////	
	
	
}

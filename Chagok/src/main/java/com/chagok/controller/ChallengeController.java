package com.chagok.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chagok.domain.BoardVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.MinusVO;
import com.chagok.domain.PlusVO;
import com.chagok.domain.SysLogVO;
import com.chagok.domain.UserVO;
import com.chagok.service.ChallengeService;
import com.chagok.service.UserService;
import com.chagok.utils.UploadFileUtils;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/challenge/*")
public class ChallengeController {

	@Inject
	private ChallengeService service;
	
	@Inject
	private UserService uservice;
	
	@Resource(name="uploadPath")
	private String uploadPath;


	private static final Logger mylog = LoggerFactory.getLogger(ChallengeController.class);

	// http://localhost:8080/challenge/plusFeed?cno=2
	@GetMapping(value = "/plusFeed")
	public String plusfeedGET(Model model, int cno, HttpSession session) throws Exception {
		mylog.debug("plusfeedGET() 호출");

		List<Map<String, Object>> plusPeoList = service.getPlusPeople(cno);
		mylog.debug("plusFeedGET()에서 id : "+session.getId());
		SysLogVO sysLogVO = new SysLogVO();

		model.addAttribute("sessionId", sysLogVO.getUserId());
		model.addAttribute("vo", service.getChallengeInfo(cno));
		model.addAttribute("plusPeoList", plusPeoList);
		model.addAttribute("c_end", service.getChallengeEndDate(cno));
		
		return "/challenge/plusFeed";
	}
	
	@PostMapping(value = "/plusFeed")
	public String plusfeedPOST(Model model, int cno, HttpSession session) throws Exception {
		mylog.debug("plusfeedPOST() 호출");
		
		ChallengeVO chVO = service.getChallengeInfo(cno);
		List<Map<String, Object>> plusPeoList = service.getPlusPeople(cno);
		
		model.addAttribute("vo", chVO);
		model.addAttribute("plusPeoList", plusPeoList);
		
		return "/challenge/plusFeed";
	}
	
	// http://localhost:8080/challenge/plusdetail?cno=2

	@GetMapping(value = "/plusdetail")
	public String plusdetailGET(Model model, @RequestParam("cno") Integer cno, HttpSession session) throws Exception {
		mylog.debug("plusdetailGET 호출");
		mylog.debug(cno + "");
		
	
		ChallengeVO vo = service.getChallengeInfo(cno);
		// mno에 해당하는 user의 nick을 받아옴
		model.addAttribute("user", uservice.getUser(vo.getMno())); 
		
		ChallengeVO vo2 = service.getCt_top(cno);

		model.addAttribute("vo", vo); // plusdetail로 정보전달

		model.addAttribute("vo2", vo2);

		return "/challenge/plusdetail";
	}


	// http://localhost:8080/challenge/minusFeed?cno=1
	// http://localhost:8080/challenge/minusFeed
	@GetMapping(value="/minusFeed")
	public String minusFeed(Model model,@RequestParam("cno") int cno,HttpSession session) throws Exception {
		mylog.debug(" 수 지 : minusFeed Get 호출 ");
		
		ChallengeVO vo = service.getChallengeInfo(cno);
		List<Map<String, Object>> minusPeoList = service.getMinusPeople(cno);
		ChallengeVO vo2 = service.getCt_top(cno);
		
	   // 연결된 뷰페이지로 정보 전달(model)
	   model.addAttribute("vo", vo);
	   model.addAttribute("minusPeoList", minusPeoList);
	   model.addAttribute("vo2", vo2);
	   
	   return "/challenge/minusFeed";
	}
	
	@PostMapping(value = "/minusFeedPOST")
	public String minusFeedPOST() throws Exception {

		return "/challenge/minusFeed";
	}

	@PostMapping(value = "/plusdetailPOST")
	@ResponseBody // ajax 값을 바로 jsp에 보내기 위해 사용@RequestParam("ctno") int ctno, 
	public String plusdetailPOST(@RequestBody Map<String, Object> map,HttpSession session) throws Exception {
		mylog.debug("plusdetailPOST 호출");
		mylog.debug(map+"");
		
		String result="";
		
		Integer gctno = service.samechallenge(map);	
		mylog.debug(gctno+"");
		if(gctno != null) {
			result = "Y";
		}else {
			result = "N";

			mylog.debug(map+"");
			service.joinplusInsert(map); // mno랑 cno필요
			service.joinplusUpdate(map); // nick이랑 cno
		}
	
		mylog.debug(result);
		return result;
	}

	// http://localhost:8080/challenge/minusdetail?cno=1
	@GetMapping(value = "/minusdetail")
	public String minusdetailGET(Model model,@RequestParam("cno") int cno, HttpSession session) throws Exception {
		mylog.debug("minusdetailGET 호출");
		mylog.debug(cno+"");
		
		ChallengeVO vo = service.getChallengeInfo(cno);
		model.addAttribute("user", uservice.getUser(vo.getMno())); 
		ChallengeVO vo2 = service.getCt_top(cno);
		
		model.addAttribute("vo", vo); // minusdetail로 정보전달
		model.addAttribute("vo2", vo2);

		return "/challenge/minusdetail";
	}
	
	@PostMapping(value = "/minusdetailPOST")
	@ResponseBody // ajax 값을 바로 jsp에 보내기 위해 사용@RequestParam("ctno") int ctno, 
	public String minusdetailPOST(@RequestBody Map<String, Object> map,HttpSession session) throws Exception {
		mylog.debug("minusdetailPOST 호출");
		mylog.debug(map+"");
		
		String result="";
		
		Integer gctno = service.samechallenge(map);	
		mylog.debug(gctno+"");
		if(gctno != null) {
			result = "Y";
		}else {
			result = "N";

			mylog.debug(map+"");
			service.joinminusInsert(map); // mno랑 cno필요
			service.joinplusUpdate(map); // nick이랑 cno
		}
	
		mylog.debug(result);
		return result;
}

	// http://localhost:8080/challenge/echo
	@GetMapping(value = "/echo")
	public String echoGET() throws Exception {

		return "/challenge/echo";
	}
	

	// http://localhost:8080/challenge/chat
	@GetMapping(value = "/chat")
	public String chatGET(Model model) throws Exception{
		mylog.debug("==================================");
		UserVO user = new UserVO();
		mylog.debug("@ChatController, GET Chat / Username : " + user.getNick());
		
		model.addAttribute("user", user.getNick());
		
		return "/challenge/chat";
	}

	
	// http://localhost:8080/challenge/checkfeed?cno=2
	@GetMapping(value = "/checkfeed")
	public String checkfeedGET(HttpSession session,@RequestParam("cno")int cno, Model model) throws Exception {
			
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
		
		return "/challenge/checkfeed";
	}

	// http://localhost:8080/challenge/mychallenge
		@GetMapping("/mychallenge")
		public String mychallengeGET(Model model, HttpSession session) throws Exception {
			
			String nick = (String)session.getAttribute("nick");
			
			if(nick != null) {
				List<ChallengeVO> mychallengeList = service.getmyChallenge(nick);
				model.addAttribute("mychallengeList", mychallengeList);
				mylog.debug(mychallengeList+"");
			}
			
			
			return "/challenge/mychallenge";
		}
		
		// mychallenge에서 신청취소 했을 때
		@GetMapping("/cancelChallenge")
		public String cancelChallengeGET(@RequestParam("cno") Integer cno, @RequestParam("c_sort") Integer c_sort,HttpSession session) throws Exception {
			
			Integer mno = (Integer)session.getAttribute("mno");
			mylog.debug(cno+" : cno , "+mno+" : mno, "+c_sort+" : c_sort");
//			String nick = uservice.getUser(mno).getNick();
			
			String nick = ",효원";
			service.cancelChallenge(nick,cno);
			
			if(c_sort == 0) {
				service.cancelPlus(mno, cno);
			}else if(c_sort == 1){
				service.cancelMinus(mno, cno);
			}
//			cno, mno로챌린지 조회
			
			return "redirect:/challenge/mychallenge";
		}
		
		
	// http://localhost:8080/challenge/webSocket
	// 웹소캣 채팅 !!
	@GetMapping(value="/webSocket")
	public String webSocket(Model model,HttpSession session) throws Exception {
		
	   // 연결된 뷰페이지로 정보 전달(model)
	   
	   return "/challenge/webSocket";
	}
	
	
	// 챌린지 등록 (저축형) - GET
	// http://localhost:8080/challenge/plusregist
	@GetMapping(value="/plusregist")
	public String plusRegistGET() throws Exception{
		mylog.debug(" /challenge/plusRegistGET 호출 -> 페이지 이동 ");
		
		return "/challenge/plusRegist";
		
	}
		
	// 챌린지 등록 (저축형) - POST
	@RequestMapping(value = "/plusregist", method=RequestMethod.POST)
	public String plusRegistPOST(ChallengeVO vo, MultipartFile file) throws Exception{
		mylog.debug(" /challenge/plusRegist(POST) 호출 ");	
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		   fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
		} else {
		   fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setC_file(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setC_thumbFile(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		
		// 1. 전달된 정보 저장
		mylog.debug(vo.toString());
		
		// 2. 서비스 -> DAO 접근 (mapper)
		service.challengeRegist(vo);
		mylog.debug(" 챌린지 등록(저축형) 완료! ");
		
		// 3. 페이지로 이동(모집중 챌린지)
//		rttr.addFlashAttribute("result", "plusRegistOK");
		return "redirect:/commumain";
		
	}
		
	// 챌린지 등록 (절약형) - GET
	// http://localhost:8080/challenge/minusregist
	@GetMapping(value="/minusregist")
	public String minusRegistGET() throws Exception{
		mylog.debug(" /challenge/minusRegistGET 호출 -> 페이지 이동 ");
		
		return "/challenge/minusRegist";
	}
	
	// 챌린지 등록 (절약형) - POST
	@RequestMapping(value = "/minusregist", method=RequestMethod.POST)
	public String minusRegistPOST(ChallengeVO vo, MultipartFile file) throws Exception{
		mylog.debug(" /challenge/minusRegist(POST) 호출 ");	
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		   fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
		} else {
		   fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setC_file(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setC_thumbFile(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		
		// 1. 전달된 정보 저장
		mylog.debug(vo.toString());
		
		// 2. 서비스 -> DAO 접근 (mapper)
		service.challengeRegist(vo);
		mylog.debug(" 챌린지 등록(저축형) 완료! ");
		
		// 3. 페이지로 이동(모집중 챌린지)
//		rttr.addFlashAttribute("result", "plusRegistOK");
		return "redirect:/commumain";
		
	}
	
	// 챌린지 결과(성공)
	// http://localhost:8080/challenge/success?cno=1
	@GetMapping(value="/success")
	public String victoryGET(Model model, @RequestParam("cno") int cno, HttpSession session) throws Exception{
		ChallengeVO vo = service.getChallengeInfo(cno);
		List<ChallengeVO> challengeList = service.getChallengeList(cno);
		
		ChallengeVO vo2 = service.getCt_top(cno);
		int CList = service.getCList(cno);
		int ChallengeMoney = service.getChallengeMoney(cno);
		Integer Success = service.getSuccess(cno);
		
		model.addAttribute("vo", vo);
		model.addAttribute("CList", CList);
		model.addAttribute("challengeList", challengeList);
		model.addAttribute("vo2", vo2);
		model.addAttribute("c_end", service.getChallengeEndDate(cno));
		model.addAttribute("ChallengeMoney", ChallengeMoney);
		model.addAttribute("Success", Success);
		
		return "/challenge/resultsuccess";
	}

	// 챌린지 결과(실패)
	// http://localhost:8080/challenge/defeat?cno=1
	@GetMapping(value="/defeat")
	public String defeatGET(Model model, @RequestParam("cno") int cno, HttpSession session) throws Exception{
		ChallengeVO vo = service.getChallengeInfo(cno);
		List<ChallengeVO> challengeList = service.getChallengeList(cno);
				
		ChallengeVO vo2 = service.getCt_top(cno);
		int CList = service.getCList(cno);
		int ChallengeMoney = service.getChallengeMoney(cno);
		Integer Success = service.getSuccess(cno);
		
		model.addAttribute("vo", vo);
		model.addAttribute("CList", CList);
		model.addAttribute("challengeList", challengeList);
		model.addAttribute("vo2", vo2);
		model.addAttribute("c_end", service.getChallengeEndDate(cno));
		model.addAttribute("ChallengeMoney", ChallengeMoney);
		model.addAttribute("Success", Success);
				
		return "/challenge/resultdefeat";
	}
	
	
	
}
package com.chagok.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.chagok.domain.BusinessAccountVO;
import com.chagok.domain.PayVO;
import com.chagok.domain.UserVO;
import com.chagok.service.ChallengeService;
import com.chagok.service.PayService;
import com.chagok.service.UserService;

@Controller
//@RequestMapping("/payment/*")
public class PaymentController {

	private static final Logger mylog = LoggerFactory.getLogger(PaymentController.class);

	@Inject
	private PayService service;
	
	@Inject
	private UserService uService;

	@Inject
	private ChallengeService chService;
	
	
	
	// http://localhost:8080/payment
	@GetMapping(value="/payment")
	public String paymentGET(Model model, HttpSession session) throws Exception{
		mylog.debug(" /payment 호출 -> 페이지 이동 ");
		
		if (session.getAttribute("mno") != null) {
			   int mno = (int)session.getAttribute("mno");
			   
			   UserVO userVO = uService.getUser(mno);
			   model.addAttribute("userVO", userVO);
			   
		   } else {
			   return "/chagok/login";
		   }
		
		
		return "/payment/payment";
	}
	
	@PostMapping(value="/paymentPOST")
	public String paymentPOST(@RequestBody PayVO vo,HttpSession session) {
		mylog.debug(" /paymentPOST 호출 !! ");
		int mno = 0;
		if (session.getAttribute("mno") != null) {
			   mno = (int)session.getAttribute("mno");
		   }
		mylog.debug("mno : "+mno);
		mylog.debug("pay_cash : "+vo.getPay_cash());
		mylog.debug("pay_mean : "+vo.getPay_mean());
		
		service.insertPay(mno, vo.getPay_cash(), vo.getPay_mean());
		uService.insertBuy(mno, vo.getPay_cash());
		
		return "/payment/payment";
	}
	
//	@PostMapping(value="/verifyIamport")
//	public String paymentVerify(@RequestParam("imp_uid") String imp_uid) {
//		mylog.debug(imp_uid+"AAAAAAAAAA");
//		return "/payment/refund";
//	}	
	
	
	
	// 환불페이지 - GET
	// http://localhost:8080/refund
	@GetMapping(value="/refund")
	public String refundGET(HttpSession session, Model model) throws Exception{
		mylog.debug(" /refund 호출 -> 페이지 이동 ");
		Integer mno = (Integer) session.getAttribute("mno");
		Integer getPoint =  uService.getUser(mno).getGetpoint();
		
		mylog.debug(uService.getUser(mno).toString());
		
		UserVO vo = uService.getUser(mno);
		
		if(vo.getRbank() == null || vo.getRbank() == "") {
			model.addAttribute("msg","환불 계좌를 입력해주세요!");
		}else {
			model.addAttribute("msg", "입력된 계좌를 사용합니다.");
			model.addAttribute("userVO", vo);
		}
		
		model.addAttribute("getPoint", getPoint);
		
		return "/payment/refund";
	}

	   
   @PostMapping(value = "/refund")
   public String refundPointPOST(@RequestParam("getpoint") Integer getpoint, BusinessAccountVO baVO, @RequestParam("raccount") String raccount,
		   @RequestParam("rbank") String rbank, @RequestParam("rname") String rname, HttpSession session) throws Exception {
	   mylog.debug(" refundPointPOST 호출 ");
	   
	   Map<String, Object> usePointInfo = new HashMap<String, Object>();
	   Integer mno = null;
	   
	   if (session.getAttribute("mno") != null) {
		   mno = (Integer)session.getAttribute("mno");
		   String nick = (String)session.getAttribute("nick");
		   baVO.setBiz_holder_name(nick);
		   baVO.setMno(mno);
		   
		   usePointInfo.put("mno", mno);
		   usePointInfo.put("getpoint", getpoint);
		   
		   baVO.setBiz_inout(1); // 출금
		   baVO.setBiz_amount(getpoint);
		   
	   }
	   
	   UserVO userVO = uService.getUser(mno);
	   uService.usePoint(usePointInfo);

	   if(raccount != null && rbank != null) {
		   userVO.setRaccount(raccount);
		   userVO.setRbank(rbank);
		   userVO.setRname(rname);
		   uService.updateUserInfo(userVO);
		   
	   }
	   
	   // 트래픽 방지용
	   if(userVO.getGetpoint() >= getpoint) //원래 있는 포인트 >= 사용 포인트
		   chService.sendBiz(baVO);
	   
	   
	   return "redirect:/payment";
   }
   

   
	   
}

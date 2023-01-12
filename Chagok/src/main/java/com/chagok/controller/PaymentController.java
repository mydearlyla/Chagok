package com.chagok.controller;

import java.io.IOException;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chagok.domain.PayVO;
import com.chagok.domain.UserVO;
import com.chagok.service.PayService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
//@RequestMapping("/payment/*")
public class PaymentController {

	private static final Logger mylog = LoggerFactory.getLogger(PaymentController.class);

	@Inject
	private PayService service;
	// 결제하기
	// http://localhost:8080/pay
//	@GetMapping(value="/pay")
//	public String payGET() {
//		
//		return "/challenge/pay";
//	}
//	
	
//	private IamportClient api;
//	public PaymentController() {
//		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
//		this.api = new IamportClient("5615632670260363","a4x93RXR27aEPQ3s7WSqhacyrdZNUzK0S3J1UQtqU1FfhC9D5urwfaSrlAkjtyFzsoSZsYXVWCliOsPN");
//	}
//	// 결제정보 확인(검증)
//	
//	@ResponseBody
//	@RequestMapping(value="/payCallback", method=RequestMethod.POST)
//	public IamportResponse<Payment> paymentByImpUid(
//			Model model
//			, Locale locale
//			, HttpSession session
//			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
//	{	
//			return api.paymentByImpUid(imp_uid);
//	}

	// 결제페이지 - GET
	// http://localhost:8080/payment
	@GetMapping(value="/payment")
	public String paymentGET(UserVO uvo, Model model) throws Exception{
		mylog.debug(" /payment 호출 -> 페이지 이동 ");
		mylog.debug(uvo.getMno()+"");
		int mno = uvo.getMno();
		
		model.addAttribute("mno", mno);
		return "/payment/payment";
	}
	
	@PostMapping(value="/paymentPOST")
	public String paymentPOST(@RequestBody PayVO vo) {
		mylog.debug(" /paymentPOST 호출 !! ");
		mylog.debug("mno : "+vo.getMno());
		mylog.debug("pay_cash : "+vo.getPay_cash());
		mylog.debug("pay_mean : "+vo.getPay_mean());
		mylog.debug("pay_regdate : "+vo.getPay_regdate());
		
		service.insertPay(vo.getMno(), vo.getPay_cash(), vo.getPay_mean(), vo.getPay_regdate());
		
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
	public String refundGET() throws Exception{
		mylog.debug(" /refund 호출 -> 페이지 이동 ");
		
		return "/payment/refund";
	}

	   
   @PostMapping(value = "/refund")
   public String refundPointPOST(Integer payno) {
	   
	   return null;
   }
	   
}

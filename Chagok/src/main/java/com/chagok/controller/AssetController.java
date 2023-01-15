package com.chagok.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chagok.apiDomain.AccountHistoryRequestVO;
import com.chagok.apiDomain.AccountHistoryResponseVO;
import com.chagok.apiDomain.AccountHistoryVO;
import com.chagok.apiDomain.AccountVO;
import com.chagok.apiDomain.CardHistoryVO;
import com.chagok.apiDomain.CardInfoRequestVO;
import com.chagok.apiDomain.CardInfoResponseVO;
import com.chagok.apiDomain.CardInfoVO;
import com.chagok.apiDomain.CashVO;
import com.chagok.apiDomain.RequestTokenVO;
import com.chagok.apiDomain.ResponseTokenVO;
import com.chagok.apiDomain.UserInfoResponseVO;
import com.chagok.domain.AbookVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.JsonObj;
import com.chagok.domain.PropCardVO;
import com.chagok.domain.UserVO;
import com.chagok.service.AbookService;
import com.chagok.service.AccountService;
import com.chagok.service.OpenBankingService;
import com.chagok.service.ReportService;
import com.chagok.service.UserService;
import com.fasterxml.jackson.annotation.JsonAutoDetect;
@JsonAutoDetect 
@Controller
@RequestMapping("/asset/*")
public class AssetController {
	
	private static final Logger mylog = LoggerFactory.getLogger(AssetController.class);

	
	///////////////////영민////////////////////
	// http://localhost:8080/asset/myAsset
	@Inject
	private OpenBankingService openBankingService;
	
	@Inject
	private AccountService accountService; 
	
	@Inject
	private UserService userService;
	
	@GetMapping("/myAsset")
	public String myAssetGET(HttpSession session, Model model) throws Exception{
		// 로그인 확인
		Integer mno = (Integer)session.getAttribute("mno");
		if (mno==null) {
			model.addAttribute("chkLogin", "loginN");
		} else {
			UserVO userVO = userService.getUser(mno);
			model.addAttribute("userVO", userVO);
			
			// 현재 년월
			LocalDate now = LocalDate.now();
			String now_date = now.format(DateTimeFormatter.ofPattern("yyyyMM"));
			model.addAttribute("now_date", now_date);
			
			// 계좌 리스트 조회
			List<AccountVO> accountList = accountService.getAccountInfo(mno);
			model.addAttribute("accountList", accountList);
			
			// 카드 리스트 조회
			List<CardInfoVO> cardList = accountService.getCardInfo(userVO.getUser_seq_no());
			model.addAttribute("cardList", cardList);
			
			// 카드 내역/금액 조회
			List<List<CardHistoryVO>> cardHistoryList = accountService.getCardHistory(cardList);
			model.addAttribute("cardHistoryList", cardHistoryList);
			
			// 현금 내역 조회
			CashVO cashVO = accountService.getCashInfo(mno);
			if (cashVO != null) {
				cashVO.setCash_amt(cashVO.getCash_amt().replaceAll(",", ""));
			}
			
			model.addAttribute("cashVO", cashVO);
		}
		
		return "/asset/myAsset";
	}
	
	@GetMapping("/accountHistory")
	public String accountHistoryGET(HttpSession session, Model model, 
			@RequestParam("fintech_use_num") String fintech_use_num) throws Exception{
		
		if (session.getAttribute("mno") != null) {
			int mno = (int)session.getAttribute("mno");
			
			UserVO userVO = userService.getUser(mno);
			model.addAttribute("userVO", userVO);
			
			mylog.debug("@@@@@@@@@@@@@@@@@@@@@@" + fintech_use_num);
			
			List<AccountHistoryVO> accountHistoryList = accountService.getAccountHistory(fintech_use_num);
			model.addAttribute("accountHistoryList", accountHistoryList);
			
			mylog.debug(accountHistoryList+"");
			
		}
		
		return "/asset/accountHistory";
	}
	
	@GetMapping("/cardHistory")
	public String cardHistoryGET(HttpSession session, Model model, 
			@RequestParam("card_id") String card_id, @RequestParam("cardSum") String cardSum) throws Exception{
		
		if (session.getAttribute("mno") != null) {
			int mno = (int)session.getAttribute("mno");
			
			UserVO userVO = userService.getUser(mno);
			model.addAttribute("userVO", userVO);
			
			mylog.debug("@@@@@@@@@@@@@@@@@@@@@@" + card_id);
			
			List<CardHistoryVO> cardHistoryList = accountService.getCardHistory(card_id);
			model.addAttribute("cardHistoryList", cardHistoryList);
			model.addAttribute("cardSum", cardSum);
			
			mylog.debug(cardHistoryList+"");
			
			
		}
		
		return "/asset/cardHistory";
	}
	
	@GetMapping("/insertCash")
	public String insertCashGET() throws Exception{
		
		return "/asset/insertCash";
	}
	
	@GetMapping("/insertCashPro")
	public String insertCashProGET(CashVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		mylog.debug("현금등록 호출!!!!");
		
		int mno = (int)session.getAttribute("mno");
		vo.setMno(mno);
		
		mylog.debug(vo+"");

		accountService.insertCash(vo);

		rttr.addFlashAttribute("insertOK", "OK");
		
		return "redirect:/asset/insertCash";
	}
	
	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String getToken(RequestTokenVO requestTokenVO, Model model, CardInfoRequestVO cardInfoRequestVO, 
			HttpSession session) throws Exception {
		//////////////// 사용자인증 API (3-legged) ////////////////
		
		// 현재 시간정보
		LocalDate now = LocalDate.now();
		String from_date = now.minusMonths(6).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		String to_date = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		
		// 토큰 생성
		ResponseTokenVO responseTokenVO = openBankingService.requestToken(requestTokenVO);
		
		// 정보를 들고 jsp 이동 (model 객체)
		model.addAttribute("responseTokenVO", responseTokenVO);
			
		if (responseTokenVO != null) {
			int mno = (int)session.getAttribute("mno");
			
			// isChecked N => Y update
			userService.updateIsCheck(mno);
			
			// user_seq_no 저장
			Map<String, Object> userMap = new HashMap<String, Object>();
			userMap.put("mno", mno);
			userMap.put("user_seq_no", responseTokenVO.getUser_seq_no());
			userService.updateSeqNo(userMap);
			
			//////////////// 사용자 정보, 계좌정보 조회 => DB(user, account 테이블)에 저장 ////////////////
			UserInfoResponseVO userInfoResponseVO = openBankingService.getUserInfo(responseTokenVO);
			for (int k = 0; k < userInfoResponseVO.getRes_list().size(); k++) {
				userInfoResponseVO.getRes_list().get(k).setMno(mno);
			}
			// 사용자 정보
			model.addAttribute("userInfoResponseVO", userInfoResponseVO);
			// 계좌 정보
			List<AccountVO> accountList = userInfoResponseVO.getRes_list();
			model.addAttribute("accountList", accountList);
			
			if (userInfoResponseVO.getRes_list() != null) {
				accountService.insertAccountInfo(userInfoResponseVO.getRes_list()); // 디비 저장
			}
			
			mylog.debug("계좌 리스트 : " + accountList);
			
			//////////////// 계좌 거래내역 조회 => DB(account_history 테이블)에 저장 ////////////////
			List<AccountHistoryRequestVO> accountHistoryRequestList = new ArrayList<AccountHistoryRequestVO>();
			for (int i = 0; i < accountList.size(); i++) {
				AccountHistoryRequestVO accountHistoryRequestVO = new AccountHistoryRequestVO();
				
				accountHistoryRequestVO.setAccess_token(responseTokenVO.getAccess_token());
				accountHistoryRequestVO.setBank_tran_id("M202202513U"+(int)((Math.random()+1)*100000000));
				mylog.debug("@@@@@@@@@@@@@@"+i+accountHistoryRequestVO.getBank_tran_id());
				accountHistoryRequestVO.setFintech_use_num(accountList.get(i).getFintech_use_num());
				accountHistoryRequestVO.setInquiry_type("A");
				accountHistoryRequestVO.setInquiry_base("D");
				accountHistoryRequestVO.setFrom_date(from_date);
				accountHistoryRequestVO.setTo_date(to_date);
				accountHistoryRequestVO.setSort_order("D");
				
				accountHistoryRequestList.add(accountHistoryRequestVO);
			}
			
			List<AccountHistoryResponseVO> accountHistoryResponseList = openBankingService.getAccountHistory(accountHistoryRequestList);
			model.addAttribute("accountHistoryResponseList", accountHistoryResponseList);
			
			if (accountHistoryRequestList != null) {
				accountService.insertAccountHistory(accountHistoryResponseList); // 디비 저장
			}
			
			//////////////// 카드목록 조회 => DB(card 테이블)에 저장 ////////////////
			
			cardInfoRequestVO.setAccess_token(responseTokenVO.getAccess_token());
			cardInfoRequestVO.setBank_tran_id("M202202513U"+(int)((Math.random()+1)*100000000));
			cardInfoRequestVO.setUser_seq_no(responseTokenVO.getUser_seq_no());
			cardInfoRequestVO.setBank_code_std("399"); // fix, 오픈뱅킹만 사용가능
			cardInfoRequestVO.setMember_bank_code("399"); // fix, 오픈뱅킹만 사용가능
			CardInfoResponseVO cardInfoResponseVO = openBankingService.getCardInfo(cardInfoRequestVO);
			
			model.addAttribute("cardInfoResponseVO", cardInfoResponseVO);
			if (cardInfoResponseVO != null) {
				accountService.insertCardInfo(cardInfoResponseVO);
			}
			
			// 계좌 금액 조회
			if (userInfoResponseVO.getRes_list() != null) {
				// mno에 해당하는 계좌들의 가장최근 거래내역 조회
				List<AccountHistoryVO> accountHistoryList = accountService.getBalanceAmt(mno);
				model.addAttribute("accountHistoryList", accountHistoryList);
				
				// 최근 거래금액을 각각 계좌에 업데이트
				List<AccountVO> updateBalanceList = new ArrayList<AccountVO>();
				for (int i = 0; i < accountHistoryList.size(); i++) {
					if (accountHistoryList.get(i) != null) {
						AccountVO accountVO = new AccountVO();
						accountVO.setFintech_use_num(accountHistoryList.get(i).getFintech_use_num());
						accountVO.setBalance_amt(accountHistoryList.get(i).getAfter_balance_amt());
						updateBalanceList.add(accountVO);
					}
				}
				accountService.updateBalanceAmt(updateBalanceList);
			}
		}
//		return "/asset/apiTest"; // 출력 테스트
		return "redirect:/asset/myAsset";
	}
	
	@GetMapping("/callbackCard")
	public String registCard(RequestTokenVO requestTokenVO, Model model) throws Exception{
		
		model.addAttribute("requestTokenVO", requestTokenVO);
		
		return "/asset/cardTest";
	}
	
	
	
	
	
	@RequestMapping(value = "/callbackCenter", method = RequestMethod.GET)
	public String getTokenCenter(RequestTokenVO requestTokenVO, Model model) throws Exception{
		////////////////사용자인증 API (2-legged) ////////////////
				
		ResponseTokenVO responseTokenVO = openBankingService.requestTokenCenter(requestTokenVO);
		
		// 정보를 들고 jsp 이동 (model 객체)
		model.addAttribute("responseTokenVO", responseTokenVO); 
		if (responseTokenVO != null) {
			//////////////// 사용자 정보 조회 => DB(member 테이블)에 저장 ////////////////
			UserInfoResponseVO userInfoResponseVO = openBankingService.getUserInfo(responseTokenVO);
			// 사용자 정보
			model.addAttribute("userInfoResponseVO", userInfoResponseVO);
			// 계좌 정보
			model.addAttribute("accountList", userInfoResponseVO.getRes_list());
			//////////////// 계좌 정보 조회 => DB(member 테이블)에 저장 ////////////////
			
		}
		return "/asset/apiTest";
	}

	
	
	
	
	
	///////////////////영민////////////////////

	
	
	///////////////////세영//////////////////////
	
	//서비스 객체 주입
	@Inject
	private AbookService abService;
	
	
	// 0. abokkList페이지 get으로 호출 ============================================================
//	http://localhost:8080/asset/abookList
	@GetMapping(value="/abookList", produces = "application/json; charset=utf8")
	public String abookList(HttpSession session,Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// 0. mno 세션에서 받기 
		// 로그인 확인
		if(session.getAttribute("mno")==null) {
			return "/chagok/login";
		}
		int mno = (int)session.getAttribute("mno");
		UserVO userVO = userService.getUser(mno);
		
		mylog.debug("mno : "+mno);

		return "asset/abookList"; 
	}
	
	
	// 1. 서버 Data 불러서 그리드에 뿌리기 ==========================================================
	@ResponseBody
	@RequestMapping(value = "/reqGrid", method = {RequestMethod.GET,RequestMethod.POST})
	public JsonObj test (
			@RequestParam(value = "page", required=false) String page,//page : 몇번째 페이지를 요청했는지
			@RequestParam(value = "rows", required=false) String rows,//rows : 페이지 당 몇개의 행이 보여질건지
			@RequestParam(value  = "sidx", required=false) String sidx,//sidx : 소팅하는 기준이 되는 인덱스
			@RequestParam(value = "sord", required=false) String sord,
			HttpSession session) throws Exception {//sord : 내림차순 또는 오름차순
	    	
		mylog.debug("cont - reqGrid");
		
		// 로그인 확인
		int mno = (int)session.getAttribute("mno");
		UserVO userVO = userService.getUser(mno);
		
		mylog.debug("mno@@@:"+mno);
		int mm=0;
		
		String formatDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		// list: 그리드 구성할 때 필요한 데이터(page,sidx,sord) 리스트 
		// list2: 서버 데이터(VO) 리스트
		JsonObj obj = new JsonObj();
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		List<?> list2 = abService.getAbookList(mno, mm);
		mylog.debug("vo -> list "+list2);
		
		int int_page = Integer.parseInt(page);// 1 2 3
		int perPageNum = (int)Double.parseDouble(rows);
		
		// db에서 가져온 데이터의 갯수가 10개라고 가정하고 임의로 수행	
//		for(int i= (int_page-1)*perPageNum+1 ; i<(int_page*perPageNum) ; i++){
		for(int i=0; i<list2.size(); i++){
			AbookVO vo = (AbookVO) list2.get(i);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("abno", vo.getAbno());
			map.put("ab_inout", vo.getAb_inout());
			map.put("ab_date", vo.getAb_date());
			map.put("ab_content", vo.getAb_content());
			map.put("ab_amount", vo.getAb_amount());
			map.put("ab_method", vo.getAb_method());
			map.put("ctno", vo.getCtno());
			map.put("ct_top", vo.getCt_top());
			map.put("ct_bottom", vo.getCt_bottom());
			map.put("ab_memo", vo.getAb_memo());
			
			list.add(map);
	}
	    obj.setRows(list);  // list<map> -> obj
	    
	    //page : 현재 페이지
	    obj.setPage(int_page);// 현재 페이지를 매개변수로 넘어온 page로 지정해준다. 
		
	    //records : 페이지에 보여지는 데이터 개수
	    obj.setRecords(list.size());
		
	    //total : rows에 의한 총 페이지수
		// 총 페이지 갯수는 데이터 갯수 / 한페이지에 보여줄 개수
		int totalPage = (int)Math.ceil(list.size()/Double.parseDouble(rows));
		obj.setTotal(totalPage); // 총 페이지 수 (마지막 페이지 번호)
		
		mylog.debug("cont -> 그리드로"+obj);
		
	    return obj;
	    
	} // ===========================================================================================================
	
	
	// 그리드 -> DB(서버 데이터)로 수정하고 저장하는 코드
	@RequestMapping(value = "/saveGrid", method = RequestMethod.POST)
	 @ResponseBody
	 public Object saveList(HttpServletRequest request,@RequestBody List<Map<String, Object>> list, HttpSession session) throws Exception {		
		// 로그인 확인
		int mno = (int)session.getAttribute("mno");
		UserVO userVO = userService.getUser(mno);
		
		mylog.debug("mno@@@@@@@@:"+mno);
		
		mylog.debug("##그리드 뽑 리스트"+list);
		 Map <String, String> resultMap =  new HashMap<String, String>();
		  String result = "ok";
		  String resultMsg = "";
		  
	  try {
		  
	   for(int i = 0; i < list.size(); i++) {
		AbookVO vo = new AbookVO(); 
//	    vo.setMno(mno);
	    vo.setAbno(Integer.parseInt(list.get(i).get("abno").toString()));
	    vo.setAb_inout(Integer.parseInt(list.get(i).get("ab_inout").toString()));
	    vo.setAb_amount(Integer.parseInt(list.get(i).get("ab_amount").toString()));
	    vo.setCtno(Integer.parseInt(list.get(i).get("ctno").toString()));
	    
	    vo.setAb_date(list.get(i).get("ab_date").toString());
	    vo.setAb_content(list.get(i).get("ab_content").toString());
	    vo.setAb_memo(list.get(i).get("ab_memo").toString());
	    vo.setAb_method(list.get(i).get("ab_method").toString());

//	    mylog.debug("!!!!!!!!!!!!!!!!!"+vo);
	    abService.setAbookList(vo);
	   }
	    result = "success";
	    resultMsg = "성공" ;
	     
	   }catch (Exception e) { 
	    result = "failure";
	    resultMsg = "실패" ;
	   }
	  
	  resultMap.put("result", result);
	  resultMap.put("resultMsg", resultMsg);
	  mylog.debug("#######resultMap"+resultMap);
	  
	  return resultMap;
	}
	

	// ===============================================================
	@ResponseBody
	@RequestMapping(value = "/cateSelect", method = {RequestMethod.GET,RequestMethod.POST})
	public JSONArray cateSelect (@RequestParam(value = "cate", required=false) String test,		
			HttpSession session) throws Exception {
		mylog.debug("%%json controller cate"+test);
		
		// 로그인 확인
		int mno = (int)session.getAttribute("mno");
		UserVO userVO = userService.getUser(mno);
		mylog.debug("mno@@@@@@@@:"+mno);
		
		List<Map<String, Object>> ctList = abService.cateList();
		mylog.debug("****vo -> list "+ctList);

		JSONArray jArr = new JSONArray();
		for(Map<String, Object> map : ctList) {
			JSONObject jsonobj2 = new JSONObject();
			
			for(Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				jsonobj2.put(key, value);
//				mylog.debug("+++"+jsonobj2);
			    
			}
			jArr.add(jsonobj2);
		}

		return jArr;
	}
	
	// ===========================================================
	@RequestMapping("/catebottom")
	 @ResponseBody
	 public JSONArray ctbottomList(HttpServletRequest request,/*@RequestParam("ct_top") String ct_top*/@RequestParam Map<String, String> pre_ct_top) throws Exception {
		mylog.debug("처음"+pre_ct_top);		 
		
		mylog.debug(pre_ct_top.get("ct_top"));
		String ct_top = pre_ct_top.get("ct_top");
		
		List<Map<String, Object>> ctbottomList = abService.ctbottomList(ct_top);
		mylog.debug("****vo -> list "+ctbottomList);
		
		JSONArray jArrB = new JSONArray();
		
		for(Map<String, Object> map : ctbottomList) {
			JSONObject jsonobjb = new JSONObject();
			
			for(Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				jsonobjb.put(key, value);

			}
			jArrB.add(jsonobjb);
		}
		mylog.debug("&&&"+jArrB);
		
		return jArrB;
		
	}

	
	// =======================================================================================================
	// insert 
	@PostMapping(value = "/insGrid")
	public String insGrid(AbookVO vo, RedirectAttributes rttr, HttpSession session) throws Exception{
		
		// 로그인 확인
		int mno = (int)session.getAttribute("mno");
		UserVO userVO = userService.getUser(mno);
		
		mylog.debug(" cont- insGrid 호출 ");	
		mylog.debug("인서트 실험 중 "+vo.toString());
		vo.setMno(mno);
		
		abService.insAbookList(vo);
		mylog.debug(" 쓰기 완료 ");
		
		return "redirect:/asset/abookList";
	}
	
	
	// ===============================================================
	
@RequestMapping(value="/delGrid", method = {RequestMethod.POST, RequestMethod.GET})
	 @ResponseBody
	 public Object delList(HttpServletRequest request,@RequestParam(value="test[]") List<String> list)  throws Exception {
		mylog.debug("#그리드에서 선택한 abno"+list);
		List<AbookVO> delRow = new ArrayList<AbookVO>();
		  String result = "ok";
		  String resultMsg = "";
		  
			 Map <String, String> resultMap =  new HashMap<String, String>();

	  try {
		  
	   for(int i = 0; i < list.size(); i++) {
		  int abno = Integer.parseInt(list.get(i));
		    abService.delAbookList(abno);
	   }
	    result = "success";
	    resultMsg = "성공" ;
	     
	   }catch (Exception e) { 
	    result = "failure";
	    resultMsg = "실패" ;
	   }
	  
	  resultMap.put("result", result);
	  resultMap.put("resultMsg", resultMsg);
	  mylog.debug("##삭제resultMap"+resultMap);
	  
	  return resultMap; 
	}
	
	
	// ===================================================================================
	
	///////////////////MJ////////////////////
	
	@Inject
	private ReportService rptService;
	
//	http://localhost:8080/assetmain
//	http://localhost:8080/asset/dtRpt
	@GetMapping(value = "/dtRpt")
	public String dateReport(HttpSession session, Model model) throws Exception {
		// 로그인 확인
		Integer mno = (Integer)session.getAttribute("mno");
		int mm = 0;
		int mm2 = 1;
		if (mno==null) {
			model.addAttribute("chkLogin", "loginN");
		} else if (abService.chkAb(mno, mm)==0) {
			model.addAttribute("chkAb", "abN");
		} else {	
			model.addAttribute("chkAb", "abY");
			String nick = userService.getUser(mno).getNick();
			
			/////////////// 1. service에서 DB 가져오기 ///////////////
			// 1. 이번달 총 지출
			Integer dtSum1 = rptService.dtSum(mno, mm);
			mylog.debug("dtSum1 : "+dtSum1);
			
			// 2. 지난달 총 지출
			Integer dtSum2 = rptService.dtSum(mno, mm2);
			mylog.debug("dtSum2 : "+dtSum2);
			
			// 3. 이번달 평균 지출
			Integer dtAvg1 = rptService.dtAvg(mno, mm);
			mylog.debug("dtAvg1 : "+dtAvg1);
			
			// 4. 지난달 평균 지출
			Integer dtAvg2 = rptService.dtAvg(mno, mm2);
			mylog.debug("dtAvg2 : "+dtAvg2);
			
			// 최근 3개월 평균 지출
			Integer dtAvg3 = rptService.dtAvg3(mno);
			mylog.debug("dtAvg3 : "+dtAvg3);
			
			// 5. 이번달 예상 지출
			Integer expSum = rptService.expSum(mno, mm);
			mylog.debug("expSum : "+expSum);
			
			// 6. 이번달 총 수입
			Integer dtSumIn = rptService.dtSumIn(mno, mm);
			mylog.debug("dtSumIn : "+dtSumIn);
			
			// 7. 이번달 무지출 일수
			Integer noOut = rptService.noOut(mno, mm);
			mylog.debug("noOut : "+noOut);
			
			// 8. 이번달 결제 건수(지출 횟수)
			Integer outCnt = rptService.outCnt(mno, mm);
			mylog.debug("outCnt : "+outCnt);
			
			// 9. 이번달 누적 지출
			List<Map<String, Object>> outCum = rptService.outCum(mno, mm);
			mylog.debug("outCum : "+outCum.size());
			
			// 10. 일간 통계
			List<Map<String, Object>> day = rptService.day(mno, mm);
			mylog.debug("day : "+day.size());
			
			// 11. 주간 통계
			List<Map<String, Object>> week = rptService.week(mno);
			mylog.debug("week : "+week.size());
			
			// 12. 월간 통계
			List<Map<String, Object>> month = rptService.month(mno);
			mylog.debug("month : "+month.size());
			
			// 13. 지출액 TOP 4
			List<Map<String, Object>> amtTop = rptService.amtTop(mno, mm);
			mylog.debug("amtTop : "+amtTop.size());
			
			// 14. 지출횟수 TOP 4
			List<Map<String, Object>> cntTop = rptService.cntTop(mno, mm);
			mylog.debug("cntTop : "+cntTop.size());		
			
			/////////////// 2. List<Map> -> JsonArray ///////////////
			String outCumjson = rptService.listMapToJson(outCum);
			String dayjson = rptService.listMapToJson(day);
			String weekjson = rptService.listMapToJson(week);
			String monthjson = rptService.listMapToJson(month);
			String amtTopjson = rptService.listMapToJson(amtTop);
			String cntTopjson = rptService.listMapToJson(cntTop);
			
			/////////////// 3. model로 전달 ///////////////
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("dtSum1", dtSum1);
			map.put("dtSum2", dtSum2);
			map.put("dtAvg1", dtAvg1);
			map.put("dtAvg2", dtAvg2);
			map.put("dtAvg3", dtAvg3);
			map.put("expSum", expSum);
			map.put("dtSumIn", dtSumIn);
			map.put("noOut", noOut);
			map.put("outCnt", outCnt);
			map.put("outCumjson", outCumjson);
			map.put("dayjson", dayjson);
			map.put("weekjson", weekjson);
			map.put("monthjson", monthjson);
			map.put("amtTopjson", amtTopjson);
			map.put("cntTopjson", cntTopjson);
			model.addAttribute("map", map);
			model.addAttribute("nick", nick);
		}
			return "/asset/dateReport";
	}	
	
	
//	http://localhost:8080/asset/ctRpt
	@GetMapping(value = "/ctRpt")
	public String cateReport(HttpSession session, Model model) throws Exception {
		// 로그인 확인
		Integer mno = (Integer)session.getAttribute("mno");
		int mm = 0;
		if (mno==null) {
			model.addAttribute("chkLogin", "loginN");
		} else if (abService.chkAb(mno, mm)==0) {
			model.addAttribute("chkAb", "abN");
		} else {		
			model.addAttribute("chkAb", "abY");
			String nick = userService.getUser(mno).getNick();
			
			/////////////// 1. service에서 DB 가져오기 ///////////////
			// 1. 최다 지출 카테고리
			List<Map<String, Object>> cateCntList = rptService.cateCnt(mno, mm);
			mylog.debug("cateCntList : "+cateCntList.size());
		
			// 2. 최대 지출 카테고리
			List<Map<String, Object>> cateSumList = rptService.cateSum(mno, mm);
			mylog.debug("cateSumList : "+cateSumList.size());
			
			// 3. 챌린지 추천
			List<ChallengeVO> chRandList = rptService.chRand(mno, mm);
			mylog.debug("chRandList : "+chRandList.size());
			
			// 4. 카드 추천
			List<PropCardVO> cardRandList = rptService.cardRand(mno, mm);
			mylog.debug("cardRandList : "+cardRandList.size());
			
			/////////////// 2. List<Map> -> JsonArray ///////////////
			String cateCntjson = rptService.listMapToJson(cateCntList);
			String cateSumjson = rptService.listMapToJson(cateSumList);
			
			/////////////// 3. model로 전달 ///////////////
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cateCntjson", cateCntjson);
			map.put("cateSumjson", cateSumjson);
			map.put("chRandList", chRandList);
			map.put("cardRandList", cardRandList);
			model.addAttribute("map", map);
			model.addAttribute("nick", nick);
		}
		return "/asset/cateReport";
	}
	
	
//	http://localhost:8080/asset/budget
//	http://localhost:8080/asset/budget?mm=0
	@GetMapping(value = "/budget")
	public String budgetGET(@RequestParam("mm") int mm, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {	
		Integer mno = (Integer)session.getAttribute("mno");
		List<String> ctTopList = abService.getctTop();
		String pMonth = abService.getPMonth(mm);
		Integer dtAvg3 = rptService.dtAvg3(mno);
		
		model.addAttribute("dtAvg3", dtAvg3);
		model.addAttribute("ctTopList", ctTopList);
		model.addAttribute("pMonth", pMonth);
		model.addAttribute("mm", mm);
		
		// chkBud
		int chkBud = abService.chkBud(mno, pMonth);
		if(chkBud==0) {
			mylog.debug(pMonth+"__예산 없음");
			return "/asset/budget";
		} else {
			mylog.debug(pMonth+"__예산 있음");
			return "redirect:/asset/budRpt?mm="+mm+"";
		}
	}
	
	@PostMapping(value = "/budget")
	public String budgetPOST(@RequestParam("mm") int mm, @RequestParam Map map, HttpSession session) throws Exception {
		Integer mno = (Integer)session.getAttribute("mno");
		
		List<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();
		for(int i=1;i<map.size();i++) {
			Map<String, Object> tmpmap = new HashMap<String, Object>();
			if(map.get("ctno"+i)!=null){
				tmpmap.put("mno", mno);
				tmpmap.put("p_month", map.get("pMonth"));
				tmpmap.put("ctno", map.get("ctno"+i));
				tmpmap.put("p_amount", map.get("p_amount"+i));
				dataList.add(tmpmap);
			}
		}
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("insertList", dataList);	// key값=collection의 value값
		abService.setBud(insertMap);
		
		return "redirect:/asset/budRpt?mm="+mm+"";
	}

	// 예산 조회
	@ResponseBody
	@GetMapping(value = "/getBud")
	public List<Map<String, Object>> getBud(@RequestParam("mm") int mm, HttpSession session) throws Exception {
		Integer mno = (Integer)session.getAttribute("mno");
		String pMonth = abService.getPMonth(mm);
		
		// 예산 조회
		List<Map<String, Object>> budList = abService.getBud(mno, pMonth);
		mylog.debug("budList"+budList.toString());
		mylog.debug(pMonth+"__예산 조회 완료");
		return budList;
	}

//	http://localhost:8080/asset/updBud?mm=0
	@GetMapping(value="/updBud")
	public String updBudGET(@RequestParam("mm") int mm, HttpSession session, Model model) throws Exception {
		mylog.debug("updBudGET");
		Integer mno = (Integer)session.getAttribute("mno");

		List<String> ctTopList = abService.getctTop();
		String pMonth = abService.getPMonth(mm);
		
		model.addAttribute("ctTopList", ctTopList);
		model.addAttribute("pMonth", pMonth);
		model.addAttribute("mm", mm);
		return "/asset/budUpdate";
	}
	
	@PostMapping(value = "/updBud")
	public String updBudPOST(@RequestParam("mm") int mm, @RequestParam Map map, HttpSession session) throws Exception {
		Integer mno = (Integer)session.getAttribute("mno");

		// map : form data, tmpmap : 재배치
		List<Map<String, Object>> updateList = new ArrayList<Map<String,Object>>();
		for(int i=1;i<map.size();i++) {
			Map<String, Object> tmpmap = new HashMap<String, Object>();
			if(map.get("ctno"+i)!=null){
				tmpmap.put("pno", map.get("pno"+i));
				tmpmap.put("p_amount", map.get("p_amount"+i));
				updateList.add(tmpmap);
			}
		}
		abService.updBud(updateList);
		
		return "redirect:/asset/budget?mm="+mm+"";
	}

	@GetMapping(value = "/delBud")
	public String delBud(@RequestParam("mm") int mm, HttpSession session) throws Exception {
		Integer mno = (Integer)session.getAttribute("mno");
		String pMonth = abService.getPMonth(mm);
		abService.delBud(mno, pMonth);
		
		return "redirect:/asset/budget?mm="+mm+"";
	}
	
//	http://localhost:8080/asset/budRpt?mm=0
	@GetMapping(value="/budRpt")
	public String budRpt(@RequestParam("mm") int mm, HttpSession session, Model model) throws Exception {
		Integer mno = (Integer)session.getAttribute("mno");
		String nick = userService.getUser(mno).getNick();
		String pMonth = abService.getPMonth(mm);
		
		/////////////// 1. service에서 DB 가져오기 ///////////////
		// 1. 해당 월 예산
		Integer totalBud = abService.totalBud(mno, pMonth);
		
		// 2. 해당 월 지출
		Integer dtSum = rptService.dtSum(mno, mm);
		
		// 3. 해당 월 예상 지출
		Integer expSum = rptService.expSum(mno, mm);
		
		// 4. 일간 통계
		List<Map<String, Object>> day = rptService.day(mno, mm);
		String dayjson = rptService.listMapToJson(day);
		
		/////////////// 2. model로 전달 ///////////////
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalBud", totalBud);
		map.put("dtSum", dtSum);
		map.put("expSum", expSum);
		map.put("dayjson", dayjson);
		model.addAttribute("nick", nick);		
		model.addAttribute("pMonth", pMonth);
		model.addAttribute("map", map);

		return "/asset/budReport";
	}

//	http://localhost:8080/asset/abookCal
	@GetMapping(value="/abookCal")
	public String abookCal(HttpSession session, Model model) throws Exception {
		return "/asset/calendar";
	}
	
	@ResponseBody
	@GetMapping(value="/cal")
	public List<Map<String, Object>> cal(@RequestParam int mm, @RequestParam int inout, HttpSession session) throws Exception {
		int mno = (int)session.getAttribute("mno");
		mylog.debug("mm : "+mm);
		mylog.debug("inout : "+inout);
		
		List<Map<String, Object>> cal = abService.calInout(mno, mm, inout);
		JSONArray jArr = new JSONArray();
		for(Map<String, Object> map : cal) {
			JSONObject jObj = new JSONObject();
			for(Map.Entry<String, Object> entry : map.entrySet()) {
				String key = "";
				String value = String.valueOf(entry.getValue());
				if(entry.getKey().equals("date")) {
					key = "start";
				} else if (entry.getKey().equals("sum")) {
					key = "title";
				} else {
					key = entry.getKey();
				}
				jObj.put(key, value);
			}
			jArr.add(jObj);
		}
//		mylog.debug("jArr"+jArr.toString());
		return jArr;
	}
	
	
	///////////////////MJ////////////////////
}
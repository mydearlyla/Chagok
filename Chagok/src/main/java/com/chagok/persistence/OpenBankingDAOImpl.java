package com.chagok.persistence;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Repository;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.chagok.apiDomain.AccountHistoryRequestVO;
import com.chagok.apiDomain.AccountHistoryResponseVO;
import com.chagok.apiDomain.CardInfoRequestVO;
import com.chagok.apiDomain.CardInfoResponseVO;
import com.chagok.apiDomain.RequestTokenVO;
import com.chagok.apiDomain.ResponseTokenVO;
import com.chagok.apiDomain.UserInfoResponseVO;

@Repository
public class OpenBankingDAOImpl implements OpenBankingDAO{
	private String client_id = "d357debb-9ab8-401d-a882-ce684fb5b3f7"; // 기관 id
	private String client_secret = "a137df94-4001-439a-ab9d-c61f985f6811"; // 기관 pw
	private String redirect_uri = "http://chagok.ga/asset/callback"; // call uri
	private String grant_type = "authorization_code";
	
	private HttpHeaders httpHeaders; // http 헤더 정보 관리 클래스
	private RestTemplate restTemplate; // REST방식 API 요청
	
	private static final Logger mylog = LoggerFactory.getLogger(OpenBankingDAOImpl.class);
	
	// 헤더에 토큰 추가 메서드
	public HttpHeaders setHeaderAccessToken(String access_token) {
		httpHeaders.add("Authorization", "Bearer " + access_token);
		return httpHeaders;
	}
	
	// 사용자 토큰 발급 메서드
	@Override
	public ResponseTokenVO requestToken(RequestTokenVO requestTokenVO) throws Exception {
		// HTTP URL 		https://testapi.openbanking.or.kr/oauth/2.0/token
		// HTTP Method 		POST
		// Content-Type		application/x-www-form-urlencoded; charset=UTF-8
		
		// http header 지정
		httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		// application/x-www-form-urlencoded; charset=UTF-8 객체저장 불가능
		// 파라미터 저장 해서 들고감
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("code", requestTokenVO.getCode());
		parameters.add("client_id", client_id);
		parameters.add("client_secret", client_secret);
		parameters.add("redirect_uri", redirect_uri);
		parameters.add("grant_type", grant_type);
		
		// httpHeaders, parameters 담아서 감 => httpEntity
		HttpEntity<MultiValueMap<String, String>> param = 
				new HttpEntity<MultiValueMap<String,String>>(parameters, httpHeaders);
		
		String requestUrl = "https://testapi.openbanking.or.kr/oauth/2.0/token";
		
		restTemplate = new RestTemplate();
		
		return restTemplate.exchange(requestUrl, HttpMethod.POST, param, ResponseTokenVO.class).getBody();
	}
	
	// 사용자 정보 조회 메서드
	@Override
	public UserInfoResponseVO getUserInfo(ResponseTokenVO responseTokenVO) throws Exception {
		// http header 지정
		httpHeaders = new HttpHeaders();
		restTemplate = new RestTemplate();
		
		String requestUrl = "https://testapi.openbanking.or.kr/v2.0/user/me";
		
		// httpHeaders(token) 담아서 감 => httpEntity
		HttpEntity<String> param = 
				new HttpEntity<String>(setHeaderAccessToken(responseTokenVO.getAccess_token()));
		
		// user_seq_no 파라미터
		// https://testapi.openbanking.or.kr/v2.0/user/me?user_seq_no=11111
		UriComponents uriBuilder = UriComponentsBuilder.fromHttpUrl(requestUrl)
				.queryParam("user_seq_no", responseTokenVO.getUser_seq_no())
				.build();
		
		return restTemplate.exchange(uriBuilder.toString(), 
				HttpMethod.GET, param, UserInfoResponseVO.class).getBody();
	}

	// 사용자 토큰 발급 메서드 (센터용)
	@Override
	public ResponseTokenVO requestTokenCenter(RequestTokenVO requestTokenVO) throws Exception {
		// HTTP URL 		https://testapi.openbanking.or.kr/oauth/2.0/token
		// HTTP Method 		POST
		// Content-Type		application/x-www-form-urlencoded; charset=UTF-8
		
		// http header 지정
		httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		// application/x-www-form-urlencoded; charset=UTF-8 객체저장 불가능
		// 파라미터 저장 해서 들고감
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("client_id", client_id);
		parameters.add("client_secret", client_secret);
		parameters.add("scope", "oob");
		parameters.add("grant_type", "client_credentials");
		
		// httpHeaders, parameters 담아서 감 => httpEntity
		HttpEntity<MultiValueMap<String, String>> param = 
				new HttpEntity<MultiValueMap<String,String>>(parameters, httpHeaders);
		
		String requestUrl = "https://testapi.openbanking.or.kr/oauth/2.0/token";
		
		restTemplate = new RestTemplate();
		
		return restTemplate.exchange(requestUrl, HttpMethod.POST, param, ResponseTokenVO.class).getBody();
	}
	
	// 계좌 내역 조회
	@Override
	public List<AccountHistoryResponseVO> getAccountHistory(List<AccountHistoryRequestVO> list) throws Exception {
		
		httpHeaders = new HttpHeaders();
		restTemplate = new RestTemplate();
		
		LocalDateTime now = LocalDateTime.now();
		
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
		String requestUrl = "https://testapi.openbanking.or.kr/v2.0/account/transaction_list/fin_num";
		
		List<AccountHistoryResponseVO> accountHistoryResponseList = new ArrayList<AccountHistoryResponseVO>();
		
		for (int i = 0; i < list.size(); i++) {
			
			HttpEntity<String> param = 
					new HttpEntity<String>(setHeaderAccessToken(list.get(i).getAccess_token()));
			UriComponents uriBuilder = UriComponentsBuilder.fromHttpUrl(requestUrl)
					.queryParam("bank_tran_id", list.get(i).getBank_tran_id())
					.queryParam("fintech_use_num", list.get(i).getFintech_use_num())
					.queryParam("inquiry_type", list.get(i).getInquiry_type())
					.queryParam("inquiry_base", list.get(i).getInquiry_base())
					.queryParam("from_date", list.get(i).getFrom_date())
					.queryParam("to_date", list.get(i).getTo_date())
					.queryParam("sort_order", list.get(i).getSort_order())
					.queryParam("tran_dtime", formatedNow)
					.build();
			
			accountHistoryResponseList.add(restTemplate.exchange(uriBuilder.toString(), 
					HttpMethod.GET, param, AccountHistoryResponseVO.class).getBody());
		}
		
		return accountHistoryResponseList;
	}
	
	// 카드 목록 조회
	@Override
	public CardInfoResponseVO getCardInfo(CardInfoRequestVO cardInfoRequestVO) throws Exception {
		
		httpHeaders = new HttpHeaders();
		restTemplate = new RestTemplate();
		
		
		String requestUrl = "https://testapi.openbanking.or.kr/v2.0/cards";
		
		// httpHeaders(token) 담아서 감 => httpEntity
		HttpEntity<String> param = 
				new HttpEntity<String>(setHeaderAccessToken(cardInfoRequestVO.getAccess_token()));
		
		UriComponents uriBuilder = UriComponentsBuilder.fromHttpUrl(requestUrl)
				.queryParam("bank_tran_id", cardInfoRequestVO.getBank_tran_id())
				.queryParam("user_seq_no", cardInfoRequestVO.getUser_seq_no())
				.queryParam("bank_code_std", cardInfoRequestVO.getBank_code_std())
				.queryParam("member_bank_code", cardInfoRequestVO.getMember_bank_code())
				.build();
		
		return restTemplate.exchange(uriBuilder.toString(), 
				HttpMethod.GET, param, CardInfoResponseVO.class).getBody();
	}

	
	
	
	
	
	
}

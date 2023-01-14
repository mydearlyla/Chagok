package com.chagok.controller;

import java.net.URI;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
public class NewsAPIController {
	
	private String id = "4unUam3jJHrdRVqHxP8y";
	private String secret = "Ko_dMfdbp7";
	
	private static final Logger mylog = LoggerFactory.getLogger(NewsAPIController.class);
	
	@GetMapping(value = "/news", produces = "application/text; charset=UTF-8")
	public String getNaverNews(HttpServletResponse response) throws Exception{
		
		String query = "경제"; // 검색어 utf-8로 인코딩 해야함
		mylog.debug("@@@@@@@@@@@@@@@ 인코딩전 : " + query);
		ByteBuffer buffer = StandardCharsets.UTF_8.encode(query);
		String encode = StandardCharsets.UTF_8.decode(buffer).toString();
//		String encode = URLEncoder.encode(query, "UTF-8");
		
		URI uri = UriComponentsBuilder.fromUriString("https://openapi.naver.com")
				.path("/v1/search/news.json")
				.queryParam("query",encode)
				.queryParam("display",3)
				.queryParam("start",1)
				.queryParam("sort","sim")
				.build()
				.encode()
				.toUri();
		
		RestTemplate template = new RestTemplate();
		
		// 헤더 설정
		RequestEntity<Void> req = RequestEntity.get(uri)
								.header("X-Naver-Client-Id", id)
								.header("X-Naver-Client-Secret", secret)
								.header("Content-Type", "text/xml;charset=utf-8")
								.build();
		
		ResponseEntity<String> result = template.exchange(req, String.class);
		
		response.setCharacterEncoding("UTF-8");
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParser.parse(result.getBody());
		
		JSONArray items = (JSONArray)jsonObject.get("items");
		
		return items.toJSONString();
	}
	
}

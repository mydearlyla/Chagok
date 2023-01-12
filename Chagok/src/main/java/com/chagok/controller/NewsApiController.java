//package com.chagok.controller;
//
//import java.net.URI;
//import java.nio.charset.StandardCharsets;
//import java.util.Base64;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.RequestEntity;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.client.RestTemplate;
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.util.UriComponentsBuilder;
//
//import com.chagok.service.NewsService;
//
//import lombok.extern.slf4j.Slf4j;
//
//   
//import java.io.*;
//import java.net.HttpURLConnection;
//import java.net.MalformedURLException;
//import java.net.URL;
//import java.net.URLEncoder;
//import java.util.HashMap;
//import java.util.Map;
//
//@Controller("/naver")
//public class NewsApiController {
//
//	 @Autowired
//	    private NewsService service; 
//	    
//	    //키워드가 있을때도 있고 없을때도있음 
//	    //있을때는 가져가고 없을때는 안가져가고 
//	    @RequestMapping(value="/naver/newsboard")
//	    public ModelAndView bookList(@RequestParam(required=false)String keyword){
//	        ModelAndView mav = new ModelAndView();
//	        
//	        if(keyword !=null)
//	        {
//	            mav.addObject("NewsList",service.searchNews(keyword,10,1));
//	        }
//	        mav.setViewName("NewsList");
//	        return mav;
//	    }
//   
//}
//
//
//
//

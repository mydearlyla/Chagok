package com.chagok.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SecurityController {
	
	private static final Logger mylog = LoggerFactory.getLogger(SecurityController.class);

	// http://localhost:8080/admin
	@RequestMapping(value = "/admin", method=RequestMethod.GET)
	public void admin() throws Exception{
		mylog.debug(" admin () 실행 - 관리자만 사용가능 ");
	}
	
	@RequestMapping(value = "/user", method=RequestMethod.GET)
	public void user() throws Exception{
		mylog.debug(" user() 실행 - 회원만 사용가능 ");
	}
	
	@RequestMapping(value = "/all", method=RequestMethod.GET)
	public void all() throws Exception{
		mylog.debug(" all() 실행 - 모두 사용가능 ");
	}
	
}

package com.chagok.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.jaas.AuthorityGranter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	
	private static final Logger mylog = LoggerFactory.getLogger(CustomLoginSuccessHandler.class);
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {

		mylog.debug("로그인 성공");
		
		List<String> roleName = new ArrayList<String>();
		
		auth.getAuthorities().forEach(authority -> {
			
			roleName.add(authority.getAuthority());
		});
		
		mylog.debug("ROLE NAMES : " + roleName);
		
		if(roleName.contains("ROLE_ADMIN")) {
			
			response.sendRedirect("/admin");
			return;
		}
		
		if(roleName.contains("ROLE_MEMBER")) {
			
			response.sendRedirect("/commumain");
			return;
		}
		
		response.sendRedirect("/main");
		
	}
}

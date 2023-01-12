package com.chagok.interceptor;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.apache.commons.lang3.StringUtils;
import org.springframework.messaging.handler.HandlerMethod;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;

import com.chagok.domain.ChallengeVO;

public class AuthInterceptor extends HandlerInterceptorAdapter implements SessionNames {
	
	// 세션은 request 안에 존재
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			System.out.println("AuthInterceptor.pre>> "+request.getRequestURI() );
			
			HttpSession session = request.getSession();
			
			if(session.getAttribute(LOGIN) == null) {
				String uri = request.getRequestURI(); // /challenge/plusdetail
				String query = request.getQueryString(); // cno=1
				if(StringUtils.isNotEmpty(query))
					uri += "?"+ query;
				
				session.setAttribute(ATTEMPTED, uri);
				
				response.sendRedirect("/login");
			}
			
			return true;
		}

}
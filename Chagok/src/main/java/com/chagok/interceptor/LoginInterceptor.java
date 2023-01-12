package com.chagok.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter implements SessionNames {
	
	// 세션은 request 안에 존재
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			System.out.println("LoginInterceptor.pre>>  "+request.getRequestURI() );
			System.out.println("LoginInterceptor.pre>>  " +handler);
			
			HttpSession session = request.getSession();
			
			if(session.getAttribute(SessionNames.LOGIN) != null) {
				session.removeAttribute(LOGIN);
			}
			
			return true;
		}
		
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {
			System.out.println("LoginInterceptor.post ");
			
//			HandlerMethod method = (HandlerMethod) handler;
//			System.out.println("MMMM >>>> Bean : "+ method.getBean() + ", Method : "+ method.getMethod());
//			System.out.println("MMMM >>>> Model : "+ modelAndView);
			
			HttpSession session = request.getSession();
			
			ModelMap modelMap = modelAndView.getModelMap();
			Object userVO = modelMap.get("UserVO");
			System.out.println("LoginInterceptor.post>> "+userVO);
			
			if(userVO != null) {
				session.setAttribute(LOGIN, userVO);
				if(StringUtils.isNoneEmpty(request.getParameter("useCookie"))) {
					Cookie logCookie = new Cookie(LOGIN_COOKIE, session.getId());
					logCookie.setPath("/"); // 경로
					logCookie.setMaxAge(7 * 24 * 60 * 60); // 7일
					
					response.addCookie(logCookie);
				}
				
				String attempted = (String)session.getAttribute(ATTEMPTED);
				if(StringUtils.isNotEmpty(attempted)) {
					System.out.println("attempted안 ");
					
					response.sendRedirect(attempted);
					session.removeAttribute(ATTEMPTED);
				}else {
					System.out.println("메인으로 ");
					
					response.sendRedirect("/main"); /* QQQ 주소어디로 바꿀지 생각해볼 것*/
				}
			}
		}

}
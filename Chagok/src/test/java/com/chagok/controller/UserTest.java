package com.chagok.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chagok.domain.UserVO;
import com.chagok.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class UserTest {
	@Inject
	private UserDAO dao;
	
	//@Test
	public void 시간정보조회하기() {
		System.out.println(dao.getServerTime());
	}
	
	// 회원정보저장(Create)
	//@Test
	public void createUser() throws Exception {

		// 회원정보 생성(사용자 입력 정보) // 현재 없는 단계이므로 테스트용으로 만든 상태
		UserVO vo = new UserVO();
		vo.setId("user2@user.com");
		vo.setPw("1234222");
		vo.setNick("사용자02");
		
		dao.createUser(vo);
	}
		
		// 특정 회원의 모든정보를 조회
		//@Test
		public void getUserInfo() throws Exception {
			
			UserVO vo = dao.getUser("user@user.com");
			
			System.out.println(" Test : " +vo);
		}
		
		// 로그인 처리
		@Test
		public void loginMember() throws Exception {
			
//			UserVO insertVO = new UserVO();
//			insertVO.setId("user2@user.com");
//			insertVO.setPw("1234222");
			Map<String, String> loginMap = new HashMap<String, String>();
			loginMap.put("id", "user@user.com");
			loginMap.put("pw", "12341234");
			UserVO vo2 = dao.loginUserCheck(loginMap);
			
			if(vo2 != null) {
				System.out.println(" 로그인 성공! ");
			}else {
				System.out.println(" 로그인 실패!");
			}
		}
		
}

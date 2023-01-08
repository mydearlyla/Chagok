package com.chagok.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chagok.domain.FeedDTO;
import com.chagok.domain.MessageVO;
import com.chagok.domain.UserVO;
import com.chagok.persistence.FeedDAO;
import com.chagok.persistence.UserDAO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/security-context.xml"
					})
public class UserTest {
	@Inject
	private UserDAO dao;
	
	@Inject
	private FeedDAO fdao;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Autowired
	private DataSource ds;
	
	
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
		//@Test
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
		
		// 지난 채팅 조회
		//@Test
		public void getMsgList() throws Exception{
			//MessageVO messageVO = new MessageVO();
			//FeedDTO dto = new FeedDTO();
			//dto.setCno(2);
			Integer cno = 2;
			fdao.getMsgList(cno);
		}
		
		//@Test
		public void testInsertMember() {
			String sql = "insert into user(id,pw,nick) values(?,?,?)";
			
			for(int i = 0; i < 10; i++) {
				Connection con = null;
				PreparedStatement pstmt = null;
				
				try {
					con = ds.getConnection();
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(2, pwencoder.encode("pw"+i));
					
					if(i < 8) {
						pstmt.setString(1, "user"+i);
						pstmt.setString(3, "일반사용자"+i);
						
					}else if(i < 9) {
						pstmt.setString(1, "manager"+i);
						pstmt.setString(3, "운영자"+i);
					
					}else {
						pstmt.setString(1, "admin"+i);
						pstmt.setString(3, "관리자"+i);
						
					}
					
					pstmt.executeUpdate();

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if(pstmt != null) { try { pstmt.close();} catch (Exception e) {}}
					if(con != null) { try { con.close();} catch (Exception e) {}}
			}
		}
	}
		
		@Test
		public void testInsertAuth() {
			String sql = "update user set authority=? where id=?";
			
			
			for(int i = 0; i < 10; i++) {
				Connection con = null;
				PreparedStatement pstmt = null;
				
				try {
					con = ds.getConnection();
					pstmt = con.prepareStatement(sql);
					
					if(i < 8) {
						pstmt.setString(1, "ROLE_USER");
						pstmt.setString(2, "user"+i);
						
					}else if(i < 9) {
						pstmt.setString(1, "ROLE_MEMBER");
						pstmt.setString(2, "manager"+i);
						
					}else {
						pstmt.setString(1, "ROLE_ADMIN");
						pstmt.setString(2, "admin"+i);
						
					}
					
					pstmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if(pstmt != null) { try { pstmt.close();} catch (Exception e) {}}
					if(con != null) { try { con.close();} catch (Exception e) {}}
				}
			}
		}
		
}

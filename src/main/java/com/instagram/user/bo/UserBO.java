package com.instagram.user.bo;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.user.dao.UserDAO;
import com.instagram.user.model.User;

@Service
public class UserBO {
	
	User[] users = new User[1000];
	
	@Autowired
	private UserDAO userDAO;
	
	// 회원가입
	public int addUser(String email, String name, String loginId, String password) {
		return userDAO.insertUser(email, name, loginId, password);
	}
	
	// 로그인 아이디 유효성 검사
	public int existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	// 로그인
	public User getUserByLoginIdPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdPassword(loginId, password);
	}
	
	// 유저 정보를 가져오는 객체
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}
	
	// 유저 추천 리스트
	public List<User> getUserList() {
		
		int userIndex = 0;
		
		for (int i = 0; i < 1000; i++) {
			User user = new User();
			user.setName("userName");
			user.setId(i + 1);
			users[userIndex++] = user;
		}
		
		return userDAO.selectUserList();
	}
	
	public void mix() {
		Random rnd = new Random();
		for (int i = 0; i < 1000; i++) {
			int rndIndex = rnd.nextInt(4);
			User user = users[0];
			users[0] = users[rndIndex];
			users[rndIndex] = user;
		}
	}
}
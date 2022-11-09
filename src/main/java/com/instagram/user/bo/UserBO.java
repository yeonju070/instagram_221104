package com.instagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.user.dao.UserDAO;
import com.instagram.user.model.User;

@Service
public class UserBO {
	
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
}

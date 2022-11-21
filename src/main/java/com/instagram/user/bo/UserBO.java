package com.instagram.user.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

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
	
	// 유저 추천 리스트
	public List<User> getRecommentUserList(int userId) {
		
		// 유저 리스트
		List<User> userList = userDAO.selectUserList();
		
		// 유저 리스트가 비어있을 경우
		if (ObjectUtils.isEmpty(userList)) {
			return new ArrayList<>();
		}
		
		// 나 자신은 리스트에서 제거
		for (int i = 0; i < userList.size(); i++) {
			if (userList.get(i).getId() == userId) {
				userList.remove(i);
				return userList;
			}
		}
		
		// 유저 랜덤 추천
		Random rnd = new Random();
	
		for (int i = 0; i < 50; i++) {
			int rndIndex = rnd.nextInt(userList.size());
			User tempUser = userList.get(0);
			userList.set(0, userList.get(rndIndex));	// 0번째 index에 랜덤 index입력
			userList.set(rndIndex, tempUser);			// 랜덤으로 섞인 index에 tempUser를 넣는다.
			
		}
		
		// 유저가 4명이상 리스트에 담겨있는지 체크
		if (userList.size() < 4) {
			return userList;
		}
		
		// 4명의 유저만 추천
		List<User> userRecommentList = new ArrayList<>();
		for (int i = 0; i < 4; i++) {
			userRecommentList.add(userList.get(i));
		}
		
		return userRecommentList;
	}
}
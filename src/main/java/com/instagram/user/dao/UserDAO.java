package com.instagram.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.instagram.user.model.User;

@Repository
public interface UserDAO {

	// 회원가입
	public int insertUser(
			@Param("email") String email,
			@Param("name") String name,
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	// 유효성 검사
	public int existLoginId(String loginId);
	
	// 로그인
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	// 유저 정보를 가져오는 객체
	public User selectUserById(int id);
	
	// 유저 추천 리스트
	public List<User> selectUserList();
}
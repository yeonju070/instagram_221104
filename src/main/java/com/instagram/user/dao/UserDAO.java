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
	
	// 유저 정보를 가져오는 메소드
	public User selectUserById(int id);
	
	// 유저 추천 리스트
	public List<User> selectUserList();
	
	// 유저 프로필 사진 업로드
	public int updateUserProfileImagePathByUserId(
			@Param("id") int id,
			@Param("imagePath") String imagePath);
	
	// 화면에 뿌릴 유저 정보
	public List<User> selectUserListByUserId(int id);
	
	// 유저 프로필 이미지 삭제
	public int updateDeleteUserProfileImagePathByUserId(int id);
	
	// 유저 프로필 정보
	public int updateUserProfileDetailByUserId(
			@Param("id") int id,
			@Param("name") String name,
			@Param("loginId") String loginId,
			@Param("introduce") String introduce,
			@Param("email") String email,
			@Param("phoneNumber") String phoneNumber);
}
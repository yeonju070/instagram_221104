package com.instagram.user.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import com.instagram.common.FileManagerService;
import com.instagram.follow.bo.FollowBO;
import com.instagram.follow.model.Follow;
import com.instagram.user.dao.UserDAO;
import com.instagram.user.model.User;

@Service
public class UserBO {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private FollowBO followBO;
	
	@Autowired
	private FileManagerService fileManager;
	
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
	
	// 유저 정보를 가져오는 메소드
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}
	
	// 유저 추천 리스트
	public List<User> getRecommentUserList(int userId) {
		
		// 유저 리스트
		List<User> userList = userDAO.selectRecommentUserList();
		
		// 유저 리스트가 비어있을 경우
		if (ObjectUtils.isEmpty(userList)) {
			return new ArrayList<>();
		}
		
		// 나 자신은 리스트에서 제거
		for (int i = 0; i < userList.size(); i++) {
			if (userList.get(i).getId() == userId) {
				userList.remove(i);
			}
		}
		
		// 팔로우 한 유저 레스트에서 제거
		for (int i = 0; i < userList.size(); i++) {
			if (followBO.checkFollow(userId, userList.get(i).getId()) == true) {
				userList.remove(i);
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
	
	// 유저(나 자신) 프로필 사진 업로드
	public int updateUserProfileImagePathByUserId(int userId, String userLoginId,
			MultipartFile file) {
		
		// 나의 정보 가져오기
		User user = getUserById(userId);
		if (user == null) {
			log.warn("[add user] 추가할 프로필 이미지가 없습니다. userId:{}", userId);
			return 0;
		}
		
		String imagePath = null;
		
		// 파일이 없을 시
		if (file == null) {
			log.warn("[update user imagePath] 업데이트할 프로필 이미지가 없습니다. userId:{}", userId);
			return 0;
		}
		
		// 성공시 추가
		imagePath = fileManager.saveFile(userLoginId, file);
		
		// 성공시 기존 이미지 제거
		if (imagePath != null && user.getImagePath() != null) {
			fileManager.deleteFile(user.getImagePath());
		}

		
		return userDAO.updateUserProfileImagePathByUserId(userId, imagePath);
	}
	
	// profileDetail에 뿌릴 유저 정보
	public List<User> getUserListByUserId(int userId) {
		return userDAO.selectUserListByUserId(userId);
	}
	
	// 프로필 이미지 삭제
	public int updateDeleteUserProfileImagePathByUserId(int userId) {
		
		// 나의 정보 가져오기
		User user = getUserById(userId);
		if (user == null) {
			log.warn("[add user] 추가할 프로필 이미지가 없습니다. userId:{}", userId);
			return 0;
		}
		
		return userDAO.updateDeleteUserProfileImagePathByUserId(userId);
	}
	
	// 프로필 상세 업데이트
	public int updateUserProfileDetailByUserId(int userId, String name, String loginId,
			String introduce, String email, String phoneNumber) {
		
		return userDAO.updateUserProfileDetailByUserId(userId, name, loginId,
				introduce, email, phoneNumber);
	}
	
	// message에 보낼 팔로우한 user의 리스트
	public List<User> getFollowUserList(int userId, String search) {
		
		// 유저 리스트
		List<User> userList = userDAO.selectRecommentUserList();
		
		// 유저 리스트가 비어있을 경우
		if (ObjectUtils.isEmpty(userList)) {
			return new ArrayList<>();
		}
		
		// 나 자신은 리스트에서 제거
		for (int i = 0; i < userList.size(); i++) {
			if (userList.get(i).getId() == userId) {
				userList.remove(i);
			}
		}
		
		// 팔로우 한 유저만 리스트에 출력
		for (int i = 0; i < userList.size(); i++) {
			if (followBO.checkFollow(userId, userList.get(i).getId()) == true) {
				userList.get(i);
			} else {
				userList.remove(i);
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
	
	// 나를 팔로우한 유저 리스트
	public List<User> getFolloweeUserList(int userId) {
		
		// 유저 리스트
		List<Follow> followList = followBO.getFollowListByFolloweeId(userId);
		
		// 유저 리스트가 비어있을 경우
		if (ObjectUtils.isEmpty(followList)) {
			return new ArrayList<>();
		}
		
		// 나를 팔로우 한 유저만 리스트에 출력
		for (int i = 0; i < followList.size(); i++) {
			int userList = followList.get(i).getFollowerId();
		}
	}
}
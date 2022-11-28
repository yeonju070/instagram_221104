package com.instagram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.instagram.common.EncryptUtils;
import com.instagram.user.bo.UserBO;
import com.instagram.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 회원 가입
	@RequestMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("email") String email,
			@RequestParam("name") String name,
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {

		String encryptPassword = EncryptUtils.md5(password);
		int row = userBO.addUser(email, name, loginId, encryptPassword);

		Map<String, Object> result = new HashMap<>();
		if (row == 1) {
			result.put("code", 100);
		} else {
			result.put("errorMessage", "회원 가입에 실패했습니다. 다시 입력해주세요.");
		}
		return result;
	}
	
	// 로그인
	@RequestMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		
		String encryptPassword = EncryptUtils.md5(password);
		User user = userBO.getUserByLoginIdPassword(loginId, encryptPassword);
		
		Map<String, Object> result = new HashMap<>();
		
		if (user != null) {
			result.put("code", 100);
			// session에 유저 정보담기(로그인 상태 유지)
			HttpSession session = request.getSession();
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());	
			session.setAttribute("userId", user.getId());	
		} else {
			result.put("errorMessage", "해당 유저가 존재하지않습니다. 다시 입력해주세요.");
		}
		
		return result;
	}
	
	// 로그인 중복 확인
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		int existRowCount = userBO.existLoginId(loginId);
		if (existRowCount > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}
	
	// 프로필 사진 업로드
	@PutMapping("/imagePath_update")
	public Map<String, Object> imagePathUpdate(
			@RequestParam("file") MultipartFile file,
			HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		String userLoginId =  (String)session.getAttribute("userLoginId");
		
		int row = userBO.updateUserProfileImagePathByUserId(userId, userLoginId, file);
		
		Map<String, Object> result = new HashMap<>();
		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("code", 400);
			result.put("errorMessage", "프로필 사진 업로드에 실패했습니다.");
		}
		
		return result;
	}
	
	// 프로필 사진 삭제
	@PutMapping("/imagePath_delete")
	public Map<String, Object> imagePathDelete(HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		int userId = (int)session.getAttribute("userId");
		
		int row = userBO.updateDeleteUserProfileImagePathByUserId(userId);
		
		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("code", 400);
			result.put("errorMessage", "프로필 사진 업로드에 실패했습니다.");
		}
		
		return result;
	}
	
	// 프로필 상세 영역
	@PostMapping("/profile_update")
	public Map<String, Object> profileUpdate(
			@RequestParam("name") String name,
			@RequestParam("loginId") String loginId,
			@RequestParam(value="introduce", required=false) String introduce,
			@RequestParam("email") String email,
			@RequestParam(value="phoneNumber", required=false) String phoneNumber,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		int userId = (int)session.getAttribute("userId");
		
		int row = userBO.updateUserProfileDetailByUserId(userId, name,
				loginId, introduce, email, phoneNumber);
		
		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("code", 400);
			result.put("errorMessage", "프로필 사진 업로드에 실패했습니다.");
		}
		
		return result;
	}
}
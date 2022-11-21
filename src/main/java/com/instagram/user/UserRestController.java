package com.instagram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.instagram.common.EncryptUtils;
import com.instagram.user.bo.UserBO;
import com.instagram.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	/*
	 * 회원 가입
	 */
	@RequestMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {

		String encryptPassword = EncryptUtils.md5(password);
		int row = userBO.addUser(loginId, encryptPassword, name, email);

		Map<String, Object> result = new HashMap<>();
		if (row == 1) {
			result.put("code", 100);
		} else {
			result.put("error", "입력 실패");
		}
		return result;
	}
	
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
			result.put("error", "입력 실패");
		}
		return result;
	}
	
	/*
	 * 로그인 중복 확인
	 */
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
}
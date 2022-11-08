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
	 * 회원가입
	 * email
	 * name
	 * loginName
	 * password
	 */
	@RequestMapping("sign_up")
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
			result.put("error", "회원 가입 실패");
		}
		return result;
	}
	
	/*
	 * 로그인 중복 확인
	 */
	@RequestMapping("is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		
		int existCount = userBO.existLoginId(loginId);
		if (existCount > 0) {
			result.put("code", 100);
		} else {
			result.put("error", "입력 실패");
		}

		return result;
	}
	
	/*
	 * 로그인
	 * loginId
	 * password
	 */
	
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
			HttpSession session = request.getSession();
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userPassword", user.getPassword());
			session.setAttribute("userName", user.getName());
		} else {
			result.put("error", "입력 실패");
		}
		
		return result;
	}
}

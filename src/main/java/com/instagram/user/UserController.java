package com.instagram.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.instagram.timeline.bo.TimelineBO;
import com.instagram.timeline.model.CardView;
import com.instagram.user.bo.UserBO;
import com.instagram.user.model.User;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Autowired
	private TimelineBO timelineBO;
	
	@Autowired
	private UserBO userBO;
	
	// 회원가입 화면
	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "user/signUp");
		return "template/logInLayout";
	}
	
	// 로그인 화면
	@RequestMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("viewName", "user/signIn");
		return "template/logInLayout";
	}
	
	// 로그아웃
	@RequestMapping("/sign_out")
	public String signOut(HttpSession session) {
		// 로그아웃
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		session.removeAttribute("userId");
		return "redirect:/user/sign_in_view";
	}
	
	// 유저 프로필 화면
	@RequestMapping("/profile_view")
	public String profileView(
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		// cardView 화면에 뿌리기
		List<CardView> cardViewList = timelineBO.generateCardList(userId);
		
		// userList 화면에 뿌리기
		List<User> userList = userBO.getUserListByUserId(userId);
		
		model.addAttribute("userList", userList);
		model.addAttribute("cardList", cardViewList);
		model.addAttribute("viewName", "user/profile");
		return "template/layout";
	}
	
	// 유저 프로필 디테일 화면
	@RequestMapping("/profile_detail_view")
	public String profileDetailView(
			Model model,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		// cardView 화면에 뿌리기
		List<CardView> cardViewList = timelineBO.generateCardList(userId);
		
		// userList 화면에 뿌리기
		List<User> userList = userBO.getUserListByUserId(userId);
		
		model.addAttribute("userList", userList);
		model.addAttribute("cardList", cardViewList);
		model.addAttribute("viewName", "user/profileDetail");
		return "template/layout";
	}
}
package com.instagram.message;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.instagram.user.bo.UserBO;
import com.instagram.user.model.User;

@RequestMapping("/message")
@Controller
public class MessageController {
	
	@Autowired
	private UserBO userBO;

	// 메시지화면
	@RequestMapping("/message_list")
	public String messageListView(
			@RequestParam(value="userSearch", required=false) String userSearch,
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		// 팔로우한 userList(전체) 타임라인에 뿌리기
		List<User> userList = userBO.getFollowUserList(userId, userSearch);
		
		model.addAttribute("userSearch", userSearch);
		model.addAttribute("userList", userList);
		model.addAttribute("viewName", "message/messageList");
		return "template/layout";
	}
	
	// 채팅방 화면
	@PostMapping("/message_inbox_list")
	public String messageSendListView(
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		// userList(전체) 타임라인에 뿌리기
		List<User> userList = userBO.getFollowUserList(userId, null);
		
		model.addAttribute("userList", userList);
		model.addAttribute("viewName", "message/messageInbox");
		return "template/layout";
	}
}

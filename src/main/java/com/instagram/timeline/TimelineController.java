package com.instagram.timeline;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.instagram.timeline.bo.TimelineBO;
import com.instagram.timeline.model.CardView;
import com.instagram.user.bo.UserBO;
import com.instagram.user.model.User;

@RequestMapping("/timeline")
@Controller
public class TimelineController {
	
	@Autowired
	private TimelineBO timelineBO;
	
	@Autowired
	private UserBO userBO;
	
	// 타임라인 화면
	@RequestMapping("/timeline_view")
	public String timelineView(
			@RequestParam(value="search", required=false) String search,
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		// cardView 타임라인에 뿌리기
		List<CardView> cardViewList = timelineBO.generateCardList(userId, search);
		
		// userList(전체) 타임라인에 뿌리기
		List<User> userList = userBO.getRecommentUserList(userId);
		
		// userInfoList(유저 하나의 정보) 타임라인에 뿌리기
		List<User> userInfoList = userBO.getUserListByUserId(userId);
		
		model.addAttribute("userInfoList", userInfoList);
		model.addAttribute("userList", userList);
		model.addAttribute("cardList", cardViewList);
		model.addAttribute("viewName", "timeline/timeline");
		return "template/layout";
	}
}
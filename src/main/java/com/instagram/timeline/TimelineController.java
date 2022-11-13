package com.instagram.timeline;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.instagram.post.bo.PostBO;
import com.instagram.post.model.Post;
import com.instagram.timeline.bo.TimelineBO;
import com.instagram.timeline.model.CardView;

@RequestMapping("/timeline")
@Controller
public class TimelineController {
	
	@Autowired
	private TimelineBO timelineBO;
	
	/*
	 * 타임라인 화면
	 */
	@RequestMapping("/timeline_view")
	public String timelineView(
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		List<CardView> cardViewList = timelineBO.generateCardList(userId);
		
		model.addAttribute("cardList", cardViewList);
		model.addAttribute("viewName", "timeline/timeline");
		return "template/layout";
	}
}

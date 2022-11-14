package com.instagram.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.instagram.timeline.bo.TimelineBO;
import com.instagram.timeline.model.CardView;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	private TimelineBO timelineBO;

	@RequestMapping("/post_create_view")
	public String postCreateView(
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		model.addAttribute("viewName", "post/postCreate");
		return "template/layout";
	}
	
	@RequestMapping("/post_detail_view")
	public String postDetailView(
			@RequestParam("postId") int postId,
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		// postId에 대한 하는 데이터값
		// Post post = postBO.getPostByPostIdAndUserId(postId, userId);
		
		// CardView 타임라인에 뿌리기
		List<CardView> cardViewList = timelineBO.generateCardList(userId);
		
		model.addAttribute("cardList", cardViewList);
		model.addAttribute("viewName", "post/postDetail");
		return "template/layout";
	}
}

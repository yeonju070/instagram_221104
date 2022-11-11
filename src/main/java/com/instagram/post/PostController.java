package com.instagram.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.instagram.timeline.bo.TimelineBO;
import com.instagram.timeline.model.CardView;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	private TimelineBO timelineBO;

	@RequestMapping("/post_create_view")
	public String signUpView(
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		model.addAttribute("viewName", "post/postCreate");
		return "template/layout";
	}
}

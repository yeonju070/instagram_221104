package com.instagram.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/post")
@Controller
public class PostController {

	@RequestMapping("/post_create_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "post/postCreate");
		return "template/layout";
	}
}

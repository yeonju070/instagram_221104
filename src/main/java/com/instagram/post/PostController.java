package com.instagram.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.instagram.post.bo.PostBO;
import com.instagram.post.model.Post;
import com.instagram.user.bo.UserBO;
import com.instagram.user.model.User;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;

	@RequestMapping("/post_create_view")
	public String postCreateView(
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		// userInfoList(유저 하나의 정보) 타임라인에 뿌리기
		List<User> userInfoList = userBO.getUserListByUserId(userId);
		
		model.addAttribute("userInfo", userInfoList);
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
		
		// postList 타임라인에 뿌리기
		List<Post> postList = postBO.getPostListByPostIdAndUserId(postId, userId);
		
		// userInfoList(유저 하나의 정보) 타임라인에 뿌리기
		List<User> userInfoList = userBO.getUserListByUserId(userId);
		
		model.addAttribute("userInfo", userInfoList);
		model.addAttribute("postList", postList);
		model.addAttribute("viewName", "post/postDetail");
		return "template/layout";
	}
}
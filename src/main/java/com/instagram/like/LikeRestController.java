package com.instagram.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.instagram.like.bo.LikeBO;

@RestController
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;

	@RequestMapping("/like/{postId}")
	public Map<String, Object> like(
			@PathVariable int postId,
			HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
				
		Map<String, Object> result = new HashMap<>();
		likeBO.likeToggle(postId, userId);
		
		result.put("code", 100); // 성공
		result.put("result", "success");
		
		return result;
	}
}

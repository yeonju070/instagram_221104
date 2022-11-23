package com.instagram.follow;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.instagram.follow.bo.FollowBO;

@RestController
public class FollowRestController {
	
	@Autowired
	private FollowBO followBO;
	
	@RequestMapping("/follow/{followeeId}")
	public Map<String, Object> follow(
			@PathVariable int followeeId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		Integer followerId = (Integer)session.getAttribute("userId"); // 팔로우 하려는 나의 아이디
		
		followBO.followToggle(followerId, followeeId);
		
		result.put("code", 100);
		
		return result;
	}
}

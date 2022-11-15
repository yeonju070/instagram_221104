//package com.instagram.follow;

//import javax.servlet.http.HttpSession;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;

//@Controller
//public class FollowController {
	
//	private Logger log = LoggerFactory.getLogger(this.getClass());

//	@PostMapping("/follow/{followerId}")
//	public String follow(
//			@PathVariable String followerId,
//			@PathVariable String followeeId,
//			HttpSession session,
//			Model model) throws Exception {
		
//		log.info("/follow/" + followerId + " : 팔로우 요청");
		
//		Integer userLoginId = (Integer)session.getAttribute("userLoginId");
//		Integer activeUser = userLoginId;
//	}
//}
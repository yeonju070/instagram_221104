package com.instagram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.instagram.post.bo.PostBO;

@RequestMapping("/post")
@RestController
public class PostRestController {
	
	@Autowired
	private PostBO postBO;

	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("content") String content,
			@RequestParam("file") MultipartFile file,
			HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		String userLoginId = (String) session.getAttribute("userLoginId");
		
		Map<String, Object> result = new HashMap<>();
		
		postBO.addPost(userId, userLoginId, content, file);
		result.put("code", 100);
		
		return result;
	}
	
	// 게시글 수정
	@PutMapping("/update")
	public Map<String, Object> update(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		String userLoginId =  (String)session.getAttribute("userLoginId");
		
		int row = postBO.updatePost(postId, userId, userLoginId, content, file);
		
		Map<String, Object> result = new HashMap<>();
		if (row > 0) {
			result.put("code", 100);
		} else {
			result.put("code", 400);
			result.put("errorMessage", "게시글 수정에 실패했습니다.");
		}
		
		return result;
	}
	
	// 게시글 삭제
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int postId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 300);
			result.put("errorMessage", "로그인 후 이용해주세요.");
			return result;
		}
		
		postBO.deletePostByPostIdAndUserId(postId, userId);
		result.put("code", 100);
		
		return result;
	}
}
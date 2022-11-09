package com.instagram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.instagram.common.FileManagerService;
import com.instagram.post.dao.PostDAO;
import com.instagram.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManager;

	public int addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String imagePath = null;
		if (file == null) {
			imagePath = fileManager.saveFile(userLoginId, file);
		}
		
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	// post list 가져오는 객체
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public Post getPostByPostId(int postId) {
		return postDAO.selectPostById(postId);
	}
}

package com.instagram.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.instagram.common.FileManagerService;
import com.instagram.post.dao.PostDAO;
import com.instagram.post.model.Post;

@Service
public class PostBO {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManager;

	// 게시글 작성
	public int addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String imagePath = null;
		if (file != null) {
			// 파일이 있을 때만 업로드 처리 => 서버에 업로드
			imagePath = fileManager.saveFile(userLoginId, file);
		}
		
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	// timelineBO에 보낼 post의 리스트
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public Post getPostByPostId(int postId) {
		return postDAO.selectPostById(postId);
	}
	
	// 게시글 수정
	public int updatePost(int postId, int userId, String userLoginId,
			String content, MultipartFile file) {
		
		// 기존 게시글 가져오기
		Post post = getPostByPostId(postId);
		if (post == null) {
			log.warn("[update post] 수정할 메모가 존재하지 않습니다. postId:{}, userId:{}", postId, userId);
			return 0;
		}
		
		String imagePath = null;
		
		if(file != null) {
			// 업로드
			imagePath = fileManager.saveFile(userLoginId, file);
			
			// 성공시 기존 이미지 제거
			if (imagePath != null && post.getImagePath() != null) {
				fileManager.deleteFile(post.getImagePath());
			}
		}
		
		return postDAO.updatePost(postId, userId, content, imagePath);
	}
}
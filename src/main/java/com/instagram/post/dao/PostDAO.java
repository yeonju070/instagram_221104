package com.instagram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.instagram.post.model.Post;

@Repository
public interface PostDAO {

	// 게시글 업로드
	public int insertPost(
			@Param("userId") int userId, 
			@Param("content") String content, 
			@Param("imagePath") String imagePath);
	
	// 게시글 list 가져오는 메소드
	public List<Post> selectPostList();
	
	public Post selectPostById(int id);
	
	// 게시글 수정 메소드
	public Post selectPostByPostIdAndUserId(
			@Param("postId") int postId,
			@Param("userId") int userId);
}

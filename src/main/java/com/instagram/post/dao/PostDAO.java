package com.instagram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.instagram.post.model.Post;

@Repository
public interface PostDAO {

	// post 업로드
	public int insertPost(
			@Param("userId") int userId, 
			@Param("content") String content, 
			@Param("imagePath") String imagePath);
	
	// postList를 가져오는 객체
	public List<Post> selectPostList();
	
	public Post selectPostById(int id);
}

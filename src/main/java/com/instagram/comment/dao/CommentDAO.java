package com.instagram.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.instagram.comment.model.Comment;

@Repository
public interface CommentDAO {

	// 댓글 생성
	public void insertComment(
			@Param("userId") int userId, 
			@Param("postId") int postId, 
			@Param("content") String content);
	
	// 댓글 리스트
	public List<Comment> selectCommentListByPostId(int postId);
}
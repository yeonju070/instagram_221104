package com.instagram.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	// 좋아요가 눌려있지 않으면 추가
	public void insertLike(
			@Param("postId") int postId, 
			@Param("userId") int userId);
	
	// 좋아요가 눌려있으면 제거
	public void deleteLikeByPostIdUserId(
			@Param("postId") int postId, 
			@Param("userId") int userId);

	// 좋아요가 눌렸는지 확인
	public boolean checkLike(
			@Param("postId") int postId, 
			@Param("userId") int userId);

	// 좋아요가 개수 확인
	public int selectLikeCountByPostIdOrUserId(
			@Param("postId") int postId,
			@Param("userId") Integer userId);
	
	// 좋아요 개수
	public int selectLikeCountByPostId(int postId);
	
}

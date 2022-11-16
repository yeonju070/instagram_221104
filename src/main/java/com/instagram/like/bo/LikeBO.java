package com.instagram.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;

	public void likeToggle(int postId, int userId) {
		// 좋아요가 눌려있는지 확인
		if (getLikeCountByPostIdOrUserId(postId, userId) > 0) {
			// 있으면 제거
			likeDAO.deleteLikeByPostIdUserId(postId, userId);
		} else {
			// 없으면 추가
			likeDAO.insertLike(postId, userId);
		}
	}
	
	// 좋아요가 눌렸는지 확인
	public boolean checkLike(int postId, int userId) {
		return likeDAO.checkLike(postId, userId);
	}

	// 좋아요가 개수 확인
	public int getLikeCountByPostIdOrUserId(int postId, Integer userId) {
		return likeDAO.selectLikeCountByPostIdOrUserId(postId, userId);
	}
	
	// 좋아요 개수
	public int getLikeCountByPostId(int postId) {
		return likeDAO.selectLikeCountByPostId(postId);
	}
}
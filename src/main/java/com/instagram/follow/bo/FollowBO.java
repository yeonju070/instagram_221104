package com.instagram.follow.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.follow.dao.FollowDAO;

@Service
public class FollowBO {
	
	@Autowired
	private FollowDAO followDAO;

	// 팔로우 토글
	public void followToggle(int followerId, int followeeId) {
		// 팔로우가 눌려있는지 확인
		if (getFollowCountByFollowerIdAndFolloweeId(followerId, followeeId) > 0) {
			// 있으면 제거
			followDAO.deleteFollowByFollowerIdFolloweeId(followerId, followeeId);
		} else {
			// 없으면 추가
			followDAO.insertFollow(followerId, followeeId);
		}
	}
	
	// 팔로우가 눌렸는지 확인
	public boolean checkFollow(int followerId, int followeeId) {
		return followDAO.checkFollow(followerId, followeeId);
	}
	
	// 팔로우가 개수 확인
	public int getFollowCountByFollowerIdAndFolloweeId(int followerId, int followeeId) {
		return followDAO.selectFollowCountByFollowerIdAndFolloweeId(followerId, followeeId);
	}
}

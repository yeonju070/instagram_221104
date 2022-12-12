package com.instagram.follow.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.follow.dao.FollowDAO;
import com.instagram.follow.model.Follow;

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
	
	// 팔로워 개수
	public int getFollowCountByFollowerIdAndFolloweeId(int followerId, int followeeId) {
		return followDAO.selectFollowCountByFollowerIdAndFolloweeId(followerId, followeeId);
	}
	
	// 팔로워(팔로우한 대상) 개수
	public int getFollowCountByFollowerId(int followerId) {
		return followDAO.selectFollowCountByFollowerId(followerId);
	}

	// 팔로잉(팔로우한 대상) 개수
	public int getFollowCountByFolloweeId(int followeeId) {
		return followDAO.selectFollowCountByFolloweeId(followeeId);
	}
	
	// 팔로워 유저 정보
	public List<Follow> getFollowListByFolloweeId(int followeeId) {
		return followDAO.selectFollowListByFolloweeId(followeeId);
	}
}

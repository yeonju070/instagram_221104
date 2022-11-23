package com.instagram.follow.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FollowDAO {
	
	// 팔로우가 추가
	public void insertFollow(
			@Param("followerId") int followerId, 
			@Param("followeeId") int followeeId);
	
	// 팔로우가 제거
	public void deleteFollowByFollowerIdFolloweeId(
			@Param("followerId") int followerId, 
			@Param("followeeId") int followeeId);

	// 팔로우가 눌려있는지 확인
	public boolean checkFollow(
			@Param("followerId") int followerId, 
			@Param("followeeId") int followeeId);
	
	// 팔로우 개수 확인
	public int selectFollowCountByFollowerIdAndFolloweeId(
			@Param("followerId") int followerId, 
			@Param("followeeId") int followeeId);
}

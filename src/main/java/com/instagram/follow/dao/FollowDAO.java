package com.instagram.follow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.instagram.follow.model.Follow;

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
	
	// 팔로워(팔로우한 대상)
	public List<Follow> selectFollowListByFollowerId(int followerId);

	// 팔로우(팔로우 당한 대상)
	public List<Follow> selectFollowListByFolloweeId(int followeeId);
	
	// 팔로워(팔로우한 대상) 개수
	public int selectFollowCountByFollowerId(int followerId);

	// 팔로잉(팔로우 당한 대상) 개수
	public int selectFollowCountByFolloweeId(int followeeId);
}

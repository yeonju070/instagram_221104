package com.instagram.timeline.model;

import com.instagram.post.model.Post;
import com.instagram.user.model.User;

public class CardView {
	// 글 1개
	private Post post;
	
	// 글쓴이 정보
	private User user;

	// 좋아요 개수
	private int likeCount;
	
	// 로그인 사람이 좋아요를 눌렀는지
	private boolean filledLike;  // 눌렀으면 true 아니면 false
	
	// 댓글 N개
	//private List<CommentView> commentList;
	
	// 댓글 개수
	//private int commentCount;

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public boolean isFilledLike() {
		return filledLike;
	}

	public void setFilledLike(boolean filledLike) {
		this.filledLike = filledLike;
	}
	
}
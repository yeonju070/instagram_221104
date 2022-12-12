package com.instagram.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.comment.bo.CommentBO;
import com.instagram.comment.model.CommentView;
import com.instagram.like.bo.LikeBO;
import com.instagram.post.bo.PostBO;
import com.instagram.post.model.Post;
import com.instagram.timeline.model.CardView;
import com.instagram.user.bo.UserBO;
import com.instagram.user.model.User;

@Service
public class TimelineBO {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	// 가공된 CardView를 만드는 객체
	public List<CardView> generateCardList(Integer userId, String search) {
		List<CardView> cardViewList = new ArrayList<>();
		
		// 게시글 목록 가져오기
		List<Post> postList = postBO.getPostList(search);
		
		// cardView에 채우기
		for (Post post : postList) {
			CardView card = new CardView();
			
			// 게시글에 대한 정보
			card.setPost(post);
			
			// 글쓴이의 대한 정보
			User user = userBO.getUserById(post.getUserId());
			card.setUser(user);
			
			// 내가 좋아요를 눌렀는지 확인
			if (userId == null) {
				card.setFilledLike(false);
			} else {
				int count = likeBO.getLikeCountByPostIdOrUserId(post.getId(), userId);
				card.setFilledLike(count > 0 ? true : false);
			}
			
			// 좋아요 개수
			card.setLikeCount(likeBO.getLikeCountByPostIdOrUserId(post.getId(), null));
			
			// 게시글 하나의 댓글 목록
			List<CommentView> commentList = commentBO.generateCommentViewListByPostId(post.getId());
			card.setCommentList(commentList);
			
			// 댓글 개수
			card.setCommentCount(commentBO.getCommentByPostIdOrUserId(post.getId(), null));
	
			cardViewList.add(card);
		}
		return cardViewList;
	}
}
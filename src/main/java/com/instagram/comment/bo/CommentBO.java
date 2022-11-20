package com.instagram.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.instagram.comment.dao.CommentDAO;
import com.instagram.comment.model.Comment;
import com.instagram.comment.model.CommentView;
import com.instagram.user.bo.UserBO;
import com.instagram.user.model.User;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	// 댓글 생성
	public void addComment(int userId, int postId, String content) {
		commentDAO.insertComment(userId, postId, content);
	}
	
	// 댓글 리스트
	private List<Comment> getCommentListByPostId(int postId) {
		return commentDAO.selectCommentListByPostId(postId);
	}
	
	// 가공된 댓글 객체
	public List<CommentView> generateCommentViewListByPostId(int postId) {
		
		// 결과
		List<CommentView> commentViewList = new ArrayList<>();
		
		// 댓글 목록 가져오기
		List<Comment> commentList = getCommentListByPostId(postId);
		
		// List<CommentView>에 CommentView 채운다.
		for (Comment comment : commentList) {
			CommentView commentView = new CommentView();
			commentView.setComment(comment);
			
			// 댓글 단 유저
			User user = userBO.getUserById(comment.getUserId());
			commentView.setUser(user);
			
			commentViewList.add(commentView);
		}
		
		// 리스트를 리턴한다.
		return commentViewList;
	}
}
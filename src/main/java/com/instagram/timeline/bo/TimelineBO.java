package com.instagram.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public List<CardView> generateCardList(Integer userId) {
		List<CardView> cardViewList = new ArrayList<>();
		// 글 목록 가져오기
		List<Post> postList = postBO.getPostList();
		
		for (Post post : postList) {
			CardView card = new CardView();
			// 게시글 정보
			card.setPost(post);
			
			// 글쓴이 정보
			User user = userBO.getUserById(post.getUserId());
			card.setUser(user);
			
			// 카드 리스트에 채우기 
			cardViewList.add(card);
		}
		
		return cardViewList;
	}
}

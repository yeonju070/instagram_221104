<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center">
	<%-- 타임라인(게시글) 영역 --%>
	<div class="timeline-box my-5">
		<%-- 검색 영역 --%>
		<c:if test="${not empty userId}">
		<div class="d-flex">
			<input type="text" id="search" class="form-control" placeholder="검색할 내용을 입력하세요.">
			<button id="searchBtn" class="btn">검색</button>
		</div>
		<%-- 게시글 --%>
		<div class="card border rounded mt-4">
			<%-- 글쓴이, 더보기 --%>
			<c:forEach items="${cardList}" var="card">
			<div class="p-2 d-flex justify-content-between">
				<span class="font-weight-bold">${card.user.loginId}</span>
				<%-- 내가 쓴 글일때만 보이게 --%>
				<a href="#" class="more-btn">
					<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="30">
				</a>
			</div>
			
			<%-- 카드 이미지 --%>
			<div class="card-img">
				<img src="http://www.urbanbrush.net/web/wp-content/uploads/edd/2020/02/urbanbrush-20200227023608426223.jpg" class="w-100" alt="본문 이미지">
			</div>
			
			<%-- 좋아요 --%>
			<div class="card-like m-3">
				<a href="#" class="like-btn" data-user-id="" data-post-id="">
					<img src="https://www.iconninja.com/files/527/809/128/heart-icon.png" width="18px" height="18px" alt="filled heart">
					<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" width="18px" height="18px" alt="empty heart">
					좋아요
				</a>
			</div>
			
			<%-- 글 --%>
			<div class="card-post m-3">
				<span class="font-weight-bold">${card.user.loginId}</span>
				<span>${card.post.content}</span>
			</div>
			
			<%-- 댓글 --%>
			<div class="card-comment-desc border-bottom">
				<div class="ml-3 mb-1 font-weight-bold">댓글</div>
			</div>
			</c:forEach>
			
			<div class="card-comment-list m-2">
				<%-- 댓글 목록 --%>
				<div class="card-comment m-1">
					<span class="font-weight-bold">댓글쓴이:</span>
					<span>댓글</span>
					
					<%-- 댓글 삭제 버튼 --%>
					<a href="#" class="comment-delBtn" data-comment-id="">
						<img src="https://www.iconninja.com/files/603/22/506/x-icon.png" width="10px" height="10px">
					</a>
				</div>
				<%-- 댓글 쓰기 --%>
				<div class="comment-write d-flex border-top mt-2">
					<input type="text" class="form-control border-0 mr-2" placeholder="댓글 달기"/> 
					<button type="button" class="comment-btn btn border-0 btn-write" data-post-id="">게시</button>
				</div>
			</div>
		</div> <%--// 게시글 닫기 --%>
		</c:if>
	</div> <%--// 타임라인(게시글) 영역 닫기  --%>
	
	<%-- 프로필 영역 --%>
	<div class="timeline-profile-box p-5">
		<c:if test="${not empty userName}">
		<div class="d-flex align-items-center">
			<div>
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="30px" alt="기본 유저사진">
				<span class="ml-3">${userName}</span>
			</div>
		</div>
		</c:if>
	</div>
</div>
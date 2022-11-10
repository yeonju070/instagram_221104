<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center">
	<%-- 타임라인 영역 --%>
	<div class="timeline-box my-5">
		<%-- 검색 영역 --%>
		<div class="d-flex">
			<input type="text" id="search" class="form-control" placeholder="검색할 내용을 입력하세요.">
			<button id="searchBtn" class="btn">검색</button>
		</div>
		
		<%-- 게시글 영역 --%>
		<div class="timeline-box my-5">
		
			<%-- 카드 1 --%>
			<div class="card border rounded mt-3">
			
				<%-- 글쓴이, 더보기(삭제) --%>
				<div class="p-2 d-flex justify-content-between">
					<span class="font-weight-bold">글쓴이</span>
					<%-- 내가 쓴 글일때만 보이게 조건 --%>
					<a href="#" class="more-btn">
						<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/330px-Hamburger_icon.svg.png" width="25">
					</a>
				</div>
				
				<%-- 카드 이미지 --%>
				<div class="card-img">
					<img src="http://www.urbanbrush.net/web/wp-content/uploads/edd/2020/02/urbanbrush-20200227023608426223.jpg" class="w-100" alt="본문 이미지">
				</div>
				
				<%-- 좋아요, 댓글 --%>
				<div class="card-like ml-3 mt-2">
					<a href="#" class="like-btn">
						<img src="https://cdn-icons-png.flaticon.com/512/7476/7476962.png" width="18px" height="18px" alt="filled heart">
						<img src="https://cdn-icons-png.flaticon.com/512/833/833472.png" width="18px" height="18px" alt="empty heart">
					</a>
					<span>좋아요</span>
				</div>
				
				<%-- 글 --%>
				<div class="card-post my-2 ml-3">
					<span class="font-weight-bold">유저</span>
					<span>글내용</span>
				</div>
				
				<%-- 댓글 --%>
				<div class="card-comment-desc border-bottom">
					<div class="ml-3 mb-2 font-weight-bold">댓글</div>
				</div>
				
				<%-- 댓글 내용 --%>
				<div class="card-comment-list">
					<%-- 댓글 목록 --%>
					<div class="card-comment my-2 ml-3">
						<span class="font-weight-bold">댓글쓴이:</span>
						<span>내용</span>
						
						<%-- 댓글 삭제 버튼 --%>
						<a href="#" class="comment-delBtn">
							<img src="https://www.iconninja.com/files/603/22/506/x-icon.png" width="10px" height="10px">
						</a>
					</div>
					<%-- 댓글 쓰기 --%>
					<div class="comment-write d-flex border-top mt-3">
						<input type="text" class="form-control border-0" placeholder="댓글 달기"/> 
						<button type="button" class="comment-btn btn bg-white">게시</button>
					</div>
				</div>	<%-- 댓글 내용 닫기 --%>
			</div>	<%-- 카드1 닫기 --%>
		</div>	<%-- 게시글 영역 닫기 --%>
	</div>	<%-- 타임라인 영역 닫기  --%>
	
	<%-- 프로필 영역 --%>
	<div class="timeline-profile-box p-5">
		<c:if test="${not empty userName}">
		<div class="d-flex align-items-center">
			<%-- 내 프로필 --%>
			<div>
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="30px" alt="기본 유저사진">
				<span class="ml-3">${userName}</span>
			</div>
		</div>
		</c:if>
	</div>
</div>
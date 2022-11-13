<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center">
	<%-- 타임라인 영역 --%>
	<div class="timeline-box m-5">
		<%-- 검색 영역 --%>
		<div class="d-flex">
			<input type="text" id="search" class="form-control" placeholder="검색할 내용을 입력하세요.">
			<button id="searchBtn" class="btn text-white">검색</button>
		</div>
		
		<%-- 게시글 영역 --%>
		<div class="timeline-box my-5">
		
			<%-- 카드 1 --%>
			<c:forEach items="${cardList}" var="card">
			<div class="card border rounded mt-3">
				<%-- 글쓴이, 더보기 --%>
				<div class="p-2 d-flex justify-content-between">
					<a href="#">
						<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="25px" alt="기본 유저사진">
						<span class="font-weight-bold text-dark ml-1">${card.user.loginId}</span>
					</a>
					<%-- 내가 쓴 글일때만 보이게 조건 --%>
					<a href="#" class="more-btn" data-toggle="modal" data-target="#more-modal">
						<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/330px-Hamburger_icon.svg.png" width="25">
					</a>
				</div>
				
				<%-- 카드 이미지 --%>
				<div class="card-img">
					<img src="${card.post.imagePath}" class="w-100" alt="본문 이미지">
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
					<span class="font-weight-bold">${card.user.loginId}</span>
					<span>${card.post.content}</span>
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
			</c:forEach>
		</div>	<%-- 게시글 영역 닫기 --%>
	</div>	<%-- 타임라인 영역 닫기  --%>
	
	<%-- 프로필 영역 --%>
	<div class="timeline-profile-box p-5">
		<c:if test="${not empty userName}">
		<div class="d-flex align-items-center">
			<%-- 내 프로필 --%>
			<div>
				<a href="#">
					<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="30px" alt="기본 유저사진">
					<span class="ml-3 text-dark">${userLoginId}</span>
				</a>
			</div>
		</div>
		</c:if>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="more-modal">
	<%-- modal-dialog-centered: 모달창을 수직 가운데 정렬, modal-sm: 작은 모달창 --%>
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
      		<%-- Modal 창 안에 내용 채워넣기 --%>
      		<div class="text-center">
      			<div class="py-3">
      				<a href="#" id="delPostBtn" class="btn">삭제</a>
      			</div>
      			<div class="py-3">
      				<a href="/post/post_detail_view?postId=${post.id}" id="detailPostBtn" class="btn">수정</a>
      			</div>
      			<div class="py-3">
      				<%-- data-dismiss="modal" 모달창 닫힘 --%>
      				<a href="#" data-dismiss="modal">취소</a>
      			</div>
      		</div>
		</div>
	</div>
</div>
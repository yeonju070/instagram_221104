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
					<%-- 글쓴이 --%>
					<a href="/user/profile_view">
						<img src="https://media.istockphoto.com/id/1168022051/ko/%EB%B2%A1%ED%84%B0/%EC%82%AC%EC%9A%A9%EC%9E%90-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EB%98%90%EB%8A%94-%EC%9D%B8%EC%A6%9D-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%82%AC%EB%9E%8C-%EA%B8%B0%ED%98%B8.jpg?s=612x612&w=0&k=20&c=usGMDDtBu7aYOubS3rP2Ot5-vzjMHik905IMJpJa7Ps=" width="25px" alt="기본 유저사진">
						<span class="font-weight-bold text-dark ml-1">${card.user.loginId}</span>
					</a>
					<%-- 더보기 --%>
					<a href="#" class="more-btn" data-toggle="modal" data-target="#more-modal" data-post-id="${card.post.id}" data-content-id="${card.post.content}">
						<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/330px-Hamburger_icon.svg.png" width="25">
					</a>
				</div>
				
				<%-- 카드 이미지 --%>
				<div class="card-img">
					<img src="${card.post.imagePath}" class="w-100" alt="본문 이미지">
				</div>
				
				<%-- 좋아요, 댓글 --%>
				<div class="card-like ml-3 mt-2">
					<a href="#" class="like-btn" data-user-id="${userId}" data-post-id="${card.post.id}">
						<c:if test="${card.filledLike eq false}">
							<img src="https://cdn-icons-png.flaticon.com/512/7476/7476962.png" width="18px" height="18px" alt="filled heart">
						</c:if>
						<c:if test="${card.filledLike eq true}">
						<img src="https://cdn-icons-png.flaticon.com/512/833/833472.png" width="18px" height="18px" alt="empty heart">
						</c:if>
						<span>좋아요 ${card.likeCount}</span>
					</a>
				</div>
				
				<%-- 글 --%>
				<div class="card-post my-2 ml-3">
					<span class="font-weight-bold">${card.user.loginId}</span>
					<span>${card.post.content}</span>
				</div>
				
				<%-- 댓글 --%>
				<div class="card-comment-desc border-bottom">
					<div class="ml-3 mb-2 font-weight-bold">댓글 ${card.commentCount}</div>
				</div>
				
				<%-- 댓글 내용 --%>
				<div class="card-comment-list">
					<%-- 댓글 목록 --%>
					<c:forEach items="${card.commentList}" var="commentView">
					<div class="card-comment my-2 ml-3">
						<c:if test="${not empty commentView.user.loginId}">
						<span class="font-weight-bold">${commentView.user.loginId}:</span>
						</c:if>
						<c:if test="${empty commentView.user.loginId}">
						<span class="font-weight-bold">댓글없음</span>
						</c:if>
						<span>${commentView.comment.content}</span>
						
						<%-- 댓글 삭제 버튼 --%>
						<a href="#" class="comment-delBtn" data-comment-id="${commentView.comment.id}">
							<img src="https://www.iconninja.com/files/603/22/506/x-icon.png" width="10px" height="10px">
						</a>
					</div>
					</c:forEach>
					<%-- 댓글 쓰기 --%>
					<div class="comment-write d-flex border-top mt-3">
						<input type="text" class="form-control border-0" placeholder="댓글 달기"/> 
						<button type="button" class="comment-btn btn bg-white" data-post-id="${card.post.id}">게시</button>
					</div>
				</div>	<%-- 댓글 내용 닫기 --%>
			</div>	<%-- 카드1 닫기 --%>
			</c:forEach>
		</div>	<%-- 게시글 영역 닫기 --%>
	</div>	<%-- 타임라인 영역 닫기  --%>
	
	<%-- 프로필 영역 --%>
	<div class="timeline-profile-box p-5">
		<c:if test="${not empty userName}">
		<div class="user-profile">
			<%-- 내 프로필 --%>
			<div class="d-flex align-items-center mb-3">
				<a href="/user/profile_view">
					<img src="https://media.istockphoto.com/id/1168022051/ko/%EB%B2%A1%ED%84%B0/%EC%82%AC%EC%9A%A9%EC%9E%90-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EB%98%90%EB%8A%94-%EC%9D%B8%EC%A6%9D-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%82%AC%EB%9E%8C-%EA%B8%B0%ED%98%B8.jpg?s=612x612&w=0&k=20&c=usGMDDtBu7aYOubS3rP2Ot5-vzjMHik905IMJpJa7Ps=" width="50px" alt="기본 유저사진">
					<span class="ml-2 font-weight-bold">${userLoginId}</span>
				</a>
			</div>
			
			<div class="another">
				<span class="ml-1 text-secondary font-weight-bold">회원님을 위한 추천</span>
			</div>
			
			<%-- 다른 사람 프로필 --%>
			<c:forEach items="${userList}" var="user">
			<div class="another-user mt-3 d-flex align-items-center justify-content-between">
				<div>
					<a href="/user/profile_view">
						<img src="https://media.istockphoto.com/id/1168022051/ko/%EB%B2%A1%ED%84%B0/%EC%82%AC%EC%9A%A9%EC%9E%90-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EB%98%90%EB%8A%94-%EC%9D%B8%EC%A6%9D-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%82%AC%EB%9E%8C-%EA%B8%B0%ED%98%B8.jpg?s=612x612&w=0&k=20&c=usGMDDtBu7aYOubS3rP2Ot5-vzjMHik905IMJpJa7Ps=" width="50px" alt="기본 유저사진">
						<span class="ml-2 text-dark font-weight-bold">${user.loginId}</span>
					</a>
				</div>
				<div class="align-items-end">
					<a href="#" class="follow-btn font-weight-bold" data-user-id="${user.id}">팔로우</a>
				</div>
			</div>
			</c:forEach>
		</div>
		</c:if>
	</div>
</div>

<%-- post modal --%>
<div class="modal fade" id="more-modal">
	<%-- modal-dialog-centered: 모달창을 수직 가운데 정렬, modal-sm: 작은 모달창 --%>
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
      		<%-- Modal 창 안에 내용 채워넣기 --%>
      		<div class="text-center">
      			<div class="py-3">
      				<a href="#" id="delPostBtn" class="btn text-danger font-weight-bold">삭제</a>
      			</div>
      			<div class="py-3">
      				<a href="#" id="detailPostBtn" class="btn text-detail font-weight-bold">수정</a>
      			</div>
      			<div class="py-3">
      				<%-- data-dismiss="modal" 모달창 닫힘 --%>
      				<a href="#" data-dismiss="modal">취소</a>
      			</div>
      		</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	// 더보기를 눌렀을 때 수정할 postId를 모달에 넣는다.
	$('.more-btn').on('click', function(e) {
		e.preventDefault();
		
		let postId = $(this).data('post-id');	// 게시글의 글번호를 가져온다.
		
		$('#more-modal').data('post-id', postId);
	});
	
	// modal의 수정 클릭
	$('#detailPostBtn').on('click', function(e) {
		e.preventDefault();
		
		let postId = $('#more-modal').data('post-id');	// modal에 게시글번호를 가져온다.
		
		location.href = "/post/post_detail_view?postId=" + postId;
	});
	
	// 좋아요 버튼 클릭
	$('.like-btn').on('click', function(e) {
		e.preventDefault();
		
		let userId = $(this).data('user-id');
		let postId = $(this).data('post-id');
		// validation
		if (userId == '') {
			alert("로그인 후 이용해주세요.");
			return;
		}
		
		// ajax
		$.ajax({
			url:"/like/" + postId
			,success:function(data) {
				if (data.code == 100) {
					location.reload(true);
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(e) {
				alert("좋아요를 수행하는데 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	// 댓글 게시
	$('.comment-btn').on('click', function() {
		
		let postId = $(this).data('post-id');
		let content = $(this).siblings('input').val().trim();

		if (content == '') {
			alert("게시할 댓글을 입력해주세요");
			return;
		}
		
		// ajax
		$.ajax({
			type:"post"
			,url:"/comment/create"
			,data:{"postId":postId, "content":content}
			,success:function(data) {
				if (data.code == 100) {
					location.reload();
				} else if (data.code == 300) {
					alert("로그인 후 이용해주세요.");
					location.href = "/user/sign_in_view";
				}
			}
			,error: function(e) {
				alert("댓글 게시에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	// 댓글 삭제
	$('.comment-delBtn').on('click', function(e) {
		e.preventDefault();
		
		let commentId = $(this).data('comment-id');
		
		// ajax 댓글 삭제
		$.ajax({
			type:"delete"
			, url:"/comment/delete"
			, data:{"commentId":commentId}
			, success:function(data) {
				if (data.code == 100) {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(e) {
				alert("댓글 삭제에 실패했습니다. 관리자에게 문의해주세요");
			}
		});
	});
	
	// 게시글 삭제
	$('.more-btn').on('click', function(e) {
		e.preventDefault();
		
		let postId = $(this).data('post-id');
		
		$('#more-modal').data('post-id', postId);
	});
	
	// modal 삭제 클릭
	$('#more-modal #delPostBtn').on('click', function(e) {
		e.preventDefault();
		
		let postId = $('#more-modal').data('post-id');
		
		// ajax 글삭제
		$.ajax({
			type:"delete"
			, url:"/post/delete"
			, data: {"postId":postId}
			, success: function(data) {
				if (data.code == 100) {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("게시글 삭제에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	// 팔로우 버튼 클릭
	$('.follow-btn').on('click', function() {

		// 유저 id
		let userId = $(this).data("user-id");
		alert(userId);
	});
});
</script>
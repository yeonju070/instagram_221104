<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center align-items-center">
	<div class="profile-box p-4">
		<%-- 프로필 영역 --%>
		<div class="profile-detail-box d-flex">
			<div class="profile-imagePath d-flex justify-content-center">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="150px" height="150px" alt="기본 유저사진">
			</div>
			
			<%-- 유저 프로필 정보(프로필 사진, 게시물, 팔로워 등등..) 영역 --%>
			<div class="user-profile-detail-box mt-2 ml-5">
				<div class="d-flex justify-content-start">
					<span id="ProfileloginId">${userLoginId}</span>
					<a href="/user/profile_detail_view" id="profileDetailBtn" class="btn border ml-5 font-weight-bold">프로필 편집</a>
					<a href="/user/profile_detail_view" class="ml-2">
						<img src="https://cdn-icons-png.flaticon.com/512/17/17146.png?w=740&t=st=1669200934~exp=1669201534~hmac=0b033b009415440b5617e473cbc35bdd54f82c824d97b9e7c8a0a64c098b840f" width="30px" alt="설정">
					</a>
				</div>
				
				<div class="d-flex justify-content-start mt-2">
					<span class="mr-5">게시물 0</span>
					<a href="#" class="mr-5 ml-2">팔로워 0</a>
					<a href="#" class="ml-2">팔로우 0</a>
				</div>
				<div class="mt-2">
					<textarea class="form-control" style="height: 55px; width:300px;" placeholder="나의 소개가 없습니다."></textarea>
				</div>
			</div>	<%-- 유저 프로필 정보(프로필 사진, 게시물, 팔로워 등등..) 영역 종료 --%>
		</div>	<%-- 프로필 영역 종료 --%>
		
		<%-- 유저 게시글 영역 --%>
		<div class="user-post-box m-3">
			<div>나의 게시물</div>
			<div class="user-post border mt-3 d-flex flex-wrap justify-content-start">
				<c:if test="${empty cardList}">
					<div>게시글이 없습니다.</div>
				</c:if>
				<c:forEach items="${cardList}" var="card">
					<c:if test="${card.post.imagePath != null}">
						<div class="post-list d-flex justify-content-center">
							<a href="#" data-toggle="modal" data-target="#post-modal">
								<img src="${card.post.imagePath}"  alt="기본 이미지" width="250px" height="250px" class="m-3 mt-4 my-post-list" data-post-id="${card.post.id}">
							</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<%-- post modal --%>
<div class="modal fade" id="post-modal">
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
	// 게시글을 눌렀을 때 수정할 postId를 모달에 넣는다.
	$('.my-post-list').on('click', function(e) {
		e.preventDefault();
		
		let postId = $(this).data('post-id');
		
		$('#post-modal').data('post-id', postId);
	});
	
	// modal의 수정 클릭
	$('#detailPostBtn').on('click', function(e) {
		e.preventDefault();
		
		let postId = $('#post-modal').data('post-id');
		
		if (postId == '') {
			alert("수정할 게시글이 없습니다.");
			return;
		}
		
		location.href = "/post/post_detail_view?postId=" + postId;
	});
	
	// modal 삭제 버튼 클릭
	$('#post-modal #delPostBtn').on('click', function(e) {
		e.preventDefault();
		
		let postId = $('#post-modal').data('post-id');
		
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
});
</script>
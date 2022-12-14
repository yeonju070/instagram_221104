<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center align-items-center">
	<div class="profile-box p-4">
		<%-- 프로필 영역 --%>
		<div class="profile-detail-box d-flex">
			<c:forEach items="${userList}" var="user">
			<div class="profile-imagePath mr-5">
				<a href="#" class="profile-imagePath-btn" data-toggle="modal" data-target="#profile-modal">
				<c:if test="${empty user.imagePath}">
					<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" class="my-profile-imagePath" alt="기본 유저사진">
				</c:if>
				<c:if test="${not empty user.imagePath}">
					<img src="${user.imagePath}" class="my-profile-imagePath" alt="기본 유저사진">
				</c:if>
				</a>
			</div>
			</c:forEach>
			
			<%-- 유저 프로필 정보(프로필 사진, 게시물, 팔로워 등등..) 영역 --%>
			<div class="user-profile-detail-box mt-2 ml-5">
				<c:forEach items="${userList}" var="user">
				<div id="userLoginIdBox" class="d-flex justify-content-between">
				<span id="ProfileloginId">${user.loginId}</span>
					<div id="moveUserProfileDetail">
						<a href="/user/profile_detail_view" id="profileDetailBtn" class="btn border font-weight-bold">프로필 편집</a>
						<a href="/user/profile_detail_view" class="ml-2">
							<img src="https://cdn-icons-png.flaticon.com/512/17/17146.png?w=740&t=st=1669200934~exp=1669201534~hmac=0b033b009415440b5617e473cbc35bdd54f82c824d97b9e7c8a0a64c098b840f" width="30px" alt="설정">
						</a>
					</div>
				</div>
				</c:forEach>
				
				<div class="d-flex justify-content-start mt-2">
					<span class="mr-5">게시물 ${postCount}</span>
					<a href="#" class="mr-5 ml-2" data-toggle="modal" data-target="#follower-modal" id="followerModal">
						팔로워 ${followeeCount}
					</a>
					<a href="#" class="mr-5 ml-2" data-toggle="modal" data-target="#followee-modal">
						팔로우 ${followerCount}
					</a>
				</div>
				<c:forEach items="${userList}" var="user">
				<div class="mt-2">
					<textarea class="form-control" style="height: 55px; width:300px;" placeholder="나의 소개가 없습니다.">${user.introduce}</textarea>
				</div>
				</c:forEach>
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
								<img src="${card.post.imagePath}"  alt="기본 이미지" width="250px" height="250px" class="m-4 my-post-list" data-post-id="${card.post.id}">
							</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<%-- follower modal --%>
<div class="modal fade" id="follower-modal">
	<%-- modal-dialog-centered: 모달창을 수직 가운데 정렬, modal-sm: 작은 모달창 --%>
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
      		<%-- Modal 창 안에 내용 채워넣기 --%>
			<div class="m-3 d-flex">
				<span class="follow-title-box font-weight-bold text-center">팔로워</span>
				<div class="follow-box-cancell align-items-center">
	   				<%-- data-dismiss="modal" 모달창 닫힘 --%>
	   				<a href="#" data-dismiss="modal">
	   					<img src="https://cdn.icon-icons.com/icons2/904/PNG/512/cancel-1_icon-icons.com_69681.png" alt="취소 아이콘" width="10px">
	   				</a>
	   			</div>
 			</div>
   			<div class="border-top">
  				<c:if test="${empty followerList}">
					<span class="m-3">팔로워가 없습니다.</span>
				</c:if>
				<c:if test="${not empty followerList}">
				<c:forEach items="${followerList}" var="follower">
				<div class="another-user m-3 d-flex align-items-center">
					<a href="#" class="user-directly-click d-flex align-items-center">
						<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="30px" alt="기본 유저사진">
						<span class="ml-4 text-dark">${follower.user.loginId}</span>
					</a>
				</div>
				</c:forEach>	<%-- 유저 추천 리스트 닫기 --%>
				</c:if>
   			</div>
		</div>
	</div>
</div>

<%-- followee modal --%>
<div class="modal fade" id="followee-modal">
	<%-- modal-dialog-centered: 모달창을 수직 가운데 정렬, modal-sm: 작은 모달창 --%>
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
      		<%-- Modal 창 안에 내용 채워넣기 --%>
			<div class="m-3 d-flex">
				<span class="follow-title-box font-weight-bold text-center">팔로우</span>
				<div class="follow-box-cancell align-items-center">
	   				<%-- data-dismiss="modal" 모달창 닫힘 --%>
	   				<a href="#" data-dismiss="modal">
	   					<img src="https://cdn.icon-icons.com/icons2/904/PNG/512/cancel-1_icon-icons.com_69681.png" alt="취소 아이콘" width="10px">
	   				</a>
	   			</div>
 			</div>
   			<div class="border-top">
  				<c:if test="${empty followeeList}">
					<span class="m-3">팔로우가 없습니다.</span>
				</c:if>
				<c:if test="${not empty followeeList}">
				<c:forEach items="${followeeList}" var="followee">
				<div class="another-user m-3 d-flex align-items-center">
					<a href="#" class="user-directly-click d-flex align-items-center">
						<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="30px" alt="기본 유저사진">
						<span class="ml-4 text-dark">${followee.loginId}</span>
					</a>
				</div>
				</c:forEach>	<%-- 유저 추천 리스트 닫기 --%>
				</c:if>
   			</div>
		</div>
	</div>
</div>

<%-- profile modal --%>
<div class="modal fade" id="profile-modal">
	<%-- modal-dialog-centered: 모달창을 수직 가운데 정렬, modal-sm: 작은 모달창 --%>
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
      		<%-- Modal 창 안에 내용 채워넣기 --%>
      		<div class="text-center">
      			<div class="my-4">
      				<h5>프로필 사진 바꾸기</h5>
      			</div>
      			<div class="border-top border-bottom">
      				<div class="my-2">
      					<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
      					<a href="#" id="imagePathBtn" class="btn font-weight-bold" data-user-id="${userId}">사진 업로드</a>
      				</div>
      			</div>
      			<div class="border-bottom">
      				<div class="my-2">
      					<a href="#" id="imagePathDeleteBtn" class="btn text-danger font-weight-bold">현재 사진 삭제</a>
      				</div>
      			</div>
      			<div class="my-3">
      				<%-- data-dismiss="modal" 모달창 닫힘 --%>
      				<a href="#" data-dismiss="modal">취소</a>
      			</div>
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
			type:"put"
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
	
	// 이미지 클릭 시 프로필 화면 수정
	$('#imagePathBtn').on('click', function() {
		$('#file').click();
	});
	
	$('#file').on('change', function(e) {
		
		let fileName = e.target.files[0].name;
		let ext = fileName.split('.').pop().toLowerCase();
		
		// 확장자 유효성 확인
		if (fileName.split('.').length < 2 || 
				(ext != 'gif'
						&& ext != 'png'
							&& ext != 'jpg'
								&& ext != 'jpeg')) {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$(this).val('');
			$('#fileName').text('');
			return;
		}
		let userId = $(this).data('user-id');
		
		let formData = new FormData();
		formData.append("userId", userId);
		formData.append("file", $('#file')[0].files[0]);
		
		// ajax
		$.ajax({
			type:"put"
			, url:"/user/imagePath_update"
			, data:formData
			, enctype:"multipart/form-data"
			, processData:false
			, contentType:false
			
			, success:function(data) {
				if (data.code == 100) {
					alert("프로필을 수정하였습니다.");
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
		});
	});
	
	// modal 삭제 버튼 클릭
	$('#profile-modal #imagePathDeleteBtn').on('click', function() {
		
		let userId = $(this).data('user-id');
		
		// ajax 프로필 이미지 삭제
		$.ajax({
			type:"put"
			, url:"/user/imagePath_delete"
			, data: {"userId":userId}
			, success: function(data) {
				if (data.code == 100) {
					alert('프로필이 삭제되었습니다.');
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("프로필 이미지 삭제에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
});
</script>
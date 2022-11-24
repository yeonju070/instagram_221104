<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center align-items-center">
	<div class="user-profile-detail d-flex m-5">
		<div class="user-profile-nav col-3">
			<div class="profile-nav">
				<div class="d-flex profile-subject-box justify-content-end">
					<c:forEach items="${userList}" var="user">
					<a href="#" class="profile-imagePath-btn" data-toggle="modal" data-target="#profile-modal">
						<img src="${user.imagePath}" class="my-profile-imagePath" alt="기본 유저사진">
					</a>
					</c:forEach>
				</div>
				<div class="d-flex profile-subject-box justify-content-end mt-3">
					<span class="profile-subject">이름</span>
				</div>
				<div class="d-flex profile-subject-box justify-content-end">
					<span class="profile-subject">사용자 이름</span>
				</div>
				<div class="d-flex profile-info-box justify-content-end">
					<span class="profile-subject">소개</span>
				</div>
				<div class="d-flex profile-subject-box justify-content-end">
					<span class="profile-subject">이메일</span>
				</div>
				<div class="d-flex profile-subject-box justify-content-end">
					<span class="profile-subject">전화번호</span>
				</div>
			</div>
		</div>
		<div class="user-profile-content col-9 ml-2">
			<div>
				<span class="userLoginId-font-size">${userLoginId}</span>
			</div>
			<div>
				<a href="#" class="profile-imagePath-btn" data-toggle="modal" data-target="#profile-modal">
					<strong class="profile-imagePath-change">프로필 사진 바꾸기</strong>
				</a>
			</div>
			<div class="my-3">
				<form id="profileDetailForm" method="post" action="/user/profile_detail">
					<div class="mt-3">
						<input type="text" name="name" class="form-control" placeholder="이름" value="${card.user.name}">
					</div>
					<div class="mt-3">
						<input type="text" name="loginId" class="form-control" placeholder="사용자 이름" value="${card.user.loginId}">
					</div>
					<div class="mt-3">
						<textarea class="form-control" style="height: 80px; width:420px;" placeholder="소개를 입력해주세요.">${card.user.introduce}</textarea>
					</div>
					<div class="mt-3">	
						<input type="text" name="email" class="form-control" placeholder="이메일" value="${card.user.email}">
					</div>
					<div class="mt-3">
						<input type="text" name="phoneNumber" class="form-control" placeholder="전화번호" value="${card.user.phoneNumber}">
					</div>
					<div class="mt-3">
						<button type="submit" id="profileConformBtn" class="btn mb-5 text-white">제출</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%-- post modal --%>
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
<script>
$(document).ready(function() {
	// modal의  이미지 수정 버튼을 클릭했을 때
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
			, url:"/user/profile_update"
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
});
</script>
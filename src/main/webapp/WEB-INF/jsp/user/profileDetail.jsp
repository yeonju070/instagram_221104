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
						<c:if test="${empty user.imagePath}">
							<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" class="my-profile-imagePath" alt="기본 유저사진">
						</c:if>
						<c:if test="${not empty user.imagePath}">
							<img src="${user.imagePath}" class="my-profile-imagePath" alt="기본 유저사진">
						</c:if>
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
			<c:forEach items="${userList}" var="user">
			<div>
				<span class="userLoginId-font-size">${user.loginId}</span>
			</div>
			</c:forEach>
			<div>
				<a href="#" class="profile-imagePath-btn" data-toggle="modal" data-target="#profile-modal">
					<strong class="profile-imagePath-change">프로필 사진 바꾸기</strong>
				</a>
			</div>
			<div class="my-3">
				<form id="profileDetailForm" method="post" action="/user/profile_update">
					<c:forEach items="${userList}" var="user">
					<div class="mt-3">
						<input type="text" name="name" class="form-control" placeholder="이름" value="${user.name}">
					</div>
					<div class="mt-3">
						<input type="text" name="loginId" class="form-control" placeholder="사용자 이름" value="${user.loginId}">
					</div>
					<div class="mt-3">
						<textarea class="form-control" name="introduce" style="height: 80px; width:420px;" placeholder="소개를 입력해주세요.">${user.introduce}</textarea>
					</div>
					<div class="mt-3">	
						<input type="text" name="email" class="form-control" placeholder="이메일" value="${user.email}">
					</div>
					<div class="mt-3">
						<input type="text" name="phoneNumber" class="form-control" placeholder="전화번호" value="${user.phoneNumber}">
					</div>
					<div class="mt-3">
						<button type="submit" id="profileConformBtn" class="btn mb-5 text-white" data-user-id="${userId}">제출</button>
					</div>
					</c:forEach>
				</form>
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
      					<a href="#" id="imagePathDeleteBtn" class="btn text-danger font-weight-bold" data-user-id="${userId}">현재 사진 삭제</a>
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
	// modal의 이미지 수정 버튼을 클릭했을 때
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
	
	// 제출 클릭
	$("#profileConformBtn").on('click', function(e) {
		e.preventDefault();
		
		
		// validation
		let userId = $(this).data('user-id');	// 수정할 유저의 아이디
		let name = $('input[name=name]').val().trim();
		let loginId = $('input[name=loginId]').val().trim();
		let introduce = $('textarea[name=introduce]').val();
		let email = $('input[name=email]').val().trim();
		let phoneNumber = $('input[name=phoneNumber]').val();
		
		if (name == '') {
			alert("이름을 입력하세요.");
			return;
		}
		
		if (loginId == '') {
			alert("아이디를 입력하세요.");
			return;
		}
		
		if (loginId.length < 4) {
			alert('아이디는 4글자 이상부터 가능합니다.');
		}
		
		if (email == '') {
			alert("이메일을 입력하세요.");
			return;
		}
		
		// ajax
		let url = $('#profileDetailForm').attr("action");
		let params = $('#profileDetailForm').serialize();
		
		$.post(url, params)
		.done(function(data) {
			if (data.code == 100) {
				alert("프로필 정보가 수정되었습니다!");				
				location.reload();
			} else {
				alert("프로필 정보 수정에 실패하였습니다. 관리자에게 문의해주세요.");
			}
		}); 
	});
});
</script>
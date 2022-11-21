<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center align-items-center">
	<div class="user-profile-detail d-flex m-5">
		<div class="user-profile-nav col-3">
			<div class="profile-nav">
				<div class="d-flex profile-subject-box justify-content-end">
					<img src="https://media.istockphoto.com/id/1168022051/ko/%EB%B2%A1%ED%84%B0/%EC%82%AC%EC%9A%A9%EC%9E%90-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EB%98%90%EB%8A%94-%EC%9D%B8%EC%A6%9D-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%82%AC%EB%9E%8C-%EA%B8%B0%ED%98%B8.jpg?s=612x612&w=0&k=20&c=usGMDDtBu7aYOubS3rP2Ot5-vzjMHik905IMJpJa7Ps=" width="55px" alt="기본 유저사진">
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
				<form id="profileForm" method="post" action="/user/profile_detail">
					<div class="mt-3">
						<input type="text" name="name" class="form-control" placeholder="이름">
					</div>
					<div class="mt-3">
						<input type="text" name="loginId" class="form-control" placeholder="사용자 이름">
					</div>
					<div class="mt-3">
						<textarea class="form-control" style="height: 80px; width:420px;" placeholder="소개를 입력해주세요."></textarea>
					</div>
					<div class="mt-3">	
						<input type="text" name="email" class="form-control" placeholder="이메일">
					</div>
					<div class="mt-3">
						<input type="text" name="phoneNumber" class="form-control" placeholder="전화번호">
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
      					<a href="#" id="imagePathBtn" class="btn font-weight-bold">사진 업로드</a>
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
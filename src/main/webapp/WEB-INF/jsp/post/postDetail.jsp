<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center align-items-center">
	<div class="post-create-box d-flex align-items-center">
		<%-- 프로필, 내가 적을 문구 영역 종료 --%>
		<c:forEach items="${postList}" var="post">
		<div class="file-upload">
			<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
				<a href="#" id="fileUploadBtn">
					<img src="${post.imagePath}"  alt="기본 이미지" width="350px" height="300px">
				</a>
			<%-- 업로드 할 파일 이름이 임시로 저장될 공간 --%>
			<div id="fileName"></div>
		</div>
		<%-- 프로필, 내가 적을 문구 --%>
		<div class="post-user-info ml-3">
			<div class="d-flex justify-content-start align-items-center ">
				<img src="https://media.istockphoto.com/id/1168022051/ko/%EB%B2%A1%ED%84%B0/%EC%82%AC%EC%9A%A9%EC%9E%90-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EB%98%90%EB%8A%94-%EC%9D%B8%EC%A6%9D-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%82%AC%EB%9E%8C-%EA%B8%B0%ED%98%B8.jpg?s=612x612&w=0&k=20&c=usGMDDtBu7aYOubS3rP2Ot5-vzjMHik905IMJpJa7Ps=" width="50px" alt="기본 유저사진">
				<h4 class="ml-3">${userLoginId}</h4>
			</div>
			<div class="mt-3">
				<textarea class="form-control" style="height: 160px; width:300px;" placeholder="내용을 입력해주세요.">${post.content}</textarea>
			</div>
			<button id="writeBtn" class="btn btn-block text-white mt-2" data-post-id="${card.post.id}">수정</button>
		</div>	<%-- 프로필, 내가 적을 문구 영역 종료 --%>
		</c:forEach>
	</div>
</div>
<script>
$(document).ready(function() {
	$('#fileUploadBtn').on('click', function(e) {
		e.preventDefault();
		
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
		
		$('#fileName').text(fileName);
	});
	
	$('#writeBtn').on('click',function() {
		
		// validation
		let content = $('#content').val();
		let file = $('#file').val();
		
		if (content == '') {
			alert("내용을 입력해주세요");
			return;
		}
		
		// 이미지 유효성 검사
		if (file != '') {
			console.log(file.split('.').pop());
			let ext = file.split('.').pop().toLowerCase();
			if ($.inArray(ext, ['gif', 'jpg', 'jpeg', 'png']) == -1) {
				alert("gif, jpg, jpeg, png 파일만 업로드 할 수 있습니다.");
				$('#file').val('');
				return;
			}
		}
		
		// 폼태그에 자바스크립트를 심는다.
		let postId = $(this).data('post-id');
		
		let formData = new FormData();
		formData.append("postId", postId);
		formData.append("content", content);
		formData.append("file", $('#file')[0].files[0]);
		
		// ajax
		$.ajax({
			type:"put"
			,url:"/post/update"
			,data:formData
			,enctype:"multipart/form-data"
			,processData:false
			,contentType:false
			
			// response
			, success:function(data) {
				if (data.code == 100) {
					alert("게시글이 수정되었습니다.");
					location.href = "/timeline/timeline_view";
				} else {
					alert(data.errorMessage);
				}
			}
		});
	})
});
</script>
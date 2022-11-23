<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center align-items-center">
	<div class="post-create-box d-flex align-items-center">
		<%-- 프로필, 내가 적을 문구 영역 종료 --%>
		<c:forEach items="${postList}" var="post">
		<div class="file-upload">
			<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
				<a href="#" id="fileUpdateBtn">
					<img src="${post.imagePath}"  alt="기본 이미지" width="350px" height="300px">
				</a>
			<%-- 업로드 할 파일 이름이 임시로 저장될 공간 --%>
			<div id="fileName"></div>
		</div>
		<%-- 프로필, 내가 적을 문구 --%>
		<div class="post-user-info ml-3">
			<div class="d-flex justify-content-start align-items-center ">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="50px" alt="기본 유저사진">
				<h4 class="ml-3">${userLoginId}</h4>
			</div>
			<div class="mt-3">
				<textarea class="form-control" id="content" style="height: 160px; width:300px;" placeholder="내용을 입력해주세요.">${post.content}</textarea>
			</div>
			<button id="postUpdateBtn" class="btn btn-block text-white mt-2" data-post-id="${post.id}">수정</button>
		</div>	<%-- 프로필, 내가 적을 문구 영역 종료 --%>
		</c:forEach>
	</div>
</div>
<script>
$(document).ready(function() {
	// 파일 업로드(사진 클릭)
	$('#fileUpdateBtn').on('click', function(e) {
		e.preventDefault();
		
		$('#file').click();
	});
	
	// 파일 확장자 체크
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
	
	$('#postUpdateBtn').on('click', function() {
		
		let content = $('#content').val();
		let file = $('#file').val();
		
		// validation
		if (content == '') {
			alert("내용을 입력해주세요");
			return;
		}
		
		if (file == '') {
			alert('파일을 업로드 해주세요');
			return;
		}
		
		if (file != '') {
			console.log(file.split('.').pop());
			let ext = file.split('.').pop().toLowerCase();
			if ($.inArray(ext, ['gif', 'jpg', 'jpeg', 'png']) == -1) {
				alert("gif, jpg, jpeg, png 파일만 업로드 할 수 있습니다.");
				$('#file').val('');
				return;
			}
		}
		
		let postId = $(this).data('post-id');
		
		let formData = new FormData();
		formData.append("postId", postId);
		formData.append("content", content);
		formData.append("file", $('#file')[0].files[0]);
		
		// ajax
		$.ajax({
			type:"PUT"
			, url:"/post/update"
			, data:formData
			, enctype:"multipart/form-data"
			, processData:false
			, contentType:false
			
			, success:function(data) {
				if (data.code == 100) {
					alert("게시글을 수정하였습니다.");
					location.href = "/timeline/timeline_view";
				} else {
					alert(data.errorMessage);
				}
			}
		});
	});
});
</script>
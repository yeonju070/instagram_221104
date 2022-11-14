<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center align-items-center">
	<div class="post-create-box d-flex align-items-center">
		<%-- 프로필, 내가 적을 문구 영역 종료 --%>
		<c:forEach items="${cardList}" var="card">
		<div class="file-upload">
			<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
				<c:if test="${not empty card.post.imagePath}">
					<a href="#" id="fileUploadBtn">
						<img src="${card.post.imagePath}"  alt="기본 이미지" width="350px" height="400px">
					</a>
				</c:if>
			<%-- 업로드 할 파일 이름이 임시로 저장될 공간 --%>
			<div id="fileName"></div>
		</div>
		<%-- 프로필, 내가 적을 문구 --%>
		<div class="post-user-info ml-3">
			<div class="d-flex justify-content-start align-items-center ">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="50px" alt="기본 유저사진">
				<strong class="ml-3 text-dark">${userLoginId}</strong>
			</div>
			<div class="mt-3">
				<textarea id="content" rows="7" cols="40">${card.post.content}</textarea>
			</div>
			<button id="writeBtn" class="btn btn-block text-white mt-1" data-post-id="${card.post.id}">게시</button>
		</div>	<%-- 프로필, 내가 적을 문구 영역 종료 --%>
		</c:forEach>
	</div>
</div>
<script>
$(document).ready(function() {
	$('#writeBtn').on('click',function() {
		
		// validation
		let content = $('#content').val();	// 내용
		let file = $('#file').val();		// 이미지
		
		if (content.length == '') {
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
					alert("메모가 수정되었습니다.");
					location.href = "/timeline/timeline_view";
				} else {
					alert(data.errorMessage);
				}
			}
		});
	})
});
</script>
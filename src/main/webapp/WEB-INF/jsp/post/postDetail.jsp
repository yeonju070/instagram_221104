<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center align-items-center">
	<div class="post-create-box d-flex align-items-center">
		<%-- 기본이미지 --%>
		<div class="file-upload">
			<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
			<c:forEach items="${cardList}" var="card">
				<c:if test="${not empty card.post.imagePath}">
					<a href="#" id="fileUploadBtn">
						<img src="${card.post.imagePath}"  alt="기본 이미지" width="350px" height="400px">
					</a>
				</c:if>
			</c:forEach>
			<%-- 업로드 할 파일 이름이 임시로 저장될 공간 --%>
			<div id="fileName"></div>
		</div>
		<%-- 프로필, 내가 적을 문구 --%>
		<div class="post-user-info ml-3">
			<div class="d-flex justify-content-start align-items-center ">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="50px" alt="기본 유저사진">
				<strong class="ml-3 text-dark">${userLoginId}</strong>
			</div>
			<c:forEach items="${cardList}" var="card">
			<div class="mt-3">
				<textarea id="content" rows="7" cols="40">${card.post.content}</textarea>
			</div>
			</c:forEach>
			<button id="writeBtn" class="btn btn-block text-white mt-1">게시</button>
		</div>	<%-- 프로필, 내가 적을 문구 영역 종료 --%>
	</div>
</div>
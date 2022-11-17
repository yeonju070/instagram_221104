<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center align-items-center">
	<div class="profile-box mt-5">
		<%-- 프로필 영역 --%>
		<div class="profile-detail-box d-flex">
			<div class="profile-imagePath">
				<img src=https://media.istockphoto.com/id/1168022051/ko/%EB%B2%A1%ED%84%B0/%EC%82%AC%EC%9A%A9%EC%9E%90-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EB%98%90%EB%8A%94-%EC%9D%B8%EC%A6%9D-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%82%AC%EB%9E%8C-%EA%B8%B0%ED%98%B8.jpg?s=612x612&w=0&k=20&c=usGMDDtBu7aYOubS3rP2Ot5-vzjMHik905IMJpJa7Ps= width="160px" height="160px" alt="기본 유저사진">
			</div>
			
			<div class="user-profile-detail-box ml-5">
				<div class="d-flex justify-content-between">
					<h3 class="loginId">${userLoginId}</h3>
					<a class="btn border">프로필 편집</a>
				</div>
				
				<div class="d-flex justify-content-between mt-2">
					<span>게시물 0</span>
					<a href="#">팔로워 0</a>
					<a href="#">팔로우 0</a>
				</div>
				<div class="mt-2">
					<textarea class="form-control" style="height: 55px; width:300px;" placeholder="나의 소개가 없습니다."></textarea>
				</div>
			</div>
		</div>	<%-- 프로필 영역 종료 --%>
		<%-- 유저 게시글 영역 --%>
		<div class="user-post-box m-3 mt-3">
			<div>나의 게시물</div>
			<div class="userPost border mt-3">
				<span>게시글이 없습니다.</span>
			</div>
		</div>
	</div>
</div>
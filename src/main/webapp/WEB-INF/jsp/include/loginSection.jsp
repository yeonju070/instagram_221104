<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center align-items-center">
	<div class="login-box p-5">
		<%-- instagram 로고 --%>
		<div class="d-flex justify-content-center align-items-center mt-5">
			<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1200px-Instagram_logo.svg.png?20160616034027" width="200px" alt="인스타 로고">
		</div>
		<%-- 기본 유저 로고 --%>
		<div class="d-flex justify-content-center align-items-center ">
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="100px" alt="기본 유저사진">
		</div>
		<form id="loginForm" action="/user/sign_in" method="post">
			<%-- 아이디 input --%>
			<div class="input-group mb-3 mt-3">
				<div class="input-group-prepend">
					<span class="input-group-text">ID</span>
				</div>
				<input type="text" class="form-control" id="loginId" name="loginId" placeholder="아이디를 입력하세요.">
			</div>
			<%-- 비밀번호 input --%>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">PW</span>
				</div>
				<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요.">
			</div>
			<div class="d-flex">
				<a class="btn btn-info w-50 mt-3 mb-5" href="/user/sign_up_view">회원가입</a>
				<button type="submit" class="btn btn-info w-50 mt-3 ml-3 login mb-5">로그인</button>
			</div>
		</form>
	</div>
</div>
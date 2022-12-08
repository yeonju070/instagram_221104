<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center">
	<%-- 메신저 리스트 --%>
	<div class="message-list-box m-5" style="width: 280px; padding-top:75px;">
		<%-- 유저 검색 영역 --%>
		<div class="input-group mb-3 mt-3">
			<div class="input-group-prepend">
				<span class="input-group-text">
					<img src="https://svgsilh.com/svg/1093183.svg" width="20px" alt="돋보기">
				</span>
			</div>
			<input type="text" class="form-control" id="userSearch" name="userSearch" placeholder="사용자 이름을 입력하세요.">
		</div>	<%-- 유저 검색 영역 닫기 --%>
		
		<%-- 유저 추천 리스트 --%>
		<c:forEach items="${userList}" var="user">
		<div class="another-user mt-4 d-flex align-items-center justify-content-between">
			<a href="#" class="d-flex align-items-center">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="45px" alt="기본 유저사진">
				<span class="user-font-size ml-4 text-dark">${user.loginId}</span>
			</a>
		</div>
		</c:forEach>	<%-- 유저 추천 리스트 닫기 --%>
		<button type="submit" id="userSearchBtn" class="btn text-white mt-4">메시지 보내기</button>
	</div>	<%-- 메신저 리스트 닫기 --%>
	
	<%-- 채팅창 영역 --%>
	<div class="message-list-box m-5" style="width: 280px; padding-top:75px;">
		<%-- 유저 검색 영역 --%>
		<div class="input-group mb-3 mt-3">
			<div class="input-group-prepend">
				<span class="input-group-text">
					<img src="https://svgsilh.com/svg/1093183.svg" width="20px" alt="돋보기">
				</span>
			</div>
			<input type="text" class="form-control" id="userSearch" name="userSearch" placeholder="사용자 이름을 입력하세요.">
		</div>	<%-- 유저 검색 영역 닫기 --%>
		
		<%-- 유저 추천 리스트 --%>
		<c:forEach items="${userList}" var="user">
		<div class="another-user mt-4 d-flex align-items-center justify-content-between">
			<a href="#" class="d-flex align-items-center">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAyMjBfMjY4%2FMDAxNjQ1Mjk5Nzc2Mjg2.pzyiS5-tXZYmGvpnR1xGOyaO7lfd2M1vCO-qDlxowbQg.wzX3zzmvL_-4PxIED5x46fd3-COb7cU0oTM6c3KL3O0g.JPEG.zxc7421%2F44884218_345707102882519_2446069589734326272_n.jpg&type=sc960_832" width="45px" alt="기본 유저사진">
				<span class="user-font-size ml-4 text-dark">${user.loginId}</span>
			</a>
		</div>
		</c:forEach>	<%-- 유저 추천 리스트 닫기 --%>
		<button type="submit" id="userSearchBtn" class="btn text-white mt-4">메시지 보내기</button>
	</div>	<%-- 채팅창 닫기 --%>
</div>
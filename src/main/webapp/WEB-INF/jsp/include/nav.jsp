<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-start">
	<div class="timeline-nav">
		<%-- nav instagram 로고 영역 --%>
		<div class="d-flex justify-content-start align-items-center h-25 ml-4">
			<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1200px-Instagram_logo.svg.png?20160616034027" width="100px" alt="인스타 로고">
		</div>
		<%-- nav menu 영역 --%>
		<div class="menu d-flex justify-content-start align-items-start h-50">
			<div>
				<button class="btn homeBtn bg-white ml-3 mb-3">
					<img src="https://cdn-icons-png.flaticon.com/512/70/70950.png" alt="포인트" width="25px">
					<span class="ml-3">홈</span>
				</button><br>
				<button class="btn messageBtn bg-white ml-3 mb-3">
					<img src="https://cdn.icon-icons.com/icons2/3237/PNG/512/chatting_logo_tool_direct_message_social_media_icon_197332.png" alt="포인트" width="25px">
					<span class="ml-3">메시지</span>
				</button><br>
				<button class="btn crateBtn bg-white ml-3">
					<img src="https://cdn-icons-png.flaticon.com/512/78/78181.png" alt="포인트" width="23px">
					<span class="ml-3">만들기</span>
				</button>
			</div>
		</div>
		<%-- nav 더보기 영역 --%>
		<div class="detail d-flex align-items-end ml-3 h-25">
			<button class="btn bg-white detailBtn" data-toggle="modal" data-target="#modal">
				<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/330px-Hamburger_icon.svg.png" alt="더보기" width="30px">
				<span class="ml-3">더보기</span>
			</button>
		</div>
	</div>
</div>
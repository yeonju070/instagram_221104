<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-start">
	<div class="timeline-nav">
		<%-- nav instagram 로고 영역 --%>
		<div class="logo d-flex justify-content-start align-items-center ml-4">
			<a href="/timeline/timeline_view">
				<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1200px-Instagram_logo.svg.png?20160616034027" width="100px" alt="인스타 로고">
			</a>
		</div>
		
		<%-- nav menu 영역 --%>
		<div class="menu d-flex justify-content-start align-items-start">
			<div>
				<div>
					<a href="/timeline/timeline_view" class="btn homeBtn bg-white ml-3 mb-3">
						<img src="https://cdn-icons-png.flaticon.com/512/70/70950.png" alt="홈" width="25px">
						<span class="ml-3">홈</span>
					</a>
				</div>
				<div>
					<a href="/message/message_list" class="btn messageBtn bg-white ml-3 mb-3">
						<img src="https://img.icons8.com/ios/2x/sent.png" alt="메시지" width="25px">
						<span class="ml-3">메시지</span>
					</a>
				</div>
				<div>
					<a href="/post/post_create_view" class="btn crateBtn bg-white ml-3">
						<img src="https://cdn-icons-png.flaticon.com/512/78/78181.png" alt="만들기" width="23px">
						<span class="ml-3">만들기</span>
					</a>
				</div>
			</div>
		</div>
		
		<%-- nav 더보기 영역 --%>
		<div class="detail d-flex ml-4">
			<a href="#" class="more-btn" data-toggle="modal" data-target="#modal">
				<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/330px-Hamburger_icon.svg.png" alt="더보기" width="30px">
				<span class="ml-3">더보기</span>
			</a>
		</div>
	</div>
</div>
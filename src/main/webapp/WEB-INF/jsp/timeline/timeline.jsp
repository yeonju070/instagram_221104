<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>instagram</title>
<!-- jquery : bootstrap, datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
	<div id="wrap">
		<div class="d-flex justify-content-between align-items-center">
			<nav class="d-flex justify-content-start">
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
			</nav>
			<div>
				<section class="timeline-contents d-flex justify-content-between">
					<%-- 게시글 영역 --%>
					<div class="timeline-content bg-dark">
						<input type="text" class="form-control" id="search" placeholder="검색할 내용을 입력하세요.">
						<button class="">검색</button>
					</div>
					<div class="timeline-profile bg-info"></div>
				</section>
			</div>
		</div>
	</div>
<!-- Modal -->
<div class="modal fade" id="modal">
	<%-- modal-dialog-centered: 모달창을 수직 가운데 정렬, modal-sm: 작은 모달창 --%>
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
      		<%-- Modal 창 안에 내용 채워넣기 --%>
      		<div class="text-center">
      			<div class="py-3 border-bottom">
      				<button id="profileDetailBtn" class="btn bg-white btn-block">설정</button>
      			</div>
      			<div class="py-3 border-bottom">
      				<button id="signOutBtn" class="btn bg-white btn-block">로그아웃</button>
      			</div>
      			<div class="py-3">
      				<%-- data-dismiss="modal" 모달창 닫힘 --%>
      				<button data-dismiss="modal" class="btn bg-white btn-block">취소</button>
      			</div>
      		</div>
		</div>
	</div>
</div>
</body>
</html>
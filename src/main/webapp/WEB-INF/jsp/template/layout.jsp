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
		<div class="d-flex justify-content-between">
			<nav class="border-right">
				<jsp:include page="../include/nav.jsp" />
			</nav>
			<section class="contents">
				<jsp:include page="../${viewName}.jsp" />
			</section>
		</div>
	</div>
	<%-- nav Modal --%>
	<div class="modal fade" id="modal">
		<%-- modal-dialog-centered: 모달창을 수직 가운데 정렬, modal-sm: 작은 모달창 --%>
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
	      		<%-- Modal 창 안에 내용 채워넣기 --%>
	   			<div class="text-center">
	      			<div class="py-3">
	      				<a href="/user/profile_detail_view" id="detailBtn" class="btn">설정</a>
	      			</div>
	      			<div class="py-3">
	      				<a href="/user/sign_out" class="btn">로그아웃</a>
	      			</div>
	      			<div class="py-3">
	      				<%-- data-dismiss="modal" 모달창 닫힘 --%>
	      				<a href="#" data-dismiss="modal">취소</a>
	      			</div>
	      		</div>
			</div>
		</div>
	</div>
</body>
</html>
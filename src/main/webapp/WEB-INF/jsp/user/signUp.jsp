<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="sign-up-box p-5">
		<%-- instagram 로고 --%>
		<div class="d-flex justify-content-center p-3">
			<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1200px-Instagram_logo.svg.png?20160616034027" width="200px" alt="인스타 로고">
		</div>
		<h4 class="text-center">친구들의 사진과 동영상을 보려면 가입하세요.</h4>
		
		<%-- 회원가입 --%>
		<form id="signUpForm" method="post" action="/user/sign_up">
			<div class="mt-3">
				<input type="text" name="email" class="form-control" placeholder="이메일주소">
			</div>
			<div class="mt-3">
				<input type="text" name="name" class="form-control" placeholder="성명">
			</div>
			<div class="mt-3">
				<input type="text" name="loginId" class="form-control" placeholder="사용자 이름">
			</div>
			<%-- 사용자 이름 중복 확인 --%>
			<div>
				<div id="idCheckLength" class="small text-danger d-none">ID를 4자 이상 입력해주세요.</div>
				<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 ID입니다.</div>
				<div id="idCheckConfirm" class="small text-success d-none">사용 가능한 ID 입니다.</div>
			</div>
			<div class="mt-3">
				<input type="password" name="password" class="form-control" placeholder="비밀번호">
			</div>
			<div class="mt-3">
				<button type="submit" id="signUpBtn" class="btn btn-info btn-block mb-5">가입하기</button>
			</div>
		</form>
	</div>
</div>
<script>
$(document).ready(function() {
	$('input[name=loginId]').on('change', function(e) {
		e.preventDefault();
		
		let loginId = $('input[name=loginId]').val().trim();
		
		if (loginId.length < 4) {
			$('#idCheckLength').removeClass('d-none'); // 경고문구 노출
			$('#idCheckDuplicated').addClass('d-none'); // 숨김
			$('#idCheckConfirm').addClass('d-none'); // 숨김
			return;
		}
		
		$.ajax({
			url: "/user/is_duplicated_id",
			data: {"loginId": loginId},
			success: function(data) {
				if (data.code == 100) {
					$('#idCheckDuplicated').removeClass('d-none');
					$('#idCheckLength').addClass('d-none');
					$('#idCheckConfirm').addClass('d-none');
				} else {
					$('#idCheckDuplicated').addClass('d-none');
					$('#idCheckLength').addClass('d-none');
					$('#idCheckConfirm').removeClass('d-none');
				}
			},
			error: function(error) {
				alert("아이디 중복확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	$('#signUpBtn').on('click', function(e) {
		e.preventDefault();
		
		let email = $('input[name=email]').val().trim();
		let name = $('input[name=name]').val().trim();
		let loginId = $('input[name=loginId]').val().trim();
		let password = $('input[name=password]').val().trim();
		
		if (email == '') {
			alert("이메일을 입력하세요.");
			return;
		}
		
		if (name == '') {
			alert("성명을 입력하세요.");
			return;
		}

		if (loginId == '') {
			alert("사용자 이름을 입력하세요.");
			return;
		}

		if (password == '') {
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		if ($('#idCheckConfirm').hasClass('d-none') == true) {
			alert("아이디 확인을 다시 해주세요.");
			return;
		}
		
		// ajax
		let url = $('#signUpForm').attr("action");
		let params = $('#signUpForm').serialize();
		
		$.post(url, params)
		.done(function(data) {
			if (data.code == 100) {
				alert("가입을 환영합니다!!! 로그인을 해주세요.");				
				location.href="/user/sign_in_view";
			} else {
				alert("가입에 실패했습니다. 다시 시도해주세요.");
			}
		}); 
	})
});
</script>
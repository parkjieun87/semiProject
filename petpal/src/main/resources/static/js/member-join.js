//회원 가입 페이지 유효성 검사 모듈
//- jQuery가 반드시 필요

$(function(){
	//검사 결과 저장 객체
	var valid = {
		memberIdValid:false,			//아이디	(형식+중복)
		memberPwValid:false,		//비밀번호(형식)
		memberPwReValid:false,		//비밀번호 확인(일치)
		memberNickValid:false,		//닉네임(형식+중복)
		memberTelValid:false,		//전화번호(형식)
		memberAddressValid:true,	//주소(애매한 입력)
		isAllValid:function(){
			return this.memberIdValid
						&& this.memberPwValid
						&& this.memberPwReValid
						&& this.memberNickValid
						&& this.memberTelValid
						&& this.memberAddressValid;
		}
	};

	//아이디 검사
	//[1] 형식 검사
	//[2] 형식 검사 통과 시 중복 검사
	$("[name=memberId]").blur(function(){
		var regex = /^[a-z][a-z0-9]{7,19}$/;
		var memberId = $(this).val();
		var isValid = regex.test(memberId);

		valid.memberIdValid = isValid;

		if(isValid) {
			$.ajax({
				url:contextPath+"/rest/member/memberId/" + memberId,
				method:"get",
				success:function(response) {//성공시 Y/N
					if(response == "Y") {//사용 가능한 아이디 -> valid
						valid.memberIdValid = true;
						$("[name=memberId]")
									.removeClass("valid invalid invalid2")
									.addClass("valid");
					}
					else {//사용중인 아이디 -> invalid2
						valid.memberIdValid = false;
						$("[name=memberId]")
									.removeClass("valid invalid invalid2")
									.addClass("invalid2");
					}
				},
				error:function(){//통신 오류 발생 시
					alert("오류가 발생했습니다\n잠시 후 시도하세요");
					valid.memberIdValid = false;
				}
			});
		}
		else {//아이디가 형식에 맞지 않는 경우 -> invalid
			$(this).removeClass("valid invalid invalid2")
						.addClass("invalid");
		}
	});

	//비밀번호 검사
	$("[name=memberPw]").blur(function(){
		var regex = /^[A-Za-z~!@#$%^&*()_+=0-9]{8,20}$/;
		var isValid = regex.test($(this).val());

		valid.memberPwValid = isValid;
		$(this).removeClass("valid invalid")
					.addClass(isValid ? "valid" : "invalid");
	});

	//비밀번호 확인 검사
	$("#passwordRe").blur(function(){
		var memberPw = $("[name=memberPw]").val();
		var memberPwRe = $(this).val();

		var isEmpty = memberPw.length == 0;
		var isValid = memberPw == memberPwRe;

		valid.memberPwReValid = !isEmpty && isValid;

		$(this).removeClass("valid invalid invalid2");
		if(isEmpty) {
			$(this).addClass("invalid2");
		}
		else if(isValid) {
			$(this).addClass("valid");
		}
		else {
			$(this).addClass("invalid");
		}
	});

	$("[name=memberNick]").blur(function(){
		var regex = /^[가-힣0-9]{2,10}$/;
		var target = $(this);
		var memberNick = target.val();
		var isValid = regex.test(memberNick);

		valid.memberNickValid = isValid;
		if(!isValid) {//형식 오류 -> invalid
			target.removeClass("valid invalid invalid2")
						.addClass("invalid");
			return;
		}

		$.ajax({
			url:contextPath+"/rest/member/memberNick/"+memberNick,
			method:"get",
			success:function(response){//Y 또는 N
				if(response == "Y") {//사용가능 -> valid
					valid.memberNickValid = true;
					target.removeClass("valid invalid invalid2")
								.addClass("valid");
				}
				else {//사용중 -> invalid2
					valid.memberNickValid = false;
					target.removeClass("valid invalid invalid2")
								.addClass("invalid2");
				}
			},
			error:function(){
				alert("통신 오류 발생");
				valid.memberNickValid = false;
			},
		});
	});

	//전화번호 검사
	$("[name=memberTel]").blur(function(){
		var regex = /^01[016-9][1-9][0-9]{6,7}$/;
		var isValid = regex.test($(this).val());

		valid.memberTelValid = isValid;
		$(this).removeClass("valid invalid")
					.addClass(isValid ? "valid" : "invalid");
	});

	//주소 검사
	$("[name=memberDetailAddr]").blur(function(){
		var memberPost = $("[name=memberPost]").val();
		var memberBasicAddr = $("[name=memberBasicAddr]").val();
		var memberDetailAddr = $(this).val();

		var isAllEmpty = memberPost.length == 0
								&& memberBasicAddr.length == 0
								&& memberDetailAddr.length == 0;
		var isAllWritten = memberPost.length > 0
								&& memberBasicAddr.length > 0
								&& memberDetailAddr.length > 0;
		var isValid = isAllEmpty || isAllWritten;

		valid.memberAddressValid = isValid;

		//class..? 알림창..?
		$(this).removeClass("valid invalid")
					.addClass(isValid ? "valid" : "invalid");
//		if(isValid == false) {
//			alert("상세주소를 작성해야 합니다");
//		}
	});
	
	//주소 지우기 버튼
	$(".clear-address-btn").click(function(){
		$("[name=memberPost]").val("");
		$("[name=memberBasicAddr]").val("");
		$("[name=memberDetailAddr]").val("")
						.removeClass("valid invalid");
	});


	//폼 검사
	$(".join-form").submit(function(e){
		//console.table(valid);
/*		if(valid.isAllValid() == false){ //입력된 값이 마음에 안들면 
			e.preventDefault();
		}*/
		
		return valid.isAllValid();
	});
});


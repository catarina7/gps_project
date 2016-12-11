$(function(){
	var pwtest=0;
	var pwchk =0;
	var pwinchk = 0;
	
	//새로운 비밀번호 확인
	$("se_#new_pw_input").keyup(function(){
		var reg1=/[a-z]+/;
		var reg2=/[A-Z]+/;
		var reg3=/\d+/;
		var reg4=/[`~!@#$%^&*+-=]/;
		if(reg1.test($(this).val())){
			pwtest++;
		}
		if(reg2.test($(this).val())){
			pwtest++;
		}
		if(reg3.test($(this).val())){
			pwtest++;
		}
		if(reg4.test($(this).val())){
			pwtest++;
		}

		if($(this).val()=="" || $(this).val().length<8 || pwtest<2){
			$("#pw_check").show();
			pwchk=0;
		}else{
			$("#pw_check").hide();
			pwchk++;
		}
	});
	
	//비밀번호 확인 일치 체크 경고 메세지
	$("#se_pw_set").keyup(function(){
		if($(this).val()==$("#se_new_pw_input").val()){
			$("#pw_confirm").hide();
			pwchk++;
		}else{
			$("#pw_confirm").show();
			pwchk=0;
		}
	});
	
	//현재 비밀번호 확인용
	$("#se_pw_input").keyup(function(){
		if($(this).val()==$("#pas_pw").val()){
			pwinchk++;
		}else{
			pwinchk=0;
		}
	});
	
	
	$("#pwmod_btn").click(function(){
		if(pwinchk ==0 ){
			alert("비밀번호가 일치 하지 않습니다.");
		}else if(pwchk == 0){
			alert("새로운 비밀번호를 확인해 주세요.");
		}else {
			
			$.ajax({
				url : "MemMod",
				data : {			
					m_id : $("#pas_id").val(),
					m_pw : $("#se_new_pw_input").val(),
					m_kind : 1
				},
				type : "post",
				success : function(result){
					if(result==0){
						alert("회원 수정에 실패했습니다. 입력정보를 확인해 주세요.");
					}else{
						alert("회원정보 수정에 성공했습니다. 로그인 페이지로 이동하겠습니다.");
						location.href="login";
					}
				}
			});  
			
		}
		
		
	});
	
	
});
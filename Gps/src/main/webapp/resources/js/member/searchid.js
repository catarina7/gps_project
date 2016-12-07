$(function(){
	
	//name 입력확인	
	var namechk=0;	 //이름 입력 여부 확인
	var emailchk=0;	//전화번호 입력 체크
	
	//이름 입력 여부 체크 경고 메세지
	$("#si_name_input").keyup(function(){
		if($(this).val()==""){
			$("#namechk").show();
			 
		}else{
			$("#namechk").hide();
			namechk++;
		}
	});		
	
	
	//email 입력 여부 체크 경고메세지
	$("#si_email_input").keyup(function(){
		//이메일 유효성 검사 정규표현식
		var reg=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if($(this).val()=="" || !(reg.test($(this).val()))){
			$("#emailchk").show();
		}else{
			$("#emailchk").hide();
			emailchk++;
		}
	});
	
	//id 중복체크 ajax
	$("#searchid").click(function(){
		if(namechk == 0){
			alert("이름을 입력해 주세요.");
		}else if(emailchk == 0){
			alert("email을 입력해 주세요.");
		}else{
			$.ajax({
				url : "searchId",
				data : {
					m_name : $("#si_name_input").val(),
					m_email : $("#si_email_input").val()
					},				
				type : "post",
				success : function(result){
					 if(result.m_num != null){
						 alert(result.m_id+"입니다.( >..0 ) ok");
						 location.href="login";
					 }else{
						 alert("입력 정보를 확인해 주세요.");
					 }
				}
			});
		}
	});
	
	
	
	
});
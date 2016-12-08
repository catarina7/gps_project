 $(function(){
	
	//name 입력확인	
	var idChk=0;	//id입력 여부 확인
	var namechk=0;	 //이름 입력 여부 확인
	var emailchk=0;	//전화번호 입력 체크
	
	//id input에 한글 불가 및 미입력 경고 메세지
	$("#sp_id_input").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		}
		if($(this).val() == ""){
			$("#idchk").show();
			idChk--;
		}else{
			$("#idchk").hide();
			idChk++;
		}
		
	});
	
	//이름 입력 여부 체크 경고 메세지
	$("#sp_name_input").keyup(function(){
		if($(this).val()==""){
			$("#namechk").show();
			 namechk--;
		}else{
			$("#namechk").hide();
			namechk++;
		}
	});		
	
	
	//email 입력 여부 체크 경고메세지
	$("#sp_email_input").keyup(function(){
		//이메일 유효성 검사 정규표현식
		var reg=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if($(this).val()=="" || !(reg.test($(this).val()))){
			$("#emailchk").show();
			emailchk--;
		}else{
			$("#emailchk").hide();
			emailchk++;
		}
	});
	
	//id 중복체크 ajax
	$("#searchpw").click(function(){
		if(idChk == 0){
			alert("아이디를 입력해 주세요.");
		}else if(namechk == 0){
			alert("이름을 입력해 주세요.");
		}else if(emailchk == 0){
			alert("email을 입력해 주세요.");
		}else{
			$.ajax({
				url : "SearchPw",
				data : {
					m_id: $("#sp_id_input").val(),
					m_name : $("#sp_name_input").val(),
					m_email : $("#sp_email_input").val()
					},				
				type : "post",
				success : function(result){
					 if(result != 0){
						 alert("변경된 pw가 email로 보내 졌습니다.");
						 location.href="/gps/index";
					 }else{
						 alert("입력 정보를 확인해 주세요.");
					 }
				}
			});
		}
	});
	
});
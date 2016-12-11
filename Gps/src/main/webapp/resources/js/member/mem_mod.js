$(function(){
	
	//전화번호 검사용
	var telChk = 0;
	var emailChk = 0;
	var tel_split = "";
	
	//이름 
	
	
	
	//전화번호 
	/*var tel = $("#pas_tel").val();
	
	tel_split = tel.split("=");
	
	
	if(tel_split[0] == "SKT"){
		$("select > option[value = SKT]").attr("selected","true");
	}else if(tel_split[0] == "LGT"){
		$("select > option[value = LGT]").attr("selected","true");
	}else if(tel_split[0] == "KT"){
		$("select > option[value = KT]").attr("selected","true");
	}	
	$("#pu_tel_input").val(tel_split[1]);*/
	
	
	/*//성별
	if($("#pas_gender").val() == "male"){		
		$("input:radio[value=male]").prop("checked","checked");
	}else{		
		$("input:radio[value=female]").prop("checked","checked");
	}*/
	
	
	/*전화번호*/
	//전화번호 입력여부 체크 경고 메세지 유효성 검사
	$("#pu_tel_input").keyup(function(){
		//전화번호 유효성 검사 정규표현식
		var reg=/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		if($(this).val()=="" || !(reg.test($(this).val()))){
			$("#telchk").show();
			telChk = 0;
		}else{
			$("#telchk").hide();
			telChk ++;
		}
	});
	/*성별*/
	
	/*email*/
	//email 입력 여부 체크 경고메세지
	$("#pu_email_input").keyup(function(){
		
		//이메일 유효성 검사 정규표현식
		var reg=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if($(this).val()=="" || !(reg.test($(this).val()))){
			$("#emailchk").show();
			emailChk = 0;
		}else{
			$("#emailchk").hide();
			emailChk ++;
		}
	});
	
	//수정하기 ajax
	$("#pu_mod_btn").click(function(){
		if($("#pu_name_input").val() == ""){
			alert("수정 이름 항목을 비워두지 마세요.");
		}else if(telChk == 0){
			alert("수정된 전화번호 를 입력해 주세요.");
		}else if($("input:radio[name=pu_m_gender]:checked").val() == ""){
			alert("성별 체크를 확인해 주세요.");
		}else if(emailChk == 0){
			alert("수정된 email을 입력해 주세요.");
		}else {
			$.ajax({
				url : "MemMod",
				data : {			
					m_id : $("#id_input").val(),
					m_name : $("#pu_name_input").val(),
					m_tel : $("#pu_tel_option").val()+"="+$("#pu_tel_input").val(),
					m_gender : $("input:radio[name=pu_m_gender]:checked").val(),
					m_email : $("#pu_email_input").val()
				},
				type : "post",
				success : function(result){
					if(result==0){
						alert("회원 일반 정보수정에 실패했습니다. 입력정보를 확인해 주세요.");
					}else{
						alert("회원 정보 수정에 성공했습니다.");
						location.href="mem_Info"; 
					}
				}
			});  
		}
	});
	
	
	
});
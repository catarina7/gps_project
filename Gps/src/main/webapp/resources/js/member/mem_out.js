$(function(){
	
	$("#pw_input").keyup(function(){
		var reg1=/[a-z]+/;
		var reg2=/[A-Z]+/;
		var reg3=/\d+/;
		var reg4=/[`~!@#$%^&*+-=]/;
		var pwtest=0;
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
			pwchk=1;
		}
	});
	
	$("#out_btn").click(function(){
		if(pwchk == 0){
			alert("비밀번호를 확인해 주세요.");
		}else{
			$.ajax({
				url : "memOut",
				data : {
					
					m_num : $("#pas_num").val(),
					m_id : $("#pas_id").val(),
					m_pw : $("#pw_input").val()					
					
				},
				type : "post",
				success : function(result){
					if(result==0){
						alert("탈퇴에 실패 했습니다. 관리자에게 문의해주세요");
					}else{
						alert("탈퇴에 성공했습니다. 이용해 주셔서 감사합니다.");
						location.href="/gps/index";
					}
				}
			});  
		}
	});
	
});
$(function(){
	
	var pwtest = 0;
	var pwchk = 0;
	
	//새로운 비밀번호 확인
	$("#pw_input").keyup(function(){
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
	
	$("#out_btn").click(function(){
		if(pwchk == 0){
			alert("비밀번호를 확인해 주세요.");
		}else {
			
			$.ajax({
				url : "memOut",
				data : {			
					m_id : $("#pas_id").val(),
					m_pw : $("#pw_input").val()
				},
				type : "post",
				success : function(result){
					if(result==0){
						alert("입력정보를 확인해 주세요.");
					}else{
						alert("이용해 주셔서 감사합니다. 홈화면으로 이동하겠습니다. ");
						location.href="/gps/index";
					}
				}
			});  
			
		}
	
	}); 
});
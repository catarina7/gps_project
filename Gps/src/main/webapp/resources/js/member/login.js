$(function(){	
	//id input에 한글 불가 
	$("#id_input").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		}
		
	});
	
	//아이디 확인 
	$("#pw_input").focus(function(){
		if($("#id_input").val().length<5){
			alert("아이디는 영문/숫자 5자 이상의 조합입니다.");
			$("#id_input").val("");
			$("#id_input").focus();
		}
		
	});
	
	
	$("#log_btn").click(function(){
		var reg1=/[a-z]+/;
		var reg2=/[A-Z]+/;
		var reg3=/\d+/;
		var reg4=/[`~!@#$%^&*+-=]/;
		var pwtest=0;
		if(reg1.test($("#pw_input").val())){
			pwtest++;
		}
		if(reg2.test($("#pw_input").val())){
			pwtest++;
		}
		if(reg3.test($("#pw_input").val())){
			pwtest++;
		}
		if(reg4.test($("#pw_input").val())){
			pwtest++;
		}

		if($("#pw_input").val()=="" || $("#pw_input").val().length<8 || pwtest<2){
			alert("비밀번호는 영문/숫자 8자 이상의 조합입니다.");
			$("#pw_input").val("");
			$("#pw_input").focus();

		}else{
			$.ajax({
				url : "login",
				data : {
					id : $("#id_input").val(), 
					pw : $("#pw_input").val()},
				type : "post",
				success : function(result){
					if(result==0){
						alert("아이디나 비밀번호가 잘못 입력되었습니다. 확인 후 다시 시도해주세요");
						$("#id_input").val("");
						$("#pw_input").val("");
					}else{
						alert("환영합니다.");
						location.href="/gps/index";
					}
				}
			});
		}
	});
	
	$("#join_btn").click(function(){
		location.href="join";
	});
	
});
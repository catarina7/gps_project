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
	
	$("#pwbtn").click(function(){
		if($("#pw_input").val() == $("#pw_set").val()){
			if($("#category").val() == 1){
				location.href="mem_Info";
			}else if($("#category").val() == 2){
				location.href="";
			}else if($("#category").val() == 3){
				location.href="";
			}
		}else{
			alert("비밀번호를 체크해 주세요.");
		}
	});
	
});
$(function(){
	
	//pw
	var pas_pw = $("#pas_pw").val();
	
	var pw_sub = pas_pw.substring(6);
	
	
	for(var i=0;i<6;i++){
		pw_sub = "*"+pw_sub;
	}
	$("#pw_input").val(pw_sub);
	
	//전화번호
	var tel_split = "";
	var tel = $("#pas_tel").val();
	
	tel_split = tel.split("=");
	
	
	if(tel_split[0] == "SKT"){
		$("select > option[value = SKT]").attr("selected","true");
	}else if(tel_split[0] == "LGT"){
		$("select > option[value = LGT]").attr("selected","true");
	}else if(tel_split[0] == "KT"){
		$("select > option[value = KT]").attr("selected","true");
	}	
	$("#tel_input").val(tel_split[1]);
	
	
	//성별
	if($("#pas_gender").val() == "male"){		
		$("input:radio[value=male]").prop("checked","checked");
	}else{		
		$("input:radio[value=female]").prop("checked","checked");
	}
	
	$("#mod_btn").click(function(){
		location.href = "mem_Mod"
	});
	
	
});
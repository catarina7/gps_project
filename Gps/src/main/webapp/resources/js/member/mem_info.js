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
		$("select > option[value = ch_SKT]").attr("selected","true");
		
	}else if(tel_split[0] == "LGT"){
		$("select > option[value = ch_LGT]").attr("selected","true");
		
	}else if(tel_split[0] == "KT"){
		$("select > option[value = ch_KT]").attr("selected","true");
		
	}	
	$("select").attr("selected","true");
	$("#tel_input").val(tel_split[1]);
	
	
	//성별
	if($("#pas_gender").val() == "male"){		
		$("input:radio[id=gender]").prop("checked","checked");
		$("input:radio[id=gender]").attr("disabled","disabled");
		$("input:radio[id=gender_w]").attr("disabled","disabled");
	}else{		
		$("input:radio[id=gender_w]").prop("checked","checked");
		$("input:radio[id=gender]").attr("disabled","disabled");
		$("input:radio[id=gender_w]").attr("disabled","disabled");
		
	}
	
	
	//비밀번호 수정하기 폼
	$("#pwmod_btnform").click(function(){
			$(".pw_modform").show();
			$(this).hide();
	});
	
	//수정하기 스크립트 붙여 놓음 
	//비밀번호 수정하기 취소
	$("#pwmod_btncle").click(function(){
		$("#pwmod_btnform").show();
		$("#se_pw_input").val("");
		$("#se_new_pw_input").val("");
		$("#se_pw_set").val("");
		$(".pw_modform").hide();
	});
	
	//회원정보 수정하기 폼
	$("#mod_btnform").click(function(){
		/*location.href = "mem_Mod"*/
		$(".modform").show();		
		$("#tr_mod").hide();
	});
	
	//회원정보 수정하기 취소
	$("#mod_btncle").click(function(){
		$("#tr_mod").show();
		$("#pu_name_input").val("");
		$("select > option[name = chskt]").attr("selected","true");
		$("#pu_tel_input").val("");		
		$("pu_email_input").val("");
		$(".modform").hide();
	});
	
});
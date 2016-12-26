$(function(){
	
	//회원정보 확인/ 수정
	$("#meminfo_mod").click(function(){
		location.href="pw_check?category=1";
	});
	
	//비밀번호 변경
	$("#mempw_mod").click(function(){
		location.href="pw_check?category=2";
	});
	
	//회원 탈퇴
	$("#mem_dropout").click(function(){
		location.href="pw_check?category=3";
	});	
	
	
	
	
	
	
	
	
});
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	#joinform{
		display: none;
	}
	#id_check{
		display: none;
	}
	#pw_confirm{
		display: none;
	}
	#pw_check{
		display: none;
	}
</style>
<script type="text/javascript">
	
	//약정 체크 여부 확인용 
	$(function(){		
		$("#checkbox").click(function(){
			if($("#check").prop("checked")){
				$("#joinform").css({"display" : "block"});
			}
		});
		
		$("#check").click(function(){
			$("#joinform").css({"display":"none"});
		});
		
		var idchk=0;	//id중복체크 여부
		var pwchk=0;	//비밀번호, 비밀번호 확인 일치여부
		var namechk=0;	 //이름 입력 여부 확인
		
		//id input에 한글 불가 및 미입력 경고 메세지
		$("#id_input").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
            }
			if($(this).val() == ""){
				$("#id_check").hide();
			}else{
				$("#id_check").show();
			}
			idchk=0;
        });
		
		//pw 8자 이상 경고 메세지 유효성 검사
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
		
		//비밀번호 확인 일치 체크 경고 메세지
		$("#pw_set").keyup(function(){
			if($(this).val()==$("#pw_input").val()){
				$("#pw_confirm").hide();
				pwchk=1;
			}else{
				$("#pw_confirm").show();
				pwchk=0;
			}
		});
		
		//전화번호 입력여부 체크 경고 메세지 유효성 검사
		$("#tel_input").keyup(function(){
			//전화번호 유효성 검사 정규표현식
			var reg=/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			if($(this).val()=="" || !(reg.test($(this).val()))){
				$("#telchk").show();
			}else{
				$("#telchk").hide();
			}
		});
		
		
		//email 입력 여부 체크 경고메세지
		$("#email_input").keyup(function(){
			//이메일 유효성 검사 정규표현식
			var reg=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if($(this).val()=="" || !(reg.test($(this).val()))){
				$("#emailchk").show();
			}else{
				$("#emailchk").hide();
			}
		});
		
		//이름 입력 여부 체크 경고 메세지
		$("#name_input").keyup(function(){
			if($(this).val()==""){
				$("#namechk").show();
				namechk++; 
			}else{
				$("#namechk").hide();
			}
		});		
		
		//id 중복체크 ajax
		$("#id_check").click(function(){
			if($("#id_input").val().length<5){
				alert("영문/숫자 5자 이상의 아이디를 사용해주세요");
				$("#id_input").val("");
				$("#idchk").show();
			}else{
				$.ajax({
					url : "idCheck",
					data : {id : $("#id_input").val()},
					type : "post",
					success : function(result){
						if(result == 0){
							alert("사용가능한 아이디입니다");
							idchk=1;
						}else{
							alert("이미 사용 중인 아이디입니다");
							$("#id_input").val("");
							$("#idchk").show();
							idchk=0;
						}
					}
				});
			}
		});
		
		
		//가입처리 전 체크
		$("#submit_btn").click(function(){
			//input 창 빈 칸 검사
			var inputs=document.getElementsByClassName("input");
			var input_chk=0;
			for(i=0; i<inputs.length; i++){
				if(inputs.item(i).value==""){
					input_chk++;
				}
			}
			
			//회원가입 ajax
			if(input_chk!=0){
				alert("필수 입력정보를 모두 입력해주세요");
			}else if(idchk!=1){
				alert("아이디를 중복체크 해주세요");
			}else{
					 /* $.ajax({
						url : "",
						data : {
							id : $("#id_input").val(),
							pw : $("#pw_input").val(),
							name : $("#name_input").val(),
							tel : $("#tel_option").val()+"="+$("#tel_input").val(),
							email : $("#email_input").val(),
							gender : $("#gender").val()
							},
						type : "post",
						success : function(result){
							if(result==0){
								alert("회원가입에 실패했습니다. 관리자에게 문의해주세요");
							}else{
								 location.href=""; 
							}
						}
					});  */
					alert("process");
				}
			});
		
		
	});
	
</script>

</head>
<body>

	<textarea rows="" cols="">
		<!-- 약정 첨부 예정 -->
	</textarea><br>
	
	<input type="checkbox" id="check"> 위 약정을 동의하고 13세 이상임을 확인합니다. 
	<button id="checkbox">동의합니다.</button>

	<div id="joinform">
		<form action="#" id="frm">
			id: <input type="text" name="m_id" id="id_input" class="input">
			<input type="button" id="id_check" value="id_check"><br> 
			
			pw: <input type="text" name="m_pw" id="pw_input" class="input">
			<input type="text" id="pw_check" readonly="readonly" value="비밀번호는 띄어쓰기 없이 8~15자의 영문 대/소문자, 숫자 및 	특수문자 중 2가지 이상 조합으로 입력하셔야 합니다."><br>
			pwcheck: <input type="text" id="pw_set" >
			<input type="text" id="pw_confirm" readonly="readonly" value="비밀번호가 일치하지 않습니다. 다시 입력해주세요.">
			<br>
			
			name: <input type="text" name="m_name" id="name_input" class="input">
			<p id="namechk">이름을 입력해주세요.</p>
			<br>
			tel: <select id="tel_option" name="m_tel">
				<option value="SKT" selected>SKT</option> 
				<option value="LGT">LGT</option>
				<option value="KT">KT</option>
			</select> 
				<input type="text" name="m_tel" id="tel_input" placeholder=" '-'를 포함하여 입력해주세요." class="input">
				<p id="telchk">전화번호를 '-'를 포함하여 정확하게 입력해주세요.</p> 
			<br> 
			gender: 
			male <input type="radio" name="m_gender" id="gender" value="male"> 			
			female <input type="radio" name="m_gender" id="gender" value="female"> 
			<br>
			e-mail: <input type="text" name="m_email" id="email_input" placeholder="이메일을 입력해주세요." class="input">
			<p id="emailchk">이메일을 정확하게 입력해주세요.</p><br>
			<input type="button" id="submit_btn" value="회원가입">
	
		</form>
	</div>


</body>
</html>
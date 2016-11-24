<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#joinform{
		display: none;
	}
</style>
<script type="text/javascript">
	
	$(function(){		
		$("#checkbox").click(function(){
			alert("wow");
			$("#check").prop("checked", function(){
				$("#frm").css("display" : "block");
			});
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
		<form action="" id="frm">
			id: <input type="text" name="m_id" id="id"><br> 
			pw: <input
				type="text" name="m_pw" id="pw"><br> 
			name: <input
				type="text" name="m_name" id="name"><br> 
			tel: <select
				id="tel0" name="m_tel">
				<option value="SKT" selected>SKT</option>
				<option value="LGT">LGT</option>
				<option value="KT">KT</option>
			</select> <select id="tel1" name="m_tel">
				<option value="010" selected>010</option>
				<option value="LGT">LGT</option>
				<option value="KT">KT</option>
			</select> <input type="text" id="tel2" name="m_tel">- 
			<input type="text" id="tel3" name="m_tel"> <br> 
			birth: <input type="date" name="m_date" id="birth"><br> 
			gender: <input type="radio" name="m_gender" id="gender" value="male"> 
			male <input type="radio" name="m_gender" id="gender" value="male"> 
			female<br>
	
			<button id="submit">작성하기</button>
	
		</form>
	</div>


</body>
</html>
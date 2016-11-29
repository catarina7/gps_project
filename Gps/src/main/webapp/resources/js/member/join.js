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
	var dayDiff=0;	//나이 체크


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
					if(result == 1){
						alert("이미 사용 중인 아이디입니다");
						$("#id_input").val("");
						$("#idchk").show();
						idchk=0;
					}else{							
						alert("사용가능한 아이디입니다");
						idchk=1;
					}
				}
			});
		}
	});


	//가입 나이 확인 
	//서버 시간 가지고 오기
	$("#birth_input").change(function(){

		var xmlHttp;
		function srvTime(){
			if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
				xmlHttp.open('HEAD',window.location.href.toString(),false);
				xmlHttp.setRequestHeader("Content-Type", "text/html");
				xmlHttp.send('');
				return xmlHttp.getResponseHeader("Date");
			}else if (window.ActiveXObject) {
				xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
				xmlHttp.open('HEAD',window.location.href.toString(),false);
				xmlHttp.setRequestHeader("Content-Type", "text/html");
				xmlHttp.send('');
				return xmlHttp.getResponseHeader("Date");
			}
		}
		var st = srvTime();


		//입력 생일 받아 오기 
		var birth = $("#birth_input").val();

		if(birth != ''){
			var str=birth.split('-');
			var today = new Date(st);
			var toMonth = today.getMonth()+1;
			var toDate = today.getDate();
			var toYear = today.getFullYear();
			var toAge = toYear - str[0];

			if (toMonth > str[1]){
				dayDiff = toAge;
			} else if (str[1] > toMonth) {
				dayDiff = toAge -1;
			} else {
				if (str[2] > toDate) {
					dayDiff =toAge -1;
				} else {
					dayDiff = toAge;
				}
			}

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
			alert("필수 입력정보를 모두 입력해주세요.");
		}else if(idchk!=1){
			alert("아이디를 중복체크 해주세요.");
		}else if(pwchk==0){
			alert("비밀번호 확인을 진행해 주세요.");
		}else if(dayDiff<=13){
			alert("엄마 젖이나 더 먹고와라 애송이");
		}else if($("#gender").val() == "" || $("#gender").val() == null){
			alert("성별 체크 확인해 주세요.");
		}else{
			$.ajax({
				url : "join",
				data : {
					m_id : $("#id_input").val(),
					m_pw : $("#pw_input").val(),
					m_name : $("#name_input").val(),
					m_tel : $("#tel_option").val()+"="+$("#tel_input").val(),
					m_birth: $("#birth_input").val(),
					m_gender : $("input:radio[name=m_gender]:checked").val(),
					m_email : $("#email_input").val()
				},
				type : "post",
				success : function(result){
					if(result==0){
						alert("회원가입에 실패했습니다. 관리자에게 문의해주세요");
					}else{
						alert("회원가입에 성공했습니다. 환영합니다.");
						location.href="../"; 
					}
				}
			});  
		}
	});


});
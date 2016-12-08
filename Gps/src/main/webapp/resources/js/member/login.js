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
					m_id : $("#id_input").val(), 
					m_pw : $("#pw_input").val()},
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
	
	//id 저장하기 쿠키
	//id 저장 불러오기
	var cookie_id = getCookie("m_id");
	$("#id_input").val(cookie_id);
	
	// 아이디 저장
	
	if($("#id_input").val() != ""){ 
		// 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#id_save").attr("checked", true); 
        // ID 저장하기를 체크 상태로 두기.    
	
	}
	
		$("#id_save").change(function(){ // 체크박스에 변화가 있다면,
	        if($(this).is(":checked")){ // ID 저장하기 체크했을 때,
	        	alert("아이디를 저장 하시면 공공기관에서 사용시 id 보호에 불이익이 발생할 수 있습니다.");
	        	var user_id = $("#id_input").val();
	            setCookie("m_id", user_id, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("m_id");
	        }
	    });
	// 체크 박스를 체크하고는 아이디 저장이 안됨.
	
	
	//쿠키세트 펑션
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	//쿠키삭제 펑션
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	
	//쿠키저장 펑션
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	
	//로그인 으로 보내기
	$("#join_btn").click(function(){
		location.href="join";
	});
	
	//아이디 찾기
	$("#findid_btn").click(function(){
		/*location.href="searchid";*/
		$("#first_id_div").show();
		$("#first_pw_div").hide();
	});
	//비밀번호 찾기
	$("#findpw_btn").click(function(){
		/*location.href="searchPw";*/
		$("#first_pw_div").show();
		$("#first_id_div").hide();
	});
	//모달창 닫기
	$(".x_div").click(function(){
		$("#first_id_div").hide();
		$("#first_pw_div").hide();
	});
	
	
});
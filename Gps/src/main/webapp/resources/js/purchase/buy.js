$(function(){
	
	var price_input = 0;
	var post_total = 0;
	
	//구매액수 확인
	var pricelist = [];
	$("input[name=total_price]").each(function(){
		pricelist.push($(this).val());
	});
	
	var listsum =0;
	for(var i=0;i<pricelist.length;i++){
		listsum = listsum*1 + parseInt(pricelist[i]);
	}
	
	$("#price_input").val(listsum);
	//상품 마일리지
	var promilist =[];
	$("input[name=pro_millage]").each(function(){
		promilist.push($(this).val());
	});
	
	var milsum=0;
	for(var i=0;i<promilist.length;i++){
		milsum = milsum*1 + parseInt(promilist[i]);
	}
	$("#pro_millage_pur").val(milsum);
	$("#span_millage").html(milsum);
	//마일리지 합계
	
	
	
	//millage function
	function millage(){
		var total_input = $("#total_input").val();
		var millage_count = $("#millage_count").val()*1;
		var cup_check = $("#cup_check").val();
		post_total = (parseInt(total_input)-parseInt(millage_count)-parseInt(cup_check));
		return post_total;
	}
	
	
	//cupon function
	function cuponin(){
		post_total = $("#post_total").val();
		var cup_check = $("#cup_check").val();
		post_total = parseInt(post_total)-parseInt(cup_check);
		if(post_total < 0){
			post_total =0;
		}
		return post_total;
	}
	
	//cuponout
	function cuponout(){
		post_total = $("#post_total").val();
		$("#cup_check").val(parseInt($("#cup_check").val())-10000);
		var cup_check = $("#cup_check").val();
		post_total = (parseInt(post_total)+10000);
		return post_total;
	}
	
	
	
	price_input = $("#price_input").val();
	
	
	
	//부가세(디지털 콘텐츠에 대해서도 부가세 10%)
	/*출처(http://www.zdnet.co.kr/news/news_view.asp?artice_id=00000010038794#csidx43d3ac3244b411888a088028e1f6487 )*/
	$("#vat_input").val((price_input*0.1));
	$("#span_vat").html((price_input*0.1));	
	
	//마일리지 입력하기
	//유효성 검사
	$("#millage_count").keyup(function(){		
		var inputVal = $(this).val()*1;
		var m_millage = $("#m_millage").val()*1;
		var price_input = $("#price_input").val()*1;
		if (inputVal > m_millage){
			alert("가용 마일리지 보다 더 사용하실수 없습니다.");
			$("#millage_count").val("0");
			millage();
			$("#post_total").val(post_total);
			$("#span_total").html(post_total);
		}else if(inputVal > price_input){
			alert("가용 마일리지를 상품 금액 보다 더 사용하실수 없습니다.");
			$("#millage_count").val("0");
			millage();
			$("#post_total").val(post_total);
			$("#span_total").html(post_total);
		}else{			
			millage();
			$("#post_total").val(post_total);
			$("#span_total").html(post_total);
		}
	});
	
	
	//전부 적용하기
	$("#mill_in").click(function(){
		if(parseInt($("#m_millage").val())>parseInt($("#total_input").val())){
			alert("가용 마일리지를 상품 가격 보다 더 쓸수 없습니다.");
			$("#millage_count").val("0");		
		}else{
			if($("#m_millage").val() != $("#millage_count").val()){
				var m_millage = $("#m_millage").val();
				$("#millage_count").val(m_millage);
				millage();
				$("#post_total").val(post_total);
				$("#span_total").html(post_total);
			}else{
				alert("가용 마일리지가 없습니다.");
				$("#millage_count").val("0");
			}	
		}		
	});
	//마일리지 적용 취소
	$("#mill_cancle").click(function(){
		if($("#millage_count").val() != 0){			
			$("#millage_count").val("");
			millage();
			$("#post_total").val(post_total);
			$("#span_total").html(post_total);
		}else{
			alert("사용한 마일리지 없습니다.");
		}
		
	});
	
	//최종결재 금액
	$("#total_input").val((price_input*1)+($("#vat_input").val()*1));
	
	millage();
	$("#post_total").val(post_total*1);
	$("#span_total").html(post_total*1);
	
	
	// 결재 수단 확인용 
	/*//
	 * 
		// 체크 변경
		$("input:radio[value=male]").prop("checked","checked");			
		// 체크 확인 
		m_gender : $("input:radio[name=pu_m_gender]:checked").val();
		
	*/
	
	//결제 수단 확인용 
	var choice_check = 0;
	//결제 인증 확인용 
	var purchk =0;
	
	
	//결제 수단 변경에 따른 결제 초기화
	$("input:radio").change(function(){
		if(!($("input:radio[name=choice]").prop("checked"))){
			$("input:text[name=pay_id]").val("");
			$("input:password[name=pay]").val("");
			$("select > option[value=kt]").attr("selected", "true");
			for(var i=1;i<4;i++){
				$("#tel_input"+i).val("");
			}
		}
	});	
	
	//전화 소액 결제
	$(".celphone").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi,''));
		}
	});
	
	//전화번호 입력여부 체크 경고 메세지 유효성 검사
	$("#tel_check").click(function(){
		var telphone = $("#tel_input1").val()+"-"+$("#tel_input2").val()+"-"+$("#tel_input3").val();
		
		//전화번호 유효성 검사 정규표현식
		var reg=/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		if(telphone =="" || !(reg.test(telphone))){
			alert("번호를 확인해 주세요.");
			purchk=0;
		}else{
			alert("결제 버튼을 눌러 주세요.");
			purchk++;
		}
	});
	
	
	
	//상풍권 유효성 검사
	$(".pin_input").keyup(function(event){	
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		}
		if(parseInt($("#pin1").val().length) > 3){
			alert("각 자리는 3자리 알파벳과 숫자 조합입니다.");
			$(this).val("");
		}else if(parseInt($("#pin2").val().length) > 3 ){
			alert("각 자리는 3자리 알파벳과 숫자 조합입니다.");
			$(this).val("");
		}else if(parseInt($("#pin3").val().length) > 3 ){
			alert("각 자리는 3자리 알파벳과 숫자 조합입니다.");
			$(this).val("");
		}else if(parseInt($("#pin4").val().length) > 3 ){
			alert("각 자리는 3자리 알파벳과 숫자 조합입니다.");
			$(this).val("");
		}else if(parseInt($("#pin5").val().length) > 3 ){
			alert("각 자리는 3자리 알파벳과 숫자 조합입니다.");
			$(this).val("");
		}
		
	});

	//상품권 serial 코드 확인용 
	var cup_serial= "";
	
	//상품권 확인
	$("#pin_check").click(function(){		
		cup_serial = $("#pin1").val()+"-"+$("#pin2").val()+"-"+$("#pin3").val()+"-"+$("#pin4").val()+"-"+$("#pin5").val();
		if($("#pin1").val()==""||$("#pin2").val()==""||$("#pin3").val()==""||$("#pin4").val()==""||$("#pin5").val() == ""){
			alert("쿠폰 번호를 입력해 주세요.");
		}else{
			$.ajax({
				url : "Cupon",
				data : {
					cup_serial:cup_serial
				},
				type : "post",
				success : function(result){
					if(result != 0){
						$("#cup_check").val(result);
						$("#cup_price").val(result);
						cuponin();
						$("#post_total").val(post_total);
						$("#span_total").html(post_total);
						$(".c").hide();
						$(".cc").show();
						purchk++;
					}else{
					  alert("사용중인 쿠폰입니다. 확인해 주세요.");
					}
				}
			});
		}
	});
	
	//쿠폰 사용 취소
	$("#pin_del").click(function(){
		
		alert("쿠폰 사용 취소");
		if(cup_serial != null){			
			$.ajax({
				url : "CuponDel",
				data : {
					cup_serial:cup_serial
				},
				type : "post",
				success : function(result){
					if(result > 0){
						cuponout();
						$("#post_total").val(post_total);
						$("#span_total").html(post_total);
						$(".c").show();
						$(".cc").hide();
						for(var i=0;i<6;i++){
							$("#pin"+i+"").val("");
						}
					}else{
						alert("오류입니다.");
					}
				}
			});			
		}else{
			alert("사용 중인 쿠폰이 없습니다.");
		}
		
	});
	
	//쿠폰 재 등록
	/*$("#pin_re").click(function(){		
		$(".c").show();
		$(".cc").hide();		
	});
	*/
	
	//결제 수단 체크
	$("input:radio[name=choice]").click(function(){	
		if($("input:radio[name=choice]:checked").val() != null){
			choice_check ++;
			purchk=0;
			if($("input:radio[name=choice]:checked").val() == "bank"){
				purchk++;
			}
		}
	});
	
	
	
	$("#last_buy").click(function(){
		if(choice_check == 0){
			alert("결제 수단을 확인해 주세요.");
		}else if(purchk == 0){
			alert("결제 인증 필요합니다.");
		}else{
			var status="";
			var m_millage =0;
			if($("input:radio[name=choice]:checked").val() == "bank"){
				alert("무통장 입금시 구매에 시간이 걸릴 수 있습니다.");
				status="결재대기";
			}else{
				status="결재요청";
			}			
			m_millage = parseInt($("#pro_millage_pur").val())+parseInt($("#cup_check").val())-parseInt($("#millage_count").val());
			var pro_numli = [];
			$("input[name=pro_num]").each(function(){
				pro_numli.push($(this).val());
			});
			var promlist = pro_numli;
			alert(promlist);
			var pro_num=0;
			$.ajax({
				url : "Purchase_pro",
				data : {
					m_id : $("#m_id").val(),
					pro_num : parseInt(pro_numli),
					total_price : $("#post_total").val(),
					status : status,
					pur_kind : $("input:radio[name=choice]:checked").val(),
					m_millage: m_millage
					},
					type : "post",
				success : function(result){
					if(result>0){						
						location.href="purResult";				
					}else {
						alert("구매 정보를 확인해 주세요.");
					}
				},
				error:function(e){
					alert("not working");
				}
			});
			
		}
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
});
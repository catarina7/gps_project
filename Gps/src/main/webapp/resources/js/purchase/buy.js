$(function(){
	
	var price_input = 0;
	
	price_input = $("#price_input").val();
	
	//부가세
	$("#vat_input").val((price_input*0.1));
	
	//마일리지 입력하기
	//유효성 검사
	$("#millage_count").keyup(function(){
		if($("#m_millage").val() < $("#millage_count").val()){
			
			
		}else{
			alert("가용 마일리보다 더 사용 하실수 없습니다.");
		
		}
		
	});
	
	
	//전부 적용하기
	$("#mill_in").click(function(){
		if($("#m_millage").val() != 0){
			var m_millage = $("#m_millage").val();
			var millage_count = $("#millage_count").val();
			$("#millage_count").val(m_millage+millage_count);
			$("#m_millage").val("");
		}else{
			alert("가용 마일리지가 없습니다.");
		}		
		
	});
	
	$("#mill_cancle").click(function(){
		if($("#millage_count").val() != 0){
			var m_millage = $("#m_millage").val();
			var millage_count = $("#millage_count").val();
			$("#m_millage").val(m_millage+millage_count);
			$("#millage_count").val("");
		}else{
			alert("사용한 마일리지 없습니다.");
		}
	});
	
	
});
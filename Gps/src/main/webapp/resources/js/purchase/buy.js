$(function(){
	
	var price_input = 0;
	var post_total = 0;
	
	
	
	//millage function
	function millage(){
		var total_input = $("#total_input").val();
		var millage_count = $("#millage_count").val()*1;
		post_total = (parseInt(total_input)-parseInt(millage_count)) ;
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
			$("#millage_count").val("");
		}else if(inputVal > price_input){
			alert("가용 마일리지를 상품 금액 보다 더 사용하실수 없습니다.");
			$("#millage_count").val("");
		}else{			
			millage();
			$("#post_total").val(post_total);
			$("#span_total").html(post_total);
		}
	});
	
	
	//전부 적용하기
	$("#mill_in").click(function(){
		if($("#m_millage").val() != $("#millage_count").val()){
			var m_millage = $("#m_millage").val();
			$("#millage_count").val(m_millage);
			millage();
			$("#post_total").val(post_total);
			$("#span_total").html(post_total);
		}else{
			alert("가용 마일리지가 없습니다.");
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
	
	
	
	
	
	
	
	
});
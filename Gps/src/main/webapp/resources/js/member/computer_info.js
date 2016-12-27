$(function(){
	
	$(".input").keyup(function(){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val( inputVal.replace(/[^ a-zA-Z0-9./-]/gi,''));
		}			
		
	});
	
	$("#c_mod").click(function(){
		
		if($("#c_mod").val() == "수정 완료"){
			$.ajax({
				url: "ComMod",
				data:{
					m_num : $("#m_num").val(),
					com_os : $("#com_os").val(),
					com_process : $("#com_process").val(),
					com_memory : $("#com_memory").val(),
					com_graphic : $("#com_graphic").val(),
					com_directx : $("#com_directx").val(),
					com_space : $("#com_space").val(),
				},
				type: "post",
				success: function(result){
					if(result==0){
						alert("수정에 실패 했습니다. 다시 입력 하시려면 확인 후 입력 해 주세요.");
					}else {
						alert("컴퓨터 정보 수정 완료 했습니다.");
						location.href="computer_info";
					}
				}
			});
		}		
		
		if($("#c_mod").val() == "정보 수정"){
			$(this).val("수정 완료");
			$(".com_if").hide();
			$(".com_mod").show();
		}else{
			$("#c_mod").val("정보 수정");
			$(".com_if").show();
			$(".com_mod").hide();
		}
	});
	
});
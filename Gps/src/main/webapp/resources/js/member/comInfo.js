$(function(){
	
	var m_num = 0;
	
	$(".input").keyup(function(){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^ a-zA-Z0-9./-]/gi,''));
		}
		if($(this).val() == ""){
			$("#cominfo_btn").hide();			
		}  
		
	});
	
	$("#space_input").keyup(function(){
		if($("#os_input").val() != "" &&
				$("#process_input").val() != "" &&
				$("#memory_input").val() != "" &&
				$("#graphic_input").val() != "" 
		){
			$("#cominfo_btn").show();
		}else{
			$("#cominfo_btn").hide();
		}
	});	
	
	$("#skipit").click(function(){
		location.href="/gps/index";				
	});
	
	$("#cominfo_btn").click(function(){		
		$.ajax({
			url: "ComInfo",
			data:{
				m_num : $("#m_num").val(),
				com_os : $("#os_input").val(),
				com_process : $("#process_input").val(),
				com_memory : $("#memory_input").val(),
				com_graphic : $("#graphic_input").val(),
				com_directx : $("#directx_input").val(),
				com_space : $("#space_input").val(),
			},
			type: "post",
			success: function(result){
				if(result==0){
					alert("정보 입력에 실패 했습니다. 다시 입력 하시려면 확인 후 입력 해 주세요.");
				}else {
					alert("정보 입력 감사합니다.");
					location.href="/gps/index";
				}
			}
		});
		
		
	});
	
});
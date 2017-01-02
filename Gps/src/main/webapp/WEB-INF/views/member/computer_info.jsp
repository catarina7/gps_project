<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/computer_info.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/common/img/icons.ico">
<script type="text/javascript">
	$(function(){
		
		$(".com_if").show();		
		
		$("#c_cancel").click(function(){
			$("#c_mod").val("정보 수정");
			$(".com_if").show();
			$(".com_mod").hide();
		});
	});
</script>
<!-- 수정 스크립트 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/computer_info.js"></script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<div>
			<c:import url="/user_menu_bar" />
		</div>
		<h2>내 컴퓨터 정보</h2>
		<!-- session 정리용 -->
			<input type="hidden" id="m_num" value="${member.m_num}">
		<!-- 내용 넣기 -->
		<div id="compu_first">
			<div id="compu_deco">
				<table>
					<colgroup>
						<col style="width:28%;">
						<col style="width:68%;">
					</colgroup>
					<tr>
						<td class="title">
							<span>아이디 </span>
						</td>
						<td>
							${member.m_id }
						</td>
					</tr>
					<tr>
						<td class="title">
							운영체제
						</td>
						<td class="com_if">
							${cominfo.com_os}
						</td>
						<td class="com_mod">
							<input id="com_os" type="text" value="${cominfo.com_os }" class="input">
						</td>
					</tr>
					<tr>
						<td class="title">
							CPU
						</td>
						<td class="com_if">
							${cominfo.com_process}
						</td>
						<td class="com_mod">
							<input id="com_process" type="text" value="${cominfo.com_process }" class="input">
						</td>
					</tr>
					<tr>
						<td class="title">
							메모리(RAM)
						</td>
						<td class="com_if">
							${cominfo.com_memory}
						</td>
						<td class="com_mod">
							<input id="com_memory" type="text" value="${cominfo.com_memory }" class="input">
						</td>
					</tr>
					<tr>
						<td class="title">
							그래픽 카드
						</td>
						<td class="com_if">
							${cominfo.com_graphic }
						</td>
						<td class="com_mod">
							<input id="com_graphic" type="text" value="${cominfo.com_graphic }" class="input">
						</td>
					</tr>
					<tr>
						<td class="title">
							DirectX 버전
						</td>
						<td class="com_if">
							${cominfo.com_directx }
						</td>
						<td class="com_mod">
							<input id="com_directx" type="text" value="${cominfo.com_directx }" class="input">
						</td>
					</tr>
					<tr>
						<td class="title">
							하드디스크 여유공간
						</td> 
						<td class="com_if">
							${cominfo.com_space }
						</td>
						<td class="com_mod">
							<input id="com_space" type="text" value="${cominfo.com_space }" class="input">
						</td>
					</tr>
				</table>
				<div id="btn_in">
					<input id="c_mod" type="button" value="정보 수정">
					<input id="c_cancel" class="com_mod" type="button" value="취소">
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>
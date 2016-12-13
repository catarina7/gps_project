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
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<div>
			<c:import url="/user_menu_bar" />
		</div>
		<h2>내 컴퓨터 정보</h2>
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
						<td>
							${cominfo.com_os }
						</td>
					</tr>
					<tr>
						<td class="title">
							CPU
						</td>
						<td>
							${cominfo.com_process }
						</td>
					</tr>
					<tr>
						<td class="title">
							메모리(RAM)
						</td>
						<td>
							${cominfo.com_memory }
						</td>
					</tr>
					<tr>
						<td class="title">
							그래픽 카드
						</td>
						<td>
							${cominfo.com_graphic }
						</td>
					</tr>
					<tr>
						<td class="title">
							DirectX 버전
						</td>
						<td>
							${cominfo.com_directx }
						</td>
					</tr>
					<tr>
						<td class="title">
							하드디스크 여유공간
						</td>
						<td>
							${cominfo.com_space }
						</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>
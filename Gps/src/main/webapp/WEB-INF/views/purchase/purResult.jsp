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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mem_millage.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#go_list").click(function(){
			location.href="${pageContext.request.contextPath}/member/member_info";
		});
	});
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<div>
			<c:import url="/user_menu_bar" />
		</div>
		<div id="first_mill">
			<div id="mill_deco">
				<div id="second_mill">
					<table>
						<tr>
							<td> <span>${member.m_id}</span> 님, 게임 구매 감사합니다. </td>
						</tr>
						<tr>
							<td> 게임 구매  </td>
						</tr>
						<tr>
							<td> <span></span> </td>
						</tr>
					</table>
					<div id="mill_info">
						<p><span>※ 게임 구매시 유의사항</span></p>
						<p>+ 무통장 입금시 게임 구매후 바로 게임을 설치 할 수 없고 결제 확인 이후 CD_Key가 배포 됩니다.</p>
						<p>+ 사용하신 마일리지는 환불 받으실 수 없습니다.</p>
						<p>+ 구매한 게임 내역은 구매내역에서 확인하실 수 있습니다.</p>
						<p>+ CD_key는 구매내역에서 확인해 주시기 바랍니다. </p>
					</div>
				</div>
				<div id="third_mill">
					<p>
						
					</p>
				</div>
				<div id="four_mill">
					<button id="go_list">회원정보 확인 하려 가기</button>
				</div>
			</div>
		</div>
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>
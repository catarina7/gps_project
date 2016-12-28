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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/templete.css">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<div id="first">
			<c:forEach items="pro_member_List" var="pro_mem" varStatus="status">
				<!-- 구매정보 -->
				
				<div>
					<!-- 사진 정보 -->
					<div>
						<img src="../resources/upload/${productFile[status.index].file_name}">
						<input type="text" value="number">
					</div>
					<!-- 상품정보 -->
					<div>
						<table>
							<tr>
								<td>
									<!-- title -->
								</td>
							</tr>
							<tr>
								<td>
									<!-- contents -->
								</td>
							</tr>
							<tr>
								<td>
									<!-- category -->
								</td>
							</tr>
							<tr>
								<td>
									<!-- company -->
								</td>
							</tr>
						</table>
					</div>
					<!-- cd_key -->
						<%-- <input type="text" value="${pro_memberList.Cd_serial}">  --%>
					<div>
					</div>
				</div>
			</c:forEach>
			
		</div>
			
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>
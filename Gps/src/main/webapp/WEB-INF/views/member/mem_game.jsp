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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/mem_game.css">
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
			<c:forEach items="${product_member_List}" var="promemlist" varStatus="status">
				<!-- 구매정보 -->
				<div id="first">
					<!-- 사진 정보 -->
					<div id="file_img">
						<img src="../resources/upload/${productFile[status.index].file_name}">
					</div>
					<!-- 상품정보 -->
					<div id="product_info">
						<table>
							<tr>
								<td>
									<!-- title -->
									<input type="text" value="${pr_me_List[status.index].pro_title}">
								</td>
							</tr>
							<tr>
								<td>
									<!-- contents -->
									<p>${pr_me_List[status.index].pro_contents}</p>
								</td>
							</tr>
							<tr>
								<td>
									<!-- category -->
									<input type="text" value="${pr_me_List[status.index].top_category}">
								</td>
							</tr>
							<tr>
								<td>
									<!-- company -->
									<input type="text" value="${pr_me_List[status.index].company}">
								</td>
							</tr>
						</table>
					</div>
					<!-- cd_key -->					
					<div id="cd_key_check">
						<c:if test="${promemlist.cd_serial != 'null' }">
							<input type="text" value="${promemlist.cd_serial}">
						</c:if>
						<c:if test="${promemlist.cd_serial == 'null' }">
							<span> 미발급</span>
						</c:if>
					</div>
				</div>
			</c:forEach>
			
		<!-- pageing -->
			<div id="pro_game_paging">
				<div class="margins">
					<c:if test="${pagemaker.curBlock>1}">
						<a href="purchase?curPage=${pagemaker.startNum-1}">[이전]</a>
					</c:if>
					<c:forEach begin="${pagemaker.startNum}" end="${pagemaker.lastNum}"
						var="i">
						<a href="purchase?curPage=${i}">${i}</a>
					</c:forEach>
					<c:if test="${pagemaker.curBlock<pageMaker.totalBlock}">
						<a href="purchase?curPage=${pagemaker.lastNum+1}">[다음]</a>
					</c:if>
				</div>
			</div>
			
		</div>
			
	
			
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>
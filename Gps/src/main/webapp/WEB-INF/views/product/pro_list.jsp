<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/product/pro_list.css">
</head>
<body>
	
	<c:import url="/header" />
	<section>
			<div>
				<c:import url="/user_menu_bar" />
			</div>
			<div id="pro_list_first">
				<h2>전체 상품</h2>
					<div id="pro_list_product">
						<c:forEach items="${pro_list}" var="pro" varStatus="status">
							<div class="g_games">
								<a href="pro_view?pro_num=${pro.pro_num}"><img class="game_img" src="../resources/upload/${pro_main_img[status.index].file_name}"></a>
								<p><span>글 번호 : </span> ${pro.pro_num} </p> 
								<p><span>게임명 : </span> ${pro.pro_title}</p> 		
								<p><span>가격 : </span> ${pro.price}</p>
							    <p><span>회사명 : </span>  ${pro.company}</p>  
							</div>
						</c:forEach>
					</div>
					<div id="pro_list_paging">
						<div class="margins">
							<c:if test="${pageMaker.curBlock>1}">
								<a href="pro_list?curPage=${pageMaker.startNum-1}">[이전]</a>
							</c:if>
							<c:forEach begin="${pageMaker.startNum}" end="${pageMaker.lastNum}" var="i">
								<a href="pro_list?curPage=${i}">${i}</a>
							</c:forEach>
							<c:if test="${pageMaker.curBlock<pageMaker.totalBlock}">
								<a href="pro_list?curPage=${pageMaker.lastNum+1}">[다음]</a>
							</c:if>
						</div>
					</div>
				<div id="pro_list_write">
					<div>
						<a href="pro_write">Product Write</a>
					</div>
				</div>
			</div>
	</section>
	<c:import url="/footer" />
	
	
	
</body>
</html>
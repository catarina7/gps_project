<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${pro_list}" var="pro" varStatus="status">
	<div class="g_games">
		<a href="pro_view?pro_num=${pro.pro_num}"><img class="game_img" src="../resources/upload/${pro_main_img[status.index].file_name}"></a>
		<p><span>글 번호 : </span> ${pro.pro_num} </p> 
		<p><span>게임명 : </span> ${pro.pro_title}</p> 		
		<p><span>가격 : </span> ${pro.price}</p>
	    <p><span>회사명 : </span>  ${pro.company}</p>  
	</div>
</c:forEach>
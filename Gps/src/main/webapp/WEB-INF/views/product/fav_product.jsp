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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/product/fav_product.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		
		//pro_view에서 사용할 cookie 저장
		var cookie_check = true;
		var i = 0;
		
		while(cookie_check){
			if(getCookie("recent_"+i) == ""){			
				setCookie("recent_"+i, "${pro_view.pro_num}", 1);
				cookie_check = false;
				break;
			}else {
				i++;
			}			
		}
		
		//이 페이지에서 쿠키 불러오기
		var cookie_list;
		var coo_check = true;
		var j = 0;
		
		while(coo_check){
			if(getCookie("recent_"+j) != ""){
				var cookie_list = getCookie("recent_"+j);
			}else {
				coo_check = false;
			}
		}
		
		
		
		
		
		//쿠키 저장
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue+"; path=/";
		}
		
		//쿠키 가져오기
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
		
		
		//쿠키 삭제
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
	});
</script>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		
		
		<!-- cookie를 이용한 최근 본 상품 띄우기  -->
		<div>
			<div>
				
			</div>
		</div>
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>
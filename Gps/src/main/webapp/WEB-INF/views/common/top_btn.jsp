<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- css 넣는 태그 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/top_btn.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		/* top 스크롤 js */
		$( window ).scroll( function() {
				if ($(this).scrollTop() > 200 ) {
					$( '.jcm-top' ).fadeIn();
				} else {
					$( '.jcm-top' ).fadeOut();
				}
		});
		$( '.jcm-top' ).click( function() {
			$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
			return false;
		});
	});
</script>
</head>
<body>
	<a href="#" class="jcm-top hidden-xs hidden-sm">TOP</a>
</body>
</html>
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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/common/img/icons.ico">
<script type="text/javascript">
	$(function(){
		var cookie_check = true;
		var i = 0;
		for( i=0; i<10; i++){			
			$("#cookie_"+i).val(getCookie("recent_"+i));
		}
		
		var checkArr=[];
		
		$("input[name='pro_num']").each(function(){
			checkArr.push($(this).val());
		});
		
		$.ajax({
			url: 'fav_list',
			type: 'POST',
			dataType: 'text',
			data:{
				valueArr : checkArr
			},
			success:function(data){
				data=data.trim();
				$("#fav_first").html(data);
			}
		});		
	});
	
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
		
		<!-- cookie를 이용한 최근 본 상품 띄우기  -->
		<div id="fav_first">
			<div>
				<h4> ※  오늘 본 상품</h4>
				<c:forEach var="i" begin="0" end="9">				
					<span><input type="hidden" name="pro_num" id="cookie_${i}" readonly="readonly"></span>
				</c:forEach>
				<c:forEach items="${fav_list}" var="fav_list">				
						<div id="fav_items">
							<div id="items_first">
								<a href="${pageContext.request.contextPath}/product/pro_view?pro_num=${fav_list.pro_num}">
									<img src="../resources/upload/${fav_list_img[status.index].file_name}">
								</a>
							</div>
							<div id="items_second">
								<p id="cookie_price">Num. ${fav_list.pro_num}번 상품</p>
								<p>${fav_list.pro_title}</p>
								<p>${fav_list.pro_contents}</p>
								<p id="cookie_price"> $${fav_list.total_price}</p>
							</div>
						</div>
				</c:forEach>
			</div>
		</div>
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		$(".store").mouseenter(function(){
			$("#Store_list").show();
			$("#S_list").hide();
			
			$(".M_list").mouseout(function(){
				$("#first_div_1").hover(function(){
					$("#Store_list").hide();
				});
				$("second_div").hover(function(){
					$("#Store_list").hide();
				});
				$("#first_div").hover(function(){
					$("#Store_list").hide();
				});
				$("#four_div").hover(function(){
					$("#Store_list").hide();
				});
			});
		});
		
		$(".s_list").mouseenter(function(){
			$("#S_list").show();
			$("#Store_list").hide();
			
			$(".M_list").mouseout(function(){
				$("#first_div_1").hover(function(){
					$("#S_list").hide();
				});
				$("second_div").hover(function(){
					$("#S_list").hide();
				});
				$("#first_div").hover(function(){
					$("#S_list").hide();
				});
				$("#four_div").hover(function(){
					$("#S_list").hide();
				});
			});
		});
		
		$("#join").click(function(){
			location.href="${pageContext.request.contextPath}/member/join"
		});
		
		$("#login").click(function(){
			location.href="${pageContext.request.contextPath}/member/login"
		});
		
		$("#logout").click(function(){
			location.href="${pageContext.request.contextPath}/member/logout"
		});
		
	});
</script>
</head>
<body>
	<!-- header -->
	<header>
		<div id="first_div">
			<div id="first_div_1">
				<div id="second_div" onclick="location.href='${pageContext.request.contextPath}/index'">
					<!-- rogo image -->
					<%-- <a href="${pageContext.request.contextPath}/index"><img src=""></a> --%>
				</div>
				<div id="third_div">
					<!-- menu list -->
					<ul id="main_list">
						<li><a class="store">STORE</a></li>
						<!-- <li><a class="s_list">menu</a></li> -->
						<li><a href="#">ABOUT</a></li>
						<li><a href="#">SUPPORT</a></li>
					</ul>
					<div class="M_list" id="Store_list">
						<ul>
							<li><a href="${pageContext.request.contextPath}/product/pro_list">전체상품</a></li>
							<li><a href="#">패키지 게임</a></li>
<<<<<<< HEAD
=======
							<li><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath}/qna/qnaList">QnA</a></li>
>>>>>>> refs/heads/tmo10
						</ul>
					</div>
					<!-- <div class="M_list" id="S_list">
						<ul>
							<li><a href="#">빈메뉴</a></li>
							<li><a href="#">list</a></li>
							<li><a href="#">list</a></li>
							<li><a href="#">list</a></li>
						</ul>
					</div> -->
				</div>
				<div id="four_div">
					<!-- login, join button -->
					<c:if test="${member.m_id == null}">
						<button id="login">로그인</button>
					</c:if>
					<c:if test="${member.m_id != null}">
						<button id="logout">로그아웃</button>
					</c:if>
					<c:if test="${member.m_id == null}">
						<button id="join">회원가입</button>
					</c:if>
					<c:if test="${member.m_id != null}">
						<button id="information" onclick="location.href='${pageContext.request.contextPath}/member/member_info'">My Page</button>
					</c:if>
				</div>
			</div>
		</div>
	</header>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<script type="text/javascript">
		$(function(){			
			$("#company_intro").click(function(){
				location.href="${pageContext.request.contextPath}/company/introduce";
			});
			$("#company_alliance").click(function(){
				location.href="${pageContext.request.contextPath}/company/alliance";
			});
			$("#company_agree").click(function(){
				location.href="${pageContext.request.contextPath}/company/agreement";
			});
			$("#company_info").click(function(){
				location.href="${pageContext.request.contextPath}/company/information";
			});
			$("#company_teen").click(function(){
				location.href="${pageContext.request.contextPath}/company/teenager";
			});
			$("#company_customer").click(function(){
				location.href="${pageContext.request.contextPath}/company/customer";
			});
		});	
	</script>
	<!-- footer -->
	<footer>
		<div id="first_footer">
			<div id="first_footer_1">
				<div id="second_footer">
					<div id="footer_logo">
						<img src="${pageContext.request.contextPath}/resources/css/common/img/rogo2.png">						
					</div>
					<div id="footer_info">
						<p>
							© 2016 Valve Corporation. All rights reserved. All trademarks are property of their respective owners in the US and other countries.
						</p>
						<p>
							VAT included in all prices where applicable.
						</p>
						<ul>
							<li class="design">회사정보</li>
							<li class="design">사업자등록번호</li>
							<li>상호명 : GPS</li>
						</ul>
					</div>
				</div>
				<div id="third_footer">
					<ul>
						<li id="company_agree" class="design">이용약관</li>
						<li id="company_info" class="design" id="import">개인정보취급방침</li>
						<li id="company_teen" class="design">청소년보호정책</li>
						<li id="company_customer">고객센터</li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>
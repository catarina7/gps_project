<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<h4>
1. 고객 서비스
</h4>
<p>
①TEL: 010-1234-5678<br>
②FAX: 070-1111-2222<br>
③E-MAIL: GPS@gmail.com<br>
④상담업무 : 오전11시 - 오후9시<br>
</p>
<h4>
2. 임금계좌
</h4>
<p>
①우리은행 : 023-1254-1253<br>
②농협은행 : 254-5482-5482-77<br>
③신한은행 : 952-1852-2255<br>
④국민은행 : 5-2557-5486-58<br>
⑤우체국   : 512358-12-101253<br><br>
(예금주) : 안지성
</p>
<h4>
3. 마이쇼핑
</h4>
<p>
- <a href="${pageContext.request.contextPath}/purchase/purchase">구매내역</a><br>
- <a href="${pageContext.request.contextPath}/cart_favorite/cartList?m_id=${member.m_id}">장바구니</a><br>
- <a href="${pageContext.request.contextPath}/member/millage">마일리지</a><br>
- <a href="${pageContext.request.contextPath}/qna/qnaList">Q&A</a><br>
</p>
<h4>
4. 이용안내
</h4>
<table>
<colgroup>
	<col style="width: 20%;">
	<col style="width: 75%;">
</colgroup>
<tr>
<td><a href="${pageContext.request.contextPath}/support"><img src="${pageContext.request.contextPath}/resources/css/company/img/question_mark.png"></a></td>
<td>
<p>
저희 GPS를 이용해주시는 고객님께 감사드립니다.<br>
GPS이용에 관한 전반적인 가이드입니다. 행복한 하루 되세요.<br><br>
※이용안내 페이지 이동은 이미지를 클릭해 주세요.※
</p>
</td>
</tr>
</table>

</body>
</html>
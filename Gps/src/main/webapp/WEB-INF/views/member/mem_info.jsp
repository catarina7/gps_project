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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mem_info.css">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/mem_info.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/pw_mod.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/mem_mod.js"></script>

<script type="text/javascript"></script>
<style type="text/css">
	#pw_check{
		display: none;
	}
	#pw_confirm{
		display: none;
	}
	.pw_modform{
		display: none;
	}
	#telchk{
		display: none;
	}
	#emailchk{
		display: none;
	}
	.modform{
		display: none;
	}
	
	
</style>
</head>
<body>
	
	<c:import url="/header" />
	
	<!-- section -->
	<section>
		<!-- 내용 넣기 -->
		<div id="second_mem">
			<c:import url="/user_menu_bar"/>
		</div>
		<!-- session 정리용 -->
		<div id="first_mem">
			<!-- id -->
			<input type="hidden" value="${member.m_id}" id="pas_id">
			<!-- pw -->
			<input type="hidden" value="${member.m_pw}" id="pas_pw">
			<!-- gender -->
			<input type="hidden" value="${member.m_gender}" id="pas_gender">
			<!-- tel -->
			<input type="hidden" value="${member.m_tel}" id="pas_tel">
			
			<h2>회원정보 확인</h2>
			<!-- id -->
					<table>
						<colgroup>
							<col style="width:22%;">
							<col style="width:42%;">
							<col style="width:32%;">
						</colgroup>
						<tr>
							<td class="title_m">아이디 : </td>
							<td colspan="2">
								<input type="text" readonly="readonly" name="m_id" id="id_input" class="input" value="${member.m_id}">
							</td>
						</tr>
						<tr>
							<td class="title_m"> 비밀번호 : </td>
							<td>
								<input type="text" name="m_pw" id="pw_input" class="input" readonly="readonly">
							</td>
							<td>
								<button id="pwmod_btnform">비밀번호 수정</button>
							</td>
						</tr>
						
			<!-- 비밀번호 수정 form -->
			<!-- 현재 비밀번호 확인용 -->			
				<tr class="pw_modform">
							<td class="title_m"> 현재 <br> 비밀번호 </td>
							<td >
								<input type="password" name="m_pw" id="se_pw_input" class="input">
							</td>
							<td></td>
						</tr>
			
			<!-- 수정할 비밀번호 -->
						<tr class="pw_modform">
							<td class="title_m"> 변경 할 <br> 비밀번호 </td>
							<td >
								<input type="password" name="m_pw" id="se_new_pw_input" class="input">
							</td>
							<td>
								<span id="pw_check">비밀번호는 띄어쓰기 없이 8~15자의 영문 대/소문자, 숫자 및 	특수문자 중 2가지 이상 조합으로 입력하셔야 합니다.</span>
							</td>
						</tr>
						
			<!-- 비밀번호 확인용 -->
						<tr  class="pw_modform">
							<td class="title_m"> 비밀번호 <br> 확인   </td>
							<td >
								<input type="password" name="m_pw" id="se_pw_set" class="input"><br>
							</td>
							<td>
								<span id="pw_confirm" > 비밀번호가 일치 하지 않습니다.</span>
							</td>
						</tr>
						
						<tr  class="pw_modform">
							<td ></td>
							<td></td>
							<td>
								<button id="pwmod_btn">수정하기</button>
								<button id="pwmod_btncle">수정 취소</button>
							</td>
						</tr>
						
						<tr>
							<td class="title_m">이름 : </td>
							<td colspan="2">
								<input type="text" readonly="readonly" name="m_name" id="name_input" class="input" value="${member.m_name}">
							</td>							
						</tr>
						<tr>
							<td class="title_m">전화번호 : </td>
							<td colspan="2">
								<select id="tel_option" name="m_tel" disabled="disabled">
									<option value="ch_SKT">SKT</option>
									<option value="ch_LGT">LGT</option>
									<option value="ch_KT">KT</option>
								</select>								 
								<input type="text" readonly="readonly" name="m_tel" id="tel_input" placeholder=" '-'를 포함하여 입력해주세요." class="input">
							</td>
						</tr>
						<tr>
							<td class="title_m">생일 : </td>
							<td colspan="2">
								<input type="date" readonly="readonly" name="m_birth" id="birth_input" class="input" value="${member.m_birth}"><br>
							</td>
						</tr>
						<tr>
							<td class="title_m">성별 : </td>
							<td colspan="2">
								<label for="gender">남성</label> <input type="radio" name="m_gender" id="gender" value="male" >
								<label for="gender_w">여성</label> <input type="radio" name="m_gender" id="gender_w" value="female" >
							</td>
						</tr>
						<tr>
							<td class="title_m">이메일 : </td>
							<td colspan="2">
								<input type="text" readonly="readonly" name="m_email" id="email_input" placeholder="이메일을 입력해주세요." class="input" value="${member.m_email}">
							</td>
						</tr>
						<tr id="tr_mod">
							<td ></td>
							<td></td>
							<td>
								<button id="mod_btnform">회원정보 수정</button>								
							</td>
						</tr>
			<!-- 일반회원 정보(이름) -->
						<tr class="modform">
							<td  class="title_m">이름:</td>
							<td>
								<input type="text" id="pu_name_input">
							</td>
							<td></td>
						</tr>
			<!-- 일반회원 정보(전화번호) -->
						<tr  class="modform">
							<td  class="title_m">전화번호: </td>
							<td>
								 <select id="pu_tel_option" >
									<option value="SKT" name="chskt">SKT</option>
									<option value="LGT" name="chslgt">LGT</option>
									<option value="KT" name="chkt">KT</option>
								</select> 
								<input type="text" id="pu_tel_input" placeholder=" '-'를 포함하여 입력해주세요." >
							</td>
							<td><p id="telchk">전화번호를 '-'를 포함하여 정확하게 입력해주세요.</p>	</td>
						</tr>
			<!-- 일반회원 정보(성별) -->
						<tr  class="modform">
							<td  class="title_m">성별: </td>
							<td>							
								<label for="ch_gender">남성</label> <input type="radio" name="pu_m_gender" id="ch_gender" value="male">
								<label for="ch_gender_w">여성</label> <input type="radio" name="pu_m_gender" id="ch_gender_w" value="female">
							</td>
							<td></td>
						</tr>
			<!-- 일반회원 정보(email) -->
						<tr  class="modform">
							<td  class="title_m">이메일:</td>
							<td><input type="text" id="pu_email_input" placeholder="이메일을 입력해주세요." class="input"></td>
							<td><p id="emailchk">이메일을 정확하게 입력해주세요.</p></td>
						</tr>
						<tr  class="modform">
							<td  class="title_m"></td>
							<td></td>
							<td>
								<button id="pu_mod_btn">수정하기</button>
								<button id="mod_btncle">취소하기</button>
								
							</td>
						</tr>
						

						
					</table>
		</div>
		
		
	</section>
	
	<c:import url="/footer" />
	
</body>
</html>
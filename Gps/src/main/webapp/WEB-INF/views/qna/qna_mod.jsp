<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 수정하기</title>
<!-- css 넣는 태그 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/css/common/img/icons.ico">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/product/pro_write.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/product/pro_mod.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="/gps/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {

		/* 1. smarteditor 시작 */
		//전역변수선언
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "smarteditor",
			sSkinURI : "/gps/resources/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});

		//전송버튼 클릭이벤트
		$("#savebutton").click(
				function() {
					//id가 smarteditor인 textarea에 에디터에서 대입
					editor_object.getById["smarteditor"].exec(
							"UPDATE_CONTENTS_FIELD", []);

					// 이부분에 에디터 validation 검증

					//폼 submit
					$("#frm").submit();
				});

		/* file Tag 추가 및 삭제 시작*/
		var num = 0;
		$("#imgPlus")
				.click(
						function() {
							if (num >= 0) {
								num = num * 1 + 1;
							}
							//file Tag 생성
							$("#fileinput")
									.append(
											'<div id="btn'+num+'" class="files_import"><input type="file" name="file" id="btn'+num+'"> <input type="button" id="btn'+num+'" class="butn btn" value="삭제"> <br id="btn'+num+'"></div>');

							//삭제 버튼 클릭
							$(".butn").click(function() {
								var n = $(this).attr("id");
								$("#" + n).remove();
								$(this).remove();
							});
						});
		/* file Tag 추가 및 삭제 끝*/

		/* smarteditor 끝 */
		$(document).ready(function() {
			$("#img_delete").on("click", function() {
				var checkArr = [];

				$("input[name='qfile_num']:checked").each(function() {
					checkArr.push($(this).val());
				});

				$.ajax({
					url : 'qna_mod_img_del',
					type : 'POST',
					dataType : 'text',
					data : {
						valueArr : checkArr,
						q_num : $("#q_num").val()
					},
					success : function(data) {
						data = data.trim();
						$("#img_delete_div").html(data);
					}
				});
			});
		});
	});
</script>
</head>
<body>
	<c:import url="/header" />
	<section>
		<c:import url="/user_menu_bar" />
		<div id="pro_w">
			<h2 style="text-align: center;">※QnA※</h2>
			<form action="qna_mod" method="post" id="frm"
				enctype="multipart/form-data">
				<table>
					<colgroup>
						<col style="width: 20%;">
						<col style="width: 80%;">
					</colgroup>
					<tr>
						<td class="title">작성자</td>
						<td><input type="text" class="pro_in" name="q_writer"
							value="${qnaView.q_writer }" readonly="readonly"></td>
					</tr>

					<tr>
						<td class="title">제목</td>
						<td><input type="text" class="pro_in" name="q_title"
							value="${qnaView.q_title }"></td>
					</tr>

					<tr>
						<td class="title">내용</td>
						<td>
							<div id="q_textarea">
								<textarea id="smarteditor" name="q_contents">${qnaView.q_contents}</textarea>
							</div>
						</td>
					</tr>

					<tr>
						<td>이미지삭제</td>
						<td>
							<div id="img_delete_div">
								<input type="hidden" name="q_num" id="q_num"
									value="${qnaView.q_num}">
								<c:forEach items="${qna_mod_img}" var="img" varStatus="status">
									<div id="pro_mod_images">
										<input class="check_box" id="checkbox${status.index}"
											name="qfile_num" value="${img.qfile_num}" type="checkbox">
										<input type="hidden" name="qfile_name"
											id="img_${status.index}" value="${img.qfile_name }">
										<label for="checkbox${status.index}"><img
											src="../resources/upload/${img.qfile_name}"></label>
									</div>
								</c:forEach>
							</div> <input type="button" id="img_delete" value="삭제">
						</td>
					</tr>

					<tr>
						<td>이미지추가</td>
						<td><span class="title"></span><input type="button"
							id="imgPlus" class="btn" value="추가하기">
							<div id="fileinput"></div></td>
					</tr>
				</table>
				<div id="pro_w_btn">
					<input type="hidden" name="q_num" value="${qnaView.q_num}">
					<input type="button" value="수정완료" class="btn" id="savebutton">
					<input type="button" class="btn" value="목록"
						onclick="location.href='${pageContext.request.contextPath}/qna/qnaList';">
				</div>
			</form>
		</div>
	</section>
	<c:import url="/footer" />
</body>
</html>
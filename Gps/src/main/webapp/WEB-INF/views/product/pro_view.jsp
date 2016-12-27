<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/common.css">
<!-- css 넣는 태그 -->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/product/pro_view.css">
<script type="text/javascript"
	src="/gps/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/product/pro_view.css">

<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#my_pc_btn").click(function(){
			if($(this).html() == "내 사양보기"){
				$(this).html("내 사양닫기");
			}else {
				$(this).html("내 사양보기");
			}
			$("#my_pc").toggle();
		});
		
		
		/* 1. smarteditor 시작 */
	    //전역변수선언
	    var editor_object = [];
	     
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        elPlaceHolder: "smarteditor",
	        sSkinURI: "/gps/resources/SE2/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : false,             
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : false,     
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true, 
	        }
	    
	    	
	    });
	    
	    //댓글 리스트
	    $.ajax({
	    	url: '../reply/reply_list',
	    	type: 'POST',
	    	data:{
	    		pro_num:$("#pro_num").val()
	    	},
	    	success: function(data) {
				data=data.trim();
				$("#reply_contents").html(data);
			}
	    });
	    
	    //패키지 게임 가져오기
	    $.ajax({
	    	url: '../package_pro/packList',
	    	type: 'POST',
	    	data:{
	    		pro_num: $("#pro_num").val()
	    	},
	    	success: function(data) {
	    		data=data.trim();
	    		$("#package_game").html(data);
	    	}
	    });
	    
	    //전송버튼 클릭이벤트 (댓글 작성)
		$("#save").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	         
	        $.ajax({
	        	url: '../reply/reply_id_check',
	        	type: 'POST',
	        	data:{
	        		r_writer: $("#r_writer").val(),
	        		pro_num: $("#pro_num").val()	
	        	},
	        	success:function(result){
	        		if(result>0){
	        			alert("공정심사때문에 글을 작성할수 없습니다.");
	        		}else{
	        			 // 이부분에 에디터 validation 검증
	    		        $.ajax({
	    	    			url: '../reply/reply_write',
	    	    			type: 'POST',
	    	    			data:{
	    	    				pro_num: $("#pro_num").val(),
	    	    				r_writer: $("#r_writer").val(),
	    	    				r_contents: $("#smarteditor").val(),
	    	    				r_score: $("#r_score").val()
	    	    			},
	    	    			success:function(data){
	    	    				data=data.trim();
	    	    				$("#reply_contents").html(data);
	    	    			}
	    	    		});
	        		}
	        	}
	        });
	    });
	    /* smarteditor 끝 */
		
	    $("#before").click(function(){
	    	location.href="pro_view?pro_num=${pro_view.pro_num}&curPage=${pageImg.startNum-5}";
	    });
	    
	    $("#next").click(function(){
	    	location.href="pro_view?pro_num=${pro_view.pro_num}&curPage=${pageImg.lastNum+1}";
	    });
	    
	    
	    //장바구니 담기 (클래스)
	    $(".cart").click(function() {
	    	if(confirm("장바구니에 담으시겠습니까?") == true){
	    		$("#frm").submit();
	    	}else{
	    		return;
	    	}
		});
	    
	    //장바구니 담기 (아이디)
	    $("#cart").click(function() {
	    	if(confirm("장바구니에 담으시겠습니까?") == true){
	    		$("#frm").submit();
	    	}else{
	    		return;
	    	}
		});
	    
	    //관심상품
	    $("#favorite").click(function(){
	    	if(confirm("관심상품에 담으시겠습니까?") == true){
	    		$("#frm1").submit();
	    	}else{
	    		return;
	    	}
	    });
	    
	    //상품 수정하기
	    $("#product_mod").click(function() {
	    	location.href="pro_mod?pro_num=${pro_view.pro_num}";
	    });
	    //상품 삭제하기
	    $("#product_del").click(function() {
	    	location.href="pro_del?pro_num=${pro_view.pro_num}";
	    });
	    
	    
	    
	    //pro_view에서 사용할 cookie 저장
		var cookie_check = true;
		var cookie_in = false;
		var i = 0;
		
		//처음 10개의 쿠키를 저장
		while(cookie_check){
			for(i=0; i<10; i++){
				if(getCookie("recent_9") == ""){					
					if(getCookie("recent_"+i) == ""){			
						setCookie("recent_"+i, "${pro_view.pro_num}", 1);
						cookie_check = false;
						break;
					}
				}else {
					cookie_in = true;
					cookie_check = false;
					break;
				}
			}
		}
		
		var k = 0;
		
		while(cookie_in){
			//총 10개의 쿠키를 이용하여 저장
			for(k=0; k<9; k++){
				deleteCookie("recent_"+k); //쿠키를 삭제하고
				
				var one = getCookie("recent_"+(k*1+1*1)); //다음 쿠키를 저장해 둔 뒤
				
				setCookie("recent_"+k, one, 1); //쿠키를 집어넣는다
			}
			
			
				deleteCookie("recent_9"); //가장 최신 쿠키를 삭제하고
				
				setCookie("recent_9", "${pro_view.pro_num}", 1); //현재 보고있는 쿠키를 넣는다
				
				cookie_in = false;
				break;
		}
	    
	});
	
	//댓글 삭제
	function reply_delete(i){
	  	var r_num = $("#r_num_"+i).val();
	   	$.ajax({
	  		url: '../reply/reply_delete',
	   		type: 'POST',
	   		data:{
	   			pro_num: $("#pro_num").val(),
	   			r_num: r_num
	  		},
	   		success: function(data){
	   			data=data.trim();
    			$("#reply_contents").html(data);
	   		}
	   	});
	}
	//좋아요
	function reply_like(i){
		var r_num = $("#r_num_"+i).val();
		var m_id = $("#m_id_like_"+i).val();
		
		$.ajax({
			url: '../reply/reply_like',
			type: 'POST',
			data:{
				pro_num: $("#pro_num").val(),
				r_num: r_num,
				m_id: m_id
			},
			success: function(data){
				data=data.trim();
				$("#reply_contents").html(data);
				
			}
		});
		
		
	}
	//다운
	function patchDownload(i){
		var patch_name = $("#patch_name_"+i).val();
		location.href="../resources/upload/"+patch_name;
		//location.href="pro_down?patch_file_name="+patch_name;
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
		<div id="user_menu">
			<c:import url="/user_menu_bar" />
		</div>

		<div id="pro_view">
			<!-- game name -->
			<h3>${pro_view.pro_title}</h3>
			<!-- main image -->
			<div id="first_pro">
				<div id="main_img" class="w3-content">
					<!-- game main image -->
					<c:forEach items="${pro_img}" var="img">
						<img class="mySlides" src="../resources/upload/${img.file_name}">
					</c:forEach>
				</div>
			</div>
			<!-- game information -->
			<div id="second_pro">
				<div id="title_img">
					<img src="../resources/upload/${pro_main.file_name}">
				</div>
				<div id="game_info">${pro_view.pro_contents}</div>
				<div id="game_evalution">
					<span>평점 : </span>
					<c:if test="${score_avg == 0 }">
						<img
							src="${pageContext.request.contextPath}/resources/css/product/img/zero_grade.png">
					</c:if>
					<c:if test="${score_avg == 1 }">
						<img
							src="${pageContext.request.contextPath}/resources/css/product/img/one_grade.png">
					</c:if>
					<c:if test="${score_avg == 2 }">
						<img
							src="${pageContext.request.contextPath}/resources/css/product/img/two_grade.png">
					</c:if>
					<c:if test="${score_avg == 3 }">
						<img
							src="${pageContext.request.contextPath}/resources/css/product/img/three_grade.png">
					</c:if>
					<c:if test="${score_avg == 4 }">
						<img
							src="${pageContext.request.contextPath}/resources/css/product/img/four_grade.png">
					</c:if>
					<c:if test="${score_avg == 5 }">
						<img
							src="${pageContext.request.contextPath}/resources/css/product/img/all_grade.png">
					</c:if>
					<%-- <h3>평점 :  ${score_avg} </h3> --%>
				</div>
			</div>
			<!-- sub images -->
			<div id="third_pro">
				<c:if test="${pageImg.curBlock>1}">
					<button class="sub_btn" id="before"></button>
				</c:if>

				<c:if test="${pageImg.curBlock<pageImg.totalBlock}">
					<button class="sub_btn" id="next"></button>
				</c:if>
				<ul>
					<c:forEach items="${pro_img}" var="img" varStatus="status">
						<li><img class="demo w3-opacity w3-hover-opacity-off"
							src="../resources/upload/${img.file_name}"
							onclick="currentDiv(${status.index+1})"></li>
					</c:forEach>
				</ul>
			</div>
			<script type="text/javascript">
				var slideIndex = 1;
				showDivs(slideIndex);
				
				function plusDivs(n) {
				  showDivs(slideIndex += n);
				}
				
				function currentDiv(n) {
				  showDivs(slideIndex = n);
				}
				
				function showDivs(n) {
					  var i;
					  var x = document.getElementsByClassName("mySlides");
					  var dots = document.getElementsByClassName("demo");
					  if (n > x.length) {slideIndex = 1}
					  if (n < 1) {slideIndex = x.length}
					  for (i = 0; i < x.length; i++) {
					     x[i].style.display = "none";
					  }
					  for (i = 0; i < dots.length; i++) {
					     dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
					  }
					  x[slideIndex-1].style.display = "block";
					  dots[slideIndex-1].className += " w3-opacity-off";
					}
			</script>
			<!-- product menu -->
			<div id="four_pro">
				<div id="pakage">
					<div class="item">
						<div class="four_contents">
							<table>
								<colgroup>
									<col style="width: 450px;">
									<col style="width: 100px;">
								</colgroup>
								<tr>
									<td class="f_g_name">${pro_view.pro_title }</td>
									<td></td>
								</tr>
								<tr>
									<td class="f_g_ex" colspan="2">${pro_view.pro_contents }</td>
								</tr>
							</table>
						</div>
						<div class="tag">
							<ul>
								<li class="discount">${pro_view.discount }%</li>
								<li class="price">
									<p class="nomal_p">₩ ${pro_view.price}</p> <span>₩
										${pro_view.total_price} </span>
								</li>
								<li><input type="button" class="cart" value="장바구니 담기"></li>
							</ul>
						</div>
					</div>
					<div id="package_game">
						<c:forEach items="${package_game }" var="pack" varStatus="status">				
								<div class="item">
									<div class="four_contents">
										<table>
											<colgroup>
												<col style="width: 450px;">
												<col style="width: 100px;">
											</colgroup>
											<tr>
												<td class="f_g_name">${pack.pack_title }</td>
												<td></td>
											</tr>
											<tr>
												<td class="f_g_ex" colspan="2">${pack.pack_contents }</td>
											</tr>
										</table>
									</div>
									<div class="tag">
										<ul>
											<li class="discount">${pack.discount }</li>
											<li class="price">
												<p class="nomal_p">₩ ${pack.price }</p> <span>₩ ${pack.total_price }</span>
											</li>
											<li><input type="button" value="장바구니 담기"></li>
										</ul>
									</div>
								</div>
							</c:forEach>
					</div>
				</div>
				<div id="relationship">
					<span>연관 추천 게임</span>
					<ul>
						<c:forEach items="${mapping}" var="mapping" varStatus="status">
							<li
								onclick="location.href='${pageContext.request.contextPath}/product/pro_view?pro_num=${mapping.pro_num }'">
								<dl>
									<dt>
										<img class="game_img"
											src="../resources/upload/${mapping_img[status.index].file_name}">
									</dt>
									<dd class="rel_name">${mapping.pro_title }</dd>
									<dd>
										<c:if test="${mapping.total_price == '' }">
										₩ ${mapping.price }
									</c:if>
										<c:if test="${mapping.total_price != '' }">
										₩ ${mapping.total_price} 
									</c:if>
									</dd>
								</dl>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- game software -->
			<div id="five_pro">
				<div id="computer">
					<c:if test="${member.m_id != null}">
						<button id="my_pc_btn">내 사양보기</button>
					</c:if>
					<div id="my_pc">
						<table>
							<colgroup>
								<col style="width: 40%;">
								<col style="width: 60%;">
							</colgroup>
							<tr>
								<td class="com_title" colspan="2">내 사양</td>
							</tr>
							<tr>
								<td class="com_name">운영체제</td>
								<td><span>'${cominfo.com_os}'</span></td>
							</tr>
							<tr>
								<td class="com_name">CPU</td>
								<td><span>'${cominfo.com_process}'</span></td>
							</tr>
							<tr>
								<td class="com_name">메모리(RAM)</td>
								<td><span>'${cominfo.com_memory}'</span></td>
							</tr>
							<tr>
								<td class="com_name">그래픽 카드</td>
								<td><span>'${cominfo.com_graphic}'</span></td>
							</tr>
							<tr>
								<td class="com_name">Direct X버전</td>
								<td><span>'${cominfo.com_directx}'</span></td>
							</tr>
							<tr>
								<td class="com_name">하드디스크 <br> 여유공간
								</td>
								<td><span>'${cominfo.com_space}'</span></td>
							</tr>
						</table>
					</div>
					<table>
						<colgroup>
							<col style="width: 40%;">
							<col style="width: 60%;">
						</colgroup>
						<tr>
							<td class="com_title" colspan="2">권장 사양</td>
						</tr>
						<tr>
							<td class="com_name">운영체제</td>
							<td>${computer.pc_os }</td>
						</tr>
						<tr>
							<td class="com_name">CPU</td>
							<td>${computer.pc_process }</td>
						</tr>
						<tr>
							<td class="com_name">메모리(RAM)</td>
							<td>${computer.pc_memory}</td>
						</tr>
						<tr>
							<td class="com_name">그래픽 카드</td>
							<td>${computer.pc_graphic }</td>
						</tr>
						<tr>
							<td class="com_name">Direct X버전</td>
							<td>${computer.pc_directx}</td>
						</tr>
						<tr>
							<td class="com_name">하드디스크 <br> 여유공간
							</td>
							<td>${computer.pc_space}</td>
						</tr>
					</table>
				</div>
				<div id="patch">
					<table>
						<colgroup>
							<col style="width: 70%;">
							<col style="width: 30%;">
						</colgroup>
						<tr>
							<td class="com_title" colspan="2">업데이트 및 패치 파일</td>
						</tr>
						<c:forEach items="${pro_patch}" var="patch" varStatus="status">
							<tr>
								<td class="com_name">
									<p>${patch.patch_origine_name}</p>
									<input type="hidden" value="${patch.patch_file_name}" id="patch_name_${status.index}">
								</td>
								<td>
									<button onclick="patchDownload(${status.index})">Download</button>
									<%-- <a href="../resources/upload/${patch.patch_file_name}">${patch.patch_origine_name}</a> --%>
								</td>
					
							</tr>
							</c:forEach>
						<%-- <c:forEach items="${pro_patch}" var="patch" varStatus="status">
							<tr>
								<td class="com_name">
									<p>${patch.patch_origine_name}</p> <input type="hidden"
									value="${patch.patch_file_name}"
									id="patch_name_${status.index}">
								</td>
								<td>
									<button onclick="patchDownload(${status.index})">Download</button>
									<a href="../resources/upload/${patch.patch_file_name}">${patch.patch_origine_name}</a>
								</td>

							</tr>
						</c:forEach> --%>
					</table>
				</div>

				
					<form action="../favorite/favoriteAdd" method="get" id="frm1">
						<input type="hidden" name="m_id" value="${member.m_id}"> <input
							type="hidden" name="pro_num" value="${pro_view.pro_num}">
						<button class="five_btn" id="favorite">관심상품</button>
					</form>

					<form action="../cart_favorite/cartAdd" method="get" id="frm">
						<input type="hidden" name="m_id" value="${member.m_id}"> <input
							type="hidden" name="pro_num" value="${pro_view.pro_num}">
						<button class="five_btn" class="cart" id="cart">장바구니</button>
					</form>
				<div id="admin_btn">
					<c:if test="${member.m_id eq 'admin'}">
						<input type="button" id="product_del" value="삭제">
						<input type="button" id="product_mod" value="수정">
					</c:if>
				</div>

			</div>

				<c:if test="${member.m_id != null}">
				<!-- review -->
				<div id="six_pro">
					<div id="pro_grade"></div>
					<div id="reply_write">
						<div class="re_title">
							<span>의견 쓰기</span> <span id="review_count">
								${reply_count1} </span>
						</div>


						<div class="re_contents">
							<div class="re_user">${member.m_id}</div>
							<!-- textarea -->
							<input type="hidden" name="pro_num" id="pro_num"
								value="${param.pro_num}"> <input type="hidden"
								name="r_writer" id="r_writer" value="${member.m_id}">
							<textarea id="smarteditor" name="r_contents"></textarea>
							<div id="pro_grades">
								<table>
									<colgroup>
										<col style="width: 23%;">
										<col style="width: 75%;">
									</colgroup>
									<tr>
										<td>평점 :</td>
										<td>
											<!-- <input type="number" id="r_score" name="r_score"> --> <select
											id="r_score" name="r_score">
												<option value="0" id="score_0">☆☆☆☆☆</option>
												<option value="1" id="score_1">★☆☆☆☆</option>
												<option value="2" id="score_2">★★☆☆☆</option>
												<option value="3" id="score_3">★★★☆☆</option>
												<option value="4" id="score_4">★★★★☆</option>
												<option value="5" id="score_5">★★★★★</option>
										</select>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="re_sub">
							<button id="save">등록</button>
						</div>


						<div class="reply_contents" id="reply_contents">
							<c:forEach items="${replyList}" var="rep" varStatus="status">
								<div class="re_title"></div>
								<div class="re_contents">
									<div class="re_user">
										${rep.r_writer} <input type="hidden" name="m_id"
											id="m_id_${status.index}" value="${rep.r_writer}"> <input
											type="hidden" name="r_num" id="r_num_${status.index}"
											value="${rep.r_num}">
										<c:if test="${member.m_id eq rep.r_writer}">
											<input type="button" onclick="reply_delete(${status.index})"
												value="삭제">
										</c:if>
										<input type="text" value="${rep.r_score }"
											id="score_${status.index}">
									</div>
									<textarea id="smarteditor" readonly="readonly"> ${rep.r_contents} </textarea>
								</div>
								<div class="re_sub">
									<div class="like" onclick="reply_like(${status.index})">
										<input type="hidden" name="m_id"
											id="m_id_like_${status.index}" value="${member.m_id}">
										<span> <img id="liked_check"
											src="${pageContext.request.contextPath}/resources/css/product/img/thumbs-up.png">
										</span> <strong> <c:choose>
												<c:when
													test="${empty reply_like_count[status.index].like_count}">
												0
											</c:when>
												<c:otherwise>
												${reply_like_count[status.index].like_count}			
											</c:otherwise>
											</c:choose>
										</strong>
									</div>

								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				</c:if>
			</div>
	</section>





	<c:import url="/top_btn" />
	<c:import url="/footer" />

</body>
</html>
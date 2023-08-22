<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="resources/css/User_main.css" rel="stylesheet"> -->

<style>
.content {
	width: 1570px;
	height: 800px;
	margin-top: 105px;
	/*      background-color: khaki; */
}

/* 메인 css */
.main_profile_area {
	width: 22%;
	height: 800px;
	border-radius: 20px;
	background-color: rgb(203, 235, 216);
	float: left;
	font-family: 'HallymGothic-Regular';
}

#main_profile a {
	text-decoration: none;
	color:black;
	font-size: 20px;
	font-weight: bold;
}

#main_profile img {
	width: 200px;
	height: 200px;
	border-radius: 100px;
	margin-top: 80px;
}

.main_profile_area a {
	text-decoration: none;
	color: black;
	cursor: pointer;
	font-family: 'KimjungchulGothic-Bold';
}

#main_logout {
	background-color: rgb(203, 235, 216);
	border: 0px;
	color: black;
	cursor: pointer;
	float: left;
	font-size: 20px;
	font-weight: bold;
	font-family: 'KimjungchulGothic-Bold';
}

/* 출퇴근 기록하는 div */
#main_profile_work {
	background-color: white;
	width: 310px;
	height: 260px;
	border-radius: 20px;
	margin: 13px;
}

#mp_work_input button {
	background-color: #0E6251;
	width: 100px;
	border-radius: 50px;
	float: left;
	margin-left: 35px;
}

/* 메인 가운데 전체 div */
.content_center {
	/* background-color: gold; */
	float: left;
	width: 800px;
	height: 100%;
	margin-left: 40px;
}

/* 최근 온 메일 */
.main_mail {
	border: 2px solid black;
	border-radius: 20px;
	width: 100%;
	height: 250px;
	margin-bottom: 24px;
}

/* 공지사항 */
.main_notice {
	border: 2px solid black;
	border-radius: 20px;
	width: 100%;
	height: 250px;
	margin-bottom: 24px;
}

/* 공지사항 탭 메뉴 전체 div */
#main_user_tab_area {
	width: 20%;
	margin: 15px 0 0 20px;
	float: left;
}

#main_user_tab_area>ul {
	width: 100%;
	height: 30px;
	list-style-type: none;
}

#nav-tabs {
	padding: 0;
	display: flex;
}

#main_user_tab_area>ul li {
	width: 98px;
	margin-right: 5px;
	float: left;
	background-color: rgb(203, 235, 216);
	/* border : 1px solid black; */
	border-radius: 10px;
}

#notice_new>a, #notice_liked>a {
	text-decoration: none;
	color: white;
	margin-left: 18px;
	font-size: 20px;
}

#notice_new:hover, #notice_liked:hover {
	backgroundcolor: rgb(203, 235, 216);
}

#others_team>a {
	text-decoration: none;
	color: white;
	margin-left: 15px;
	font-size: 20px;
}

#others_all>a {
	text-decoration: none;
	color: white;
	margin-left: 26px;
	font-size: 20px;
}

.main_others {
	border: 2px solid black;
	border-radius: 20px;
	width: 100%;
	height: 250px;
}

/* 제목 */
.main_ctn_title {
	float: left;
	margin: 12px 0 0 25px;
	font-size: 30px;
	font-weight: bold;
	font-family: 'KimjungchulGothic-Bold';
}

/* 플러스 아이콘 */
.main_ctn_plus {
	float: right;
	margin: 18px 25px;
	cursor: pointer;
}

/* 메인 왼쪽 전체 div */
.content_right {
	/*         background-color: lightyellow; */
	float: right;
	width: 365px;
	height: 100%;
}

/* 일정 */
.main_calender {
	border: 2px solid black;
	width: 100%;
	/*         height: 523px; */
	height: 799px;
	border-radius: 20px;
	margin-bottom: 26px;
}

/* 경조사 */
.main_event {
	border: 2px solid black;
	width: 100%;
	height: 250px;
	border-radius: 20px;
}

/* 공지사항 테이블  */
#mainNoticeList {
	width: 750px;
	margin: auto;
	font-size: 20px;
}

/* 이메일 테이블  */
#mainMessengerList {
	width: 750px;
	margin: auto;
	font-size: 20px;
}

#mainOthersList {
	width: 750px;
	height: 80px;
	margin: auto;
	text-align: center;
	font-family: 'HallymGothic-Regular';
}

#mainApprovalList {
	width: 750px;
	margin: auto;
	font-size: 20px;
	font-family: 'HallymGothic-Regular';
}

#others_profile_table {
	margin: auto;
	font-family: 'HallymGothic-Regular';
}

#calendar {
	width: 350px; /* 원하는 너비 값으로 변경 */
	margin: 55px auto 10px auto; /* 가운데 정렬을 위해 추가 */
	font-family: 'HallymGothic-Regular';
}

.fc-left h2 {
	font-size: 20px;
	padding: 15px 25px 0 8px;
}

.fc-right button, .fc-button-group button {
	height: 10px;
}

.fc-button-group button {
	margin-left: 0px;
}
.main_calendar_info {
	margin: auto;
}

/* 투두리스트 css 시작 */
.main_todo_input_box{
    text-align: center;
    margin-bottom: 20px;
    font-family: 'HallymGothic-Regular';
}

#main_todo_value{
    width: 300px;
    height: 50px;
    font-size: 18px;
    font-family: 'HallymGothic-Regular';
}
#main_todo_add {
    width: 50px;
    height: 50px;
    background-color: #0e6251;
}

.mainToDoList{
    list-style: none;
    font-size: 20px;
    font-family: 'HallymGothic-Regular';
}

#mainAddTodo {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.mainToDoList li {
    margin-bottom: 10px;
    display: flex;
    align-items: center;
}

/* 한개씩 지우는 삭제버튼 */
.mainToDoList li .delete_btn {
    font-size: 20px;
    border: none;
    background-color: white;
    color: lightgray;
    cursor: pointer;
    margin-left: 10px;
}

/* 할일 체크박스 */
.todoCheck{
    width: 20px;
    height: 20px;
    margin-right: 10px;
    accent-color: green;
}

/*  */
#todoLabelId{
    margin-left: 10px;
}

table tr {
	cursor: pointer;
	font-family: 'HallymGothic-Regular';
}

a{
	text-decoration: none;
}


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div class="content">
		<div class="main_profile_area" align="center">
			<div id="main_profile">
				<div id="mainProfileImg">
					<!-- 사진 들어가는 곳 -->
				</div>
				<p style="font-size: 30px; margin: 0 0 0 0;">${loginUser.userName }</p>
				<p>${loginUser.deptName } / ${loginUser.jobName }</p>
				<div style="float:left; margin-left: 80px;">
					<a href="myPage.me" id="profileMypage">마이페이지</a>
				</div>
				<div style="float:left; margin-left: 20px;  ">
					<form action="/final3/logout" method="post">
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				        <input type="submit" id="main_logout" value="로그아웃" style="">
					</form>
				</div>
				<br>
			</div>

			<div id="main_profile_card" align="center">
				<c:choose>
					<c:when test="${loginUser.auth eq 'ROLE_ADMIN' }">
						<div style="float: left; margin: 0 0 0 65px;">
							<a href="memberEnroll.me"> <i class="fa-sharp fa-solid fa-address-card"
								style="color: #000000; font-size: 70px;  margin: 20px 10px 0 0;"></i>
								<p style="margin: 0 10px 0 0;">회원 등록 </p>
							</a>
						</div>
					</c:when>
				</c:choose>
				<div>
					<a href="#" data-target='#main_toDoList' data-toggle='modal' style="text-decoration:none; color:black;">
						<i class="fa-solid fa-list-check"
						style="color: #000000; font-size: 70px; margin: 20px 10px 0 10px;" ></i>
						<p style="margin: 0 0 0 0;">TO DO</p>
					</a>
				</div>
			</div>

			<div id="main_profile_work">
				<div id="mp_sysdate">
					<br>
					<p id="user_date" style="font-size: 22px; margin: 0 0 0 0;"></p>
					<h1 id="user_clock"></h1>
					<!-- <span style="font-size: 45px; font-weight: bold;"></span> -->
				</div>

				<div id="mp_work_output">
<!-- 					<div id="begin_time" style="margin-bottom: 4px;"> -->
<!-- 						<div id="mainOnTimeDiv"></div> -->
<!-- 					</div> -->
<!-- 					<div style="border: 1px solid black; width: 280px;"></div> -->
<!-- 					<div id="end_time" style="margin: 6px 0 12px 0;"> -->
<!-- 						<div id="mainOffTimeDiv">퇴근 시간 : </div> -->
<!-- 					</div> -->
				</div>
				<div id="mp_work_input">
					<button id="onTimeBtn" class="btn btn-primary" onclick="insertOnTime();">출근</button>
					
					<button id="offTimeBtn" class="btn btn-primary" onclick="insertOffTime();" >퇴근</button>
				</div>
			</div>
		</div>

		<!-- 메인 가운데 부분 -->
		<div class="content_center">
			<div class="main_mail">
				<div>
					<div class="main_ctn_title">
						<span>최근 온 쪽지</span>
					</div>
					<div class="main_ctn_plus">
						<a href="#" id="msgPlus"> <i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
						</a>
					</div>
				</div>

				<table id="mainMessengerList" align="center">
					<tbody>

					</tbody>
				</table>
			</div>

			<div class="main_notice">
				<div>
					<div class="main_ctn_title">
						<span>공지 사항</span>
					</div>
					<div id="main_user_tab_area">
						<ul id="nav-tabs">
							<li class="nav-item" id="notice_new" data-tab="mainNoticeList">
								<a class="nav-link active" id="link_active" aria-current="page" href="#">new </a>
							</li>
							<li class="nav-item" id="notice_liked"data-tab="mainNoticeLikedList">
								<a class="nav-link" href="#" id="link_active">liked </a>
							</li>
						</ul>
					</div>
					<div class="main_ctn_plus">
						<a href="list.no">
							<i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
						</a>
					</div>
				</div>

				<table id="mainNoticeList" align="center">
					<tbody>
					</tbody>
				</table>
			</div>

			<c:choose>
				<c:when test="${loginUser.auth == 'ROLE_MEMBER'}">
					<div class="main_others">
						<div>
							<div class="main_ctn_title">
								<span>임직원 조회 </span>
							</div>
							<div id="main_user_tab_area">
								<ul id="nav-tabs">
									<li class="nav-item" id="others_team" data-tab="mainOthersTemaList">
										<a class="nav-link active" id="link_active" aria-current="page" href="#">Team </a>
									</li>
									<li class="nav-item" id="others_all" data-tab="mainOthersAllList">
										<a class="nav-link" href="#" id="link_active">All </a>
									</li>
								</ul>
							</div>
							<div class="main_ctn_plus">
								<a href="list.me"> 
									<i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
								</a>
							</div>
						</div>

						<table id="mainOthersList" align="center">
							<tbody>

							</tbody>
						</table>
					</div>
				</c:when>

				<c:otherwise>
					<div class="main_others">
						<div>
							<div class="main_ctn_title">
								<span>전자 결재 </span>
							</div>
							<div class="main_ctn_plus">
								<a href="home.ap">
									<i class="fa-solid fa-plus fa-2xl"style="color: #0e6251;"></i>
								</a>
							</div>
						</div>

						<table id="mainApprovalList" align="center">
							<tbody>

							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- 메인 오른쪽 부분 -->
		<div class="content_right">
			<div class="main_calender">
				<div>
					<div class="main_ctn_title">
						<span>일정</span>
					</div>
					<div class="main_ctn_plus">
						<a href="schedule.sc">
							<i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
						</a>
					</div>
				</div>
				<div id="calendar"></div>
				<table class="main_calendar_info">
					<tbody>
						<tr>
							<td style="font-size: 35px;" id="mainDay"></td>
						</tr>
						<tr id="mainDailyForm">
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- 투두 리스트 모달 -->
	<div class="modal fade" id="main_toDoList" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 class="modal-title" id="myModalLabel">TO DO LIST</h2>
				</div>
				<div class="modal-body" id="toDo_body">
                    <div class="main_todo_wrap">
                        <div class="main_todo_input_box">
                            <input type="text" id="main_todo_value" placeholder="할 일을 입력해주세요!" autofocus> <!--autofocus : 자동 포커스-->
                            <button type="button" id="main_todo_add" onclick="mainAddTodo();">
                                <i class="fa-solid fa-plus fa-2xl" style="color: white;"></i>
                            </button>
                        </div>
                        <div id="mainAddTodo">
                            <ul class="mainToDoList">
                               <!--  <li>
                                    <div id="main_result_div">
                                    	<input type="checkbox" class="todoCheck" style="float:left;">
                                        <div id="main_todo_result" class="changeDiv" style="float:left;">ddddd</div>
                                        <button class="delete_btn"> x</button>
                                    </div>
                                </li> -->
                            </ul>
                        </div>
                    </div>
				</div>
				<div class="modal-footer">
                    <button type="button" class="btn btn-default" id="main_todo_all" onclick="allDeleteTodoList();">모두 삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 임직원 조회 이름 클릭시 모달  -->
	<div class="modal fade" id="others_profile" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">정보</h4>
				</div>
				<div class="modal-body" id="other_profile_body" style="text-align: center;">
					<table border=1 id="others_profile_table" class="table">
						<tbody>
						</tbody>
					</table>
					<a href="#" id="otherProfileMsg">
					</a>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기
					</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		//자바스크립트 실시간 시계
		function getTime() {
			const clock = document.getElementById("user_clock");
			const date = document.getElementById("user_date");
			const time = new Date();
			const weekList = [ '일', '월', '화', '수', '목', '금', '토' ];
			const calendar = time.getFullYear() + "년 " + (time.getMonth() + 1) + "월 " 
							+ time.getDate() + "일 " 
							+ weekList[time.getDay()] + "요일";
			let amPm = "AM";
			let hours = addZeros(time.getHours(), 2);
			const minutes = addZeros(time.getMinutes(), 2);
			const seconds = addZeros(time.getSeconds(), 2);

			if (hours >= 12) {
				amPm = "PM"
				hours = addZeros(hours - 12, 2);
			}

			date.innerHTML = calendar;
			clock.innerHTML = amPm + " " + hours + ":" + minutes + ":" + seconds;

			setTimeout(getTime, 1000);
		}

		function addZeros(num, digit) {
			let zero = "";
			num = num.toString();
			if (num.length < digit) {
				for (let i = 0; i < digit - num.length; i++) {
					zero += "0";
				}
			}
			return zero + num;
		}
		getTime();

		
		$(function() {
			mainMessengerList(); //이메일 호출 
			mainApprovalStatusList(); //전자결재 호출 
			selectTodoList(); //투두리스트 호출 
			selectOnTime(); //출근시간 조회
			selectProfile(); //프로필 조회

			//공지사항 상세보기 가기 
			$("#mainNoticeList>tbody").on("click", "tr", function() {
				var boardNo = $(this).children().eq(0).children().val();
				location.href = "detail.no?boardNo=" + boardNo;
			})
			
			//전자결재 상세보기 가기 
			$("#mainApprovalList>tbody").on("click", "tr", function() {
				var docNo = $(this).children().eq(0).children().val();
				var docType = $(this).children().eq(1).children().val();
				location.href = "detail.ap?docNo="+docNo+"&docType="+docType;
			})
			
			//최근 온 쪽지 상세보기 가기
			$("#mainMessengerList>tbody").on("click", "tr", function() {
				var msgNo = $(this).children().eq(0).children().val();
				window.open("recvMessage.mg?msgNo="+msgNo,"메신저","width = 1100 , height = 600");
			})
			
			//최근 온 쪽지 플러스 버튼 누를 시 쪽지 리스트 가기
			$("#msgPlus").on("click", function() {
				window.open("list.mg","메신저","width = 1100 , height = 600");
			})
		});
		
		//메일 최신순으로 조회
		function mainMessengerList() {
			$.ajax({
				url : "mainMessengerList.ma",
				type : "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					var str = ""

					for ( var i in result) {
						str += "<tr>"
								+ "<td><input type = 'hidden' value='"+result[i].messengerNo+"'></td>"
								+ "<td style='width:60%; '>"
								+ result[i].msgTitle + "</td>"
								+ "<td style='width:20%; text-align:right; '>"
								+ result[i].sender + "</td>"
								+ "<td style='width:20%; text-align:right;'>"
								+ result[i].sendDate + "</td>" 
								+ "</tr>"
					}

					$("#mainMessengerList tbody").html(str);
				},
				error : function() {
					console.log("통신 실패 ");
				}
			});
		}

		/* 공지사항 탭  */
		/* 공지사항 최신 순 탭  */
		$(function() {
			$("#notice_new").click(function() {
				var activeTab = $(this).attr("data-tab");
				$("#notice_liked").css("background-color", "rgb(203, 235, 216)"); //모든 탭의 배경색 초기화
				$(this).css("background-color", "#0E6251"); // 클릭한 탭의 배경색 변경
				$.ajax({
					url : "mainNoticeList.ma",
					type : "POST",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						var str = "";

						for ( var i in result) {
							str += "<tr>"
									+ "<td><input type = 'hidden' value='"+result[i].boardNo+"'></td>"
									+ "<td style='width:60%; '>"
									+ result[i].boardTitle
									+ "</td>"
									+ "<td style='width:20%; text-align:right; '>"
									+ result[i].boardWriter
									+ "</td>"
									+ "<td style='width:20%; text-align:right;'>"
									+ result[i].createDate
									+ "</td>" + "</tr>"
						}

						$("#mainNoticeList tbody").html(str);
					},
					error : function() {
						console.log("통신 실패 ");
					}
				});

			})
			$("#notice_new").click();
		});

		/* 공지사항 즐겨찾기한 탭  */
		$(function() {
			$("#notice_liked").click(function() {
				var activeTab = $(this).attr("data-tab");
				$("#notice_new").css("background-color", "rgb(203, 235, 216)"); //모든 탭의 배경색 초기화
				$(this).css("background-color", "#0E6251"); // 클릭한 탭의 배경색 변경
				$.ajax({
					url : "mainNoticeLiked.ma",
					type : "POST",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						var str = "";

						if(result.length == 0){
							str = "즐겨찾기한 공지 사항이 없습니다. ";
						}
						for ( var i in result) {
							str += "<tr>"
									+ "<td><input type = 'hidden' value='"+result[i].boardNo+"'></td>"
									+ "<td style='width:60%; '>"
									+ result[i].boardTitle
									+ "</td>"
									+ "<td style='width:20%; text-align:right; '>"
									+ result[i].boardWriter
									+ "</td>"
									+ "<td style='width:20%; text-align:right;'>"
									+ result[i].createDate
									+ "</td>" + "</tr>"
						}

						$("#mainNoticeList tbody").html(str);
					},
					error : function() {
						console.log("통신 실패 ");
					}
				});
			});
		});

		//임직원 조회
		//팀원 조회 
		$(function() {
			$("#others_team").click(function() {
				var activeTab = $(this).attr("data-tab");
				$("#others_all").css("background-color", "rgb(203, 235, 216)");
				$(this).css({"background-color" : "#0E6251", "color" : "white"});
				$.ajax({
					url : "mainOthersTeamList.ma",
					type : "POST",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						var str = "";
						var rowCount = 0;
						
						for (var i = 0; i < result.length; i++) {
							if (i % 5 == 0) { //5명 넘으면 tr 생기기 
								str += "<tr id='mainTeamTr" + rowCount + "'>";
								rowCount++;
							}

							if(result[i].changeName == null) { //프로필 첨부파일이 null일때 기본 사진인 청록이로 띄우기
								str += "<td>"
										+ "<img style='border-radius: 50px; width: 50px; height: 50px;' src='/final3/resources/image/청록이.jpg'>"
										+ "<p data-target='#others_profile' data-toggle='modal'>"
										+ result[i].userName
										+ " "
										+ result[i].jobName
										+ "<input type = 'hidden' value='"+result[i].deptName+"'>"
										+ "<input type = 'hidden' value='"+result[i].phone+"'>"
										+ "<input type = 'hidden' value='"+result[i].email+"'>"
										+ "<input type = 'hidden' value='"+result[i].empolymentDate+"'>";
										+ "<input type = 'hidden' value='"+result[i].userNo+"'>";
										+ "<input type = 'hidden' value='"+result[i].userId+"'>";
										+"</p></td>";
							}else{
								str += "<td>"
									+ "<img style='border-radius: 50px; width: 50px; height: 50px;' src='/final3/"+result[i].changeName+"'>"
									+ "<p data-target='#others_profile' data-toggle='modal'>"
									+ result[i].userName
									+ " "
									+ result[i].jobName
									+ "<input type = 'hidden' value='"+result[i].deptName+"'>"
									+ "<input type = 'hidden' value='"+result[i].phone+"'>"
									+ "<input type = 'hidden' value='"+result[i].email+"'>"
									+ "<input type = 'hidden' value='"+result[i].empolymentDate+"'>";
									+ "<input type = 'hidden' value='"+result[i].userNo+"'>";
									+ "<input type = 'hidden' value='"+result[i].userId+"'>";
									+"</p></td>";
							}

							if (i % 5 == 4 || i == result.length - 1) {
								str += "</tr>";
							}
						}
						$("#mainOthersList tbody").html(str);

						//프로필 클릭하면 모달 나옴 
						$("p[data-target='#others_profile']").click(function() {
							var index = $(this).closest("td").index(); 
							var userData = result[index];

							var userName = userData.userName;
							var jobName = userData.jobName;
							var deptName = userData.deptName;
							var phone = userData.phone;
							var email = userData.email;
							var empolymentDate = userData.empolymentDate;
							var userId = userData.userId;
							var userNo = userData.userNo;
							var changeName = userData.changeName;

							if(changeName == null) {
								$("#others_profile_table tbody").html("<tr><td colspan='2'>"
																		+ "<img style='border-radius: 100px; width: 200px; height: 200px;' src='/final3/resources/image/청록이.jpg'>"
																		+ "</td></tr>"
																		+ "<tr><td>이름</td><td>"
																		+ userName
																		+ "</td></tr>"
																		+ "<tr><td>직급</td><td>"
																		+ jobName
																		+ "</td></tr>"
																		+ "<tr><td>부서</td><td>"
																		+ deptName
																		+ "</td></tr>"
																		+ "<tr><td>전화번호</td><td id='tbPhone'>"
																		+ phone
																		+ "</td></tr>"
																		+ "<tr><td>이메일</td><td id='tbEmail'>"
																		+ email
																		+ "</td></tr>"
																		+ "<tr><td>입사일 </td><td>"
																		+ empolymentDate
																		+ "</td></tr>");

								$("#otherProfileMsg").html("<button class='btn btn-success' style='margin-top: 20px' data-value1='"+userId+"' data-value2='"+userName+"' data-value3='"+userNo+"'>쪽지 쓰기 </button>");
							}else {
								$("#others_profile_table tbody").html("<tr><td colspan='2'>"
																		+ "<img style='border-radius: 100px; width: 200px; height: 200px;' src='/final3/"+changeName+"'>"
																		+ "</td></tr>"
																		+ "<tr><td>이름</td><td>"
																		+ userName
																		+ "</td></tr>"
																		+ "<tr><td>직급</td><td>"
																		+ jobName
																		+ "</td></tr>"
																		+ "<tr><td>부서</td><td>"
																		+ deptName
																		+ "</td></tr>"
																		+ "<tr><td>전화번호</td><td id='tbPhone'>"
																		+ phone
																		+ "</td></tr>"
																		+ "<tr><td>이메일</td><td id='tbEmail'>"
																		+ email
																		+ "</td></tr>"
																		+ "<tr><td>입사일 </td><td>"
																		+ empolymentDate
																		+ "</td></tr>");
								
								$("#otherProfileMsg").html("<button class='btn btn-success' style='margin-top: 20px' data-value1='"+userId+"' data-value2='"+userName+"' data-value3='"+userNo+"'>쪽지 쓰기 </button>");
							}
						
							$("#otherProfileMsg button").click(function() { //모달 프로필에서의 쪽지쓰기 버튼 클릭 시
								var userId = $(this).data("value1");
								var userName = $(this).data("value2"); 
								var userNo = $(this).data("value3");
								
								var url = "insertMsg.ma?userId=" + userId +"&userName="+ userName +"&userNo="+ userNo;
								window.open(url,"메신저","width = 1100 , height = 600");
							});
						})
					},
					error : function() {
						console.log("통신 실패 ");
					}
				});
			});

			$("#others_team").click();
		});

		//전직원 조회 
		$(function() {
			$("#others_all").click(function() {
				var activeTab = $(this).attr("data-tab");
				$("#others_team").css("background-color", "rgb(203, 235, 216)");
				$(this).css({"background-color" : "#0E6251", "color" : "white"});
				$.ajax({
					url : "mainOthersAllList.ma",
					type : "POST",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						var str = "";
						var rowCount = 0;

						for (var i = 0; i < result.length; i++) {
							if (i % 5 == 0) {
								str += "<tr id='mainTeamTr" + rowCount + "'>";
								rowCount++;
							}
							
							if(result[i].changeName == null) {
								str += "<td>"
									+ "<img style='border-radius: 50px; width: 38px; height: 38px;' src='/final3/resources/image/청록이.jpg'>"
									+ "<p data-target='#others_profile' data-toggle='modal'>["
									+ result[i].deptName
									+ "]<br>"
									+ result[i].userName
									+ " "
									+ result[i].jobName
									+ "<input type = 'hidden' value='"+result[i].phone+"'>"
									+ "<input type = 'hidden' value='"+result[i].email+"'>"
									+ "<input type = 'hidden' value='"+result[i].empolymentDate+"'>"
									+ "<input type = 'hidden' value='"+result[i].userNo+"'>";
									+ "<input type = 'hidden' value='"+result[i].userId+"'>";
									+ "</p></td>";
							}else {
								str += "<td>"
									+ "<img style='border-radius: 50px; width: 38px; height: 38px;' src='/final3/"+result[i].changeName+"'>"
									+ "<p data-target='#others_profile' data-toggle='modal'>["
									+ result[i].deptName
									+ "]<br>"
									+ result[i].userName
									+ " "
									+ result[i].jobName
									+ "<input type = 'hidden' value='"+result[i].phone+"'>"
									+ "<input type = 'hidden' value='"+result[i].email+"'>"
									+ "<input type = 'hidden' value='"+result[i].empolymentDate+"'>"
									+ "<input type = 'hidden' value='"+result[i].userNo+"'>";
									+ "<input type = 'hidden' value='"+result[i].userId+"'>";
									+ "</p></td>";
							}

							if (i % 5 == 4 || i == result.length - 1) {
								str += "</tr>";
							}
						}
						$("#mainOthersList tbody").html(str);

						$("p[data-target='#others_profile']").click(function() {
							//console.log($(this).closest("td").index());
							var index = $(this).closest("td").index();
							var userData = result[index];

							var userName = userData.userName;
							var jobName = userData.jobName;
							var deptName = userData.deptName;
							var phone = userData.phone;
							var email = userData.email;
							var empolymentDate = userData.empolymentDate;
							var userId = userData.userId;
							var userNo = userData.userNo;
							var changeName = userData.changeName;

							if(changeName == null) {
								$("#others_profile_table tbody").html("<tr><td colspan='2'>"
																		+ "<img style='border-radius: 100px; width: 200px; height: 200px;' src='/final3/resources/image/청록이.jpg'>"
																		+ "</td></tr>"
																		+ "<tr><td>이름</td><td>"
																		+ userName
																		+ "</td></tr>"
																		+ "<tr><td>직급</td><td>"
																		+ jobName
																		+ "</td></tr>"
																		+ "<tr><td>부서</td><td>"
																		+ deptName
																		+ "</td></tr>"
																		+ "<tr><td>전화번호</td><td>"
																		+ phone
																		+ "</td></tr>"
																		+ "<tr><td>이메일</td><td>"
																		+ email
																		+ "</td></tr>"
																		+ "<tr><td>입사일 </td><td>"
																		+ empolymentDate
																		+ "</td></tr>");
								
								$("#otherProfileMsg").html("<button class='btn btn-success' style='margin-top: 20px' data-value1='"+userId+"' data-value2='"+userName+"' data-value3='"+userNo+"'>쪽지 쓰기 </button>");
							}else{
								$("#others_profile_table tbody").html("<tr><td colspan='2'>"
																		+ "<img style='border-radius: 100px; width: 200px; height: 200px;' src='/final3/"+changeName+"'>"
																		+ "</td></tr>"
																		+ "<tr><td>이름</td><td>"
																		+ userName
																		+ "</td></tr>"
																		+ "<tr><td>직급</td><td>"
																		+ jobName
																		+ "</td></tr>"
																		+ "<tr><td>부서</td><td>"
																		+ deptName
																		+ "</td></tr>"
																		+ "<tr><td>전화번호</td><td>"
																		+ phone
																		+ "</td></tr>"
																		+ "<tr><td>이메일</td><td>"
																		+ email
																		+ "</td></tr>"
																		+ "<tr><td>입사일 </td><td>"
																		+ empolymentDate
																		+ "</td></tr>");

								$("#otherProfileMsg").html("<button class='btn btn-success' style='margin-top: 20px' data-value1='"+userId+"' data-value2='"+userName+"' data-value3='"+userNo+"'>쪽지 쓰기 </button>");
							}
							
							$("#otherProfileMsg button").click(function() {
								var userId = $(this).data("value1");
								var userName = $(this).data("value2"); 
								var userNo = $(this).data("value3");
								
								var url = "insertMsg.ma?userId=" + userId +"&userName="+ userName +"&userNo="+ userNo;
								window.open(url,"메신저","width = 1100 , height = 600");
							});
						})

					},
					error : function() {
						console.log("통신 실패 ");
					}
				});
			});

		});

		
		function onchangeDay(yy, mm, dd, ss) {
			$("#mainDay").html(yy + "년" + mm + "월" + dd + "일(" + ss + "요일)");
		}

		//풀캘린더 API 시작 
		//$(function() { }) <- 이렇게 해도된다.
		$(document).ready(function() {
			
			//오늘날짜 가져오는 함수 
			function getToday() {
				var today = moment(); // 현재 날짜와 시간
				var selectedYear = today.year();
				var selectedMonth = today.month() + 1;
				var selectedDate = today.date();

				if (selectedMonth < 10) { //달 앞에 0 붙이기 
					selectedMonth = '0' + selectedMonth;
				}
				if (selectedDate < 10) { //일 앞에 0 붙이기 
					selectedDate = '0' + selectedDate;
				}

				return {
					year : selectedYear,
					month : selectedMonth,
					date : selectedDate
				};
			}

			// 오늘 날짜로 초기화
			var selectedDate = getToday();
			updateSelectedDate(selectedDate);

			//풀캘린더
			$('#calendar').fullCalendar({
				height : 500,
				//contentHeight: 400,
				expandRows : true, //화면에 맞게 높이 재설정 
				local : "ko", //달력의 언어설정 = 한국어 
				timezone : "local", //시간대 설정 = 로컬 
				nextDayThreshold : "09:00:00", //다음 날로 간주되는 시간 = 09:00:00 
				selectable : true, //사용자가 날짜를 선택할 수 있도록 함 
				eventLimit : true, //이벤트 제한 활성화 
				fixedWeekCount : false, //달력 한줄 없애기 
				editable : false, //달력의 이벤트를 편집할수 없도록 하기 
 				displayEventTime : false, //이벤트 시간을 표시 하지 않기 
				weekNumberCalculation : "ISO",
				select : function(start, end, jsEvent, view, resource) {
					var selectedYear = start.year();
					var selectedMonth = start.month() + 1;
					var selectedDate = start.date();

					//month와 date 앞에 0을 붙이게 하는 조건 
					if (selectedMonth < 10) {
						selectedMonth = '0'+ selectedMonth;
					}
					if (selectedDate < 10) {
						selectedDate = '0'+ selectedDate;
					}
					
					var selectedDateObj = {
		                year: selectedYear,
		                month: selectedMonth,
		                date: selectedDate
			        };

					//선택한 날짜 업데이트 하기 위한 함수 호출 
					updateSelectedDate(selectedDateObj);
					
					//선택한 날짜에 해당하는 일정 불러오는 함수 호출 
					mainDailyEvents(selectedYear, selectedMonth, selectedDate);
				},
				events : function(start, end, timezone, callback) {
					$.ajax({
						url : "mainCalendar.ma",
						type : "POST",
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success : function(list) {
							var events = [];
							//console.log(list);
							$.each(list,function(index, schedule) {
								//list.forEach(function(schedule) { <- 이렇게 해도됨 

								var event = {
									id : schedule.scheduleNo,
									deptCode : schedule.deptCode,
									title : schedule.scheduleTitle,
									content : schedule.scheduleContent,
									start : schedule.startDate,
									end : moment(schedule.endDate).add(1, 'day'),
									backgroundColor : "rgb(203, 235, 216)",
									color : "#FFFFFF",
									textColor : "#000000"
								}

								events.push(event);
								//console.log(events);
							})
							//$('#calendar').fullCalendar('render');
							callback(events);
						},
						error : function() {
							console.log('통신 오류 ');
						}
					});
				}
			});

			//선택한 날짜 업데이트 하기 위한 함수
			function updateSelectedDate(dateObj) {
				selectedDate = dateObj;
				$('#mainDay').html(dateObj.year + "년 " + dateObj.month + "월 " + dateObj.date + "일");
			}

			mainDailyEvents(selectedDate.year, selectedDate.month, selectedDate.date);
			
			function mainDailyEvents(year, month, date) {
				$.ajax({
					url : "mainDailyEvents.ma",
					type : "POST",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					data : {
						year : year,
						month : month,
						date : date
					},
					success : function(events) {
						//console.log(events);
						//console.log(events.length);
						var str = "";

						if (events.length == 0) { //비어있을
							var str = "오늘 일정이 없습니다.";
						}

						for ( var i in events) {
							str += "<ul><li>"
									+ events[i].scheduleTitle
									+ "</li></ul>";
						}

						$("#mainDailyForm td").html(str);
					},
					error : function() {
						console.log("통신오류 ");
					}

				});
			}
		});
			
		//전자결재 상태
		function mainApprovalStatusList() {
 			if ("${loginUser.auth}" == "ROLE_ADMIN") {
				$.ajax({
					url : "mainApprovalStatus.ma",
					type : "POST",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result){
						var str = "";
						console.log
						for(var i in result) {
							if(result[i].lastSignature.includes("대기")){
								str += "<tr>"
									+ "<td><input type = 'hidden' value='"+result[i].DocNo+"'></td>"
									+ "<td><input type = 'hidden' value='"+result[i].docName+"'></td>"
									+"<td style='width:60%;'>"+result[i].docTitle+"</td>"
									+"<td style='width:20%; text-align:right;'>"+result[i].createDate+"<td>"
									+"<td style='width:20%; text-align:right; color:gold; font-weight:bold;'>"+result[i].lastSignature+"</td>"
									+"</tr>";
							}else if (result[i].lastSignature.includes("반려")) {
								str += "<tr>"
									+ "<td><input type = 'hidden' value='"+result[i].DocNo+"'></td>"
									+ "<td><input type = 'hidden' value='"+result[i].docName+"'></td>"
									+"<td style='width:60%;'>"+result[i].docTitle+"</td>"
									+"<td style='width:20%; text-align:right;'>"+result[i].createDate+"<td>"
									+"<td style='width:20%; text-align:right; color:red; font-weight:bold;'>"+result[i].lastSignature+"</td>"
									+"</tr>";
							}else if (result[i].lastSignature.includes("승인")) {
								str += "<tr>"
									+ "<td><input type = 'hidden' value='"+result[i].DocNo+"'></td>"
									+ "<td><input type = 'hidden' value='"+result[i].docName+"'></td>"
									+"<td style='width:60%;'>"+result[i].docTitle+"</td>"
									+"<td style='width:20%; text-align:right;'>"+result[i].createDate+"<td>"
									+"<td style='width:20%; text-align:right; color:lightgreen; font-weight:bold;'>"+result[i].lastSignature+"</td>"
									+"</tr>";
							}
						}
						
						$("#mainApprovalList tbody").html(str);
					},
					error : function() {
						console.log("전자결재 조회 통신오류 ");
					}
				});
 			}
		}
		
		//투두리스트 등록 
        function mainAddTodo() {
        	$.ajax({
        		url : "mainInsertTodo.ma",
        		data : {
        			todoContent : $("#main_todo_value").val(),
        		},
        		type : "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
        		success: function(result) {
        			selectTodoList(); //리스트 갱신
        			$("#main_todo_value").val(""); //비워주기
        			$("#main_todo_value").focus();
        		},
        		error: function() {
        			console.log("투두리스트 입력 통신 오류 ");
        		}
        	});
        }
		
		//투두리스트 조회 및 체크박스 클릭 이벤트 
		function selectTodoList() {
			$.ajax({
				url: "selectTodoList.ma",
				data: {
					userNo : "${loginUser.userNo}"
				},
				type : "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(result) {
					var str = "";
					for(var i in result) {
						str += "<li>"
							+ "<div id='main_result_div'>"
							+ "<input type='hidden' id='mainTodoNo' value='" + result[i].todoNo + "'>"
							+ "<input type='hidden' id='mainUserNo' value='" + result[i].userNo + "'>"
							+ "<input type='hidden' id='mainTodoStatus' value='" + result[i].status + "'>"
							+ "<input type='checkbox' id='todoLabel"+i+"' class='todoCheck' style='float:left;' value='"+result[i].todoContent + "'>"
							+ "<label id='todoLabelId' for='todoLabel"+i+"'>" + result[i].todoContent + "</label>"
							+ "<button class='delete_btn'> x</button>"
							+ "</div>"
							+ "</li>";
					}
					$("#mainAddTodo ul").html(str);
					
					//조회할 때 디비에 클릭된 것 체크되어있게 하기 
					$("input[type = checkbox]").each(function(){
						var status = $(this).parent().find('#mainTodoStatus').val();
						var label = $(this).next("label")
						
						if(status == "C") {
							$(this).attr("checked", true);
							label.css("color", "lightgray");
		                    label.css("textDecoration","line-through");
						}
					});
					
					//체크시 디비 바뀌고 css 효과 주는 것 
					$("input[type = checkbox]").click(function() {
						var todoNo = $(this).parent().find('#mainTodoNo').val();
						var status = $(this).parent().find('#mainTodoStatus').val();
						var content = $(this).val();
						
						updateTodoList(todoNo, status, content, $(this).is(":checked"));
					});
					
					$('.delete_btn').click(function() {
						//console.log("클릭이 되니?");
						var todoNo = $(this).parent().find('#mainTodoNo').val();
						
						deleteTodoList(todoNo);
					})
					
				},
				error: function() {
					console.log("투두 조회 오류 ");
				}
			});
		}
		
		//투두리스트 수정 
		function updateTodoList(todoNo, status, content, isChecked) {
			var label = $("input[type=checkbox][value='" + content + "']").next("label");
			//console.log(label);
			if (isChecked) {
		        label.css("color", "lightgray");
		        label.css("textDecoration", "line-through");
		        status = "N";
		        $.ajax({
	 				url: "updateTodoList.ma",
	 				data: {
	 					todoNo : todoNo,
	 					status : status
	 				},
	 				type: "POST",
	 			    beforeSend: function(xhr) {
	 			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	 			    },
	 			    success: function(result) {
	 			    },
	 			    error: function() {
	 					console.log("투두 수정 오류 ");
	 				}
	 			});
		    } else {
		        label.css("color", "black");
		        label.css("textDecoration", "none");
		        status = "C";
				$.ajax({
	 				url: "updateTodoList.ma",
	 				data: {
	 					todoNo : todoNo,
	 					status : status
	 				},
	 				type: "POST",
	 			    beforeSend: function(xhr) {
	 			      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	 			    },
	 			    success: function(result) {
	 			    },
	 			    error: function() {
	 					console.log("투두 수정 오류 ");
	 				}
	 			});
		    }
			
		}
		
		//투두리스트 한개만 삭제 
		function deleteTodoList(todoNo) {
			$.ajax({
				url : "deleteTodoList.ma",
				data : {
					todoNo : todoNo
				},
				type : "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					if(result == "success") {
						selectTodoList();
					}
				},
				error : function() {
					console.log("투두 삭제 오류 ");
				}
			})
		}
		
		//투두리스트 전체 삭제 
		function allDeleteTodoList() {
			var ans = confirm("리스트를 모두 삭제하시겠습니까?");
	        if(!ans) return false;
			
			$.ajax({
				url : "allDeleteTodoList.ma",
				data : {
					userNo : $("#mainUserNo").val()
				},
				type : "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					if(result == "success") {
						alert("모두 삭제했습니다.");
						selectTodoList();
					}
				},
				error : function() {
					console.log("투두 삭제 오류 ");
				}
			})
		}
		
		
		//출근 시간 등록
		function insertOnTime() {
			
		    document.getElementById("onTimeBtn").disabled = true;
			document.getElementById("offTimeBtn").disabled = false;

			$.ajax({
				url: "insertOnTime.ma",
				
				type : "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					//console.log(result);
						if(result == "countFail") {
							alert("이미 출근했음 ")
							
						}else if(result == "success"){
							alert("출근 시간이 등록되었습니다.");
							selectOnTime(); //출근 시간 조회
						}
				},
				error : function() {
					console.log("출근 시간 등록 오류");
				}
			});
		}
		
		//퇴근 시간 등록
		function insertOffTime() {
			document.getElementById("onTimeBtn").disabled = false; //출근 버튼 활성화 
			document.getElementById("offTimeBtn").disabled = true; //퇴근 버튼 비활성화
			
			$.ajax({
				url: "insertOffTime.ma",
				type : "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					if(result == "success") {
						alert("퇴근 시간이 등록되었습니다.");
						selectOnTime(); //퇴근 시간 조회
					}
				},
				error : function() {
					console.log("퇴근 시간 등록 오류");
				}
			});
		}
		
		//출근시간 조회
		function selectOnTime() {
			$.ajax({
				url: "mainSelectOnTime.ma",
				type : "POST",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					var str = "";
					
					if(result.length == 0) {
						str += "<div id='begin_time' style='margin-bottom: 4px;'>"
						 	+ "<div id='mainOnTimeDiv'>출근 시간 : </div>"
							+ "<div style='border: 1px solid black; width: 280px;'></div>"
							+ "<div id='end_time' style='margin: 6px 0 12px 0;'>"
							+ "<div id='mainOffTimeDiv'>퇴근 시간 : </div>"
							+ "</div>";
						
					}else {
						if(result[0].offTime == null && result[0].onTime != null){
							str += "<div id='begin_time' style='margin-bottom: 4px;'>"
							 	+ "<div id='mainOnTimeDiv'>출근 시간 : "+result[0].onTime+"</div>"
								+ "<div style='border: 1px solid black; width: 280px;'></div>"
								+ "<div id='end_time' style='margin: 6px 0 12px 0;'>"
								+ "<div id='mainOffTimeDiv'>퇴근 시간 : </div>"
								+ "</div>";
						}else if(result[0].offTime != null && result[0].onTime != null) {
							str += "<div id='begin_time' style='margin-bottom: 4px;'>"
							 	+ "<div id='mainOnTimeDiv'>출근 시간 : "+result[0].onTime+"</div>"
								+ "<div style='border: 1px solid black; width: 280px;'></div>"
								+ "<div id='end_time' style='margin: 6px 0 12px 0;'>"
								+ "<div id='mainOffTimeDiv'>퇴근 시간 : "+result[0].offTime+"</div>"
								+ "</div>";
						}
					
					}
					
					$("#mp_work_output").html(str);
					
				},
				error : function() {
					console.log("출근 시간 조회 오류");
				}
			});	
		}
		

// 		//한번 더 눌렀을 때 업데이트(나중에 하기)
// 		function updateOnTime() {
// 			$.ajax({
// 				url: "mainUpdateOnTime.ma",
// 				type : "POST",
// 				beforeSend : function(xhr) {
// 					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 				},
// 				success : function(result) {
// 					console.log(result);
// 					if(result == "success") {
// 						alert("출근 시간이 업데이트되었습니다.");
// 						selectOnTime(); //퇴근 시간 조회
// 					}
// 				},
// 				error : function() {
// 					console.log("퇴근 시간 조회 오류");
// 				}
// 			})
// 		}

	function selectProfile() {
		$.ajax({
			url: "selectProfile.ma",
			type : "POST",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				//console.log("랄라라라라 : ",result);
				var str = "";
				
				if(result.length == 0) {
					str += "<img src='/final3/resources/image/청록이.jpg' id='member_photo'>"
					
					$("#mainProfileImg").html(str);
				}else {
					str += "<img src='/final3/"+result[0].changeName+"' id='member_photo'>"
					
					$("#mainProfileImg").html(str);
				}
			},
			error : function(){
				console.log("프로필 사진 오류");
			}
			
		})
		
	}
	</script>
</body>
</html>
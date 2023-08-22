<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리_나의근무</title>
<style>
	.content{
        width: 1570px;
        height: 800px;
    }
	
     /*navibar*/
	#att-tap-area{
		width: 80%;
		margin: auto;
	}
	
	#att-tap-area>ul{
		width:100%;
		height : 42px;
		list-style-type : none;
		margin-bottom: 30px;
	}
	
	#nav-tabs{
		padding : 0;
		display: flex;
	}
	
    #att-tap-area>ul li{
    	width :98px;
    	margin-right: 5px;
    	float : left;
    }
    
    #att-tap-area a{
    	width: 100%;
    	height : 100%;
    	display: inline-block;
    	text-align: center;
    	line-height: 40px;
    	background-color: lightgrey;
    	text-decoration: none;
    	color: black;
    }
    
    #att-tap-area>ul li:not(.active):hover{
    	border-top: 1px solid #dee2e6;
		border-left: 1px solid #dee2e6;
		border-right: 1px solid #dee2e6;
		border-top-left-radius:0.25rem;
		border-top-right-radius:0.25rem; 
    }
	 #att-tap-area .active a{
	 	border-botton: none;
	 	background-color: #0E6251;
	 	color: white;
	 }
    
    /* 캘린더 스타일 */
    #calendar{
    	width: 100%;
    	height: 100%;
    	margin-top: 30px;
    	margin-left: 0;
    }
    .fc-toolbar{
    	margin-top: 30px !important;
    	margin-bottom: 40px !important;
    	font-size: 10px !important;
    }
    .fc-right, .fc-today-button{
    	font-size: 13px !important;
    }
	.fc-toolbar h2{
	  	font-size: 20px !important;
	}
	#wrap{
		margin: auto;
		width: 80%;
		height: 100%;
	}
	
    /* 캘린더구역 */
    #calendar-container{
   		margin: auto;
   		width: 60%;
   		height: 90%;
   		display: inline-block;
   		float: left;
    }
    div.fc-content:hover{cursor: pointer;}
    /* 오늘의 근무 구역 */
    #att-today{
    	height: 100%;
    	width: 40%;
    	display: inline-block;
    	float: left;
    	margin-top: 30px;
    }
    #att-panel table{
    	margin: auto;
    	margin-top:10px;
    	height: 80%;
    	width: 95%;
    }
    #att-panel table thead td{
    	border: none!important;
    } 
    #att-panel table td{
    	padding: 5px;
    	vertical-align: middle;
    }
    #att-panel table tbody{
    	font-size: 13px;
    }
    #att-panel{
    	height: 45%;
    	width: 80%;
    	margin: auto;
    }
    .panel-heading{
    	color: #0E6251;
    	font-weight: 600;
    }
    #status-btn:hover{
    	cursor: default;
    }
    .sub-title{
    	font-size: 17px;
    }
   /* 나의근무구역 */
    #record-panel{
    	height: 50%;
    	width: 80%;
    	margin: auto;
    	margin-top: 10px;
    }
    #record-panel table{
    	margin: auto;
    	margin-top:10px;
    	height: 80%;
    	width: 95%;
    }
    #record-panel .title{
    	font-size: 13px;
    }
    #record-panel .date, #record-panel tbody td{
    	border: none!important;
    } 
    #record-panel table td{
    	padding: 5px;
    	vertical-align: middle;
    }
    .progress{margin:auto!important;}
    .progress-bar{
    	line-height: 40px !important;
    }
    #progress-bar{
    	height: 80%;
    }
   /*근무정정신청 폼 스타일*/
    #att-request-form table{
    	width : 100%;
    	height : 100%;
    	margin : auto;
    }
     #att-request-form td,  #att-request-form th{
    	padding: 5px
    }
    #btn-table{
    	margin: auto;
    	text-align: center;
    }
    /* 알림메세지 */
    #alertMsg{
    	font-size: 11px;
    	color: white;
    	position: absolute;
        display: none;
    	right: 12%;
    	top: 55%;
    	padding: 5px 5px;
     }
     
     
     .alertMsg {
	position: relative;
	background: #0E6251;
	border-radius: .4em;
	}

	.alertMsg:after {
		content: '';
		position: absolute;
		bottom: 0;
		left: 50%;
		width: 0;
		height: 0;
		border: 9px solid transparent;
		border-top-color: #0E6251;
		border-bottom: 0;
		border-right: 0;
		margin-left: -4.5px;
		margin-bottom: -9px;
	}
	/*폰트*/
    #calendar .fc-content, .table *{
    	font-family: 'HallymGothic-Regular'
    }
    #att-tap-area *, .panel-heading, .fc-toolbar{
    	font-family: 'KimjungchulGothic-Bold';
    }
    
</style>
</head>
<body id="body-pd">
 <%@ include file="../common/menubar.jsp" %>  
 
 
    <div class="content" >
           <div id="att-tap-area">
                <ul id="nav-tabs"  class="nav-tabs nav-pills">
					<li role="presentation" class="active">
						<a href="userAtt.at">나의근무</a>
					</li>
					<li role="presentation">
					 	<a href="requestList.at">신청확인</a>
					</li>
					<c:if test="${loginUser.auth eq 'ROLE_ADMIN' }">
					<li role="presentation">
					 	<a href="approveRequest.at">신청관리</a>
					</li>
					<li role="presentation">
					 	<a href="manageAtt.at">근태관리</a>
					</li>
					</c:if>
				</ul>
            </div>
            
	        
	        <div id="wrap">
	        	<!-- wrap -->
		        <div id="calendar-container">
					<div id="calendar"></div>
				</div>
				
				
				<div id="att-today">
				
					<div class="panel panel-info" id="att-panel">
						<div class="panel-heading">오늘의 근무</div>
					
						<table class="table">
							<thead>
								<tr style="border-left:2px solid green;height:15%;">
									<td colspan="4" id="formattedDate" class="sub-title"></td>
								</tr>
								<tr style="height:15%;">
									<td width="300px" colspan="2">
									<c:choose>
										<c:when test="${att.leaveType eq '정상근무' }">
											${att.leaveType } (09:00 - 18:00)
										</c:when>
										<c:when test="${att.leaveType eq '오전반차' }">
											${att.leaveType } (13:00 - 18:00)
										</c:when>
										<c:when test="${att.leaveType eq '오후반차' }">
											${att.leaveType } (09:00 - 12:00)
										</c:when>
										<c:otherwise>
											${att.leaveType }
										</c:otherwise>
									</c:choose>
									</td>
									<td align="right" style="width:10px"><button id="status-btn" class="btn btn-sm btn-default">부재중</button></td>
								</tr>
							</thead>
							<tbody>
								<tr style="height:10%;">
									<td>출근</td>
									<td colspan="2" align="right">
										<c:choose>
											<c:when test="${att.onTime eq null}">
												미입력
											</c:when>
											<c:otherwise>
												${att.onTime}
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr style="height:10%;">
									<td>퇴근</td>
									<td colspan="2" align="right">
										<c:choose>
											<c:when test="${att.offTime eq null}">
												미입력
											</c:when>
											<c:otherwise>
												${att.offTime}
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr style="height:10%;">
									<td colspan="2">근무노트</td>
									<td align="right"><button class="btn btn-sm btn-default" onclick="insertTodo()">저장</button></td>
								</tr>
								<tr style="height:40%;">
									<td colspan="3"><textarea rows="4" id="todoContent" class="form-control" style="resize: none;padding: 5px;">${att.todoContent }</textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
				
				
					<div class="panel panel-success" id="record-panel">
						<div class="panel-heading">나의 근무실적</div>
						<div id="alertMsg" class="alertMsg"><div>정산이 이미 종료된 근태는 변경할 수 없습니다.</div></div>
						<table class="table">
							<thead>
								<tr style="border-left:2px solid green;height:18%">
									<td class="sub-title" id="formattedDate2" colspan="2" style="font-size:15px"></td>
									<td id="btn-td" align="right"><button type="button" id="request-btn" class="btn btn-sm btn-default" onclick="chkDate();">근태사유서신청</button></td>
								</tr>
								<tr class="title" style="height:10%;">
									<td class="date" colspan="2">근태</td>
									<td class="date" align="right" id="leaveType">${att.leaveType }</td>
								</tr>
								<tr class="title" style="height:10%;">
									<td colspan="2">출근</td>
									<td align="right" id="startTime">
										<c:choose>
											<c:when test="${att.onTime eq null}">
												미입력
											</c:when>
											<c:otherwise>
												${att.onTime}
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr class="title" style="height:10%;">
									<td colspan="2">퇴근</td>
									<td align="right" id="endTime">
										<c:choose>
											<c:when test="${att.offTime eq null}">
												미입력
											</c:when>
											<c:otherwise>
												${att.offTime}
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td style="height:40px;" class="date" colspan="3"></td>
								</tr>
							</thead>
							<tbody>
								<tr style="border-left:2px solid green;height:17%">
									<td class="date sub-title" colspan="2">주간실적</td>
									<td class="date" align="right" style="font-size:13px"><label id="weekStart"></label> - <label id="weekEnd"></label></td>
								</tr>
								<tr style="height:15%;">
									<td class="date" colspan="3" style="padding-top:15px">
										<div class="progress" id="progress-bar">
										  <div id="work-record-progress" class="progress-bar progress-bar-striped progress-bar-info" style="min-width: 2em;"></div>
										  <div id="extra-work-progress" class="progress-bar progress-bar-striped progress-bar-danger" style="min-width: 2em;"></div>
										</div>
									</td>
								</tr>
								<tr id="progress" style="font-size:13px;height:10%;">
									<td id="work-plan" height="10px"></td>
									<td id="work-record"></td>
									<td id="extra-work"></td>
								</tr>
							</tbody>		
						</table>
					</div>
					
				</div>
				
			</div>
		</div>
		
		<!-- 근태사유 모달 -->
	<div class="modal fade" id="att-request-modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				
				    <div class="modal-header">
				       <button type="button" class="close" data-dismiss="modal">&times;</button>
				       <h4 class="modal-title">근태 정정 신청 사유서</h4>
				    </div>
				<form action="attRequest.at" id="att-request-form">
				    <div class="modal-body">
					      <table>
					    		<tr>
					    			<th>신청인</th>
					    			<td colspan="2"><input type="text" class="form-control" readonly value="${loginUser.userName }"></td>
					    		</tr>
					    		<tr>
					    			<th>날짜 </th>
					    			<td colspan="2"><input type="text" id="work-date" class="form-control" readonly></td>
					    		</tr>
					    		<tr>
					    			<th>기존근무시간</th>
					    			<td><input type="text" id="start-time" class="form-control" readonly></td>
					    			<td><input type="text" id="end-time" class="form-control" readonly></td>
					    		</tr>
					    		<tr>
					    			<th>변경근무시간</th>
					    			<td><input type="text" id="request-start-time" class="form-control" required></td>
					    			<td><input type="text" id="request-end-time" class="form-control" required></td>
					    		</tr>
					    		<tr>
					    			<th>신청사유</th>
					    			<td colspan="2"><textarea rows="4" name="updateContent" id="updateContent" class="form-control" style="resize: none;padding: 5px;" required></textarea></td>
					    		</tr>
					    	</table>
					    	
					    	<input type="hidden" name="refAtno" id="refAtno">
					    	<input type="hidden" name="userNo" value="${loginUser.userNo }">
					    	<input type="hidden" name="updateOnTime" id="updateOnTime">
					    	<input type="hidden" name="updateOffTime" id="updateOffTime">
				    </div>
				    <div class="modal-footer" id="status-modal-footer">
					   	<table id="btn-table">
					   		<tr>
					   			<td>
						   			<button type="button" class="btn btn-default" onclick="submitRequestForm();">신청</button>
								    <button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
					   			</td>
					   		</tr>
					   	</table>
				    </div>
				 </form>
				       
			 </div>
		</div>
	</div>	
	<!-- 모달끝 -->		
			
      <br><br><br><br>
 
  
  <script>
   $(document).ready(function() {
	   
		$("#calendar").fullCalendar({
			height 					  : 800,
			locale 					  : "ko",    
			timezone                  : "local", 
			nextDayThreshold          : "09:00:00",
			displayEventTime          : false,
			firstDay                  : 1, //월요일이 먼저 오게 하려면 1
			weekNumbers               : false,
			weekNumberCalculation     : "ISO",
			selectHelper 			  : true,
	      	selectMirror			  : true,
			weekends                  : true, 
			header                    : {
										center : "prev, title ,next ",
							        	right : "today",
							        	left : ""
			                            },
			defaultView				  : "month",
			views                     : {
										 month : {
								        		titleFormat: "YYYY년 MM월"
								        	}
				                       },
			buttonText				  : {
										today: '오늘',
										},
										
	        eventClick: function(arg){ // 화면에서 일정 선택하면
	        	 /*나의 근무에서 선택일과 출퇴근시간 변경*/
	        	 todaysWork(arg);
		        
				/* 주간실적 progress bar*/
				
				// 선택한 날짜의 주의 첫 번째 날짜인 월요일
				var startDate = arg.start.clone().startOf('week').format('YYYY-MM-DD');
				// 선택한 날짜의 주의 마지막 날짜인 일요일
				var endDate = arg.start.clone().endOf('week').format('YYYY-MM-DD');
				// 주간실적 함수 호출
				weekWorkRecord(startDate, endDate);
				
				/* 월급정산이 끝난 지난달은 실적 정정 신청 불가 */
				var selectedMonth = arg.start.format('MM');
				var currMonth = new Date().getMonth() + 1;
				
				alertDisability(selectedMonth, currMonth); // 신청버튼 클릭 못하게, 버튼 마우스오버시 알림뜨게하는 함수
				
		       },
	           
	        events: function(start, end, timezone, callback) {
	        	
	        	/* 주간실적 progress bar*/
				
	        	// 선택한 날짜의 주의 첫 번째 날짜인 월요일
	        	var curr = moment();
				var startDate = curr.clone().startOf('isoWeek').format('YYYY-MM-DD');
				// 선택한 날짜의 주의 마지막 날짜인 일요일
				var endDate = curr.clone().endOf('isoWeek').format('YYYY-MM-DD');
				// 주간실적 함수 호출
				weekWorkRecord(startDate, endDate);
				
				$("#work-record-progress").text("0%");
				$("#extra-work-progress").text("0%"); // 실적 0으로 초기화
				
				
				$.ajax({ // 휴가계획 가져오기
      			  url : "leaveList.at",
		        	   type : "POST",
		        	   async : false,
		        	   data : {userNo : ${loginUser.userNo}},
		        	   beforeSend : function(xhr){
	                       xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                   },
		        	   success : function(lList) {
		        		   var events = [];
		        		  $.each(lList, function(index, leave) {
		        			
		        			  var event =  {
		        					  title : leave.leaveCode,
		        					  start : leave.startDate,
		        					  end : leave.endDate
		        			  }
		        			  events.push(event);
		        		  }); 
		        		  
			        		   $.ajax({ // 근태기록 가져오기
					        	   url : "attList.at",
					        	   type : "POST",
					        	   async : false,
					        	   data : {userNo : ${loginUser.userNo}},
					        	   beforeSend : function(xhr){
				                       xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				                   },
					        	   success : function(list) {
					        		  $.each(list, function(index, attendance) {
					        			
					        			  var event =  {
					        					  id: attendance.attRecordNo,
					        					  userNo : attendance.userNo,
					        					  title : "실적 : " + attendance.leaveType,
					        					  start : attendance.currDate + "T" + attendance.onTime,
					        					  end : attendance.currDate + "T" + attendance.offTime,
					        					  day : attendance.currDate,
					        					  onTime : attendance.onTime,
					        					  offTime : attendance.offTime,
					        					  leaveType : attendance.leaveType,
					        			  }
					        			  events.push(event);
					        		});
			        	  		 },
			        	  		 error: function(){
			        	  			 console.log("통신오류");
			        	  		 }
			        	   	}); 
				        callback(events);
		        	   },
		        	   error: function() {
		        	   		console.log('통신 오류');
		        	   }
		        	 });
	        },
        	   
	           eventRender: function(event, element) {
		        	 element.css({
		        		 "border": "1px solid #E0E0E0",
		        		 "color": "#616161",
		        		 "margin":"0px"
		        		});
	        	   
	        	   // 근무실적 색상변경
		           if(event.onTime==null && event.offTime==null){ // 출퇴근등록 안하면
		        	   element.css("background-color", "#C3E2DF");
		           }else if(event.onTime!=null && event.offTime==null){ // 출근이나 퇴근 등록을 하지 않으면 색 변경
	        		   element.css("background-color", "#F6A88A");
	        	   }else{ // 출퇴근등록하면
	        		   element.css("background-color", "#F9DD7C");
	        	   }
	        	   // 근무계획 색상변경
	        	   if(event.title == '오전반차' || event.title == '오후반차'){
	        		   element.css("background-color", "#D3AFD5");
	        	   }
	        	}
			});
		});
   
   // 이벤트 클릭시 근무 실적 보여주기
   function todaysWork(arg){
	 // 출퇴근 미입력시 문구출력
	 if(arg.start.format("HH:mm") != "00:00"){ 
      	 $("#startTime").text(arg.start.format("HH:mm"));
      	 $("#start-time").val(arg.start.format("HH:mm"));
      	 $("#request-start-time").val(arg.start.format("HH:mm")); // 근무정정신청폼
  	 }else{
  		 $("#startTime").text("미입력");
  		 $("#start-time").val("미입력");
  		 $("#request-start-time").val("미입력");
  	 }
   
  	 if(arg.end != null){
  		 $("#endTime").text(arg.end.format("HH:mm"));
  		 $("#end-time").val(arg.end.format("HH:mm"));
  		 $("#request-end-time").val(arg.end.format("HH:mm"));
  	 }else{
  		 $("#endTime").text("미입력");
  		 $("#end-time").val("미입력");
  		 $("#request-end-time").val("미입력");
  	 }
  	 
  	 // 휴가근무인 경우 근태타입 출력
  	 if(arg.title == '연차휴가' || arg.title == '병가' || arg.title == '육아휴직'){
  		 $("#formattedDate2").text(arg.start.format("YYYY-MM-DD") + " ~ " + arg.end.format("YYYY-MM-DD"));
  		 $("#startTime").text("휴가");
  		 $("#endTime").text("휴가");
  	 }
  	 if(arg.title == '오전반차' || arg.title == '오후반차'){
  		 $("#formattedDate2").text(arg.start.format("YYYY-MM-DD"));
  		 $("#startTime").text("반차");
  		 $("#endTime").text("반차");
  	 }
   	 
      $("#formattedDate2").text(arg.day);
      $("#work-date").val(arg.day); // 근무정정신청폼 날짜
      
      
      $("#refAtno").val(arg.id); // 근무정정신청폼 근태번호
      $("#leaveType").text(arg.leaveType);
   };
   
   // 오늘날짜 형식 바꾸기
   $(function(){
	    var date = new Date();

		var year = date.getFullYear().toString();
		var month = (date.getMonth() + 1).toString().padStart(2, '0');
		var day = date.getDate().toString().padStart(2, '0');

		var formattedDate = year + '-' + month + '-' + day;

		$("#formattedDate").text(formattedDate);
		$("#formattedDate2").text(formattedDate);
		
		selectTodo(); // 노트 불러오기 함수 호출
   });
   
   function insertTodo(){
	   $.ajax({
			url : "insert.at",
			data : {
				userNo : "${loginUser.userNo}",
				todoContent : $("#todoContent").val(),
			},
			beforeSend : function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
           },
           success : function(result){
   			if(result == "success"){
   			
   				alert("메모 작성 완료");
   			}
	    			selectTodo();
   		},
           error : function(){
           	console.log("통신오류");
           }
		});
   };
   
   function selectTodo(){
	   $.ajax({
			url : "select.at",
			data : {
				userNo : "${loginUser.userNo}",
			},
			beforeSend : function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
           },
           success : function(result){
   			$("#todoContent").val(result);
   		},
           error : function(){
           	console.log("통신오류");
           }
		});  
   };
   
   $(function(){ // 근무 상태  띄우기
		// ontime not null 이고 offtime null이면 근무중
		if("${att.onTime}"!="" && "${att.offTime}"==""){
			$("#status-btn").text("근무중");
			$("#status-btn").addClass("btn-info");
			$("#status-btn").css("background-color","#5BC0DE");
		}
		// ontime not null 이고 offtime not null이면 퇴근
		if("${att.onTime}"!="" && "${att.offTime}"!=""){
			$("#status-btn").text("퇴근");
			$("#status-btn").addClass("btn-danger");
			$("#status-btn").css("background-color","#D9534F");
		}
   });
   
   
   function weekWorkRecord(startDate, endDate){
	   /*주간실적 날짜 바꾸기*/
		$("#weekStart").text(startDate);
		$("#weekEnd").text(endDate);
		
		/* 주간실적 progress bar */
		var workPlan = 0; // 근무 계획 = 정상근무 외근 출장 8시간 + 반차 4시간 
		var workRecord = 0; // 근무 실적 = 출근 - 퇴근
		var extraWork = 0; // 연장 근무 = 실적 - 계획
		
		
		var existingEvents = $('#calendar').fullCalendar('clientEvents'); // 이미 추가된 이벤트들을 가져옴
		
		var currentDate = startDate;
	
		existingEvents.forEach(function(e){
			if(e.day != null && e.day >= startDate && e.day <= endDate){ // 실적이 있으면
				while(currentDate <= endDate){
					var result = getWork(currentDate); // 근무계획, 실적 배열 리턴하는 함수호출
					if(result.length != 0){
						workPlan += result[0];
						workRecord += result[1];
					}
					currentDate = moment(currentDate).add(1, 'day').format('YYYY-MM-DD');
				}
			}
		});
		
		extraWork = workRecord - workPlan;
		if(extraWork < 0){ // 초과근무 음수일 경우 0으로 처리
			extraWork = 0;
		}
		
		
		$("#work-plan").text("계획 : " + workPlan);
		$("#work-record").text("실적 : " + workRecord);
		$("#extra-work").text("초과 : " + extraWork);
		
		var fulltime = 52*60; // 주 52시간제
		// progressbar100% 대비 width값
		var workRecordProgress =  Math.round(((workRecord-extraWork) / fulltime) * 100) + "%";
		var extraWorkProgress =  Math.round((extraWork / fulltime) * 100) + "%";
		// 기본근무시간, 연장근무시간 대비 실적 text값
		var workRecordProgressBar = Math.round((workRecord / workPlan) * 100) + "%";
		var extraWorkProgressBar = Math.round((extraWork / (12 * 60)) * 100) + "%";
		
		if(workPlan <= workRecord){
			workRecordProgressBar = "100%";
		}
		
		$("#work-record-progress").css("width",workRecordProgress);
		$("#work-record-progress").text(workRecordProgressBar);
		$("#extra-work-progress").css("width",extraWorkProgress);
		$("#extra-work-progress").text(extraWorkProgressBar);
   };
	
	function getWork(currentDate){ // attendanceRecord 먼저 조회해오고, 결과가 만약 null(출퇴근등록 안함)이면 휴가계에서 근무계획 불러오기, 배열로 계획과 실적 return		 
		var result = [];
		$.ajax({
			url : "selectAtt.at",
			data : {
				userNo : "${loginUser.userNo}",
				currDate : currentDate
			},
			beforeSend : function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            async: false,
            success : function(r){
            	if(r!=null){
            	 var workPlan = r.workPlan;
                 var workRecord = r.workRecord;

                 result = [workPlan, workRecord]; // 배열로 결과값 묶기
            	}
    		},
            error : function(){
            	console.log("통신오류");
            }
		});
		return result;
	};
	// 캘린더날짜 선택해야 근태신청 가능(모달열기)
	function chkDate(){
		if($("#work-date").val()){
			$("#att-request-modal").modal("toggle");
		}else{
			alert("캘린더에서 근태를 수정하실 날짜를 먼저 입력하세요.");
		}
	}
	// 근태신청사유서 폼 submit함수 (날짜와 시간 더해서 시간형식 만든 후 hidden값 폼태그로 넘겨주기)
	function submitRequestForm(){
		
		// 입력한 값이 정규식에 맞는지 검사하는 함수 호출
		if(checkTimeFormat($("#request-start-time").val()) && checkTimeFormat($("#request-end-time").val())){
			
			var workDate = $("#work-date").val();
			var startDate = workDate + " " + $("#request-start-time").val();
			var endDate = workDate + " " + $("#request-end-time").val();
			
			$("#updateOnTime").val(startDate);
			$("#updateOffTime").val(endDate);
			
			if($("#updateOnTime").val() && $("#updateOffTime").val() && $("#updateContent").val()){
				if(confirm("위의 내용으로 신청 진행하시겠습니까?")){
					$("#att-request-form").submit();
				}
			}else{
				alert("모든 입력란을 작성하세요.");
			}
			
		}else{
			alert("형식에 맞게 작성해주세요 (00:00)");
		}
	};
	
	function checkTimeFormat(inputValue) {
		  // 시간 형식인지 검사하는 정규식
		  var timeRegex = /^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/;
		  // 입력된 값과 정규식을 비교하여 시간 형식인지 확인
		  if (timeRegex.test(inputValue)) {
		    return true;
		  } else {
		    return false;
		  }
	};
	
	// 이미 정산이 끝난 지난 달의 근무는 정정 신청 불가능
	function alertDisability(selectedMonth, currMonth){
		var btn = document.getElementById("request-btn");
		
		if(selectedMonth < currMonth){ 
			btn.addEventListener("mouseenter",function(){
				document.getElementById("alertMsg").style.display="block";
				btn.setAttribute("disabled", true);
			});
			document.getElementById("btn-td").addEventListener("mouseout",function(){
				document.getElementById("alertMsg").style.display="none";
				btn.removeAttribute("disabled");
			});
			
		}else{
			btn.addEventListener("mouseenter",function(){
				document.getElementById("alertMsg").style.display="none";
				btn.removeAttribute("disabled");
			});
		}
	};

			
  </script>
   


</body>
</html>
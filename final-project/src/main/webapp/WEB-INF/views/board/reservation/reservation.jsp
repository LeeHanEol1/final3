<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약</title>
     
  <style>
	.content{
        width: 1570px;
    }
	
     /*navibar*/
	#board-tap-area{
		width: 80%;
		margin: auto;
	}
	
	#board-tap-area>ul{
		width:100%;
		height : 42px;
		list-style-type : none;
		margin-bottom: 30px;
	}
	
	#nav-tabs{
		padding : 0;
		display: flex;
	}
	
    #board-tap-area>ul li{
    	width :98px;
    	margin-right: 5px;
    	float : left;
    }
    
    #board-tap-area a{
    	width: 100%;
    	height : 100%;
    	display: inline-block;
    	text-align: center;
    	line-height: 40px;
    	background-color: lightgrey;
    	text-decoration: none;
    	color: black;
    }
    
    #board-tap-area>ul li:not(.active):hover{
    	border-top: 1px solid #dee2e6;
		border-left: 1px solid #dee2e6;
		border-right: 1px solid #dee2e6;
		border-top-left-radius:0.25rem;
		border-top-right-radius:0.25rem; 
    }
	 #board-tap-area .active a{
	 	border-botton: none;
	 	background-color: #0E6251;
	 	color: white;
	 }
    
    /* 캘린더 스타일 */
    #calendar{
    	width: 100%;
    	height: 100%;
    	margin-top: 50px;
    	margin-left: 0;
    }
    .fc-agendaWeek-view .fc-time-grid .fc-slats td {
	  	height: 60px; 
	}
    .fc-toolbar{
    	margin-top: 60px !important;
    	margin-bottom: 40px !important;
    	font-size: 10px !important;
    }
    .fc-right, .fc-today-button{
    	font-size: 13px !important;
    }
	.fc-toolbar h2{
	  	font-size: 20px !important;
	}
	
    /* 캘린더구역 */
    #calendar-container{
   		margin: auto;
   		width: 70%;
    	height: 50%;
    }
    /* 예약폼스타일 */
    #reserve-table{
    	width : 100%;
    	height : 100%;
    	margin : auto;
    }
    #reserve-table td, #reserve-table th{
    	padding: 5px
    }
    /* 모달창 */
    .btn-table{
    	margin: auto;
    	text-align: center;
    }
    #reserve-status-table{
    	width : 100%;
    	height : 100%;
    	margin : auto;
    }
    #reserve-status-table td, #reserve-status-table th{
    	padding: 5px
    }
   	#board-tap-area *, .fc-header-toolbar, th, .modal-title, .modal-footer button{
    	font-family: 'KimjungchulGothic-Bold';
    }
    .fc-bg *, td{
    	font-family: 'HallymGothic-Regular'
    }
    
    
    </style>
</head>
<body id="body-pd">
  <%@ include file="../../common/menubar.jsp" %>  
 
 
    <div class="content" >
           <div id="board-tap-area">
                <ul id="nav-tabs"  class="nav-tabs nav-pills">
					<li role="presentation">
						<a href="list.no">공지사항</a>
					</li>
					<li role="presentation">
					 	<a href="list.dc">자료실</a>
					</li>
					<li role="presentation" class="active">
						<a href="list.re">대여</a>
					</li>
					<li role="presentation">
						<a href="list.fr">커뮤니티</a>
					</li>
				</ul>
            </div>
	        <!-- 캘린더구역 -->
	        <div id="calendar-container">
				<div id="calendar"></div>
			</div>
			<!-- 캘린더구역 끝 -->
      </div>
      <br><br><br><br>
    
   
			
  <!-- 회의실 예약 현황 모달시작 -->
   	<div class="modal fade" id="meetingRoom-reservation-status" role="dialog">
		<div class="modal-dialog">
			    
			<!-- Modal content-->
			<div class="modal-content">
				
				    <div class="modal-header">
				       <button type="button" class="close" data-dismiss="modal">&times;</button>
				       <h4 class="modal-title">회의실 예약 현황</h4>
				    </div>
				    <div class="modal-body">
				      <table id=reserve-status-table>
				    		<tr>
				    			<th>신청인</th>
				    			<td colspan="2"><input type="text" id="status-userName" class="form-control" readonly></td>
				    		</tr>
				    		<tr>
				    			<th>날짜 </th>
				    			<td colspan="2"><input type="date" id="status-revDate" class="form-control" required></td>
				    		</tr>
				    		<tr>
				    			<th>이용시간</th>
				    			<td><select id="status-startTime" class="status-selectbox form-control" required>
							    		<option value="09:00">09:00</option>
							    		<option value="10:00">10:00</option>
							    		<option value="11:00">11:00</option>
							    		<option value="12:00">12:00</option>
							    		<option value="13:00">13:00</option>
							    		<option value="14:00">14:00</option>
							    		<option value="15:00">15:00</option>
							    		<option value="16:00">16:00</option>
							    		<option value="17:00">17:00</option>
							    		<option value="18:00">18:00</option>
						    		</select>
				    			</td>
				    			<td><select id="status-endTime" class="status-selectbox form-control" required>
							    		<option value="10:00">10:00</option>
							    		<option value="11:00">11:00</option>
							    		<option value="12:00">12:00</option>
							    		<option value="13:00">13:00</option>
							    		<option value="14:00">14:00</option>
							    		<option value="15:00">15:00</option>
							    		<option value="16:00">16:00</option>
							    		<option value="17:00">17:00</option>
							    		<option value="18:00">18:00</option>
							    		<option value="19:00">19:00</option>
						    		</select>
				    			</td>
				    		</tr>
				    		<tr>
				    			<th>회의실</th>
				    			<td colspan="2"><select name="roomCode" id="status-roomCode" class="form-control">
							    		<option value="A">A</option>
							    		<option value="B">B</option>
							    		<option value="C">C</option>
							    		<option value="D">D</option>
							    		<option value="E">E</option>
						    		</select>
						    	</td>
				    		</tr>
				    	</table>
				    	<input type="text" id="status-userNo" style="display:none;">
				    	<input type="text" id="status-reservationNo" style="display:none;">
				    </div>
				    <div class="modal-footer" id="status-modal-footer">
					   	<table class="btn-table">
					   		<tr>
					   			<td>
						   			<button type="button" class="btn btn-default" onclick="updateReservation()">예약수정</button>
								    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteReservation()">예약삭제</button>
								    <p id="alertDisable"></p>
					   			</td>
					   		</tr>
					   	</table> 
				    </div>
			  </div>
		</div>
	</div>
  <!-- 회의실 예약 현황 모달 끝 -->
  
 
  
  <!-- 회의실 예약하기 모달시작 -->
   	<div class="modal fade" id="meetingRoom-reservation" role="dialog">
		<div class="modal-dialog">
			    
			<!-- Modal content-->
			<div class="modal-content">
					
				    <div class="modal-header">
				       <button type="button" class="close" data-dismiss="modal">&times;</button>
				       <h4 class="modal-title">회의실 예약하기</h4>
				    </div>
				    <div class="modal-body">
				    	<table id=reserve-table>
				    		<tr>
				    			<th>신청인</th>
				    			<td colspan="2"><input type="text" class="form-control" value="${loginUser.userName }" readonly></td>
				    		</tr>
				    		<tr>
				    			<th>날짜 </th><!-- 조건넣어서 날짜값 불러오기 -->
				    			<td colspan="2"><input type="text" id="revDate" class="form-control" readonly></td>
				    		</tr>
				    		<tr>
				    			<th>이용시간</th>
				    			<td><select id="startTime" class="selectbox form-control" disabled>
							    		<option value="09:00">09:00</option>
							    		<option value="10:00">10:00</option>
							    		<option value="11:00">11:00</option>
							    		<option value="12:00">12:00</option>
							    		<option value="13:00">13:00</option>
							    		<option value="14:00">14:00</option>
							    		<option value="15:00">15:00</option>
							    		<option value="16:00">16:00</option>
							    		<option value="17:00">17:00</option>
							    		<option value="18:00">18:00</option>
						    		</select>
				    			</td>
				    			<td><select id="endTime" class="selectbox form-control" disabled>
							    		<option value="10:00">10:00</option>
							    		<option value="11:00">11:00</option>
							    		<option value="12:00">12:00</option>
							    		<option value="13:00">13:00</option>
							    		<option value="14:00">14:00</option>
							    		<option value="15:00">15:00</option>
							    		<option value="16:00">16:00</option>
							    		<option value="17:00">17:00</option>
							    		<option value="18:00">18:00</option>
							    		<option value="19:00">19:00</option>
						    		</select>
				    			</td>
				    		</tr>
				    		<tr>
				    			<th>회의실</th>
				    			<td colspan="2"><select id="roomCode" class="form-control">
							    		<option value="A">A</option>
							    		<option value="B">B</option>
							    		<option value="C">C</option>
							    		<option value="D">D</option>
							    		<option value="E">E</option>
						    		</select>
						    	</td>
				    		</tr>
				    	</table>
				    
				    </div>
				    <div class="modal-footer">
				    	<input type="text" id="startTime" style="display:none">
				    	<input type="text" id="endTime" style="display:none">
				    	<table class="btn-table">
				    		<tr>
				    			<td>
							      <button type="button" class="btn btn-default" onclick="confirmReservation()">예약</button>
							      <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					      		</td>
					      	</tr>
					     </table>
				    </div>
			  </div>
		</div>
	</div>
  <!-- 회의실 예약하기 모달 끝 -->
  
  <script>
   $(document).ready(function() {
	   
		$("#calendar").fullCalendar({
			height 					  : 800,
			locale 					  : "ko",    
			timezone                  : "local", 
			nextDayThreshold          : "09:00:00",
			allDaySlot                : false,
			firstDay                  : 1, //월요일이 먼저 오게 하려면 1
			selectable                : true,
			weekNumberCalculation     : "ISO",
			navLinks                  : false,
			timeFormat                : "HH:mm",
			defaultTimedEventDuration : "01:00:00", // 한시간단위
			minTime                   : "09:00:00",
			maxTime                   : "19:00:00",
			slotLabelFormat           : "HH:mm",
			slotDuration			  : "1:00:00", // 시간 슬롯 단위를 1시간으로 설정
			weekends                  : false, // 주말 안보이게
			nowIndicator              : true,
			selectHelper 			  : true,
			header                    : {
			                              left   : "today",
			                              center : "prev, title, next",
			                              right  : "agendaWeek, listWeek"
			                            },
			defaultView				  : "agendaWeek",
			views                     : {
			                              agendaWeek : {
				  	                          columnFormat : "M/D ddd",
					                          titleFormat  : "MM월 D",
					                          eventLimit   : false
				                          },
				                          listWeek : {
				                          columnFormat : ""
				                          }
				                              },
			buttonText				  : {
										  today: '오늘',
										  week: '주간', 
										  list: '목록'
										},
			select : function(start, end) { // 화면에서 날짜 선택시 예약 모달 열기
				
				openReservationModal(start, end);
			
	           },
	           
	        events: function(start, end, timezone, callback) { // 화면에 이벤트 출력
	        	   
	        	      $.ajax({
	        	        url: "mrrevList.re", // 예약 정보를 가져올 컨트롤러 URL
	        	        beforeSend : function(xhr){
	                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                    },
	        	        success: function(list) {
	        	        	var events = [];

	        	        	list.forEach(function(reservation) {
	        	              var event = {
	        	                id: reservation.reservationNo,
	        	                userNo : reservation.userNo,
	        	                userName: reservation.userName,
	        	                title: reservation.roomCode + "회의실(" + reservation.userName + ")",
	        	                start: reservation.revDate + "T" + reservation.startTime,
	        	                end: reservation.revDate + "T" + reservation.endTime,
	        	                roomCode : reservation.roomCode
	        	              };
	        	              events.push(event);
	        	            });

	        	            callback(events); 
	        	          
	        	        },
	        	        error: function() {
	        	        	console.log("예약 정보를 가져오는 데 실패했습니다.");
	        	        }
	        	      });
	        	    },
	        	 
	          eventClick: function(arg){ // 화면에서 일정 선택하면 예약 현황/수정 모달 열기
	        	  
	        		openUpdateModal(arg);
	          
		        	},
	        	    
	          eventRender: function(event, element) {
	        	   // 회의실 코드에 따라 예약 창의 색상 설정
		        	 element.css({
		        		 "border": "1px solid #E0E0E0",
		        		 "color": "#616161",
		        		 "margin-right":"15px"
		        		});
	        	   
	        	      switch (event.roomCode) {
	        	        case "A":
	        	          	element.css("background-color", "#8EB695"); break;
	        	        case "B":
	        	          	element.css("background-color", "#FCCCD4"); break;
	        	        case "C":
	        				element.css("background-color", "#FBDEA2"); break;
	        	        case "D":
		        	        element.css("background-color", "#F2E2C6"); break;
	        	        case "E":
		        	        element.css("background-color", "#FB9DA7"); break;
	        	        default:
	        	            element.css("background-color", "gray");
	        	       }
	        	 	}
			});
		});
   
    // 날짜 선택시 회의실 예약하는 모달 열기
    function openReservationModal(start, end){
    	
    	if(checkReservationAvailability(start, end)){ // 예약시간 유효한지 체크하는 함수
			// 시간
            var starttime = start.format("HH:mm");
            var endtime = end.format("HH:mm");
            
			// 날짜 
            var start = start.format("YYYY-MM-DD");
            var end = end.format("YYYY-MM-DD");
            $("#meetingRoom-reservation #startTime").val(starttime);
            $("#meetingRoom-reservation #endTime").val(endtime);
            $("#meetingRoom-reservation #revDate").val(start);
            $("#meetingRoom-reservation").modal("toggle");
            
		}else{
			$("#calendar").fullCalendar("unselect");
		}
    };
    
    // 이벤트 선택시 예약 수정하는 모달 열기
    function openUpdateModal(arg){
    	var reservationNo = arg.id;
		var userNo = arg.userNo;
		var revDate = arg.start.format("YYYY-MM-DD");
		var startTime = arg.start.format("HH:mm");
        var endTime = arg.end.format("HH:mm");
		
		$("#meetingRoom-reservation-status #status-userName").val(arg.userName);
		$("#meetingRoom-reservation-status #status-startTime").val(startTime);
        $("#meetingRoom-reservation-status #status-endTime").val(endTime);
        $("#meetingRoom-reservation-status #status-revDate").val(revDate);
        $("#meetingRoom-reservation-status #status-roomCode").val(arg.roomCode);
        $("#meetingRoom-reservation-status #status-userNo").val(userNo);
        $("#meetingRoom-reservation-status #status-reservationNo").val(reservationNo);
        
		$("#meetingRoom-reservation-status").modal("toggle");
		updateConstraint(); // 예약한 사람만 수정삭제 가능한 함수
		checkUpdateAvailability(arg.start); // 현재시간 이전의 예약은 수정하지 못하게 하는 함수
    };

 	// 예약한 사람만 수정삭제 가능한 함수
 	function updateConstraint(){
 		if(${loginUser.userNo} != $("#status-userNo").val()){
 			$("#status-modal-footer button[type=button]").css("display", "none");
 			$("#status-revDate").attr("disabled", true);
 			$("#status-startTime").attr("disabled", true);
 			$("#status-endTime").attr("disabled", true);
 			$("#status-roomCode").attr("disabled", true);
 		}
 	};
 	
	// 회의실 예약시 confirm메세지와 비동기로 DB에 데이터 넣기
	function confirmReservation(){
		
		if(eventConstraint("insert")){ // 회의실예약이 겹치지 못하게 하는 함수
			if(window.confirm("이대로 예약을 하시겠습니까?")){
				
				$.ajax({
					url : "mrrev.re",
					data : {
						userNo : "${loginUser.userNo}",
						revDate : $("#revDate").val(),
						startTime : $("#startTime").val(),
						endTime : $("#endTime").val(),
						reserveCategory : "M",
						roomCode : $("#roomCode").val()
					},
					beforeSend : function(xhr){
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
		            success : function(result){
		    			if(result == "success"){
		    				alert("예약이 완료되었습니다.");
		    			}
		    			location.reload();
		    		},
		            error : function(){
		            	console.log("통신오류");
		            }
				});
			}
			
		}
	}
	
	// 회의실 예약 수정하기
	function updateReservation(){
		
		if(eventConstraint("update")){ // 회의실예약이 겹치지 못하게 하는 함수
			if($("#status-revDate").val() == "" || $("#status-startTime").val() == null || $("#status-endTime").val() == null){
				window.alert("모든 입력사항을 입력해주세요.");
			}else{
				if(window.confirm("이대로 예약을 수정하시겠습니까?")){
					
					$.ajax({
						url : "updatemrrev.re",
						data : {
							reservationNo : $("#status-reservationNo").val(),
							revDate : $("#status-revDate").val(),
							startTime : $("#status-startTime").val(),
							endTime : $("#status-endTime").val(),
							roomCode : $("#status-roomCode").val()
						},
						beforeSend : function(xhr){
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			            },
			            success : function(result){
			    			if(result == "success"){
			    				alert("예약수정이 완료되었습니다.");
			    			}
			    			location.reload();
			    		},
			            error : function(){
			            	console.log("통신오류");
			            }
					});
				}
			}
		}
	}	
	
	// 회의실 예약 삭제하기
	function deleteReservation(){
		
		if(window.confirm("정말 예약을 삭제하시겠습니끼?")){
			
			$.ajax({
				url : "deletemrrev.re",
				data : {
					reservationNo : $("#status-reservationNo").val()
				},
				beforeSend : function(xhr){
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success : function(result){
	    			if(result == "success"){
	    				alert("예약내역이 삭제되었습니다.");
	    			}
	    			location.reload();
	    		},
	            error : function(){
	            	console.log("통신오류");
	            }
			});
		}
	}
	
	/*--------------------------------예약시간 체크해주는 함수들--------------------------------*/
	
	var currentDate = new Date();
	
	var year = currentDate.getFullYear(); // 년도 추출
	var month = String(currentDate.getMonth() + 1).padStart(2, "0"); // 월 추출 
	var day = String(currentDate.getDate()).padStart(2, "0"); // 일 추출
	var formattedDate = year + "-" + month + "-" + day; // 오늘 날짜 원하는 포맷으로 조합
	
	
	// 예약시간 유효한지 체크하는 함수
    function checkReservationAvailability(start, end) {
    	
		// 현재시간과 예약시간을 비교해주는 함수
        if (start < currentDate) {
            alert("예약이 불가능한 시간입니다.");
            return false;
        }
        
     	// 하루 이상은 예약하지 못하게 하는 함수
     	var startDay = new Date(start).getDate();
     	var endDay = new Date(end).getDate();
     	
     	if(startDay < endDay){
     		alert("하루이상의 예약은 불가능합니다.");
     		return false;
     	}
        return true;
    }
	
	// 현재시간 이전의 예약은 수정하지 못하게 하는 함수 : input박스를 disabled 처리
	function checkUpdateAvailability(time){
		var startTime = new Date(time);
		
		if(startTime <= currentDate){
			$("#meetingRoom-reservation-status input, #meetingRoom-reservation-status select").attr("disabled", true);
			$("#alertDisable").html("이미 지난 시간의 예약은 수정 및 삭제가 불가능합니다.").css("color","red");
			$("#status-modal-footer button[type=button]").css("display", "none");
		}
	} 
	// 모달을 닫을 때 disabled처리 된 모달을 다시 reset
	 $("#meetingRoom-reservation-status").on("hidden.bs.modal", function () {
	 	 $("#meetingRoom-reservation-status input, #meetingRoom-reservation-status select").attr("disabled", false);
		 $("#alertDisable").html(""); // 경고 메시지 초기화
		 $("#status-modal-footer button[type=button]").css("display", "inline-block"); // 버튼 보이기
	}); 
		
	// 예약 시작시간, 종료시간, 현재시간을 비교해주는 함수(예약수정)
	$(".status-selectbox").change(function() { 
        var start = $("#status-startTime").val(); // 시작 시간
        var end = $("#status-endTime").val(); // 종료 시간
        
        if(start > end) {
            alert("종료 시간이 시작 시간보다 이전일 수 없습니다.");
            $(this).val("");
        }
        if(start == end) {
            alert("시작 시간과 종료 시간이 동일합니다. 다른 시간을 선택해주세요.");
            $(this).val("");
        }
       
        if($("#status-revDate").val() == formattedDate && start.substring(0,2) <= new Date().getHours()){
        	alert("현재 시간보다 이전 시간은 예약할 수 없습니다. 다른 시간을 선택해주세요.")
        	$(this).val("");
        }
    });
		
	// 예약 수정시 날짜와 현재날짜 비교하는 함수
	$("#meetingRoom-reservation-status #status-revDate").change(function(){
		var selectedDate = $("#status-revDate").val();
		
		if(selectedDate < formattedDate){
			alert("현재 날짜보다 이전 날짜를 선택할 수 없습니다. 다른 날짜를 선택해주세요.");
			$(this).val("");
		}
		if(selectedDate == formattedDate){ // 오늘날짜면 시간대를 비교
			var start = $("#status-startTime").val(); // 시작 시간
			if(start.substring(0,2) <= new Date().getHours()){
	        	alert("현재 시간보다 이전 시간은 예약할 수 없습니다. 다른 시간을 선택해주세요.")
	        	$(this).val("");
	        }
		}
	});
	
	// 회의실 예약이 겹치지 못하게 하는 함수
	function eventConstraint(arg){ // 매개변수가 insert이면 새로 예약, update이면 기존 예약 수정
		
		var existingEvents = $('#calendar').fullCalendar('clientEvents'); // 모든 이벤트 가져오기
		var roomCode; // 예약하려는 회의실 ID
		var revDate; // 예약하려는 날짜
		var startTime; // 예약하려는 시작 시간
		var endTime; // 예약하려는 종료 시간
		var reservationNo; // 수정하려는 예약 번호
		
		if(arg == "insert"){
			roomCode = $("#roomCode").val(); 
			revDate = $("#revDate").val(); 
			startTime = revDate + "T" + $("#startTime").val(); 
			endTime = revDate + "T" + $("#endTime").val(); 
		}else{
			roomCode = $("#status-roomCode").val();
			revDate = $("#status-revDate").val();
			startTime = revDate + "T" + $("#status-startTime").val();
			endTime = revDate + "T" + $("#status-endTime").val();
			reservationNo = $("#status-reservationNo").val();
		}
		// 이미 예약된 이벤트들과 비교하여 중복 예약 체크
		for (var i = 0; i < existingEvents.length; i++) {
			  
			if (!existingEvents[i].start || !existingEvents[i].end) {
				continue; // 이벤트의 시작 또는 종료 시간이 null인 경우 건너뛰기
				}
		    
		    // 같은 회의실에서 같은 시간대에 예약된 이벤트가 있는 경우
		    if (existingEvents[i].roomCode == roomCode && existingEvents[i].id != reservationNo) { // 회의실이 겹치는 경우(내 예약 제외)
			    if (
			        (existingEvents[i].start._i >= startTime && existingEvents[i].start._i < endTime) || // 시작 시간이 겹치는 경우
			        (existingEvents[i].end._i > startTime && existingEvents[i].end._i <= endTime) || // 종료 시간이 겹치는 경우
			        (existingEvents[i].start._i <= startTime && existingEvents[i].end._i >= endTime) // 이벤트가 예약하려는 시간대를 포함하는 경우
			      	) {
				        window.alert('중복 예약입니다. 회의실 또는 예약 시간을 변경해주세요.');
				        if(arg == "insert"){
				        	 $("#roomCode").focus();
				        }else{
				        	$("#status-roomCode").focus();
				        }
				        return false; // 예약 불가능
				      }
			    }
		}
		  return true; // 예약 가능
	};
	
  </script>
   
</body>
</html>


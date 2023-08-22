<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>부서 스케줄</title>
</head>
<style>
	.content{
        width: 1570px;
        margin-left : 30px;
    }
    
    /* modal style */
    .modal-body label{
    	margin-top: 10px;
    }
    
    .fc-content:hover{
    	cursor:pointer;
		font-size : 1.1em;
    }
    
    
    #title-area{
    	width:80%;
    	margin: auto;
    	margin-bottom : 20px;
    }
    
   	#calendar-container{
   		width:80%;
   		margin:auto;
   	}
   	
   	#title-area *{
   		font-family: 'KimjungchulGothic-Bold';
   	}
   	
    #userCalendar .fc-toolbar {
    	font-family: 'KimjungchulGothic-Bold';
    }
    
    #userCalendar .fc-view-container {
    	font-family: 'HallymGothic-Regular';
    }
    
    .modal-content * {
    	font-family: 'KimjungchulGothic-Bold';
    }
</style>

<%@ include file="../common/menubar.jsp"  %> 
<div class="content">
	<div id="title-area">
		<h1 id="title" style="margin-bottom:20px;"> SCHEDULE </h1>
		<!-- ROLE_ADMIN이고 부서가 'D9'이면서 직급은 'J5'이상 직급만 전체 일정 관리 가능  -->
		<div id="select-area">
			<select id="schedule-category" class="form-control" style="width:100px; margin-bottom: 15px; float:left;">
				<option value="US">개인 일정 </option>
				<option value="DS"> 부서 일정 </option>
				<c:if test="${(loginUser.auth eq 'ROLE_ADMIN' and loginUser.deptCode eq 'D9') or 
							  (loginUser.deptCode eq 'D9' and loginUser.jobCode lt 'J5')}">
					<option value="AS">전체일정</option>
				</c:if>
			</select>
			<button type=button class="btn btn-sencondary" id="change-schedule" style="margin-left: 5px;"> 확인 </button>
		</div>
	</div>
	<script>
	
	</script>
	<!-- 캘린더 영역 -->
	<div id="calendar-container">
		<div id="userCalendar"></div>
	</div>
	
	<!-- 모달 -->	
	<div class="modal fade" id="schedule-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="exampleModalLabel" style="padding-top: 20px;">인사팀 일정<!-- 로그인 회원 부서로 바꿔줄것  --></h3>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>제목</label>
                        <input type="text" class="form-control" id="scheduleTitle" name="scheduleTitle" maxlength ="30">
                        <label>시작 날짜</label>
                        <input type="date" class="form-control" id="startDate" name="startDate">
                        <label>종료 날짜</label>
                        <input type="date" class="form-control" id="endDate" name="endDate">
                        <label>메모</label>
                        <textarea class="form-control" id="scheduleContent" name="scheduleContent" style="resize:none;" rows="6" maxlength="100"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addSchedule">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 수정모달  -->
    <div class="modal fade" id="schedule-update" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="exampleModalLabel" style="padding-top: 20px;">인사팀 일정<!-- 로그인 회원 부서로 바꿔줄것  --></h3>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>제목</label>
                        <input type="text" class="form-control" id="updateTitle" name="scheduleTitle" maxlength ="30">
                        <label>시작 날짜</label>
                        <input type="date" class="form-control" id="startUpdate" name="startDate">
                        <label>종료 날짜</label>
                        <input type="date" class="form-control" id="endUpdate" name="endDate">
                        <label>메모</label>
                        <textarea class="form-control" id="updateContent" name="scheduleContent" style="resize:none;" rows="6" maxlength="100"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="updateSchedule">수정</button>
                    <button type="button" class="btn btn-danger" id="deleteSchedule">삭제</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	$(function(){
		$("#userCalendar").fullCalendar({
				
	        plugins : ['interaction','dayGrid'],
	        locale: 'ko',
	        firstDay : 1, // 월요일이 먼저 오게 하기  
			fixedWeekCount : false, // 해당 월만 보이도록 하기 
			eventLimit: true, //보이는 이벤트 수 제한 
			selectable: true,
	      	height : 800,
					        
	      	header : {
	        	left : "",
	        	center : "prev, title ,next ",
	        	right : "addEventButton, today, prevYear, nextYear "
	        },
	        
	        views : {
	        	month : {
	        		titleFormat: "YYYY년 MM월"
	        	},
	        	agenda :{
	        		eventLimit : 4 //하루 칸에 보이는 이벤트 최대 개수 	
	        		
	        	}
	        },

	       //등록된 일정 조회 
	        events: function(start, end, timezone, callback){

	        	$.ajax({
					url : "getUserSchedule.sc",
					data : { 
							userNo : '${loginUser.userNo}',
							scheduleType : $("#schedule-category").val()
					},
					success : function(list){
		            	var events = [];
		            	$.each(list, function(index,schedule){
		            		
		            		var event ={
			            			id: schedule.scheduleNo,
			            			title : schedule.scheduleTitle,
			            			content : schedule.scheduleContent,
			            			type : schedule.scheduleType,
			            			start : schedule.startDate,
			            			end : schedule.endDate
			            		};
		            		events.push(event);
						});
		            	callback(events);
		            },
				});
	        }, 
	        
	        //날짜 클릭 -> 일정 등록 
	        dayClick : function(start,end, e){
	        	$("#schedule-modal").modal("show"); // 정보 입력 모달 띄워주기 
	        	//시작,종료날짜 포맷지정 
        		var startDate = moment(start).format('YYYY-MM-DD');
        		var endDate = moment(end).format('YYYY-MM-DD');
        		
        		var $startDate = $("#startDate").val(startDate); // 선택한 날짜 value에 담아서 보여주기 
				
        		$("#addSchedule").on("click", function(){
		        	
        			var $title = $("#scheduleTitle").val();
					var $content = $("#scheduleContent").val();
					var userNo = '${loginUser.userNo}';
					var deptCode = '${loginUser.deptCode}';
					endDate = $("#endDate").val();
					startDate = $("#startDate").val();  
					if($title == ""){
						alert("일정 제목을 입력해주세요");
						$("#scheduleTitle").focus();
						
					}else if($startDate == "" || endDate == ""){
						alert("날짜를 입력해주세요");
						
					}else if(new Date(endDate) - new Date(startDate) < 0){
						alert("종료일이 시작일보다 빠를 수 없습니다.");
						$("#startDate").val("");  
						
					}else{
						//정상 입력시 전송할 객체 생성  
						//ajax로 DB연동 하기 
						$.ajax({
							
							url: "addUserSchedule.sc",
							
							data : {
								scheduleType : $("#schedule-category").val(),
								scheduleTitle : $title,
								scheduleContent : $content,
								startDate : $startDate.val(),
								endDate : endDate,
								userNo : userNo,
								deptCode : deptCode
							},
							
				            success : function(result){
				            	
								if(result == "YYYY"){
									alert("일정 등록 완료 ")
									$("#scheduleTitle").val("");
									
								}else{
									alert("일정 등록에 실패하였습니다. ")
								}
								location.reload();
								$("#schedule-modal").modal("hide"); //모달창 닫기 
							}
						});
					}
					e.stopPropagation(); // 상위 요소로 이벤트 결과 전달 막기
				});	
	        }, 
	        //일정 추가 커스텀 버튼 
	        customButtons : {
				addEventButton : {
					text : "일정 추가",

					click : function(start,end,e){
						$("#schedule-modal").modal("show");
							var startDate = moment(start).format('YYYY-MM-DD');
							var endDate = moment(end).format('YYYY-MM-DD');
							
							//시작 날짜에 value값에 조합한 오늘 날짜 넣어주기 
							var $startDate = $("#startDate").val(startDate);  
						
							$("#addSchedule").on("click", function(){
							
								var $title = $("#scheduleTitle").val();
								var $content = $("#scheduleContent").val();
								var userNo = '${loginUser.userNo}';
								var deptCode = '${loginUser.deptCode}';
								endDate = $("#endDate").val();
								startDate = $("#startDate").val();  
								
								if($title == ""){
									alert("일정 제목을 입력해주세요");
									$("#scheduleTitle").focus();
									
								}else if($startDate == "" || endDate == ""){
									alert("날짜를 입력해주세요");
									
								}else if(new Date(endDate) - new Date(startDate) < 0){
									alert("종료일이 시작일보다 빠를 수 없습니다.");
									$("#startDate").val("");  
								}else{
									//정상 입력시 ajax로 요청 
									$.ajax({
										url: "addUserSchedule.sc",
										
										data : {
											scheduleType : $("#schedule-category").val(),
											scheduleTitle : $title,
											scheduleContent : $content,
											startDate : $startDate.val(),
											endDate : endDate,
											userNo : userNo,
											deptCode : deptCode
										},
										
							            success : function(result){
											if(result == "YYYY"){
												alert("일정 등록 완료 ")
											}else{
												alert("일정 등록에 실패하였습니다. ")
											}
											location.reload();
											$("#schedule-modal").modal("hide") //모달창 닫기 
										}
									});
							}
							e.stopPropagation(); // 상위 요소로 이벤트 결과 전달 막기 
						});
					}
				} 
			},
			
			//이벤트 클릭 -> 수정 포맷 
			eventClick : function(calEvent, jsEvent, view){
				//수정 모달 띄워주기 
				$("#schedule-update").modal("show");
				
				//기존에 가지고 있는 시작,끝 날짜 포맷 바꿔주기 
				var start = moment(calEvent.start).format("YYYY-MM-DD");
				var end = moment(calEvent.end,'YYYY-MM-DD').subtract(1,'days').format('YYYY-MM-DD'); //종료 날짜 하루 빼주기 
				$("#updateTitle").val(calEvent.title);
				$("#startUpdate").val(start);
				$("#endUpdate").val(end);
				$("#updateContent").val(calEvent.content);
				
				//수정 버튼 클릭 이벤트 
				$("#updateSchedule").on("click",function(e){
					if(confirm("일정을 수정하시겠습니까?")){
						var scheduleNo = calEvent.id;
						var $updateTitle = $("#updateTitle").val();
						var $updateStart = $("#startUpdate").val();
						var $updateEnd =  $("#endUpdate").val();
						var $updateContent =$("#updateContent").val();
						
						if($updateTitle ==""){
							alert("제목을 입력해주세요");
							
						}else if($updateStart =="" || $updateEnd == ""){
							alert("날짜를 입력해주세요");
							
						}else if(new Date($updateEnd) - new Date($updateStart) < 0){
							alert("종료일이 시작일보다 빠를 수 없습니다.");
						}else{
							//정상적으로 작성되었을 경우 DB연동
							$.ajax({
								url : "updateUserSchedule.sc",
								data : {
									scheduleType : $("#schedule-category").val(),
									scheduleNo : scheduleNo,
									scheduleTitle : $updateTitle,
									scheduleContent : $updateContent,
									startDate : $updateStart,
									endDate : $updateEnd,
									userNo : '${loginUser.userNo}',
									deptCode : '${loginUser.deptCode}'
								},
						
								success : function(result){
									if(result =="YYYY"){
										alert("일정 수정이 완료되었습니다.");
									
									}else{
										alert("일정 수정에 실패하였습니다.");
									}
									location.reload();
									$("#schedule-update").modal("hide");
								}
							}); 
						}
						e.stopPropagation(); // 상위 요소로 이벤트 결과 전달 막기
					}
				});	//수정 이벤트 끝 
				
				//삭제버튼 클릭 이벤트 
				$("#deleteSchedule").on("click",function(e){
					if(confirm("일정은 삭제 후 복구가 불가능 합니다 삭제하시겠습니까? ")){
							var scheduleNo = calEvent.id;
							$.ajax({
								url : "deleteUserSchedule.sc",
	 							data : { 
	 								scheduleType : $("#schedule-category").val(),
	 								scheduleNo : scheduleNo,
									userNo : '${loginUser.userNo}'		
								},
								success : function(result){
									if(result =="YYYY"){
										alert("일정 삭제가 완료되었습니다.")
									}else{
										alert("일정 삭제에 실패하였습니다. 다시 시도해주세요")
									}
									location.reload();
									$("#schedule-update").modal("hide");
								}
							});
					}
					e.stopPropagation(); // 상위 요소로 이벤트 결과 전달 막기
				});
			},
			
			eventRender : function (eventObj, $el){
				//이벤트 호버 
				$el.popover({
					title : eventObj.title,
					content : eventObj.content,
					trigger : 'hover',
					placement : 'top',
					container : 'body'
				});
				
			}
			
		}); // 개인 캘린더 랜더링 끝 
		
		$("#change-schedule").on("click", function(){
			
			if($("#schedule-category").val()=='DS'){	
				location.href="schedule.sc"
			}else if($("#schedule-category").val()=='AS'){
				location.href="schedule.ad"
			}
		});
	});
		
	
</script>	
</body>
</html>
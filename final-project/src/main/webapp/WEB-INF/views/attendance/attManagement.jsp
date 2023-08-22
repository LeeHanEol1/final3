<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의근무_신청관리(관리자전용)</title>
<style>
	.content{
        width: 1570px;
        height: 800px;
    }
    #wrap{
		margin: auto;
		width: 80%;
		height: 75%;
		margin-top : 10px;
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
     /* 제목 */
    #title-area{
	    height: 40px;
	    width: 80%;
	    padding: 10px;
	    margin-bottom: 40px;
	    line-height: 15px;
	    font-size: 20px;
	    font-weight: 600;
	    display: inline-block;
	    float: left;
    }
    /* 테이블 */
     #table-area {
    	margin-top: 20px;
    	margin-bottom: 10px;
    }
    #table-area  *{
    	text-align: center;
    	vertical-align: middle;
    }
    /* 검색 */
    #btn-area{
    	height: 40px;
    	width: 20%;
    	display: inline-block;
    	float: left;
    	margin-top: 20px;
    }
    #selectedDate{
    	width: 75%;
    	display: inline-block;
    	float: left;
    	margin-right: 5px;
    }
    #btn-area button{
    	width: 20%;
    	display: inline-block;
    	float: left;
    	margin-top: 1px;
    }
    /* 페이징 */
    #pagingArea {
        width:fit-content; 
        margin:auto;
    }
    /*폰트*/
     #att-tap-area *, #title-area, th, #board-pagebar-area *, #btn-area *{
    	font-family: 'KimjungchulGothic-Bold';
    }
    td{
    	font-family: 'HallymGothic-Regular'
    }
    
    
</style>
</head>
<body id="body-pd">
 <%@ include file="../common/menubar.jsp" %>  
 
 
    <div class="content" >
           <div id="att-tap-area">
                <ul id="nav-tabs"  class="nav-tabs nav-pills">
					<li role="presentation">
						<a href="userAtt.at">나의근무</a>
					</li>
					<li role="presentation">
					 	<a href="requestList.at">신청확인</a>
					</li>
					<c:if test="${loginUser.auth eq 'ROLE_ADMIN' }">
					<li role="presentation">
					 	<a href="approveRequest.at">신청관리</a>
					</li>
					<li role="presentation" class="active">
					 	<a href="manageAtt.at">근태관리</a>
					</li>
					</c:if>
				</ul>
            </div>
            
	        
	    <div id="wrap">
	    	<div id="title-area">
	    		사원 근태관리
	    	</div>
	    	<div id="btn-area">
		    	<form action="manageAtt.at">
		    		<input type="hidden" name="currentPage" value="1">
		    		<input type="date" name="selectedDate" id="selectedDate" class="form-control" value="${selectedDate }">
		    		<button type="submit" class="btn btn-sm btn-info">검색</button>
		    	</form>
	    	</div>

	    	
			<div id="table-area">
				<table class="table">
					<thead>
						<tr>
							<th width="8%">사번</th>
							<th width="10%">사원</th>
							<th width="15%">부서</th>
							<th width="12%">근태일</th>
							<th width="15%">근무코드</th>
							<th width="20%" colspan="2">근무계획</th>
							<th width="20%" colspan="2">근무실적</th>
						</tr>
					</thead>
					<tbody>
						 <c:if test="${empty list }">
							<tr>
								<td colspan="12" style="font-weight:700">아직 출근한 사람이 없네요.</td>
							</tr>
						</c:if> 
					
						<c:forEach var="a" items="${list }">
						<tr>
							<td rowspan="2">${a.userNo }</td>
							<td rowspan="2">${a.userName }</td>
							<td rowspan="2">${a.deptName }</td>
							<td rowspan="2">${a.workDate }</td>
							<td rowspan="2">${a.leaveType }</td>
							<th>출근</th>
							<td>
								<c:choose>
									<c:when test="${a.leaveType eq '오전반차'}">
									13:00
									</c:when>
									<c:otherwise>
									09:00
									</c:otherwise>
								</c:choose>
							</td>
							<th>출근</th>
							<td>
								<c:choose>
									<c:when test="${a.onTime eq null }">
										<div data-toggle="tooltip" data-placement="right">미입력</div>
									</c:when>
									<c:otherwise>
										<div data-toggle="tooltip" data-placement="right">${a.onTime }</div>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>퇴근</th>
							<td>
								<c:choose>
									<c:when test="${a.leaveType eq '오후반차'}">
									12:00
									</c:when>
									<c:otherwise>
									18:00
									</c:otherwise>
								</c:choose>
							</td>
							<th>퇴근</th>
							<td>
								<c:choose>
									<c:when test="${a.offTime eq null }">
									미입력
									</c:when>
									<c:otherwise>
									${a.offTime }
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					
						</c:forEach>
					</tbody>
				</table>
			</div>
				
		</div>
		<!--날짜 검색 조건으로 페이징처리 -->
        <div id="board-pagebar-area">
        	<div id="pagingArea">
            	 <ul class="pagination">
	                    <c:choose>
							<c:when test="${empty selectedDate }">
							 	<li id="previous-btn" class="page-item disabled"><a class="page-link" href="manageAtt.at?currentPage=${pi.currentPage - 1 }">이전</a></li>
							</c:when>
							<c:otherwise>
								<li id="previous-btn" class="page-item"><a class="page-link" href="manageAtt.at?currentPage=${pi.currentPage - 1 }&selectedDate=${selectedDate }">이전</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1">
							<c:choose>
								<c:when test="${empty selectedDate }">
									<c:if test="${p eq pi.currentPage }"> <!-- 내가 보고있는 페이지의 버튼은 disabled처리 -->
										<li class="page-item disabled"><a class="page-link" href="manageAtt.at?currentPage=${p }">${p }</a></li>
									</c:if>
									<c:if test="${p != pi.currentPage }">
									<li class="page-item"><a class="page-link" href="manageAtt.at?currentPage=${p }">${p }</a></li>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${p eq pi.currentPage }">
										<li class="page-item disabled"><a class="page-link" href="manageAtt.at?currentPage=${p }&selectedDate=${selectedDate }">${p }</a></li>
									</c:if>
									<c:if test="${p != pi.currentPage }">
										<li class="page-item"><a class="page-link" href="manageAtt.at?currentPage=${p }&selectedDate=${selectedDate }">${p }</a></li>
									</c:if>
								</c:otherwise>
							</c:choose>
						</c:forEach>
		                    	
                       <c:choose>
							<c:when test="${empty selectedDate }">
								<li id="next-btn" class="page-item"><a class="page-link" href="manageAtt.at?currentPage=${pi.currentPage + 1 }">다음</a></li>
							</c:when>
							<c:otherwise>
								<li id="next-btn" class="page-item"><a class="page-link" href="manageAtt.at?currentPage=${pi.currentPage + 1 }&selectedDate=${selectedDate }">다음</a></li>
							</c:otherwise>
						</c:choose>
                    </ul>
              </div>
          </div>
            
            <!-- 현재페이지에 따라 이전/다음버튼 disabled처리 (클래스부여)-->
            <c:if test="${pi.currentPage eq 1 }">
            	<script>
            		$(function(){
            			$("#previous-btn>a").removeAttr('href');
            			$("#previous-btn").addClass("disabled");
            		});
            	</script>
            </c:if>
            
            <c:if test="${pi.currentPage eq pi.maxPage }">
            	<script>
            		$(function(){
            			$("#next-btn>a").removeAttr('href');
            			$("#next-btn").addClass("disabled");
            		});
            	</script>
            </c:if>
		
	</div>
			
      <br><br><br><br>
      
  
	<c:if test="${selectedDate eq null }">
		<script>
		$(function(){ // 검색날짜 없다면 오늘날짜를 기본으로 보여주는 함수
			
			var date = new Date();
		
			var year = date.getFullYear().toString();
			var month = (date.getMonth() + 1).toString().padStart(2, '0');
			var day = date.getDate().toString().padStart(2, '0');
		
			var formattedDate = year + '-' + month + '-' + day;
			
			$("#selectedDate").val(formattedDate);
		});
		</script>
	</c:if>

	<script>
	
	$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();
	});
	
	// 지각의 경우 글씨 색 변경, 마우스오버시 툴팁
	$(function(){
		
		$("#table-area tbody tr").each(function(){
			var tr = $(this).closest("tr");
			var td = tr.children();
			
			var recordElement = td.eq(8).children();
			var plan = td.eq(6).text();
			var record = td.eq(8).text();
			
			var planTime = new Date("2023-05-21 " + plan);
			var recordTime = new Date("2023-05-21 " + record);
			
			if(planTime < recordTime || record == "미입력"){
				
				var timeGap = (recordTime - planTime)/60000;
				recordElement.css("color","red");
				recordElement.css("font-weight","600");
				recordElement.attr("title", timeGap + "분 지각");
			}
			
		});	
		
	});
	
	</script>
</body>
</html>
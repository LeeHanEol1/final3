<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리_신청확인</title>
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
/*     .content div{border: 1px solid black;} */
    
    /* 제목 */
    #title-area{
	    height: 40px;
	    padding: 10px;
	    margin-bottom: 10px;
	    line-height: 15px;
	    font-size: 20px;
	    font-weight: 600;
    }
    /* 테이블 */
    #table-area{
    	margin-top: 20px;
    	margin-bottom: 20px;
    }
    #table-area td, #table-area th{
    	text-align: center;
    	vertical-align: middle;
    }
    #table-area button:hover{
    	cursor: default;
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
					<li role="presentation" class="active">
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
	    	<div id="title-area">
	    		근태 사유서 상신 내역
	    	</div>
		      <!-- 기존근태: ATTENDANCE_RECORD에서 STAUTS 'N'으로 변경된게 취소된 실적 -->  
			<div id="table-area">
				<table class="table">
					<thead>
						<tr>
							<th width="10%">근태일</th>
							<th width="10%">근무코드</th>
							<th width="15%" colspan="2">기존근무시간</th>
							<th width="15%" colspan="2">정정근무시간</th>
							<th width="30%">정정신청사유</th>
							<th width="10%">신청일</th>
							<th width="10%">승인여부</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list }">
							<tr>
								<td colspan="9">근태 정정 신청하신 내역이 없습니다.</td>
							</tr>
						</c:if>
					
						<c:forEach var="a" items="${list }">
						<tr>
							<td rowspan="2">${a.workDate }</td>
							<td rowspan="2">${a.leaveType }</td>
							<th>출근</th>
							<td>
								<c:choose>
									<c:when test="${a.onTime eq null}">
										미입력
									</c:when>
									<c:otherwise>
										${a.onTime }
									</c:otherwise>
								</c:choose>
							</td>
							<th>출근</th>
							<td>${a.updateOnTime }</td>
							<td rowspan="2">${a.updateContent }</td>
							<td rowspan="2">${a.createDate }</td>
							<td rowspan="2">
								<c:choose>
									<c:when test="${a.status eq 'Y' }">
										<button type="button" class="btn btn-sm btn-info" style="background-color:#5BC0DE;border:#5BC0DE;">승인완료</button>
									</c:when>
									<c:when test="${a.status eq 'R' }">
										<button type="button" class="btn btn-sm btn-danger" style="background-color:#D9534F ;border:#D9534F ;">반려처리</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-sm btn-warning" style="background-color:#F0AD4E ;border:#F0AD4E ;">승인대기</button>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>퇴근</th>
							<td>
								<c:choose>
									<c:when test="${a.offTime eq null}">
										미입력
									</c:when>
									<c:otherwise>
										${a.offTime }
									</c:otherwise>
								</c:choose>
							</td>
							<th>퇴근</th>
							<td>${a.updateOffTime }</td>
						</tr>
					
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		
		
		
		<!--페이징처리 -->
        <div id="board-pagebar-area">
        	<div id="pagingArea">
        	
            	<ul class="pagination">
					<li id="previous-btn" class="page-item"><a class="page-link" href="requestList.at?currentPage=${pi.currentPage - 1 }">이전</a></li>
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1">
							
							<c:if test="${p eq pi.currentPage }"> <!-- 내가 보고있는 페이지의 버튼은 disabled처리 -->
								<li class="page-item disabled"><a class="page-link" href="requestList.at?currentPage=${p }">${p }</a></li>
							</c:if>
							<c:if test="${p != pi.currentPage }">
								<li class="page-item"><a class="page-link" href="requestList.at?currentPage=${p }">${p }</a></li>
							</c:if>
								
						</c:forEach>
					<li id="next-btn" class="page-item"><a class="page-link" href="requestList.at?currentPage=${pi.currentPage + 1 }">다음</a></li>
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
 
  
 


</body>
</html>
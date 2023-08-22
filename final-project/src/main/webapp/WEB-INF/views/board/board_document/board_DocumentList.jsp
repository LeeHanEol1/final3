<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>자료실</title>
   <!-- Modal CSS  -->
   <link href="/final3/resources/css/document-modal.css" rel="stylesheet">
  <style>
	
	.content{
        width: 1570px;
    }
    
    /* 검색영역 */
    #board-search-area>form{
        width: 80%;
        margin:auto;
        margin-top:20px;
    }
    
    #option-box{
        width: 40%;
        float: left;
    }
    #dept_code{
        margin-left: 5px;
    }
    #search-box{
        width: 60%;
        float: left;
    }

    #search-input{
        width: 30%;
        float: left;
    }
    
	/*navibar*/
	#board-tap-area{
		width: 80%;
		height : 50px;
		margin: auto;
	}
	
	#board-tap-area>ul{
		width:100%;
		list-style-type : none;
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
    
    #board-tap-area>ul li a{
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
   
   /* 버튼영역 */
    #board-btn-area{
        width: 80%;
        height : 50px;
        margin: auto;
    }
    
    #board-btn-area>button{
   		float: right; 
   		margin-left: 10px;
        margin-bottom : 10px;
    }
    
    /* 게시글 목록영역 */
    #board-list-area{
        width: 80%;
        margin: auto;
    }
    
    #board-list th, #board-list td{
        text-align:center;
    }
	
	#board-list-area>#board-list{
		width:100%;
		
	}
	
	#board-list-area i:hover{
    	font-size: 25px;
    	cursor: pointer;
    }
    
    #board-list input[type='checkbox']:hover{
    	cursor: pointer;
    }
    
    #pagingArea {
        width:fit-content; 
        margin:auto;
    }
    
    #board-btn-area>#enroll-btn{
    	background-color: #12866f;
    }
    
    #board-btn-area>#enroll-btn:hover{
    	background-color: #0E6251;
    }
    
    #board-tap-area, #boardList-btn>button, 
    #board-btn-area button, #board-search-area, .popup-wrap, #board-pagebar-area{
    	font-family: 'KimjungchulGothic-Bold';
    }
    
    th {
    	font-family: 'KimjungchulGothic-Bold';
    }
    
    td {
     	font-family: 'HallymGothic-Regular';
    }
    
    
    </style>
</head>
<%@ include file="../../common/menubar.jsp" %>
    <div class="content">
    	<!-- 이동 탭 영역 -->
        <div id="board-tap-area">
   			<ul id="nav-tabs"  class="nav-tabs nav-pills">
				<li role="presentation">
					<a href="list.no">공지사항</a>
				</li>
				<li role="presentation" class="active">
				 	<a href="list.dc">자료실</a>
				</li>
				<li role="presentation">
					<a href="list.re">대여</a>
				</li>
				<li role="presentation">
					<a href="list.fr">커뮤니티</a>
				</li>
			</ul>
  		</div>
		<!-- 검색창 영역  -->
		<div id="board-search-area">
			<form action="search.dc" method="get">
				<div id="option-box" align="right" >
                	<select id="dept_code" name="deptCode" class="btn btn-secondary dropdown-toggle" style=" border: 1px solid #ccc; background-color: white; color:#0c0d0d; height: 34px; margin-right: 3px;">
	                    <option value="전체">전체</option>
	                    <option value="D1">기타</option>
	                    <option value="D2">회계관리부</option>
	                    <option value="D3">마케팅부</option>
	                    <option value="D4">국내영업부</option>
	                    <option value="D5">해외영업부</option>
	                    <option value="D6">기술지원부</option>
	                    <option value="D7">총무부</option>
	                    <option value="D8">회계부</option>
	                    <option value="D9">인사관리부</option>
                	</select>
				</div>
				<div id="search-box">
					<input type="text" name="keyword" class="form-control" id="search-input" value="${keyword}"> 
					<button type="submit" class="btn btn-secondary" style="background-color: #0E6251; margin-left: 5px;">
					<i id="search-icon" class="fa-solid fa-magnifying-glass fa-lg" style="color:white;"></i></button>
           		</div>
			</form>
		</div>
		
		<!-- 검색한 부서 고정 script -->
		<c:if test="${not empty deptCode }">
		<script>
			$(function(){
				$("#option-box option[value = ${deptCode}]").attr("selected",true);
				
			});
		</script>
		</c:if>
		
		<!-- 작성/삭제 버튼 영역 (삭제 버튼은 관리자에게만 보이도록 조건 걸기)  -->
		<div id="board-btn-area">
			<c:if test="${loginUser.auth eq 'ROLE_ADMIN'}">
	  			<button class="btn btn-danger" id="document_delete">삭제</button> 
			</c:if>
	    	<button class="btn btn-success" id="enroll-btn" onclick="location.href='enroll.dc'">작성</button>               
		</div>
	
     	<!-- 게시글 리스트 영역 -->
     	<div id="board-list-area">
         	<table id="board-list" class="table table-hover">
             	<thead>
	                 <tr>
	                     <th width="10%">No.</th>
	                     <th width="45%">제목</th>
	                     <th width="15%">작성자</th>
	                     <th width="5%">조회수</th>
	                     <th width="10%">작성일</th>
	                     <th width="10%">다운로드</th>
	                     <c:if test="${loginUser.auth eq 'ROLE_ADMIN'}">
	                     <th width="5%">선택</th>
	                     </c:if>
	                 </tr>
           		</thead>
            	<tbody>
              		<c:choose>
              		<c:when test="${empty bList}">
              			<tr onclick="event.cancelBubble=true">
              				<td colspan="7">조회된 게시글이 없습니다.</td>
              			</tr>
              		</c:when>
              		<c:otherwise>
              			<c:forEach var="b" items="${bList}">
              			<tr>
               				<td>${b.boardNo}</td>
               				<c:choose> <%-- 중요도 조건 --%>
               				<c:when test="${b.importanceLevel eq 'I'}">
                        		<td style="text-align:left;"><b style="color:red">[중요]</b> ${b.boardTitle}</td>      
               				</c:when>
               				<c:otherwise>
               					<td style="text-align:left;">${b.boardTitle}</td>
               				</c:otherwise>
               				</c:choose>             
                      		<td>${b.boardWriter}<span>[${b.deptName}]</span></td>      
                       		<td>${b.count}</td>
                       		<td>${b.createDate}</td>
                  			<td onclick="event.cancelBubble=true"><i id="down" class="fa-solid fa-download fa-lg" style="color : #0c0d0d;"></i>
                  				<input type="hidden" value="${b.boardNo}"></td>
                  		
                  			<!-- 특정 직급 이상자에게만 보이도록 조건 걸기  -->	
                  			<c:if test="${loginUser.auth eq 'ROLE_ADMIN'}">
                  			<td onclick="event.cancelBubble=true"><input type="checkbox" class="form-check-input" name="select_chk" style="width: 15px; height:15px"></td>
                  			</c:if>	
              			</tr>
              			</c:forEach>
              		</c:otherwise>
              	</c:choose>
         	</tbody>
      	</table>
   		<br>
     	<div id="board-pagebar-area">
			<div id="pagingArea">
				<ul class="pagination">
                   	<c:choose>
                   		<c:when test="${pi.currentPage eq 1 }">
	                        <li class="page-item disabled"><a class="page-link">이전</a></li>
                   		</c:when>
                   		<c:otherwise>
                   			<c:choose>
	                   			<c:when test="${empty deptCode}">
			                         <li class="page-item"><a class="page-link" href="list.dc?currentPage=${pi.currentPage-1}">이전</a></li>
	                   			</c:when>
	                   			<c:otherwise>
	                   				<li class="page-item"><a class="page-link" href="search.dc?currentPage=${pi.currentPage-1}&deptCode=${deptCode}&keyword=${keyword}">이전</a></li>
	                   			</c:otherwise>
                   			</c:choose>
                   		</c:otherwise>
                   	</c:choose>
                   	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                   		<c:choose>
                   		<c:when test = "${empty deptCode}">
                        	<li class="page-item"><a class="page-link" href="list.dc?currentPage=${p}">${p}</a></li>
                        </c:when>
                        <c:otherwise>
                        	<li class="page-item"><a class="page-link" href="search.dc?currentPage=${p}&deptCode=${deptCode}&keyword=${keyword}">${p}</a></li>
                        </c:otherwise>
                   		</c:choose>
                   	</c:forEach>
                   	<c:choose>
                   		<c:when test="${pi.maxPage eq pi.currentPage}">
	                        <li class="page-item disabled"><a class="page-link">다음</a></li>
                   		</c:when>
                   		<c:otherwise>
                   			<c:choose>
	                   			<c:when test="${empty deptCode}">
			                        <li class="page-item"><a class="page-link" href="list.dc?currentPage=${pi.currentPage+1}">다음</a></li>
	                   			</c:when>
	                   			<c:otherwise>
	                   				<li class="page-item"><a class="page-link" href="search.dc?currentPage=${pi.currentPage+1}&deptCode=${deptCode}&keyword=${keyword}">다음</a></li>
	                   			</c:otherwise>
                   			</c:choose>
                   		</c:otherwise>
                   	</c:choose>
				</ul>
			</div>
		</div>
		<script>
         	
       	//detailView 이동 script
	       	$(function(){
	       		$("#board-list>tbody ").on("click","td",function(){
	       			
	       			var bno = $(this).siblings().eq(0).text();
	       			location.href="detail.dc?bno="+bno;
	       			
	       		});
	       	});
        
		//선택 삭제 script
			$(function(){
				var bnoArr = new Array();
				var chkCount =""; //선택된 체크박스 개수 담을 변수 
				
				$("#board-list>tbody td").on("click","input[type=checkbox]",function(){
					//게시글 번호 
					var $bno =$(this).parent().siblings().eq(0).text();
					
					//선택한 게시글의 작성자의 부서 
					var wirterDept = $(this).parent().siblings().eq(2).children().text();
					
					//로그인 유저(관리자)의 부서 
					var loginUserDept = '${loginUser.deptName}';
					
					if(wirterDept.indexOf(loginUserDept) != -1){
						console.log("포함");
						var query = 'input[name="select_chk"]:checked';
				  		
			 			//선택된 체크박스 개수 
			 			chkCount = document.querySelectorAll(query) //console.log("chkCount:",selectElements.length);
			 			
				 		if($(this).prop("checked")==true){
				  			bnoArr.push($bno);
				 		}else{
				 			for(let i = 0 ; i<bnoArr.length; i++){
				 				if(bnoArr[i] === $bno){
				 					bnoArr.splice(i,1);
				 				}
				 			}
				 		}
				 		
					}else{
					 	console.log("포함되지 않음");
					 	alert("권한이 없습니다.")
					 	return false;
					}
					
		 			
		 			//console.log(bnoArr);
				});
				
				//삭제버튼 클릭시 선택삭제 진행 script 
				$("#document_delete").click(function(){
					if(chkCount.length == 0){
						alert("삭제할 게시글을 선택해 주세요")
					}else{
						if(confirm("선택한 게시글을 삭제하시겠습니까?")){
				 			
				 			$.ajax({
				 				url : "selectDelete.dc",
				 				
				 				data : {bnoArr : bnoArr },
				 				
				 				type :"get",
				 				
				 				traditional: true, //배열 넘기는 옵션
				 				
				 				success: function(result){
				 					
				 					if(result='YYYY'){
				 						alert("게시물 삭제가 완료되었습니다.");
				 					}else{
				 						alert("삭제에 실패하였습니다. 다시 시도해주세요");
				 					}
				 					
				 					location.reload();
				 				}
				 			});
				 		} 
					}				
				});	
			});
		</script>
        <!-- modal 팝업 창 -->
        <div class="container">
            <div class="popup-wrap" id="popup"> <!-- 모달을 감싸줄 박스 -->
                <div class="popup"> <!-- 실질적 모달 팝업 -->
                    <div class="popup-head"> <!-- 로고영역 -->
                        <span class="head-title" style="font-size: 30px; color:white;">KH COMPANY</span>
                    </div>
                    <div class="popup-body"> <!-- 컨텐츠 영역  -->
                        <div class="body-content">
                            <div class="body-titlebox">
                            	<h3>첨부파일</h3>
                            </div>
                            <div class="body-contentbox">
								<table>
									<tbody>
										<!-- 조회 내용 들어갈 영역 -->
									</tbody>
								</table>
                            </div>
                        </div>
                    </div>
                    <div class="popup-foot" align="center"> <!-- 푸터 버튼 영역 -->
                        <span class="pop-btn-confirm" id="confirm" style="color:white;">확인</span>
                        <span class="pop-btn-close" id="close" style="color:white;">창닫기</span>
                    </div>
                </div>
            </div>
        </div>
                
		<script>
		//list에서 파일 다운 script
			$(function(){
              		
				$("#confirm").click(function(){
                	modalClose();
				});
                  
             	$('#close').click(function(){
                	modalClose(); //모달 닫기 함수 호출
             	});

     			function modalClose(){
                	$('#popup').fadeOut(); //페이드아웃 효과 
                };
                  
				// 다운로드 아이콘 클릭시 발생할 이벤트 
          		$("#board-list>tbody td").on("click","#down",function(){
          			$("#popup").css('display','flex').hide().fadeIn();
          			var bno = $(this).next().val();
          			
          			$.ajax({
          				url : "fileDown.dc",
          				
          			 	data : { bno : bno},
          			 	
          			 	success : function(result){
          			 		
          			 		var fileList = "";
			
          			 		for(var i in result){
          			 			fileList +="<tr>"
          			 					 + "<td>"
          			 					 + "<ul><li>"
          			 					 + "<a href='/final3"+result[i].filePath+"' download='"+result[i].originName+"'>"+result[i].originName+"</a></li></td>"   
          			 					 + "</tr>"; 
          			 		
           			 			$(".body-contentbox>table>tbody").html(fileList);
          			 		}
          			 	},
          			 	
          			 	error : function(){
          			 		console.log("통신오류");
          			 	}
          				
          			});
          		
          		});
          	})
                
		</script>
        </div>
    </div>   
</body>
</html>



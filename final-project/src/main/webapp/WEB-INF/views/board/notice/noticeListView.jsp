<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    
  <style>
	.content{
        width: 1570px;
        height: 800px;
    }
	/*검색영역*/
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
   /* 공지사항 작성버튼 */
   #boardEnroll-btn{
   		margin-right: 200px;
   		text-align: right;
   }
   #boardEnroll-btn > button{
   		background-color: #0E6251;
   		color: white;
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
	 
    /* 게시글 목록영역 */
    #board-list-area{
    	height: 60%;
        width: 80%;
        margin: auto;
        margin-top : 20px;
    }
    /* 게시글목록 테이블 */
    #board-list th{
        text-align:center;
    }

    #pagingArea {
        width:fit-content; 
        margin:auto;
    }
    #board-list button:hover{
    	cursor: default;
    }
    #board-list button{
    	background-color: #D9534F;
    }
    /*폰트*/
    #board-tap-area *, #dept_code, #boardEnroll-btn *, th, #board-pagebar-area *{
    	font-family: 'KimjungchulGothic-Bold';
    }
    td{
    	font-family: 'HallymGothic-Regular'
    }
   
    </style>
</head>
<body id="body-pd">
<%@ include file="../../common/menubar.jsp" %>
 
    <div class="content">
    
         <div id="board-tap-area">
                <ul id="nav-tabs"  class="nav-tabs nav-pills">
					<li role="presentation" class="active">
						<a href="list.no">공지사항</a>
					</li>
					<li role="presentation">
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

                <form action="list.no" id="board-search-area" method="get">
                    <div id="option-box" align="right" >
                    <input type="hidden" name="currentPage" value="1">
                        <select name="status" id="dept_code" class="btn btn-secondary dropdown-toggle" style="background-color: white; color:#0c0d0d; height: 34px; margin-right: 3px; border:1px solid #ccc;">
                            <option>부서선택</option>
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
                        <input type="text" name="keyword" class="form-control" id="search-input" value="${keyword }"> 
                        <button class="btn btn-secondary" type="submit" style="background-color: #0E6251; margin-left: 2px;"><i id="search-icon" class="fa-solid fa-magnifying-glass fa-lg" style="color:white"></i></button><!-- icon 사이즈 변경 fa-2xs /xs / sm / lg/ xl/ 2xl -->
                    </div>
                  </form>
                    <br><br>
                    <div id="boardEnroll-btn">
                    	<c:if test="${loginUser.auth eq 'ROLE_ADMIN' }">
		           		<button class="btn btn-sm" onclick="location.href='enroll.no'">공지사항 작성</button>
		           		</c:if>
		            </div>
           
            
            <!-- 검색어 select값 유지 -->
            <c:if test="${not empty status }">
				<script>
				$(function(){
					
					$("#board-search-area option").each(function(){
						if($(this).val()=="${status}"){
							$(this).attr("selected", true);
						}
					});
					
					
				});
				</script>
			</c:if>
            
           
            <div id="board-list-area">
                <table id="board-list" class="table table-hover">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>작성일</th>
                            <th>북마크</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                    	<c:forEach var="n" items="${list }">
	                        <tr onclick="location.href='detail.no?boardNo=${n.boardNo }'">
	                            <td>${n.boardNo }</td>                            
	                            <td align="left">
	                            	<c:if test="${n.importanceLevel eq 'I' }">
	                            		<button type="button" class="btn btn-danger btn-sm" style="background-color: #c42d2d">중요</button>
	                            	</c:if>
	                            ${n.boardTitle }
	                            	<c:if test="${!empty n.attachmentNo }">
	                            	<i class="fa-solid fa-paperclip" style="color: grey;"></i>
	                            	</c:if>
	                            </td>      
	                            <td>${n.deptName }</td>
	                            <td>${n.count }</td>
	                            <td>${n.createDate }</td>
	                            <td>
		                            <!-- 즐겨찾기 여부 -->
		                            <c:if test="${loginUser.userNo eq n.refUno }">
		                            	<i class="fa-solid fa-bookmark" style="color: #e82c2c;"></i>
		                            </c:if>
	                           </td>      
	                        </tr>
                       </c:forEach>
                        
                        
                    </tbody>
                </table>
            </div>
            <br><br>
            <!-- 검색어 조건으로 페이징처리 -->
            <div id="board-pagebar-area">
                <div id="pagingArea">
               		
                    <ul class="pagination">
	                    <c:choose>
							<c:when test="${empty status }">
							 	<li id="previous-btn" class="page-item disabled"><a class="page-link" href="list.no?currentPage=${pi.currentPage - 1 }">이전</a></li>
							</c:when>
							<c:otherwise>
								<li id="previous-btn" class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage - 1 }&status=${status }&keyword=${keyword}">이전</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1">
							<c:choose>
								<c:when test="${empty status }">
									<c:if test="${p eq pi.currentPage }"> <!-- 내가 보고있는 페이지의 버튼은 disabled처리 -->
										<li class="page-item disabled"><a class="page-link" href="list.no?currentPage=${p }">${p }</a></li>
									</c:if>
									<c:if test="${p != pi.currentPage }">
									<li class="page-item"><a class="page-link" href="list.no?currentPage=${p }">${p }</a></li>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${p eq pi.currentPage }">
										<li class="page-item disabled"><a class="page-link" href="list.no?currentPage=${p }&status=${status }&keyword=${keyword}">${p }</a></li>
									</c:if>
									<c:if test="${p != pi.currentPage }">
										<li class="page-item"><a class="page-link" href="list.no?currentPage=${p }&status=${status }&keyword=${keyword}">${p }</a></li>
									</c:if>
								</c:otherwise>
							</c:choose>
						</c:forEach>
		                    	
                       <c:choose>
							<c:when test="${empty status }">
								<li id="next-btn" class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage + 1 }">다음</a></li>
							</c:when>
							<c:otherwise>
								<li id="next-btn" class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage + 1 }&status=${status }&keyword=${keyword}">다음</a></li>
							</c:otherwise>
						</c:choose>
						
                    </ul>
                     
            
                </div>
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
            
            
       
  
    
   
</body>
</html>

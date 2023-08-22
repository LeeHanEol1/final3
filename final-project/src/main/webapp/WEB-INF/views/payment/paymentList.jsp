<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title> 급여 관리  </title>
   <link href="/final3/resources/css/document-modal.css" rel="stylesheet">
  <style>
	.content{
        width: 1570px;
    }
    
    .content>h1{
    	margin:0px;
    	padding: 30px;
    }
    /*navibar*/
	#payment-tap-area{
		width: 90%;
		height : 50px;
		margin: auto;
	}
	
	#payment-tap-area>ul{
		width:100%;
		list-style-type : none;
	}
	
	#nav-tabs{
		padding : 0;
		display: flex;
	}
	
    #payment-tap-area>ul li{
    	width :110px;
    	margin-right: 5px;
    	float : left;
    }
    
    #payment-tap-area>ul li a{
    	width: 100%;
    	height : 100%;
    	display: inline-block;
    	text-align: center;
    	line-height: 40px;
    	background-color: lightgrey;
    	text-decoration: none;
    	color: black;	
    }
    
   #payment-tap-area>ul li:not(.active):hover{
    	border-top: 1px solid #dee2e6;
		border-left: 1px solid #dee2e6;
		border-right: 1px solid #dee2e6;
		border-top-left-radius:0.25rem;
		border-top-right-radius:0.25rem; 
    }
	
	#payment-tap-area .active a{
	 	border-botton: none;
	 	background-color: #0E6251;
	 	color: white;
	}
    /* 검색영역 */
    #board-search-area{
        width: 90%;
        height : 60px;
        margin:auto;
        margin-top:20px;
        margin-bottom:20px;
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

    
    /* 게시글 목록영역 */
    #payment-list-area{
        width: 90%;
        margin: auto;
    }
    
    #payment-list th, #payment-list td{
        text-align:center;
    }
	
	#payment-list-area>#payment-list{
		width:100%;
		
	}
	
	#payment-list-area i:hover{
    	font-size: 25px;
    	cursor: pointer;
    }
    
    #pagingArea {
        width:fit-content; 
        margin:auto;
    }
	#option-box, #search-box, #payment-tap-area {
		font-family: 'KimjungchulGothic-Bold';
	}
	
	th{
		font-family: 'KimjungchulGothic-Bold';
	}
	
	td{
		 font-family: 'HallymGothic-Regular';
	}
    </style>
</head>
<%@ include file="../common/menubar.jsp" %>
    <div class="content">
    	<h1 style ="font-family: 'KimjungchulGothic-Bold'; " >급여 관리</h1>
    	  <div id="payment-tap-area">
   			<ul id="nav-tabs"  class="nav-tabs nav-pills">
				<li role="presentation"  class="active" >
					<a href="payment.ad">급여관리</a>
				</li>
				<li role="presentation">
				 	<a href="account.ad">급여계좌 관리 </a>
				</li>
			</ul>
  		</div>
		<!-- 검색창 영역  -->
		<div id="board-search-area">
			<form action="#" method="get">
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
					<button type="submit" id="paySearch-btn" class="btn btn-secondary" style="background-color: #0E6251; margin-left: 5px;">
					<i id="search-icon" class="fa-solid fa-magnifying-glass fa-lg" style="color:white;"></i></button>
           		</div>
			</form>
		</div>
		<script>
			//검색 이동  
			$(function(){
				$("#paySearch-btn").on("click",function(){
					location.href="payment.ad"
				});
			})
		
		</script>
		
		<!-- 검색한 부서 고정 script -->
		<c:if test="${not empty deptCode }">
		<script>
			$(function(){
				$("#option-box option[value = ${deptCode}]").attr("selected",true);
				
			});
		</script>
		</c:if>
     	<!-- 게시글 리스트 영역 -->
     	<div id="payment-list-area">
         	<table id="payment-list" class="table table-hover">
             	<thead>
	                 <tr>
	                     <th width="10%">No.</th>
	                     <th width="15%">이름</th>
	                     <th width="15%">부서</th>
	                     <th width="10%">직급</th>
	                     <th width="15%">아이디</th>
	                     <th width="15%">이메일</th>
	                     <th width="10%">생년월일</th>
	                     <th width="10%">입사일</th>
	                 </tr>
           		</thead>
            	<tbody>
              		<c:choose>
              		<c:when test="${empty mList}">
              			<tr>
              				<td colspan="7">조회된 회원이 없습니다.</td>
              			</tr>
              		</c:when>
              		<c:otherwise>
              			<c:forEach var="m" items="${mList}">
              			<tr>
               				<td>${m.userNo}</td>
               				<td>${m.userName}</td>
                  			<td>${m.deptName}</td>
                  			<td>${m.jobName}</td>
                      		<td>${m.userId}</td>      
                       		<td>${m.email}</td>
                       		<td>${m.birth}</td>
                  			<td>${m.empolymentDate}</td>
              			</tr>
              			</c:forEach>
              		</c:otherwise>
              		</c:choose>
         		</tbody>
      		</table>
   			<br>
   			<script>
   				//작성페이지 이동 
   				$(function(){
   					$("#payment-list>tbody").on("click","tr",function(){
   						var userNo = $(this).children().eq(0).text();
   						
   						location.href="enrollPayment.ad?userNo="+userNo;
   					});
   				});
   			</script>
	     	<div id="board-pagebar-area">
				<div id="pagingArea">
					<ul class="pagination">
	                   	<c:choose>
	                   		<c:when test="${pi.currentPage eq 1 }">
		                        <li class="page-item disabled"><a class="page-link">이전</a></li>
	                   		</c:when>
	                   		<c:otherwise>
		                        <li class="page-item"><a class="page-link" href="payment.ad?currentPage=${pi.currentPage-1}&deptCode=${deptCode}&keyword=${keyword}">이전</a></li>
	                   		</c:otherwise>
	                   	</c:choose>
	                   	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
	                        <li class="page-item"><a class="page-link" href="payment.ad?currentPage=${p}&deptCode=${deptCode}&keyword=${keyword}">${p}</a></li>
	                   	</c:forEach>
	                   	<c:choose>
	                   		<c:when test="${pi.maxPage eq pi.currentPage}">
		                        <li class="page-item disabled"><a class="page-link">다음</a></li>
	                   		</c:when>
	                   		<c:otherwise>
		                        <li class="page-item"><a class="page-link" href="payment.ad?currentPage=${pi.currentPage+1}&deptCode=${deptCode}&keyword=${keyword}">다음</a></li>
	                   		</c:otherwise>
	                   	</c:choose>
					</ul>
				</div>
			</div>
        </div>
    </div>   
</body>
</html>



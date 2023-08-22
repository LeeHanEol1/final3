<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>내가 쓴 글</title>
<style>
	.table-responsive{
        width: 80%;
        margin : auto;
    }
	.table-responsive th{
        text-align: center;
    }
	#paging{
    	width:fit-content;
    	margin:auto;
    }
    #button_div{
    	width : 100%;
    	height : 40px;
    }
    #button_div button{
    	height : 100%;
    	width : 100px;
    	font-size : 18px;
    	font-weight : 900;
    }
    #input_search{
    	width : 400px;
    }
    #footer{
    	text-align : center;
    	height : 40px;
    }
    #footer_inner{
    	height : 40px;
    	margin-left : 25%;
    }
    #footer input {
    	float : left;
    	height : 100%;
    }
    #footer select{
    	float : left;
    	height : 100%;
    }
    #footer button{
    	float : left;
    	height : 100%;
    	font-size : 15px;
    	font-weight : 900;
    }
    .table>thead th {
    	font-family: 'KimjungchulGothic-Bold';
    }
    
    .table>tbody th {
     	font-family: 'HallymGothic-Regular';
    }     
</style>
</head>
<body id="body-pd">
<%@ include file="../common/menubar.jsp" %>
 
<div class="content">
	    <div class="table-responsive"> 	
	    	<h1>내가 쓴 글</h1>
	    	<br>
            <table class="table table-hover">
				<thead>
					<tr>
						<th style="width:70px;">번호</th>
						<th style="width:100px;">카테고리</th>
						<th style="width:450px;">제목</th>
						<th style="width:150px;">글쓴이</th>
						<th style="width:180px;">작성일</th>
						<th style="width:100px;">조회</th>
						<th style="width:100px;">좋아요</th>
					</tr>
				</thead>
	            <tbody>
					<c:forEach var="b" items="${list}">
						<tr>
							<th>${b.boardNo}</th>
							<th>${b.categoryName}</th>
							<th>${b.boardTitle}</th>
							<th>${b.boardWriter}</th>
							<th>${b.createDate}</th>
							<th>${b.count}</th>
							<th>${b.recommendCount}</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br><br>
			<div id="footer">
					<form action="myForumList.fr" method="get">
						<div id="footer_inner">
							<select name="category">
						    	<option value="title">제목</option>
						    	<option value="writer">글쓴이</option>
						    </select>
						    	
						    <input type="text" class="form-control form-control" id="input_search" name="searchWord">
						    
						    <button type="submit" class="btn btn-success" style="background-color:#0E6251;">검색</button>		
						</div>		
					</form>
			</div>
			<div id="paging">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pi.currentPage eq 1}">
							<li class="page-item disabled">
								<a class="page-link">이전</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="/final3/${role}/myForumList.fr?currentPage=${pi.currentPage-1}">이전</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
						<li class="page-item">
							<a class="page-link" onclick="pageColor()" href="/final3/${role}/myForumList.fr?currentPage=${p}">${p}</a>
						</li>
					</c:forEach>
					<c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage}">
							<li class="page-item disabled">
								<a class="page-link">다음</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="/final3/${role}/myForumList.fr?currentPage=${pi.currentPage+1}">다음</a>
							</li>
						</c:otherwise>
					</c:choose>					
				</ul>	
			</div>
    	</div>
	</div>
	
<script>
	$(function(){
		$(".page-link").eq(${pi.currentPage}).css('color', 'gray');
	});
	
	$(".table>tbody>tr").click(function(){
		var dv = event.currentTarget;
		var boardNo = dv.children[0].innerText
		location.href = "/final3/${role}/detailList.fr?boardNo=" + boardNo;
	});
	
</script>	
</body>
</html>

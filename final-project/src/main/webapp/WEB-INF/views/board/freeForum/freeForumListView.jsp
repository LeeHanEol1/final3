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
    <title>자유게시판</title>
<style>
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
    #popularity_btn{
    	background-color : white;
    	color : #0E6251;
    }
    #write_btn{
    	float:right;
    }
	.table>tbody>tr:hover{
    	cursor : pointer;
    	
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
    #board-tap-area, #boardList-btn>button, 
    #board-btn-area button{
    	font-family: 'KimjungchulGothic-Bold';
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
<%@ include file="../../common/menubar.jsp" %>
 
<div class="content">
         <div id="board-tap-area">
                <ul id="nav-tabs"  class="nav-tabs nav-pills">
					<li role="presentation">
						<a href="list.no">공지사항</a>
					</li>
					<li role="presentation">
					 	<a href="list.dc">자료실</a>
					</li>
					<li role="presentation">
						<a href="list.re">대여</a>
					</li>
					<li role="presentation" class="active">
						<a href="list.fr">커뮤니티</a>
					</li>
				</ul>
            </div>
	    <div class="table-responsive">
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
			<div id="button_div">
			<button type="button" class="btn btn-primary" id="all_btn" onclick="boardAll()" style="background-color:#0E6251;">전체글</button>
			<button type="button" class="btn btn-primary" id="popularity_btn" onclick="boardPopularity()">인기글</button>
			<button type="button" class="btn btn-primary" id="write_btn" onclick="writing()" style="background-color:#0E6251;">글쓰기</button>
			</div>
			<br><br>
			<div id="footer">
					<form action="list.fr" method="get">
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
								<a class="page-link" href="/final3/${role}/list.fr?currentPage=${pi.currentPage-1}">이전</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
						<li class="page-item">
							<a class="page-link" onclick="pageColor()" href="/final3/${role}/list.fr?currentPage=${p}">${p}</a>
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
								<a class="page-link" href="/final3/${role}/list.fr?currentPage=${pi.currentPage+1}">다음</a>
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
	
	function boardAll(){
		location.href = "/final3/${role}/list.fr?currentPage=1";
	}
	
	function boardPopularity(){
		location.href = "list.fr?currentStatus=popularity"
	}
	
	$(".table>tbody>tr").click(function(){
		var dv = event.currentTarget;
		var boardNo = dv.children[0].innerText
		location.href = "/final3/${role}/detailList.fr?boardNo=" + boardNo;
	});
	
	function writing(){
		location.href = "/final3/${role}/enrollForm.fr";
	}
</script>	
</body>
</html>

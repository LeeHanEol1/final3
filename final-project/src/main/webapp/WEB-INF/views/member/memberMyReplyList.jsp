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
    <title>내가 쓴 댓글</title>
<style>
	.table-responsive{
        width: 80%;
        margin : auto;
        text-align : center;
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
	.table>tbody>tr:hover{
    	cursor : pointer;
    }
</style>
</head>
<body id="body-pd">
<%@ include file="../common/menubar.jsp" %>
 
<div class="content">
	    <div class="table-responsive"> 	
	    	<br>
            <table class="table table-hover" style="width:500px; margin : auto;">
				<thead>
					<tr>
						<th style="width:100px; font-size:30px;">내 댓글</th>
					</tr>
				</thead>
	            <tbody>
					<c:forEach var="r" items="${replyList}">
						<tr>
							<th class="myReply">${r.replyContent} <input type="hidden" value="${r.refBno}"></th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br><br>
			<c:if test="${not empty replyList}">
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
									<a class="page-link" href="/final3/${role}/myReplyList.fr?currentPage=${pi.currentPage-1}">이전</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
							<li class="page-item">
								<a class="page-link" onclick="pageColor()" href="/final3/${role}/myReplyList.fr?currentPage=${p}">${p}</a>
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
									<a class="page-link" href="/final3/${role}/myReplyList.fr?currentPage=${pi.currentPage+1}">다음</a>
								</li>
							</c:otherwise>
						</c:choose>					
					</ul>	
				</div>
			</c:if>
			<br><br><br><br><br>
    	</div>
	</div>
	
<script>
	$(function(){
		$(".page-link").eq(${pi.currentPage}).css('color', 'gray');
	});
	$(".myReply").click(function(){
		var boardNo = $(this).children().val();
		location.href = "detailList.fr?boardNo="+boardNo;
	});
</script>	
</body>
</html>

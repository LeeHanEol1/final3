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
    <title>게시글 상세 페이지</title>
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
	.outer{
		width: 80%;
		height: 800px;
		margin : auto;
	}
	#category_div{
		font-size : 20px;
		font-weight : 900;
	}
	#title_div{
		font-size : 45px;
		font-weight : 900;
	}
	#info_div{
		float : right;
		width : 250px;
		height : 100px;
		border : 2px solid black;
	}
	.outer>div div{
		float:left;
	}
	.table-responsive{
        width: 100%;
        margin : auto;
    }
	.table-responsive th{
        text-align: center;
    }
    #like_div{
    	margin-top : 80px;
    	text-align : center;
    }
    #like_div button{
    	width : 100px;
    	text-align : center;
    }
    #reply_hr{
    	background:rgb(87, 154, 64);
    	border:0;
    	height:3px;
    }
    .reply_div{
    	width:100%;
		overflow:hidden;
		height:auto;
		margin-bottom : 20px;
		padding-bottom : 20px;
    }
    .reply_div:hover{
    	background-color : lightgray;
    	cursor : pointer;
    }
    .reply_div div{
    	float:left;
    	font-weight : 900;		
    }
    .replyWriter_div{
    	width:15%;
    }
    .replyContent_div{
    	width:70%;
    	height:auto;
    }
    .replyDate_div{
    	width:15%;
    }
    #replyWrite_div{
    	width:100%;
    	height:100px;
    	border:1px solid rgb(87, 154, 64);
    	margin-top : 30px;
    }
    #replyWrite_div textarea{
    	height:100%;
    	width:90%;
    	box-sizing : border-box;
    	resize:none;
    	float:left;
    }
    #replyWrite_div button{
    	float:left;
    	width:10%;
    	height:100%;
    	box-sizing:border-box;
    	background-color : rgb(87, 154, 64);
    	color:white;
    }
    .modal-body textarea{
    	height:100%;
    	width:100%;
    	box-sizing : border-box;
    	resize:none;
    	float:left;
    }
    #reply_modal_body button{
    	float:left;
    }
	#paging{
    	width:fit-content;
    	margin:auto;
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
		<div class=outer>
			<div id="inner_div1">
				<div>
					<div id="category_div">
						[${board.categoryName}]
					</div>
					<br>
					<div id="title_div">
						${board.boardTitle}
					</div>
				</div>
				<div id="info_div">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th style="width:80px">조회</th>
									<th style="width:110px">좋아요</th>
									<th style="width:80px">댓글</th>
								</tr>
							</thead>
					        <tbody>
								<tr>
									<th>${board.count}</th>
									<th>${recommend}</th>
									<th>${replyCount}</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<br><br><br><br>
			<div id="content_div">
				${board.boardContent}
			</div>
			<br><br>
			<br>
			<div id="like_div">
				<button id="recommend_btn" type="button" class="btn btn-info" onclick="recommend()">좋아요[${recommend}]</button>
				<button id="deprecated_btn" type="button" class="btn btn-danger" onclick="deprecated()">싫어요[${deprecated}]</button>
			</div>
			<br><br><br>
			<sec:authentication property="principal.Username" var="loginId"/>
			<c:if test="${loginId eq board.refMid}">
				<div>
					<button class="btn btn-secondary" onclick="update();">수정하기</button>
					<button class="btn btn-secondary" onclick="deleteForum();">삭제하기</button>
				</div>		
			</c:if>
			<hr id="reply_hr">
			<c:forEach var="reply" items="${replyList}">
				<div class="reply_div">
					<div class="replyWriter_div">
						${reply.replyWriter}
					</div>
					<div class="replyContent_div">
						${reply.replyContent}
					</div>
					<div class="replyDate_div">
						${reply.createDate}
					</div>
					<input type="hidden" value="${reply.replyNo}">
				</div>
				<hr>
			</c:forEach>
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
									<a class="page-link" href="/final3/${role}/detailList.fr?currentPage=${pi.currentPage-1}&&boardNo=${board.boardNo}">이전</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
							<li class="page-item">
								<a class="page-link" onclick="pageColor()" href="/final3/${role}/detailList.fr?currentPage=${p}&&boardNo=${board.boardNo}">${p}</a>
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
									<a class="page-link" href="/final3/${role}/detailList.fr?currentPage=${pi.currentPage+1}&&boardNo=${board.boardNo}">다음</a>
								</li>
							</c:otherwise>
						</c:choose>					
					</ul>	
				</div>
			</c:if>			
			<div id="replyWrite_div">
					<textarea id="replyText" name="replyText" class="replyText" required></textarea>
					<button id="reply_btn" type="button" onclick="reply_insert();">등록하기</button>						
			</div>
			<br><br><br><br><br>
		</div>
	</div>
<!-- ===================modal======================= -->
<div class="modal" id="reply_modal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글 수정 삭제</h4>
       
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="reply_modal_body">
		<button class="btn btn-info" onclick="reply_update_view();">수정하기</button>
      	<form action="deleteReply.fr" method="post" onsubmit="return checkUser()">
      		<input type="hidden" class="replyNo" name="replyNo">
      		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      		<input type="hidden" name="boardNo" value="${board.boardNo}">
			<button class="btn btn-danger">삭제하기</button>
      	</form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer"> 
        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="close_reply_modal();">취소</button>
      </div>

    </div>
  </div>
</div>

<form action="updateReply.fr" method="post">
	<input type="hidden" class="replyNo" name="replyNo">
	<input type="hidden" name="boardNo" value="${board.boardNo}">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div class="modal" id="reply_update_modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">댓글 수정 삭제</h4>
	       
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
			<textarea rows="20" name="replyContent"></textarea>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-success" data-dismiss="modal">수정</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="close_update_modal()">취소</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</form>

<sec:authentication property="principal.userName" var="userName"/>

<script>
	$(function(){
		$(".page-link").eq(${pi.currentPage}).css('color', 'gray');
	});
	
// 	$(".table>tbody>tr").click(function(){
// 		var dv = event.currentTarget;
// 		var boardNo = dv.children[0].innerText
// 		location.href = "/final3/${role}/detailList.fr?boardNo=" + boardNo;
// 	});
	
	function update(){
 		location.href = "updateForm.fr?boardNo=${board.boardNo}";
	}
	
	function deleteForum(){
		location.href = "delete.fr?boardNo=${board.boardNo}";
	}
	
	function reply_insert(){ //댓글 삽입 ajax
		$.ajax({
			url:"insertReply.fr",
			type:"post",
			data : {
				boardNo : "${board.boardNo}",
				replyContent : $("#replyText").val()
			},
			beforeSend : function(xhr)
            {   
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success : function(result){
            	if(result.model.result == 'RRRRY'){
            		location.reload();            	
            	}else{
            		alert("오류발생");
            	}
            }
		});
	}
	
	function recommend(){ //좋아요 ajax
		$.ajax({
			url : "recommend.fr",
			type : "post",
			data : {
				boardNo : "${board.boardNo}"
			},
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(result){
				if(!isNaN(result)){
					$("#recommend_btn").text("좋아요[" + result + "]");
				}else{
					alert(result);
				}
			}
		});
	}
	
	function deprecated(){ //싫어요 ajax
		$.ajax({
			url : "deprecated.fr",
			type : "post",
			data : {
				boardNo : "${board.boardNo}"
			},
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(result){
				if(!isNaN(result)){
					$("#deprecated_btn").text("싫어요[" + result + "]");
				}else{
					alert(result);
				}
			}
		});		
	}
	
	var replyWriter;
	var replyNo;
	$(".reply_div").click(function(){
		$("#reply_modal").show();
		
		var dv = event.currentTarget;
		replyWriter = dv.children[0].innerText;
		replyNo = dv.children[3].value;
		$(".replyNo").val(replyNo);
	});
	
	function reply_update_view(){
		if(replyWriter == "${userName}"){
			$("#reply_update_modal").show();
		}else{
			alert("로그인 정보가 일치하지 않습니다.");
		}
	}
	
	function checkUser(){
		if(replyWriter == "${userName}"){
			return true;
		}else{
			alert("로그인 정보가 일치하지 않습니다.");
			return false;
		}
	}
	
	function close_update_modal(){
		$("#reply_update_modal").hide();
	}
	
	function close_reply_modal(){
		$("#reply_modal").hide();
	}
</script>	
</body>
</html>

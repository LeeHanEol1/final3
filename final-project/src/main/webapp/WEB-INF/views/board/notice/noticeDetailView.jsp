<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
  <style>
	.content2{ 
         width: 1570px; 
  		 margin-top:-8px;
   }
	
   /* 이전으로버튼 */
   #boardList-btn{
   		margin-right: 150px;
   		text-align: right;
   }
   #boardList-btn > button{
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
	 
    /* 게시글영역 */
    #board-detail-area{
        width: 80%;
        margin: auto;
        margin-top : 10px;
    }
    #board-detail-area p{
    	padding: 10px 30px;
    }
    /* 게시글테이블 */
    #board-detail th{
        text-align:center;
    }
    #reply-input:hover{
    	cursor: pointer;
    }
	#board-tap-area *, #boardList-btn *, #btn-area *, #boardEnroll-btn *, #replyArea button, th, #board-pagebar-area *, .modal-title{
    	font-family: 'KimjungchulGothic-Bold';
    }
    td, #updateReply-modal input{
    	font-family: 'HallymGothic-Regular'
    }
    
   
    </style>
</head>
<body id="body-pd">
        
<%@ include file="../../common/menubar.jsp" %>
​
 <div class="content2">
    
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
            <br><br>
            <div id="boardList-btn">
		         <button class="btn btn-sm" onclick="location.href='list.no'">목록으로</button>
		     </div>
           
            <div id="board-detail-area">
                <table id="board-detail" class="table" align="center">
	                <tr >
	                    <th width="100">제목</th>
	                    <td colspan="2">${b.boardTitle }</td>
	                    <td align="right"><button id="bookmarkButton"><span id="bookmarkIcon"></span></button></td>
	                </tr>
	                <tr>
	                    <th>작성자</th>
	                    <td>${b.deptName }</td>
	                    <th>작성일</th>
	                    <td>${b.createDate }</td>
	                </tr>
	                <tr>
	                    <th>첨부파일</th>
	                    <td colspan="3">
	                        <a href="/final3${at.filePath }" download="${at.originName }">${at.originName}</a>
	                    </td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <td colspan="3"></td>
	                </tr>
	                <tr>
	                    <td colspan="4"><p style="height:300px;">${b.boardContent }</p></td>
	                </tr>
	            </table>
            
            <br><br>
            <div id="reply-detail-area">
                <table id="replyArea" class="table" align="center">
	                <thead>
	                    <tr>
		                   <th colspan="4">
		                       <textarea class="form-control" name="replyContent" id="reply-input" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
		                   </th>
		                   <th style="vertical-align:middle"><button class="btn btn-secondary" id="reply-btn">등록하기</button></th>
	                    </tr>
	                    <tr>
	                        <td colspan="5">댓글(<span id="rcount"></span>)</td>
	                    </tr>
	                </thead>
	                <tbody>
	                    <!-- 댓글출력 -->
	                </tbody>
	            </table>
            </div>
            <div align="center" id="btn-area">
                <c:if test="${loginUser.userNo eq b.boardWriter or loginUser.auth eq 'ROLE_MANAGER' }">
                    <a class="btn btn-default" onclick="formSubmit(1);">수정하기</a>
                   <a class="btn btn-default" onclick="formSubmit(2);">삭제하기</a>
               </c:if>
           </div>
           <br><br><br>
        </div>
        
    </div>
            
            <br><br>
            
            <script>
            // 수정/삭제시 글번호와 첨부파일 번호 보내기
            function formSubmit(num){
            	var formObj = $("<form>");
            	
            	var scr = $("<input>").prop("type","hidden").prop("name","${_csrf.parameterName}").prop("value","${_csrf.token}");
            	var boardNo = $("<input>").prop("type", "hidden").prop("name", "boardNo").prop("value", "${b.boardNo}");
            	var filePath = $("<input>").prop("type","hidden").prop("name","filePath").prop("value","${at.filePath}");
            	var obj = formObj.append(boardNo).append(scr);
            	
            	if(num == 1){ // 수정
            		obj.attr("action","updateForm.no").attr("method","get");
            	}else{ // 삭제
            		obj.append(filePath);
            		obj.attr("action","delete.no").attr("method","post");
            	}
            	
            	$("body").append(obj);
            	
            	obj.submit();
            
            	}
            
            </script>
        
              <!-- 댓글 수정/삭제 모달시작 -->
   	<div class="modal fade" id="updateReply-modal" role="dialog">
		<div class="modal-dialog">
			    
			<!-- Modal content-->
			<div class="modal-content">
				
				    <div class="modal-header">
				       <button type="button" class="close" data-dismiss="modal">&times;</button>
				       <h4 class="modal-title">댓글 수정</h4>
				    </div>
				    <div class="modal-body">
				    
				      	<div class="form-group">
		                    <label for="update_replyNo">댓글 번호</label>
		                    <input class="form-control" id="update_replyNo" name="replyNo" readonly>
		                </div>
		                <div class="form-group">
		                    <label for="update_replyContent">댓글 내용</label>
		                    <input class="form-control" id="update_replyContent" name="replyContent">
		                </div>
		                <div class="form-group">
		                    <label for="update_replyWriter">댓글 작성자</label>
		                    <input class="form-control" id="update_replyWriter" name="replyWriter" readonly>
		                </div>
				      
				    </div>
				    <div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="updateReply()">수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteReply()">삭제</button>
				    </div>
			    
			  </div>
		</div>
	</div>
  <!-- 댓글 수정/삭제 모달 끝 -->
           
     <script>
     // 댓글 입력창 빈칸일때 알람
 	$("#reply-btn").click(function(){
 		chkblankReply = $("#reply-input").val();
 		if(chkblankReply.length==0){
 			alert("댓글을 입력해주세요.")
 		}else{
 			insertReply();
 		}
 	});
     
    // 댓글불러오기
    $(function(){
    	selectReplyList();
    	
    });
    	function selectReplyList(){
    		
	    	$.ajax({
	    		url : "replyList.no",
	    		data : {
	    			boardNo : "${b.boardNo}"
	    		},
	    		beforeSend : function(xhr){
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	    		success : function(list){
	    			var str = "";    				
	    			for(var i in list){
	    				str += "<tr id='reply-row'>"
	    					+ "<td>" + list[i].replyNo + "</td>"
	    					+ "<th>" + list[i].deptName + " " + list[i].userName + "</th>"
	    					+ "<td>" + list[i].replyContent + "</td>"
	    					+ "<td>" + list[i].createDate + "</td>";
	    				 if (${loginUser.userNo} == list[i].replyWriter) {
	    		            str += 
	    		            	"<td><button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#updateReply-modal'>댓글 수정</button></td></tr>"
	    				}else{
	    					str += "<td></td></tr>"
	    				}
	    		        
	    			}
	    			
	    			
	    			$("#replyArea tbody").html(str);
	    			$("#rcount").text(list.length);
	    		},
	    		error : function(){
	    			console.log("통신오류");
	    		}
	    	});
    
    	};
    	
    
    // 댓글쓰기
   function insertReply(){
    	
    	$.ajax({
    		url : "insertReply.no",
    		data : {
    			replyWriter : "${loginUser.userNo}",
    			replyContent : $("#reply-input").val(),
    			refBno : "${b.boardNo}"
    		},
    		beforeSend : function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
    		success : function(result){
    			if(result == "success"){
	    			selectReplyList();
	    			$("#reply-input").val("");
    			}
    		},
    		error : function(){
    			console.log("통신오류");
    		}
    	});
    	
    }
    
    // 댓글 수정 모달에 정보 띄우기
   $("#replyArea > tbody").on("click", "#reply-row", function () {
	    var replyNo = $(this).children().eq(0).text();
	    var replyContent = $(this).children().eq(2).text();
	    var replyWriter = $(this).children().eq(1).text();

	    $("#update_replyNo").val(replyNo);
	    $("#update_replyContent").val(replyContent);
	    $("#update_replyWriter").val(replyWriter); 

	});
    
    // 댓글 수정
   function updateReply(){
    	
    	$.ajax({
    		url : "updateReply.no",
    		data : {
    			replyNo : $("#update_replyNo").val(),
    			replyContent : $("#update_replyContent").val()
    		},
    		beforeSend : function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
    		success : function(result){
    			if(result == "success"){
    				alert("댓글을 수정했습니다.");
    				selectReplyList();
    			}
    		},
    		error : function(){
    			console.log("통신오류");	
    		}
    	});
    }
    
    // 댓글 삭제
   function deleteReply(){
    	
    	$.ajax({
    		url : "deleteReply.no",
    		data : {replyNo : $("#update_replyNo").val()},
    		beforeSend : function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success : function(result){
            	if(result == "success"){
    				alert("댓글을 삭제했습니다.");
    				selectReplyList();
    			}
            },
            error : function(){
            	console.log("통신오류");
            }
    	});
    }
    
    // 즐겨찾기여부 불러오기
    $(function(){
    	selectBookmark();
    });
    
    function selectBookmark(){
    	
    	$.ajax({
    		url : "bookmark.no",
    		data : {
    			boardNo : "${b.boardNo}",
    			userNo :  "${loginUser.userNo}"
    		},
    		beforeSend : function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
    		success : function(result){
    			
    			if(result == "Y"){ // 즐겨찾기 한 글이라면 빨간 아이콘
    				var icon = $('<i>').addClass('fa-solid fa-bookmark').css('color', '#e91616');
    			    $('#bookmarkIcon').append(icon);
    			}else{ // 즐겨찾기 안했으면 빈 아이콘
    			    var icon = $('<i>').addClass('fa-regular fa-bookmark');
    			    $('#bookmarkIcon').append(icon);  
    			}
    			
    		},
    		error : function(){
    			console.log("통신오류");
    		}
    	});
    };
    // 즐겨찾기 추가 또는 즐겨찾기 해제
    
    $("#bookmarkButton").click(function(){
    	
    	$.ajax({
    		url : "checkBookmark.no",
    		data : {
    			boardNo : "${b.boardNo}",
    			userNo : "${loginUser.userNo}"
    		},
    		beforeSend : function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
    		success : function(result){
    			if(result == 'I'){ // 즐겨찾기 추가한 경우
    				window.alert("즐겨찾기에 추가되었습니다. \n메인페이지에서 확인하세요.");
    				$('#bookmarkIcon').remove();
    			}else if(result == "D"){ // 즐겨찾기 해제한 경우
    				window.alert("즐겨찾기에서 해체되었습니다.");
    				$('#bookmarkIcon').remove();
    			}else{
    				console.log("즐겨찾기 기능 실패");
    			}
    			
    			selectBookmark();
    			location.reload();
    		},
    		error : function(){
    			console.log("통신오류");
    		}
    	});
    });
   
    </script>
</body>
</html>

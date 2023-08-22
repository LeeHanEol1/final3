<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
    .content2{ 
        width: 1570px; 
  		margin-top:-9px;
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
 	 #board-tap-area *, th, #btn-area *{
    	font-family: 'KimjungchulGothic-Bold';
    }
    td{
    	font-family: 'HallymGothic-Regular'
    }
    
    </style>
</head>
<body>
        
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
            
           
            <div id="board-detail-area">
                <form id="updateForm" method="post" action="update.no" enctype="multipart/form-data">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="boardNo" value="${b.boardNo }">
                <table id="board-detail" class="table" align="center">

	                <tr >
	                    <th width="100">제목</th>
	                    <td colspan="3"><input type="text" id="title" class="form-control" value="${b.boardTitle }" name="boardTitle" required></td>
	                </tr>
	                <tr>
	                    <th>작성자</th>
	                    <td><input type="text" id="writer" class="form-control" value="${b.deptName }"readonly>
                            <input type="hidden" name="boardWriter" value="${b.boardWriter }"></td>
	                    <th>작성일</th>
	                    <td><input type="text" class="form-control" value="${b.createDate }" readonly></td>
	                </tr>
	                <tr>
	                    <th>첨부파일</th>
	                    <td colspan="2">
                            <input type="file" id="upfile" class="form-control-file border" name="upfile">
                        	
                        	<c:if test="${not empty at.originName }">
	                        	    현재 업로드된 파일 : 
	                            <a href="${at.changeName }" id="uploaded" >${at.originName }</a>
	                            <input type="hidden" name="attachmentNo" value="${at.attachmentNo }">
	                            <input type="hidden" name="originName" value="${at.originName }">
	                            <input type="hidden" name="changeName" value="${at.changeName }">
                            </c:if>
	                    </td>
	                    <td>
	                    	<button type="button" class="btn btn-sm btn-default" onclick="resetAttachment()">지우기</button>
	                    </td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <td colspan="3"></td>
	                </tr>
	                <tr>
	                    <td colspan="4"><p style="height:300px;"><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardContent" required>${b.boardContent }</textarea></p></td>
	                </tr>
	            </table>
                <br>
                <div align="center" id="btn-area">
                    <button type="submit" class="btn btn-default">수정하기</button>
                    <button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
            
            
            <br><br><br>
            </div>
        
    </div>
        <br><br>
        
      <script>
      function resetAttachment(){
    	  $("#upfile").val("");
      };
      
      </script>
​
    
    
</body>
</html>
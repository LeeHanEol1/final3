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
     .content{
        width: 1570px;
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
    #board-detail th,  #board-detail td{
        text-align:center;
        vertical-align: middle;
    }
    #selectBox{
    	font-size: 15px !important;
    	border: none;
    }
    #board-tap-area *, #btn-area *, th{
    	font-family: 'KimjungchulGothic-Bold';
    }
    td{
    	font-family: 'HallymGothic-Regular'
    }
    
    </style>
</head>
<body>
        
    <%@include file="../../common/menubar.jsp" %>

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
            <br><br>
            
           
            <div id="board-detail-area">
                <form id="enrollForm" method="post" action="insert.no" enctype="multipart/form-data">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="categoryCode" value="B1">
                <table id="board-detail" class="table table-hover" align="center">

	                <tr >
	                    <th width="100">제목</th>
	                    <td colspan="3"><input type="text" id="title" class="form-control" name="boardTitle" required></td>
	                </tr>
	                <tr>
	                    <th>작성자</th>
	                    <td><input type="text" id="boardWriter" class="form-control" value="${loginUser.deptName }" readonly>
                            <input type="hidden" name="boardWriter" value="${loginUser.userNo }"></td>
	                    <th>중요도</th>
	                    <td><select id="selectBox" name="importanceLevel" style=" width :100%; height:100%; font-size: 20px; ">
                            <option value="R">일반</option>
                            <option value="I">중요</option>
                         </select></td>
	                </tr>
	                <tr>
	                    <th>첨부파일</th>
	                    <td colspan="3">
                            <input type="file" id="upfile" class="form-control-file border" name="upfile">
	                    </td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <td colspan="3"></td>
	                </tr>
	                <tr>
	                    <td colspan="4"><p style="height:300px;"><textarea id="content" class="form-control" rows="15" style="resize:none;" name="boardContent" required>${b.boardContent }</textarea></p></td>
	                </tr>
	            </table>
                <br>
                <div align="center" id="btn-area">
                    <button type="submit" class="btn btn-default">등록하기</button>
                    <button type="reset" class="btn btn-default" onclick="location.href='list.no'">취소하기</button>
                </div>
            </form>
             <br><br>
           


             
            
            <br><br><br>
            </div>
        
    </div>
    
    
</body>
</html>
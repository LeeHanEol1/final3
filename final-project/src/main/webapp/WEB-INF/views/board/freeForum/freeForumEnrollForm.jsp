<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>게시판 글작성</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<script type="text/javascript" src="/final3/resources/ckeditor/ckeditor.js"></script>
  
  
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
	.ck-editor__editable{
		height: 400px;
	}
	#header{
		font-size : 25px;
		font-weight : 900;
		margin-bottom : 20px;
	}
  	#header input{
  		width : 75%;
  	}
  	#header select{
  		font-size : 20px;
  	}
  	#footer{
  		width : 100%;
  		text-align : center;
  		margin-top : 45px;
  	}
  	#footer button{
  		width : 100px;
  	  	margin : auto;
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
	</div>
	<div class=outer>
		<form action="insert.fr" method="POST" enctype="multipart/form-data">
			<div id="header">
				제목 <input type="text" name="boardTitle">
				<select name="categoryCode">
					<option value="B4">전체</option>
					<option value="B5">질문</option>
					<option value="B6">자랑</option>
				</select>
			</div>
	    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    	<input type="hidden" name="role" value="${role}"/>
			<textarea class="form-control" id="p_content" name="boardContent"></textarea>
	    	<div id="footer">
	    		<button type="submit" class="btn btn-success">확인</button>
	    		<button type="button" class="btn btn-danger">취소</button>
	    	</div>
	    </form>
	</div>
    

<script>
	var ckeditor_config = {
			   resize_enaleb : false,
			   enterMode : CKEDITOR.ENTER_BR,
			   shiftEnterMode : CKEDITOR.ENTER_P,
			   filebrowserUploadUrl : '<c:url value="ckupload" />?${_csrf.parameterName}=${_csrf.token}',
			   height : 500
			 };

	CKEDITOR.replace('p_content', ckeditor_config);
	
</script>

</body>
</html>
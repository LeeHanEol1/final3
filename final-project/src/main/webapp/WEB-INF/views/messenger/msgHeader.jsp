<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	@font-face {
    font-family: 'KimjungchulGothic-Bold';
    font-style: normal;
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2') format('woff2');
	}
	
	@font-face {
    font-family: 'HallymGothic-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2204@1.0/HallymGothic-Regular.woff2') format('woff2');
    font-style: normal;
	}
	.messenger_content {
	    background-color:#0E6251;
	    width:100%;
	    height: 750px;
	    margin:auto;
	}
	.innerOuter {
	    border:1px solid lightgray;
	    width:970px;
	    height:100%;
	    margin:auto;
	    padding:3% 7%;
	    background-color:white;
	}
    
    /* navi + 검색창 영영  */    
	.innerOuter>#msg_header{
		width:100%;
		height: 130px;
		margin-top: 10px;
		margin-bottom : 10px;
	}
    /* navi 영역 */
    #msg_header>#msg_nav{
       	width: 25%;
       	height: 100%;
       	float : left;
    }
        
	#msg_nav>ul{
		list-style-type: none;
		padding: 0;
		margin : 0;
		
	}
        
    #msg_nav li a{
		text-decoration-line: none;
		color: black;
		font-size: 20px;
		
	}

	#msg_nav li a:hover{
		font-size :23px;
		color: #009966;	
	}
	
	h2, a, th, button, select{
		font-family: 'KimjungchulGothic-Bold';
	}
	
	td, input {
	 	font-family: 'HallymGothic-Regular';
 	}
   	
</style>
</head>
<body>
<c:if test="${not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
<c:if test="${not empty errorMsg }">
	<script>
		alert("${errorMsg}")		
	</script>
	<c:remove var="errorMsg" scope="session"/>
</c:if>

<div class="messenger_content">
	<div class="innerOuter">
		<h2>쪽지 <i id="messenger" class="fa-sharp fa-solid fa-paper-plane fa-sm" style="color: #0E6251;"></i></h2> 
		<div id="msg_header">
			<!-- 쪽지 네비영역 -->
			<div id="msg_nav">
				<ul>
					<li><a href="insert.mg">쪽지쓰기</a></li>
					<li><a href="list.mg" id="receive">받은쪽지함</a></li>
					<li><a href="slist.mg">보낸쪽지함</a></li>
					<li><a href="tlist.mg" id="trash">휴지통</a></li>
				</ul>
			</div>
			
			<script>
				var $userNo = '${loginUser.userNo}'
				//읽지 않은 쪽지수 조회해오기 
				$(function(){
					
					$.ajax({
						url : "countRecvMsg.mg",
						
						data : {userNo : $userNo},
						
						success : function(count){
							if(count>0){
								var str ="<b>("+count+")</b>"
								$("#receive").append(str);
							}
							
						},
						
						error : function(){
							console.log("통신 실패 ");
						}
					})
				})
				
				//삭제된 쪽지수 조회해오기 
				$(function(){
					
					$.ajax({
						url : "countTrashMsg.mg",
						
						data : {userNo : $userNo},
						
						success : function(count){
							if(count>0){
								var str ="<b>("+count+")</b>"
								$("#trash").append(str);
							}
							
						},
						
						error : function(){
							console.log("통신 실패 ");
						}
					})
					
					
				});
			</script>
						
	       
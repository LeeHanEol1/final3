<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<head>
  <title>마이페이지</title>
  <style>
  	#head{
  		width:100%;
  		height:70px;
  		text-align : center;
  		font-weight : 900;
  		font-size : 50px;
  	}
    .container {
      max-width: 800px;
      margin: 0 auto;
      height : 900px;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }
    #top_buttons_div{
    	width:200px; height:200px;
    	float:left;
    	margin-left:150px;
    	text-align : center;
    	font-size : 20px;
    	font-weight : 900;
    	line-height : 47px;
    }
    #top_buttons_div div{
    	height:25%;
    	width:100%;
    	box-sizing : border-box;
    	border : 1px solid black;
    }
    #top_buttons_div div:hover{
    	background-color : #0E6251;
    	color : white;
    	cursor: pointer;
    }
    #top_buttons_div a{
    	text-decoration-line: none;
    	color : black;
    }
    .inner_container{
    	width : 85%;
    	margin : auto;
    }
    .inner_container input{
    	font-size : 18px;
    	font-weight : 900;
    }
    #member_photo{
    	border : 1px solid black;
    	height : 200px;
    	width : 200px;	
    }
    .container span{
    	font-size : 20px;
    	font-weight : 900;
    }
    .inner_div{
    	height:36px;
    }
    .inner_div span{
    	float:left;
    	line-height : 35px;
    }
    .inner_div input{
    	float:left;
    	height:100%;
    	margin-left:15px;
    	text-align:center;
    }
    #footer{
    	text-align:center;
    	width:100%;
    	height:50px;
    }
    #footer button{
    	height:100%;
    	font-size:18px;
    	font-weight:900;
    }
  </style>
</head>
<body>
<%@include file="../common/menubar.jsp" %>

<div class="content">
	<div class="container">
		<div id="head">
			마이페이지
		</div>
		<br>
		<div style="height:200px;" >
			<c:choose>
				<c:when test="${not empty memberAttachment}">
					<img src="/final3/${memberAttachment.changeName}" id="member_photo" style="margin-left:20%; float:left;">
				</c:when>
				<c:otherwise>
					<img src="/final3/resources/image/청록이.jpg" id="member_photo" style="margin-left:20%; float:left;">
				</c:otherwise>
			</c:choose>
			<div id="top_buttons_div">
				<div>
					내가 쓴 글
				</div>
				<div>
					내가 쓴 댓글
				</div>
			</div>
		</div>
		<div class="inner_container">
			<hr>
			<div id="inner_1" class="inner_div">
				<span>사번</span> <input type="text" class="form-control" style="width:80px; height:100%;" value="${member.userNo}" readonly>
				<span style="margin-left : 50px;">아이디</span> <input type="text" class="form-control" style="width:300px;" value="${member.userId}" readonly>				
			</div>
			<hr>
			<div id="inner_2" class="inner_div">
				<span>이름</span> <input type="text" class="form-control" style="width:100px;" value="${member.userName}" readonly>
				<span style="margin-left:50px;">전화번호</span> <input type="text" class="form-control" style="width:200px;" value="${member.phone}" readonly>
			</div>
			<hr>
			<div id="inner_3" class="inner_div">
				<span>이메일</span> <input type="text" class="form-control" style="width:250px;" value="${member.email}" readonly>
				<span style="margin-left : 50px;">출생일</span> <input type="text" class="form-control" style="width:150px;" value="${member.birth}" readonly>
			</div>
			<hr>
			<div id="inner_4" class="inner_div">
				<span>주소</span> <input type="text" class="form-control" style="width:580px;" value="${member.address}" readonly>
			</div>
			<hr>
			<div id="inner_4" class="inner_div">
				<span>부서</span> <input type="text" class="form-control" style="width:150px;" value="${member.deptName}" readonly>
				<span style="margin-left:30px">직책</span> <input type="text" class="form-control" style="width:70px;" value="${member.jobName}" readonly>
				<span style="margin-left:30px">입사일</span> <input type="text" class="form-control" style="width:150px;" value="${member.empolymentDate}" readonly>
			</div>
			<hr>
			<div id="footer">
				<button type="button" class="btn btn-success" onclick="showModal('privacy');">개인정보수정</button>
				<button type="button" class="btn btn-warning" onclick="showModal('changePwd');">비밀번호변경</button>
				<br><br>
				<form action="delete.me" method="post" onsubmit="return deleteMember();">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button type="submit" class="btn btn-danger">회원탈퇴</button>
				</form>
			</div>
		</div>
	</div>
	<br><br><br>
</div>
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">비밀번호를 입력해주세요</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <input type="password" class="form-control" id="checkPwd">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" class="btn btn-success" data-dismiss="modal" onclick="modal_submit()">확인</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="modal_close()">취소</button>
        <input type="hidden" id="type">
      </div>

    </div>
  </div>
</div>
<script>
	var msg = "${alertMsg}";
	if(msg != ""){
		alert(msg);
		<c:remove var="alertMsg" scope="session"/>
	}
	
	function showModal(type){
		$("#type").val(type);
		$("#myModal").show();
	}
	function modal_close(){
		$("#myModal").hide();
	}
	function updateForm(){
		location.href="updateForm.me";
	}
	function changePwdForm(){
		location.href="changePwdForm.me";
	}
	function modal_submit(){
		var type = $("#type").val();
		$.ajax({
			url:'checkPwd.me',
			type:'get',
			data:{
				password : $("#checkPwd").val()
			},
			success:function(result){
				if(result=="true" && type=="privacy"){
					updateForm();
				}else if(result=="true" && type=="changePwd"){
					changePwdForm();
				}else{
					alert("비밀번호가 일치하지않습니다.");
					$("#checkPwd").val('');
				}
			}
		});
	}
	
	function deleteMember(){
		var message = confirm("정말로 탈퇴하시겠습니까?");
		if(message == true){
			return true;
		}else{
			return false;
		}
	}
	
	$("#top_buttons_div").children().eq(0).click(function(){ //내가 쓴 글 클릭시
		location.href = "myForumList.fr";
	});
	
	$("#top_buttons_div").children().eq(1).click(function(){ //내가 쓴 댓글 클릭시
		location.href = "myReplyList.fr";
	});
</script>
</body>
</html>

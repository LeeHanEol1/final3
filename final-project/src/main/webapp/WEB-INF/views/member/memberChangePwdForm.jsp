<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
    .container {
      max-width: 800px;
      margin: 0 auto;
      margin-top:200px;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }
	.container span{
    	font-size : 20px;
    	font-weight : 900;
	}
	.container input{
		margin-top:10px;
	}
	#btn_div{
		text-align:center;
	}
	#btn_div button{
		width : 100px;
		font-size:20px;
	}
</style>
</head>
<body>
<%@include file="../common/menubar.jsp" %>
<div class="content">
	<form action="updatePwd.me" method="post" onsubmit="return checkForm()">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="container">
			<span>비밀번호 입력</span><br>
			<input type="password" class="form-control" id="password" name="password" required minlength="8" placeholder="새로운 비밀번호를 입력하세요(8글자 이상)">
			<br><br>
			<span>비밀번호 확인</span><br>
			<input type="password" class="form-control" id="checkPassword" required minlength="8" placeholder="비밀번호를 한번 더 입력해주세요">
			<br>
			<div id="btn_div">
				<button type="submit" class="btn btn-success">확인</button>
				<button type="button" class="btn btn-danger" onclick="history.go(-1)">취소</button>		
			</div>
		</div>	
	</form>
</div>
<script>
	function checkForm(){
		if($("#password").val() != $("#checkPassword").val()){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}else{
			return true;
		}
	}
</script>
</body>
</html>
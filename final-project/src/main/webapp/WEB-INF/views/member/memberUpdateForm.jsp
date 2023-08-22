<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }
    #top_buttons_div{
    	border : 1px solid black;
    	width:200px; height:100px;
    	float:left;
    	margin-left:150px;
    	text-align : center;
    	font-size : 20px;
    	font-weight : 900;
    	line-height : 47px;
    }
    #top_buttons_div div{
    	height:50%;
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
    .inner_container span{
    	font-weight:900;
    	font-size : 20px;
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
	<form action="update.me" method="post" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="deletePhotoCheck">
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
						사진 수정
					</div>
					<div>
						사진 삭제
					</div>
				</div>
			</div>
			<div class="inner_container">
				<hr>
				<div id="inner_1" class="inner_div">
					<span>사번</span> <input type="text" class="form-control" style="width:80px; height:100%;" value="${member.userNo}"  name="userNo" readonly>
					<span style="margin-left : 50px;">아이디</span> <input type="text" class="form-control" style="width:300px;" value="${member.userId}" readonly>				
				</div>
				<hr>
				<div id="inner_2" class="inner_div">
					<span>이름</span> <input type="text" class="form-control" style="width:100px;" value="${member.userName}" name="userName" required>
					<span style="margin-left:50px;">전화번호</span> <input type="text" class="form-control" style="width:200px;" maxlength="13" required value="${member.phone}" name="phone">
				</div>
				<hr>
				<div id="inner_3" class="inner_div">
					<span>이메일</span> <input type="text" class="form-control" style="width:250px;" value="${member.email}" name="email" required>
					<span style="margin-left : 50px;">출생일</span> <input type="date" class="form-control" style="width:150px;" value="${member.birth}" name="birth" required>
				</div>
				<hr>
				<div id="inner_4" class="inner_div">
					<span>주소</span> <input type="text" id="kakaoAddress" class="form-control" style="width:580px;" value="${mainAddress}" name="address" readonly required>
				</div>
				<br>
				<div id="inner_5" class="inner_div">
					<span>상세주소</span> <input type="text" class="form-control" style="width:540px;" value="${subAddress}" name="detailAddress">
				</div>
				<hr>
				<div id="inner_6" class="inner_div">
					<span>부서</span> <input type="text" class="form-control" style="width:150px;" value="${member.deptName}" readonly>
					<span style="margin-left:30px">직책</span> <input type="text" class="form-control" style="width:70px;" value="${member.jobName}" readonly>
					<span style="margin-left:30px">입사일</span> <input type="text" class="form-control" style="width:150px;" value="${member.empolymentDate}" readonly>
				</div>
				<hr>
				<div id="footer">
					<button type="submit" class="btn btn-success">수정</button>
					<button type="button" class="btn btn-warning" onclick="history.go(-1)">취소</button>
				</div>
			</div>
		</div>
		<input type="file" id="upfile" name="upfile" style="display:none;" onchange="readURL(this);">
		<br><br><br>
	</form>
</div>
<script>
	//사진 수정 클릭시 파일 선택창 띄우기
	$("#top_buttons_div").children().eq(0).click(function(){
		$("#upfile").click();
	});
	
	//사진 삭제시 청록이로 변경
	$("#top_buttons_div").children().eq(1).click(function(){
		$("#member_photo").attr("src", "/final3/resources/image/청록이.jpg");
		$("input[name=deletePhotoCheck]").val('true');
		$("#upfile").val('');
	});
	
	//사진 미리보기
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('member_photo').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		}
	}
	
    $("input[name=phone]").keydown(function(event) {
        var key = event.charCode || event.keyCode || 0;
        $text = $(this);
        if (key !== 8 && key !== 9) {
            if ($text.val().length === 3) {
                $text.val($text.val() + '-');
            }
            if ($text.val().length === 8) {
                $text.val($text.val() + '-');
            }
        }

        return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
    	});
    
	$("#kakaoAddress").click(function(){	
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	$("#kakaoAddress").val(data.address); // 주소 넣기
                $("#detailAddress").focus(); //상세입력 포커싱
            }
        }).open();		
	});    
</script>
</body>
</html>

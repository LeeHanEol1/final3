<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>Document</title>
    <style>
        .outer{
            width: 100%;
            height: 1200px;
        }
        #enroll_form{
            border: 1px solid black;
            border-radius: 20px;
            margin: auto;
            margin-top: 25px;;
            width: 500px;
            height: 1000px;
        }
        #enroll_form>div{        
            margin: 30px;
        }
        #enroll_form>div>h2{
            font-size: 20px;
            font-weight: 900;
            margin-bottom: 20px;
        }
        p{
            font-weight: 600;
            margin-bottom: 7px;
            margin-top: 15px;
        }
        .form-control{
            border: 1px solid black;
            width: 200px;
        }
        #id_div>input{
            float: left;
        }
        #id_div>button{
            float: left;  
            margin-left: 4px;  
        }
        #enroll_form>div>input{
            width: 100%;
        }
        #select_div div{
            float: left;
        }
        #select_div>div{
            margin-right: 100px;
        }
        #button_div{
            width: 100%;
            height: 150px;
        }
        #button_div button{
            margin-left: 78px;
            margin-top: 50px;
            width : 100px;
        }
    </style>
</head>
<body>
    <div class="outer">
        <form action="/final3/admin/insert.me" name="insertForm" method="post" onsubmit="return checkForm()">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        	<input type="hidden" name="idChecking" value="false">
            <div id="enroll_form">
                <div>
                    <h2>회원가입</h2>
                    <p>아이디</p>
                    <div id="id_div">
                        <input type="text" class="form-control form-control" name="userId" maxlength="12" placeholder="12글자 이하" required>
                        <button type="button" class="btn btn-primary" onclick="idCheck();">중복체크</button>
                    </div>
                    <br><br>
                    <p>이름</p>
                    <input type="text" class="form-control form-control" name="userName" required>
                    <p>전화번호</p>
                    <input type="text" class="form-control form-control" name="phone" maxlength="13" required>
                    <p>이메일</p>
                    <input type="text" class="form-control form-control" name="email" required>
                    <p>주소</p>
                    <input type="text" id="kakaoAddress" class="form-control form-control" name="address" placeholder="클릭하세요" readonly required>
                    <p>상세주소</p>
                    <input type="text" id="detailAddress" class="form-control form-control" name="detailAddress" required>
                    <p>생년월일</p>
                    <input type="date" class="form-control form-control" name="birth" required>
                    <div id="select_div">
                        <div>
                            <p>부서</p>
                            <select name="deptCode">
                                <option value="D2">회계관리부</option>
                                <option value="D3">마케팅부</option>
                                <option value="D4">국내영업부</option>
                                <option value="D5">해외영업부</option>
                                <option value="D6">기술지원부</option>
                                <option value="D7">총무부</option>
                                <option value="D8">회계부</option>
                                <option value="D9">인사관리부</option>
                                <option value="D1">기타</option>
                            </select>
                        </div>
                        <div>
                            <p>직급</p>
                            <select name="jobCode">
                                <option value="J1">대표</option>
                                <option value="J2">부사장</option>
                                <option value="J3">부장</option>
                                <option value="J4">차장</option>
                                <option value="J5">과장</option>
                                <option value="J6">대리</option>
                                <option value="J7">사원</option>
                            </select>
                        </div>
                    </div>
                    <br><br><br>
                    <p>입사일</p>
                    <input type="date" class="form-control form-control" name="empolymentDate" required>
                    <div id="button_div">
                        <button type="submit" class="btn btn-primary">확인</button>
                        <button type="button" onClick="history.go(-1)" class="btn btn-danger">취소</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

<script>
    $(function(){
        $("input[name=userId]").keyup(function(event){
            if(!(event.keyCode >=37 && event.keyCode<=40)){
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
            }
        });
    });

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
    
    function idCheck(){
    	var userId = $("input[name=userId]").val();
    	if(userId == ''){
    		alert("아이디를 입력해주세요");
    	}else{
	    	$.ajax({
	    		url : "/final3/admin/idCheck.me",
	    		type : "get",
	    		data :{
	    			userId : userId
	    		},
	    		success : function(result){
	    			if(result == "1"){
	    				alert("사용가능한 아이디입니다");
	    				$("input[name=idChecking]").val('true');
	    				$("input[name=userId]").attr("readonly", true);
	    			}else{
	    				alert("중복된 아이디입니다. 다시입력해주세요");
	    				$("input[name=idChecking]").val('false');
	    			}
	    		}
	    	});	
    	}
    }
    
    function checkForm(){
    	if($("input[name=idChecking]").val() == 'false'){
    		alert("아이디 체크를 해주세요");
    		return false;
    	}else{
    		return true;
    	}
    }
    
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
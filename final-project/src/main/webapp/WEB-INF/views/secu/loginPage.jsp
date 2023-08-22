<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
		/* 전체  */
        .loginDiv{
            background: #3a9775;
            padding-bottom: 40px;
            border-radius: 15px;
            text-align: center;
            width: 500px;
            height: 400px;
            margin: auto;
            margin-top: 180px;
        }
        
        .loginForm{
            padding-top: 20px;
            border-radius: 15px;
            text-align: center;
        }

		.heading img{
			width: 100px;
			height: 100px;
			padding-bottom: 20px;
		}

        .loginId{
            padding: 0 40px;
	        margin: 0 0 25px 0;
	        position: relative; 
        }
        
        .loginPwd{
        	padding: 0 40px;
	        margin: 0 0 15px 0;
	        position: relative; 
        }

        .loginId i, .loginPwd i{
            position: absolute;
            top: 12px;
            left: 85px;
            font-size: 17px;
            color: #A5D6A7;
            transition : all 0.5s ease 0s;
        }
        
        /* input 아이디/ 비밀번호 */
        .form-control{
            background: #f0f0f0;
            border: none;
            border-radius: 20px;
            box-shadow: none;
            padding: 0 20px 0 45px;
            height: 40px;
            transition: all 0.3s ease 0s;
           	width: 300px;
        }
        
        .form-control:focus + i{
            color: #4CAF50;
        }
        
        .form-control:focus{
            background: #e0e0e0;
            box-shadow: none;
            outline: 0 none;
        }

        .form-group{
            padding: 0 40px;
            margin: 0 0 25px 0;
            position: relative;
        }
    
        .form-check-label:hover{
            color: #000;
        }

		/* 체크박스 */
        .rememberChk{
            float: left;
            width: 20px;
            height: 20px;
            background: #fff;
            border-radius: 50%;
            position: relative;
            margin: 5px 0 0 5px;
            border: 1px solid #11a3fc;
        }
		
		/* 체크박스 라벨 */
        .rememberChk label{
            width: 150px;
            height: 20px;
            position: absolute;
            top: 0;
            left: 0;
            cursor: pointer;
            color: white;
        }

        .rememberChk label:after{
            content: "";
            width: 10px;
            height: 5px;
            position: absolute;
            top: 5px;
            left: 4px;
            border: 3px solid #000;
            border-top: none;
            border-right: none;
            background: transparent;
            opacity: 0;
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }

        .rememberChk input[type=checkbox]{
            visibility: hidden;
        }

        .rememberChk input[type=checkbox]:checked + label:after{
            opacity: 1;
        }
        
        .loginBtn{
        	margin-top: 50px;
        }
        .loginBtn .btn{
        	padding: 10px 25px;
        	background: #E8F5E9;
        	font-size: 14px;
        	color: #000000;
        	border-radius: 30px;
        	border: none;
        	cursor: pointer;
        	width: 365px;
        	height: 40px;
        }
        
        @media only screen and (max-width: 479px){
            .form-group{
                padding: 0 25px;
            }
            .form-group i{
                left: 45px;
            }
            .btn{
                padding: 10px 20px;
            }
        }
/* 	.outer{ */
/*         width: 30%; */
/*         margin: auto; */
/*         margin-top: 10%; */
/* 	} */
</style>
</head>
<body>
	<div class="outer">
        <div class="container">
            <div class="loginDiv">
                <form action="/final3/login" method="post" class="loginForm">
         			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                    <div class="heading">
                        <img src="/final3/resources/image/logoWhite3.png">
                    </div>
                    <div class="loginId">
                        <input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="userId" id="userId"/>
                        <i class="fa-solid fa-user"></i>
                    </div>
                    <div class="loginPwd">
                        <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="userPwd" id="userPwd"/>
                        <i class="fa-solid fa-lock"></i>
                    </div>
                    <div style="height: 20px">
	                    <!-- 				로그인 실패 메세지 띄워주기 -->
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
							<font color="white">
						  		${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
								<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
							</font>
						</c:if>
                    </div>
                    <div class="form-group">
                        <div class="rememberChk" style="margin-left : 25px;">
                            <input class="form-check-input" type="checkbox" value="None" id="checkbox1" name="_spring_security_remember_me">
                            <label for="checkbox1">Remember me</label>
                        </div>
                    </div>
                    <div class="loginBtn">
                    	<input type="submit" class="btn btn-primary" value="로그인"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

<!-- 	<div class="outer"> -->
<!--         <h1>KH COMPANY ERP</h1> -->
<!--         <br><br> -->
<!-- 		<form action="/final3/login" method="post"> -->
<%-- 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  --%>
<!-- 			<div> -->
<!-- 				<label for="userId">ID</label> -->
<!-- 				<input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="userId" id="userId"/> -->
<!-- 			</div>  -->
<!-- 			<div> -->
<!-- 				<label for="userPwd">Password</label> -->
<!-- 				<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="userPwd" id="userPwd"/> -->
<!-- 			</div> -->
<!-- 				로그인 실패 메세지 띄워주기 -->
<%-- 				<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}"> --%>
<!-- 					<font color="red"> -->
<%-- 				  		${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p> --%>
<%-- 						<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/> --%>
<!-- 					</font> -->
<%-- 				</c:if> --%>
<!-- 			<div class="form-group form-check"> -->
<!-- 				<label class="form-check-label"> -->
<!--       				<input class="form-check-input" type="checkbox"> Remember me -->
<!--       			</label> -->
<!-- 			</div> -->
<!-- 			<input type="submit" class="btn btn-primary" value="로그인"/> -->
<!-- 		</form> -->
<!-- 	</div> -->
</body>
</html>
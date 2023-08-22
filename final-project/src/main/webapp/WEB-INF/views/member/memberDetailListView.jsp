<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#member_img>img{
			height: 100%;
			width: 100%
		}
        .outer{
            border: 1px solid black;
            width: 100%;
            height: 400px;
        }
        .outer>div{
            float: left;
        }
        #photo_div{
			border: 1px solid black;
            width: 20%;
            height: 100%;
            box-sizing: border-box;
        }

        #member_info{
            width: 80%;
            height: 100%;
            box-sizing: border-box;
        }
        #member_img{
        	width: 100%;
        	height: 90%;
        }
        #update_btn_div{
        	width: 100%;
        	height : 10%;
        	box-sizing: border-box;
        }
        #photo_update_btn{
        	width: 100%;
        	height: 100%;
        	color : black;
        	font-weight : 900;
        	border : 1px solid black;
        }
		#info_table1 th{
			text-align: center;
		}
		#info_table2 th{
			text-align: center;
		}
		#info_table3{
			width: 100%;
			height: 30%;
			margin-top : 40px;
		}
		#btn_div{
			height : 50%;
			margin-top : 27px;
		}
		#btn_div button{
			height: 100%;
			width: 150px;
			margin-left : 75px;
		}
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}
    </style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<div class="content">
		<form action="/final3/${role}/update.me" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		    <h1>회원정보</h1>
		    <div class="outer">
		        <div id="photo_div">
		            <div id="member_img">
		                <img src="/final3/resources/image/hamster.png">
		            </div>
		            <div id="update_btn_div">
		                <button type="button" id="photo_update_btn" class="btn btn-outline-info">사진 수정</button>
		            </div>
		        </div>
		        <div id="member_info">
		            <div id="info_table1">
		            	<table class="table">
			                <thead>
			                    <tr>
			                        <th>사번</th>
			                        <th>이름</th>
			                        <th>전화번호</th>
			                        <th>이메일</th>
			                        <th>부서</th>
			                        <th>직책</th>
			                    </tr>
			                </thead>
			                <tbody>
								<tr>
									<th id="t1_1">4</th>
									<th id="t1_2"><input type="text" value="${member.userName}" name="userName" style="width:80px; text-align:center; font-weight:900; border: 2px solid black;"></th>
									<th id="t1_3"><input type="text" value="${member.phone}" name="phone" style="width:150px; text-align:center; font-weight:900; border: 2px solid black;"></th>
									<th id="t1_4"><input type="text" value="${member.email}" name="email" style="width:300px; text-align:center; font-weight:900; border: 2px solid black;"></th>
									<th id="t1_5"><input type="text" value="${member.deptName}" name="deptName" style="width:150px; text-align:center; font-weight:900; border: 2px solid black;"></th>
									<th id="t1_6"><input type="text" value="${member.jobName}" name="jobName" style="width:50px; text-align:center; font-weight:900; border: 2px solid black;"></th>
								</tr>
			                </tbody>
			            </table>
		            </div>
		            <div id="info_table2">
		            	<table class="table">
			                <thead>
			                    <tr>
			                        <th>주소</th>
			                        <th>생일</th>
			                        <th>고용일</th>
			                        <th>퇴사일</th>
			                    </tr>
			                </thead>
			                <tbody>
								<tr>
									<th><input type="text" value="${member.address}" name="address" style="width:200px; text-align:center; font-weight:900; border: 2px solid black;"></th>
									<th><input type="number" value="${member.birth}" name="birth" style="width:70px; text-align:center; font-weight:900; border: 2px solid black;" maxlength="6" minlength="6"></th>
									<th><input type="date" value="${member.empolymentDate}" name="empolymentDate" style="width:200px; text-align:center; font-weight:900; border: 2px solid black;"></th>
									<th><input type="date" value="${member.depatureDate}" name="depatureDate" style="width:200px; text-align:center; font-weight:900; border: 2px solid black;"></th>
								</tr>
			                </tbody>
			            </table>
		            </div>
		            <div id="info_table3">
						<div id="btn_div">
							<button type="button" class="btn btn-outline-success">휴가정보</button>
			            	<button type="button" class="btn btn-outline-success">승진정보</button>
			            	<button type="submit" class="btn btn-outline-success">내용수정</button>				
						</div>
		            </div>
		        </div>
		    </div>
		</form>		    
	</div>
</body>
</html>
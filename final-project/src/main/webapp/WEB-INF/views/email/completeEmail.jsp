<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{
        box-sizing: border-box;
    }
    .complete-mail{
        height: 500px;
        width: 1000px;
    }
    #mail-info-area{
        height: 80%;
    }
    #mail-info {
        width: 80%;
        height: 60%;
        margin-top: 100px;
        text-align: center;
        font-size: large;
    }
    #btn-area{
        height: 20%;
    }
    #btn-area button {
        height: 30px;
        width: 100px;
        margin-top: 20px;
    }

</style>
<body>
<%@ include file="../common/menubar.jsp" %>
	<div class="complete-mail">
        <div id="mail-info-area">
            <table id="mail-info">
                <tbody>
                    <tr>
                        <td rowspan="3" width="40%"><img src="/final3/resources/image/이메일 완료.png"></td>
                    </tr>
                    <tr>
                        <td>제목 :</td>
                        <td>${title}</td>
                    </tr>
                    <tr>
                        <td>받는사람 : </td>
                        <c:forEach var="t" items="${arrTo}">
	                        <td>&lt;${t}&gt;</td>
                        </c:forEach>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="btn-area">
            <button type="button" class="btn btn-primary" onclick="homePage();">홈으로</button>
            <button type="button" class="btn btn-info" onclick="emailEnroll();">다시보내기</button>
        </div>
    </div>
    <script>
    	function homePage(){
    		location.href = "mainPage.me"
    	}
    	function emailEnroll(){
    		location.href = "email.em"
    	}
    </script>
</body>
</html>
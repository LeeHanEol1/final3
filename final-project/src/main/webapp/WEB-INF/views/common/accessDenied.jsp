<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>당신은 권한이 없습니다~</h1>
	<p> 사용자 권한 리스트: <sec:authentication property="principal.authorities"/></p>
	<sec:authentication property="principal" var="loginInfo"/>
	<script>
		var auth = '${loginInfo.authorities}';
		var role = auth.substring(6, auth.length-1).toLowerCase();
		setTimeout('mainPage()', 3000);
		function mainPage(){
			location.href="/final3/"+ role +"/mainPage.me";
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결재함</title>
    <link rel="stylesheet" href="/final3/resources/css/Approval_EnrollList.css" >
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
            <br><br>
	        <div class="approvalEnroll">
	            <div id="approvalEnroll-tap-area">
	                <ul class="nav-tabs" class="nav-tabs nav-pills">
	                	<li role="presentation" class="nav1">
	                      <a href="enrollList.ap">전체</a>
	                    </li>
	                    <li role="presentation" class="nav2">
	                      <a href="enrollList.ap?docCategory=C">공통</a>
	                    </li>
	                    <li role="presentation" class="nav3">
	                      <a href="enrollList.ap?docCategory=H">인사</a>
	                    </li>
	                    <li role="presentation" class="nav4">
	                      <a href="enrollList.ap?docCategory=M">관리</a>
	                    </li>
	                </ul>
	            </div>
	            <br>
	            <div id="approvalEnroll-search-area">
			        <form action="enrollList.ap" method="post">
				        <input type="hidden" name="docCategory" value="${docCategory}"/>
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				        <div id="search-box">
					    <input type="search" class="form-control" name="keyword" id="search-input" placeholder="Search" value="${keyword }">
						<button class="btn btn-primary" type="submit" style="background-color: #0E6251; margin-left: 2px;"><i id="search-icon" class="fa-solid fa-magnifying-glass fa-lg"></i></button>
						</div>
					</form>
				</div>
			<br><br>
            <div id="approvalEnroll-list-area">
                <table id="approvalEnroll-list" class="table table-hover" align="center">
                    <thead>
                        <tr>
                        	<th width="1%"></th>
                            <th width="20%">번호</th>
                            <th width="20%">양식명</th>
                            <th width="59%">설명</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <c:forEach var="t" items="${list}" varStatus="status">
                        	<tr>
                        		<td width="1%"><input type="hidden" value="${t.docType }"></td>
                        		<td width="20%">${status.count}</td>
                        		<td width="20%">${t.docName}</td>
                        		<td width="59%"></td>
                        	</tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="approval-pagebar-area">
                <div id="pagingArea">
		  			<ul class="pagination">
		                   <c:choose>
		                    		<c:when test="${pi.currentPage eq 1 }">
				                        <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
		                    		</c:when>
		                    		<c:when test="${!empty keyword}">
                    					<li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${pi.currentPage-1}&docCategory=${docCategory}&keyword=${keyword}">이전</a></li>
                    				</c:when>
                    				<c:when test="${empty keyword and !empty docCategory}">
									<li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${pi.currentPage+1}&docCategory=${docCategory}">이전</a></li>                		
			                   		 </c:when>	
		                    		<c:otherwise>
		                    			<li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${pi.currentPage-1}&docCategory=${docCategory}">이전</a></li>
		                    		</c:otherwise>
		                    </c:choose>
		                    	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1"> 
		                    		<c:if test="${!empty keyword}">
				                        <li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${p}&docCategory=${docCategory}&keyword=${keyword}">${p}</a></li>
		                    		</c:if>
		                    		<c:if test="${empty keyword and !empty docCategory}">
				                        <li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${p}&docCategory=${docCategory}">${p}</a></li>
		                    		</c:if>
		                    		<c:if test="${empty keyword and empty docCategory}">
				                        <li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${p}">${p}</a></li>
		                    		</c:if>
		                    	</c:forEach>
		                   <c:choose>
			                	<c:when test="${pi.currentPage eq pi.maxPage}">
									<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>                		
								</c:when>
								<c:when test="${!empty keyword}">
									<li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${pi.currentPage+1}&docCategory=${docCategory}&keyword=${keyword}">다음</a></li>                		
			                    </c:when>
			                    <c:when test="${empty keyword and !empty docCategory}">
									<li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${pi.currentPage+1}&docCategory=${docCategory}">다음</a></li>                		
			                    </c:when>
			                	<c:otherwise>
			                    	<li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${pi.currentPage+1}">다음</a></li>
								</c:otherwise>
		                </c:choose>
		            </ul>
                </div>
            </div>
	<script>
	//클릭시 해당 페이지 이동
		$(function(){
			$("#approvalEnroll-list>tbody>tr").click(function(){
				const appNo = $(this).children().children().val();
				location.href = "enrollForm.ap?appNo="+appNo;
			});
		});
	
	//버튼 색깔변경
	 $(function(){
		 const category = "${docCategory}";
		 
		 if(category == ''){
				$(".nav1").addClass("active");
			}else if(category == 'C'){
				$(".nav2").addClass("active");
			}else if(category == 'H'){
				$(".nav3").addClass("active");
			}else if(category == 'M'){
				$(".nav4").addClass("active");
			}
	 })
	</script>
</body>
</html>

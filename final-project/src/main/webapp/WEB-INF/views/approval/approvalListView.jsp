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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/final3/resources/css/Approval_List.css" >
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<br><br>
        <div class="approval">
            <div id="approval-tap-area">
                <ul class="nav-tabs" class="nav-tabs nav-pills">
                	<li role="presentation" class="nav1">
                      <a href="list.ap">전체</a>
                    </li>
                    <li role="presentation" class="nav2">
                      <a href="list.ap?status=P">진행함</a>
                    </li>
                    <li role="presentation" class="nav3">
                      <a href="list.ap?status=Y">완료함</a>
                    </li>
                    <li role="presentation" class="nav4">
                      <a href="list.ap?status=R">반려함</a>
                    </li>
                </ul>
            </div>
            <br>
            <div id="approval-search-area">
		        <form action="list.ap" method="post">
			        <input type="hidden" name="status" value="${status }"/>
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			        <div id="option-box" align="right">
			        <select name="option" id="search_code" class="btn btn-secondary dropdown-toggle" style="background-color: white; color:#0c0d0d; height: 34px; margin-right: 3px; border:1px solid #ccc;" >
				        <option value="0">선택</option>
				        <option value="1">부서</option>
				        <option value="2">문서</option>
				        <option value="3">제목</option>
			        </select>
			        </div>
			        <div id="search-box">
					<button class="btn btn-primary" type="submit" style="background-color: #0E6251; margin-left: 2px;"><i id="search-icon" class="fa-solid fa-magnifying-glass fa-lg"></i></button>
				    <input type="search" class="form-control" name="keyword" id="search-input" placeholder="Search" value="${keyword }">
					</div>
				</form>
			<!-- 검색어 option값 유지 -->
            <c:if test="${not empty option }">
				<script>
				$(function(){
					
					$("#approval-search-area option").each(function(){
						if($(this).val()=="${option}"){
							$(this).attr("selected", true);
						}
					});
					
					
				});
				</script>
			</c:if>	
			<br><br>
			<div id="approvalEnroll-btn">
		    	<a class="btn btn-success"  href="enrollList.ap">결재문서 작성</a>
		    </div>	
            </div>
            <div id="approval-list-area">
                <table id="approval-list" class="table table-hover" align="center">
                    <thead>
                        <tr>
                            <th>문서번호</th>
                            <th>부서</th>
                            <th>문서종류</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>승인/반려날짜 </th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    <!-- 권한에 따른 게시판 보여주기 -->
                    	<c:set var="length" value="${fn:length(list)}"/>
                        <c:forEach var="i" begin="1" end="${length}" >
	                    	<c:choose>
		                    	<c:when test="${empty list}">
		                    		<tr>
		                    			<td colspan="6" style="text-align: center;font-size: 15px;color: gray;">
		                    				결재문서가 비었습니다.
		                    			</td>
		                    		</tr>
	                    		</c:when>
	                    		<c:when test="${loginUser.auth eq 'ROLE_MEMBER'}">
				                    <tr>
				                       	<td width="10%">${list[i-1].docNo}</td>
				                       	<td width="10%">${list[i-1].deptCode}</td>
				                       	<td width="10%" id="docType">${list[i-1].docType }</td>
				                       	<td width="40%">
				                       		<c:if test="${list[i-1].emergency eq 'Y' && list[i-1].status eq 'P'}">
					                           	<button type="button" class="btn btn-danger btn-sm" disabled style="background-color: #c42d2d">긴급</button>
					                        </c:if>
				                       		${list[i-1].docTitle }
				                       	</td>
				                       	<td width="10%">${list[i-1].createDate}</td>
				                       	<c:choose>
			                        		<c:when test="${empty list[i-1].lastDate }">
			                        			<td>${list[i-1].secondDate}</td>
			                        		</c:when>
			                        		<c:otherwise>
			                        			<td>${list[i-1].lastDate}</td>
			                        		</c:otherwise>
			                       		</c:choose>
			                       		<c:choose>
			                       			<c:when test="${list[i-1].status eq 'P' }">
			                       				<td><button type="button" class="btn btn-primary" style="border:0;" disabled>신청</button></td>
			                       			</c:when>
			                       			<c:when test="${list[i-1].status eq 'Y' }">
			                       				<td><button type="button" class="btn btn-success" style="border:0;" disabled>승인</button></td>
			                       			</c:when>
			                       			<c:when test="${list[i-1].status eq 'R' }">
			                       				<td><button type="button" class="btn btn-success" style="background-color: #f87428;color:white;border:0;" disabled>반려</button></td>
			                       			</c:when>
			                       		</c:choose>
				                    </tr>
	                    		</c:when>
		                    	<c:otherwise>
			                        <tr>
			                        	<td width="10%">${list[i-1].docNo}</td>
			                        	<td width="10%">${list[i-1].deptCode}</td>
			                        	<td width="10%" id="docType">${list[i-1].docType }</td>
			                        	<td width="40%">
			                        		<c:if test="${list[i-1].emergency eq 'Y' && list[i-1].status eq 'P'}">
				                            	<button type="button" class="btn btn-danger btn-sm" disabled style="background-color: #c42d2d">긴급</button>
				                            </c:if>
			                        		${list[i-1].docTitle }
			                        	</td>
			                        	<td width="10%">${list[i-1].createDate}</td>
			                        	<c:choose>
			                        		<c:when test="${empty 'a.lastDate' && empty 'a.returnDate' }">
			                        			<td>${list[i-1].secondDate}</td>
			                        		</c:when>
			                        		<c:when test="${empty 'a.lastDate' && empty 'a.secondDate' }">
			                        			<td>${list[i-1].returnDate }</td>
			                        		</c:when>
			                        		<c:otherwise>
			                        			<td>${list[i-1].lastDate}</td>
			                        		</c:otherwise>
			                        	</c:choose>
			                        	<c:choose>
			                       			<c:when test="${list[i-1].status eq 'P' }">
			                       				<td><button type="button" class="btn btn-primary" style="border:0;" disabled>신청</button><td>
			                       			</c:when>
			                       			<c:when test="${list[i-1].status eq 'Y' }">
			                       				<td><button type="button" class="btn btn-success" style="border:0;" disabled>승인</button><td>
			                       			</c:when>
			                       			<c:when test="${list[i-1].status eq 'R' }">
			                       				<td><button type="button" class="btn btn-success" style="background-color: #f87428;color:white;border:0;" disabled>반려</button><td>
			                       			</c:when>
			                       		</c:choose>
			                        </tr>
		                    	</c:otherwise>
	                    	</c:choose>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <br><br>
            <div id="approval-pagebar-area">
                <div id="pagingArea">
		  			<ul class="pagination">
		                   <c:choose>
		                    <c:when test="${pi.currentPage eq 1 }">
				                        <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
		                    		</c:when>
		                    		<c:when test="${!empty keyword}">
                    					<li class="page-item"><a class="page-link" href="list.ap?currentPage=${pi.currentPage-1}&status=${status}&keyword=${keyword}&option=${option}">이전</a></li>
                    				</c:when>	
		                    		<c:otherwise>
		                    			<li class="page-item"><a class="page-link" href="list.ap?currentPage=${pi.currentPage-1}&status=${status}">이전</a></li>
		                    		</c:otherwise>
		                    	</c:choose>
		                    	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1"> 
		                    		<c:if test="${!empty keyword}">
				                        <li class="page-item"><a class="page-link" href="list.ap?currentPage=${p}&status=${status}&keyword=${keyword}&option=${option}">${p}</a></li>
		                    		</c:if>
		                    		<c:if test="${empty keyword}">
				                        <li class="page-item"><a class="page-link" href="list.ap?currentPage=${p}&status=${status}">${p}</a></li>
		                    		</c:if>
		                    	</c:forEach>
		                    	
		                       <c:choose>
		                			<c:when test="${pi.currentPage eq pi.maxPage}">
										<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>                		
									</c:when>
									<c:when test="${!empty keyword}">
										<li class="page-item"><a class="page-link" href="list.ap?currentPage=${pi.currentPage+1}&status=${status}&keyword=${keyword}&option=${option}">다음</a></li>                		
		                    		</c:when>
		                			<c:otherwise>
		                    			<li class="page-item"><a class="page-link" href="list.ap?currentPage=${pi.currentPage+1}&status=${status}">다음</a></li>
									</c:otherwise>
		                		</c:choose>
		                    </ul>
                </div>
            </div>
        </div>
        <br><br><br>
	<script>
	//행클릭시 해당 페이지로 이동
	$(function(){
		$("#approval-list>tbody>tr").click(function(){
			var docNo = $(this).children().eq(0).text();
			var docType = $(this).children().eq(2).text();
			location.href = "detail.ap?docNo="+docNo+"&docType="+docType;
		});
	});
	
	//li 클릭시 active 부여
	$(function(){
		const status = "${status}";
		if(status == ''){
			$(".nav1").addClass("active");
		}else if(status == 'P'){
			$(".nav2").addClass("active");
		}else if(status == 'Y'){
			$(".nav3").addClass("active");
		}else if(status == 'R'){
			$(".nav4").addClass("active");
		}
	})
	</script>
</body>
</html>

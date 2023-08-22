<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임직원 조회</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    .table-responsive{
        width: 1000px;
        margin : auto;
    }
    .table-responsive th{
        text-align: center;
    }
    #paging{
    	width:fit-content;
    	margin:auto;
    }
    #title{
    	text-align:center;
    }
    .btn-outline-secondary{
    	float:right;
    }
    .form-control-plaintext{
    	border : 2px solid black;
    	width : 200px;
    	float : right;
    	margin-bottom : 20px;
    }
    #searchMember{
    	float : right;
    }
    #searchMember input{
    	height : 27px;
    	font-size:15px;
    }
    #select_div div{
        float: left;
    }
    #select_div>div{
        margin-left : 90px;
    }
    #myModal div{
    	font-size:18px;
    	font-weight:900;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="content">
	    <div id="empInquiry">
	    	<h1 id="title">임직원 조회</h1> <br><br><br>
	        <div class="table-responsive">
		    	<button type="button" id="job_button" class="btn btn-outline-secondary" onclick="orderByJob();">직책</button>
		        <button type="button" id="all_button" class="btn btn-outline-secondary" onclick="memberAll();">전체</button>
		    	<br><br>
		    	<div id="searchMember">
		    		<form action="/final3/${role}/list.me" method="get">
			    		<select name="category">
			    			<option value="name">이름</option>
			    			<option value="dept">부서</option>
			    			<option value="job">직책</option>
			    		</select>
			    		<input type="text" class="form-control-plaintext" name="searchWord">
		    		</form>
		    	</div>
	            <table class="table table-hover">
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
						<c:forEach var="m" items="${list}">
							<tr>
								<th>${m.userNo}</th>
								<th>${m.userName}</th>
								<th>${m.phone}</th>
								<th>${m.email}</th>
								<th>${m.deptName}</th>
								<th>${m.jobName}</th>
							</tr>
						</c:forEach>
	                </tbody>
	            </table>
	            <br><br>
	            <div id="paging">
	            	<ul class="pagination">
	            		<c:choose>
	            			<c:when test="${pi.currentPage eq 1}">
			            		<li class="page-item disabled">
			            			<a class="page-link">이전</a>
			            		</li>	            				
	            			</c:when>
	            			<c:otherwise>
	            				<li class="page-item">
	            					<a class="page-link" href="/final3/${role}/list.me?currentStatus=${map['currentStatus']}&&currentPage=${pi.currentPage-1}&&category=${map['category']}&&searchWord=${map['searchWord']}">이전</a>
	            				</li>
	            			</c:otherwise>
	            		</c:choose>
	            		
	            		<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
							<li class="page-item">
								<a class="page-link" onclick="pageColor()" href="/final3/${role}/list.me?currentStatus=${map['currentStatus']}&&currentPage=${p}&&category=${map['category']}&&searchWord=${map['searchWord']}">${p}</a>
							</li>	            			
	            		</c:forEach>
	            		
	            		<c:choose>
	            			<c:when test="${pi.currentPage eq pi.maxPage}">
								<li class="page-item disabled">
									<a class="page-link">다음</a>
								</li>	            				
	            			</c:when>
	            			<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="/final3/${role}/list.me?currentStatus=${map['currentStatus']}&&currentPage=${pi.currentPage+1}&&category=${map['category']}&&searchWord=${map['searchWord']}">Next</a>
								</li>	            			
	            			</c:otherwise>
	            		</c:choose>
	            	</ul>
	            </div>
	        </div>
	    </div>
	    <br><br>
	</div>
	<div class="modal" id="myModal">
	  <form action="updateOther.me" method="post">
	  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	  	<input type="hidden" name="userNo">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title" style="font-size:25px; font-weight:900;">정보 수정</h4>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
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
		      </div>
		      <div style="width:90%; margin-bottom:18px; margin-left:18px;">
		          <p>퇴사일</p>
		          <input type="date" class="form-control form-control" name="depatureDate">              	            
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<button type="submit" class="btn btn-success" data-dismiss="modal">수정</button>
		        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="modalClose();">취소</button>
		      </div>
		
		    </div>
		  </div>
	  </form>
	</div>
	
	<script>
		$(function(){
			$(".page-link").eq(${pi.currentPage}).css('color', 'gray');
			if("${map['category']}" != ''){
				$("#searchMember input").val("${map['searchWord']}");
				$("#searchMember select").val("${map['category']}");
			}
		});
		
		if("${role}" == 'admin'){
			$(".table>tbody>tr").click(function(){
				var dv = event.currentTarget;
				var userNo = dv.children[0].innerText;
				$("input[name=userNo]").val(userNo);
				$("#myModal").show();
			});
		}
		
		function modalClose(){
			$("#myModal").hide();
		}
		
		function orderByJob(){
			location.href='/final3/${role}/list.me?currentStatus=JOB_CODE';
		}
		
		function memberAll(){
			location.href='/final3/${role}/list.me';
		}
		
		$(function(){
			if("${currentStatus}" == 'JOB_CODE'){
				$("#job_button").css({"background-color":"#0E6251"});
			}else{
				$("#all_button").css({"background-color":"#0E6251"});
			}
		});
	</script>
</body>
</html>
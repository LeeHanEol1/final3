<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title> 급여 관리  </title>
   <link href="/final3/resources/css/document-modal.css" rel="stylesheet">
  <style>
	.content{
        width: 1570px;
    }
    
    .content>h1{
    	margin:0px;
    	padding: 30px;
    }
    /*navibar*/
	#payment-tap-area{
		width: 90%;
		height : 50px;
		margin: auto;
	}
	
	#payment-tap-area>ul{
		width:100%;
		list-style-type : none;
	}
	
	#nav-tabs{
		padding : 0;
		display: flex;
	}
	
    #payment-tap-area>ul li{
    	width :110px;
    	margin-right: 5px;
    	float : left;
    }
    
    #payment-tap-area>ul li a{
    	width: 100%;
    	height : 100%;
    	display: inline-block;
    	text-align: center;
    	line-height: 40px;
    	background-color: lightgrey;
    	text-decoration: none;
    	color: black;	
    }
    
   #payment-tap-area>ul li:not(.active):hover{
    	border-top: 1px solid #dee2e6;
		border-left: 1px solid #dee2e6;
		border-right: 1px solid #dee2e6;
		border-top-left-radius:0.25rem;
		border-top-right-radius:0.25rem; 
    }
	
	#payment-tap-area .active a{
	 	border-botton: none;
	 	background-color: #0E6251;
	 	color: white;
	}
    /* 검색영역 */
    #board-search-area{
        width: 90%;
        height : 60px;
        margin:auto;
        margin-top:10px;
        margin-bottom:10px;
    }
    
    #option-box{
        width: 40%;
        float: left;
    }
    #dept_code{
        margin-left: 5px;
    }
    #search-box{
        width: 60%;
        float: left;
    }

    #search-input{
        width: 30%;
        float: left;
    }

    /* 버튼 영역 */
    #account-btn-area{
    	width:90%;
    	margin:auto;
    }
    /* 게시글 목록영역 */
    #account-list-area{
        width: 90%;
        margin: auto;
    }
    
    #account-list th, #account-list td{
        text-align:center;
    }
	
	#account-list-area>#account-list{
		width:100%;
		
	}
	
	#account-list-area i:hover{
    	font-size: 25px;
    	cursor: pointer;
    }
    
    #pagingArea {
        width:fit-content; 
        margin:auto;
    }
	
	#option-box, #search-box, #payment-tap-area,#account-btn-area>button  {
		font-family: 'KimjungchulGothic-Bold';
	}
	
	th{
		font-family: 'KimjungchulGothic-Bold';
	}
	
	td{
		 font-family: 'HallymGothic-Regular';
	}
    </style>
</head>
<%@ include file="../common/menubar.jsp" %>
    <div class="content">
    	<h1 style ="font-family: 'KimjungchulGothic-Bold'; ">급여 관리</h1>
    	  <div id="payment-tap-area">
   			<ul id="nav-tabs"  class="nav-tabs nav-pills">
				<li role="presentation" >
					<a href="payment.ad">급여관리</a>
				</li>
				<li role="presentation" class="active">
				 	<a href="account.ad">급여계좌 관리 </a>
				</li>
			</ul>
  		</div>
		<!-- 검색창 영역  -->
		<div id="board-search-area">
			<form action="#" method="get">
				<div id="option-box" align="right" >
                	<select name="accountStatus" class="btn btn-secondary dropdown-toggle" style="border: 1px solid #ccc; background-color: white; color:#0c0d0d; height: 34px; margin-right: 5px; margin-top: 15px;">
	                    <option value="전체">전체</option>
	                    <option value="N">미등록</option>
	                    <option value="Y">등록완료</option>
	                    <option value="p">등록/변경신청</option>
                	</select>
				</div>
				<div id="search-box">
					<input type="text" name="keyword" class="form-control" id="search-input" value="${keyword}" style=" margin-top: 15px;" > 
					<button type="submit" id="account-btn" class="btn btn-secondary" style="background-color: #0E6251; margin-left: 5px;  margin-top: 15px;">
					<i id="search-icon" class="fa-solid fa-magnifying-glass fa-lg" style="color:white;"></i></button>
           		</div>
			</form>
		</div>
		<script>
			//검색 이동 
			$(function(){
				$("#account-btn").on("click",function(){
					location.href="account.ad"
				});
			})
		
		</script>
		
		<!-- 검색한 부서 고정 script -->
		<c:if test="${not empty accountStatus }">
		<script>
			$(function(){
				$("#option-box option[value = ${accountStatus}]").attr("selected",true);
				
			});
		</script>
		</c:if>
		<!-- 버튼 영역 -->
		<div id="account-btn-area">
			<button type="button" id="submit-account" class="btn btn-success" style="margin-bottom : 20px; background-color:#0E6251">등록하기</button>
		</div>
     	<!-- 게시글 리스트 영역 -->
     	<div id="account-list-area">
         	<table id="account-list" class="table table-hover">
             	<thead>
	                 <tr>
	                 	 <th width="5%">선택</th>
	                     <th width="5%">사번</th>
	                     <th width="10%">이름</th>
	                     <th width="10%">부서</th>
	                     <th width="10%">직급</th>
	                     <th width="10%">아이디</th>
	                     <th width="15%">이메일</th>
	                     <th width="10%">은행</th>
	                     <th width="15%">계좌번호</th>
	                     <th width="10%">상태</th>
	                 </tr>
           		</thead>
            	<tbody>
              		<c:choose>
              		<c:when test="${empty mList}">
              			<tr>
              				<td colspan="10">조회 결과가  없습니다.</td>
              			</tr>
              		</c:when>
              		<c:otherwise>
              			<c:forEach var="m" items="${mList}">
              			<tr>
              				<td><input type="checkbox" style="width:15px;height:15px; cursor:pointer;"></td>
               				<td>${m.userNo}</td>
               				<td>${m.userName}</td>
                  			<td>${m.deptName}</td>
                  			<td>${m.jobName}</td>
                      		<td>${m.userId}</td>      
                       		<td>${m.email}</td>
                  			<td>${m.bank}</td>
                  			<td>${m.accountNumber}</td>
                  			<c:choose>
                  				<c:when test="${m.accountStatus eq 'N' }">
                  					<td style="font-weight:700; color: #8B0000;"> 계좌 미등록 </td>
                  				</c:when>
                  				<c:when test="${m.accountStatus eq 'P' }">
                  					<td style="font-weight:700; color: darkblue;"> 등록/변경신청 </td>
                  				</c:when>
                  				<c:otherwise>
                  					<td style="font-weight:700; color: #0E6251;"> 등록 완료 </td>
                  				</c:otherwise>
                  			</c:choose>
              			</tr>
              			</c:forEach>
              		</c:otherwise>
              		</c:choose>
         		</tbody>
      		</table>
   			<br>
   			<script>
   				$(function(){
   					//계좌 선택 등록 
   					var noArr = [];
   					
   					$("#account-list tbody").on("click","input[type='checkbox']",function(){
   						var userNo = $(this).parent().siblings().eq(0).text();
   						
   						if($(this).prop("checked")==true){
	   						noArr.push(userNo);
   						}else{
   							for(var i = 0; i < noArr.length; i++){
   								if(noArr[i] === userNo){
   									noArr.splice(i,1);
   								}
   							}
   						}
	   						
   					});
   					
   					$("#submit-account").on("click",function(){
   						if(noArr.length != 0){
							if(confirm('선택한 계좌를 등록하시겠습니까?')){
								$.ajax({
									url : "updateAccount.ad",
									type : "post",
									beforeSend : function(xhr)
						            {
						                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						            },
									traditional: true,
									
									data : {noArr : noArr},
									
									success : function(result){
										if(result == "YYYY"){
											alert("계좌등록에 성공하였습니다.");
										}else{
											alert("계좌 등록에 실패하였습니다. 다시 시도해주세요.")
										}
										
										location.reload();
									},
									
									error : function(){
										console.log("통신실패");
									}
									
								})
							}
   						
   						}else{
   							alert("등록할 회원을 한명이상 선택해주세요.");
   						}
   						
   					});
   				});
   				
   			</script>
	     	<div id="account-pagebar-area">
				<div id="pagingArea">
					<ul class="pagination">
	                   	<c:choose>
	                   		<c:when test="${pi.currentPage eq 1 }">
		                        <li class="page-item disabled"><a class="page-link">이전</a></li>
	                   		</c:when>
	                   		<c:otherwise>
		                        <li class="page-item"><a class="page-link" href="account.ad?currentPage=${pi.currentPage-1}&accountStatus=${accoutStatus}&keyword=${keyword}">이전</a></li>
	                   		</c:otherwise>
	                   	</c:choose>
	                   	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
	                        <li class="page-item"><a class="page-link" href="account.ad?currentPage=${p}&accountStatus=${accoutStatus}&keyword=${keyword}">${p}</a></li>
	                   	</c:forEach>
	                   	<c:choose>
	                   		<c:when test="${pi.maxPage eq pi.currentPage}">
		                        <li class="page-item disabled"><a class="page-link">다음</a></li>
	                   		</c:when>
	                   		<c:otherwise>
		                        <li class="page-item"><a class="page-link" href="account.ad?currentPage=${pi.currentPage+1}&accountStatus=${accoutStatus}&keyword=${keyword}">다음</a></li>
	                   		</c:otherwise>
	                   	</c:choose>
					</ul>
				</div>
			</div>
        </div>
    </div>   
</body>
</html>



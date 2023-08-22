<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지함</title>
<style>

	/* msg_search area */
    #msgSearchForm{
		width: 75%;
        height: 100%; 
        float : left;
         
   	}
      
     #msgSearchForm>form{
      	width:100%;
      	height:100%;
      	display : flex; /* 중앙정렬 방법 - 부모 요소 고정 */
      	justify-content: left; /* 자식 요소들 가운데로 이동  */
		align-items: center;
	}
      
    form>.custom-select{
    	width: 20%;
    	float:left;
    	margin-right:5px;
	}
      
    form .form-control{
    	width: 40%;
    	float:left;
    	margin-right: 5px;
	}
	
	/* list- button 영역 */
	#msg_list>#msg_btn_area{
		width : 100%;
		margin-top : 10px;
		margin-bottom :20px;
	}  
  
	#recMsgList {
      	text-align:center;
      	
	}
	
    #recMsgList>tbody>tr:hover {
      	cursor:pointer;
   	}
	
	#pagingArea {
      
      width:fit-content;
      margin:auto;
   	}
   	
   	#date-search-area{
   		display:none;
   	}
   	
   	#date-search-area>input{
   		width:45%;
   	}
   	
   	#date-search-area>p{
   		float:left;
   		margin:0px 10px 0px 5px;
   		height:37.99px; 
   	}
   	
   	#recMsgList{
   		table-layout:fixed; /* 테이블 고정 */
   	}
   	
   	#recMsgList td {
   		overflow: hidden; 
   		text-overflow: ellipsis; /* 말줄임 css  */
   		white-space: nowrap; /* 글자를 한줄로 모아준다 */ 
   	}
   	
</style>
</head>
<%@ include file="../messenger/msgHeader.jsp" %>
	        <!-- 쪽지 검색 영역 -->
	        <div id="msgSearchForm">
		        <form action="#">
		        	<select id="option-box" class="custom-select" name="category">
		            	<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="date">기간별</option>
		           	</select>
		           	<div id=date-search-area>
		           		<input type="date" name="startDate" class="form-control" id="startDate" value="${startDate}" ><p> ~ </p>
		           		<input type="date" name="endDate" class="form-control" id="endDate" value="${endDate}"> 
		           	</div>
		            <input type="text" class="form-control" name="keyword" id="keyword" value="${keyword}">
					<button type="submit" class="btn btn-secondary" id="search-btn" style="height:37.99px;">검색</button>
		    	</form>
	        </div>
		</div>
		<script>
			$(function(){
				$('#search-btn').on("click",function(){
					if(!$("#option-box").val() == ""){
						
						location.href="list.mg"
					}
				});
			
			})
		
			//기간별 검색시 날짜창 띄워주기 
			$(function(){
	   			$("#option-box").on("change", function(){
	   				
	   				if($(this).val() == 'date'){
	   					$("#date-search-area").show()
	   					$("input[name=keyword]").hide()
	   					
	   					
	   				}else{
	   					$("#date-search-area").hide()
	   					$("input[name=keyword]").show()
	   				}
	   			})
	   		});
			
		</script>

		<c:if test="${not empty category}">
		<script>
			$(function(){
				if($("#option-box option[value = '${category}']").val() =='date'){
					$("#date-search-area").show()
   					$("input[name=keyword]").hide()
				}else{
					$("#date-search-area").hide()
   					$("input[name=keyword]").show()
				}
				$("#option-box option[value = '${category}']").attr("selected", true);
			});		
			
		</script>
		
		</c:if>
				
		<div id="msg_list">
			<div id="msg_btn_area">
				<button type="button" id="delete-btn" class="btn btn-danger">삭제</button>
				<button type="button" id="reply-btn"class="btn btn-primary">답장</button>
			</div>
			
            <table id="recMsgList" class="table table-hover">
                <thead>
                    <tr>
                        <th width="80">선택</th>
                        <th width="120">보낸사람</th>
                        <c:choose>
                        	<c:when test="${m.emcStatus eq 'Y' }"> <!-- 긴급 -->
		                        <th width="80"></th>
		                        <th width="320">제목</th>
                        	</c:when>
                        	
                        </c:choose>
                        <th width="400">제목</th>
                        <th width="190">날짜</th>
                    </tr>
                </thead>
                <tbody>
                	<tbody>
                	<c:choose>
	                	<c:when test="${not empty msgList}">
	                		<c:forEach var="m" items="${msgList}">
                    		<tr>
		                        <td width="80" onclick="event.cancelBubble=true"><input type="checkbox" style="width:15px; height:15px;"></td>
		                        <td>${m.sender}<input type="hidden" value="${m.messengerNo}"></td>
		                        <c:choose>
		                        	<c:when test="${m.readStatus eq 'N'} ">
		                        		<c:choose>
		                        			<c:when test="${m.emcStatus eq 'Y' }">
			                        			<td width="120" style="text-align:left; font-family: 'HallymGothic-Regular'; font-weight:700;"><i class="fa-solid fa-circle-exclamation fa-xl" style="color: #f4c92f; overflow:hidden; text-overflow : ellipsis"></i> &nbsp;${m.msgTitle}</td>
		                        			</c:when>
		                        			<c:otherwise>
		                        			<td width="120" style="text-align:left;overflow:hidden; text-overflow : ellipsis; font-family: 'HallymGothic-Regular'; font-weight:700;">${m.msgTitle}</td>
		                        			</c:otherwise>
		                        		</c:choose>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<c:choose>
			                        		<c:when test="${m.emcStatus eq 'Y'}">
			                        			<td width="400" style="text-align:left;"><i class="fa-solid fa-circle-exclamation fa-xl" style="color: #f4c92f;"></i> &nbsp;${m.msgTitle}</td>
			                        		</c:when>
			                        		<c:otherwise>
			                        			<td width="400" style="text-align:left;">${m.msgTitle}</td>
			                        		</c:otherwise>
		                        		</c:choose>
		                        	</c:otherwise>
		                        </c:choose>
		                        <td width="190">${m.recvDate}</td>
                    		</tr>
	                		</c:forEach>
    	            	</c:when>
    	            	<c:otherwise>
    	            		<tr>
    	            			<td colspan="5" onclick="event.cancelBubble=true">조회된 쪽지가 없습니다.</td>
    	            		</tr>
    	            	</c:otherwise>
                	</c:choose>
                </tbody>	
                </tbody>
            </table>
		</div>   
		<br>
		<div id="board-pagebar-area">
          	<div id="pagingArea">
				<ul class="pagination">
                	<c:choose>
                   		<c:when test="${pi.currentPage eq 1 }">
	                        <li class="page-item disabled"><a class="page-link">이전</a></li>
                   		</c:when>
                   		<c:otherwise>
	                         <li class="page-item"><a class="page-link" href="list.mg?currentPage=${pi.currentPage-1}&userNo=${loginUser.userNo}&category=${category}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">이전</a></li>
                   		</c:otherwise>
                   	</c:choose>
                   	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
	                        <li class="page-item"><a class="page-link" href="list.mg?currentPage=${p}&userNo=${loginUser.userNo}&category=${category}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">${p}</a></li>
                   	</c:forEach>
                   	<c:choose>
                   		<c:when test="${pi.maxPage eq pi.currentPage}">
	                        <li class="page-item disabled"><a class="page-link">다음</a></li>
                   		</c:when>
                   		<c:otherwise>
	                        <li class="page-item"><a class="page-link" href="list.mg?currentPage=${pi.currentPage+1}&userNo=${loginUser.userNo}&category=${category}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">다음</a></li>
                   		</c:otherwise>
                   	</c:choose>
               	</ul>
        	</div>
     	</div>
		
            <br clear="both"><br>
        </div>
	</div>
	<script>
			/* 쪽지 상세 페이지 이동 스크립트 */
			$(function(){
				$("#recMsgList>tbody tr").on("click","td", function(){
					//console.log($(this).siblings().eq(1).children().val());
					var msgNo = $(this).siblings().eq(1).children().val()
					
					location.href="recvMessage.mg?msgNo="+msgNo;
				});
			});
			
			/* 선택 삭제 script */
			$(function(){
				var msgNoArr = []; //쪽지 번호 담아줄 배열 생성 

				$("#recMsgList>tbody td").on("click","input[type=checkbox]",function(){
					//msgNo 찾기 
					//console.log($(this).parent().siblings().eq(0).children().val());
					var $msgNo = $(this).parent().siblings().eq(0).children().val();
					
					//checkbox가 선택되어 있다면 쪽지 번호를 배열에 담기 
					if($(this).prop("checked")==true){
						msgNoArr.push($msgNo)
					}else{
						for(var i=0 ; i<msgNoArr.length ;i++){
							//선택 취소시 기존에 담겨있던 쪽지 번호 배열에서 삭제 
							if(msgNoArr[i] === $msgNo){
								msgNoArr.splice(i,1);
							}
						}
					}
				});
				
				$("#delete-btn").on("click",function(){
					if(msgNoArr.length == 0){
						alert("삭제하실 쪽지를 선택해 주세요.");
					}else{
						if(confirm("쪽지를 삭제하시겠습니까?")){
							
							$.ajax({
								url : "recvMsgUpdate.mg",
								
								type :"get",
	            				
	            				traditional: true, //배열 넘기는 옵션
								
	            				data : {msgNoArr : msgNoArr},
								
								success : function(result){
									if(result == "YYYY"){
										if(confirm("쪽지가 삭제되었습니다. 휴지통으로 이동하시겠습니까?")){
											location.href="tlist.mg";
										}
									}else{
										alert("쪽지 삭제에 실패하였습니다. 다시 시도해 주세요 ")
										location.reload();
									}
									location.reload();
								},
								
								error : function(){
									console.log("통신 실패")
								}
							
							});
						}
					}					
				});
			
			})
		/* 답장 script  */
		$(function(){
			
			var msgNo ="";
			
			var chkCount ="";
			
			$("#recMsgList>tbody td").on("click","input[type=checkbox]",function(){
				
				msgNo = $(this).parent().siblings().eq(0).children().val();
				
				var query = "input[type=checkbox]:checked"
				
				chkCount = document.querySelectorAll(query)
				
				console.log(chkCount.length);
				
			})
			
			
			$("#reply-btn").on("click",function(){
				
				if(chkCount.length>1){
					alert("한개만 선택해 주세요")
				}else if(chkCount.length == 1){
					location.href="relpyMsg.mg?msgNo="+msgNo;
				}else{
					location.href="insert.mg"
				}
			})
		});
		
	</script>
</body>
</html>
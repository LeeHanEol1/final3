<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴지통</title>
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
  
	#trashList {
      	text-align:center;
	}
      
    #trashList>tbody>tr:hover {
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
    
    #trashList{
    	table-layout:fixed; /* 테이블 고정 */
    }
    
    #trashList td {
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
		            	<option value="send">보낸사람</option> <!-- 나한테 보낸사람 -->
		            	<option value="receive">받는사람</option> <!-- 내가 보낸사람  -->
						<option value="title">제목</option>
						<option value="date">기간별</option>
		           	</select>
		           	<div id=date-search-area>
		           		<input type="date" name="startDate" class="form-control" id="startDate" value="${startDate}" ><p> ~ </p>
		           		<input type="date" name="endDate" class="form-control" id="endDate" value="${endDate}"> 
		           	</div>
		            <input type="hidden" value="${loginUser.userNo}" name="userNo">
		            <input type="text" class="form-control" name="keyword" id="keyword" value="${keyword}">
					<button type="submit" class="btn btn-secondary" id="search-btn" style="height:37.99px;">검색</button>
		    	</form>
	        </div>
	        
	        <script>
		        $(function(){
					$('#search-btn').on("click",function(){
						if(!$("#option-box").val() == ""){
							
							location.href="tlist.mg"
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
		
        <c:if test ="${not empty category }">
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
	        
		</div>		
		<div id="msg_list">
			<div id="msg_btn_area">
				<button id="trash-delete" class="btn btn-danger">삭제</button> 
				<button id="trash-recover" class="btn btn-success">복구</button> 
			</div>
            <table id="trashList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th width="80">선택</th>
                        <th width="170">보낸사람/받는사람</th>
                        <th width="350">제목</th>
                        <th width="190">날짜</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${empty tList}">
                			<tr>
                				<td onclick="event.cancelBubble=true" colspan ="4">삭제된 쪽지가 없습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
               			<c:forEach var='t' items="${tList}">
               				<tr>
               					<td width="80" onclick="event.cancelBubble=true"><input type="checkbox" style="width:15px; height:15px;">
               						<input type="hidden" value="${t.recvDelete}">
               					</td>
               					<c:choose>
                					<c:when test="${t.recvrUno eq loginUser.userNo}">
                						<td width="170"><label style="font-weight: 600; margin-bottom:0px;">[받은쪽지]</label> ${t.sender}</td>
                					</c:when>
               						<c:otherwise>
               							<td width="170"><label style="font-weight: 600; margin-bottom:0px;">[보낸쪽지]</label> ${t.receiver}</td>
               						</c:otherwise>
               					</c:choose>
               					<c:choose>
               						<c:when test="${t.readStatus eq 'Y'}">
                       					<td width="350" style="text-align: left;">${t.msgTitle}</td>
                       				</c:when>
                       				<c:otherwise>
                       						<td width="350" style="text-align: left; font-weight:700;">${t.msgTitle}</td>
                       				</c:otherwise>
                       			</c:choose>
                       			<td width="190">${t.sendDate}<input type="hidden" value="${t.messengerNo}"></td>
               				</tr>
               			</c:forEach>
               		</c:otherwise>
                	</c:choose>
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
	                        <li class="page-item"><a class="page-link" href="tlist.mg?currentPage=${pi.currentPage-1}&category=${category}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">이전</a></li>
                   		</c:otherwise>
                   	</c:choose>
                   	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
           				<li class="page-item"><a class="page-link" href="tlist.mg?currentPage=${p}&category=${category}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">${p}</a></li>
                   	</c:forEach>
                   	<c:choose>
                   		<c:when test="${pi.maxPage eq pi.currentPage}">
	                        <li class="page-item disabled"><a class="page-link">다음</a></li>
                   		</c:when>
                   		<c:otherwise>
	                        <li class="page-item"><a class="page-link" href="tlist.mg?currentPage=${pi.currentPage+1}&category=${category}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">다음</a></li>
                   		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
		</div>   
		
		<script>
			/* 상세페이지 이동 script */
			$(function(){
				$("#trashList>tbody tr ").on("click","td", function(){
					
					//console.log($(this).siblings().eq(2).children().val());
					var msgNo = $(this).siblings().eq(2).children().val();
					
					location.href="messenger.mg?msgNo="+msgNo;
					
				});	
			})
			
			/*선택 삭제 or 선택 복구 script*/
			$(function(){
				var sendArr = [];
				var recvArr = [];
				
				//체크 박스 선택시, 받은 쪽지함에서 삭제된 쪽지와 보낸 쪽지함에서 삭제된 쪽지 나눠서 배열에 담기 
				$("#trashList>tbody td").on("click","input[type=checkbox]", function(){
					
					//console.log($(this).parent().siblings().eq(2).children().val())
					var $msgNo = $(this).parent().siblings().eq(2).children().val();
					
					var $status = $(this).next().val() //recv_delete 상태값 => K라면 받은 쪽지함에서 삭제 된것,N 이라면 보낸쪽지함에서 삭제된 것 	
					console.log("상태값: ",$status)
					if($(this).prop("checked") == true){
						if($status == 'K'){
							recvArr.push($msgNo)
						}else{
							sendArr.push($msgNo)
						}
					}else{
						if($status == 'K'){
							for(var i = 0 ; recvArr.length ; i++){
								if(recvArr[i] === $msgNo){
									recvArr.splice(i,1);
								}
							}
						}else{
							for(var i = 0 ; sendArr.length ; i++){
								if(sendArr[i] === $msgNo){
									sendArr.splice(i,1);
								}
							}
						}
					}
					
				});	
				
				//삭제버튼 클릭시 발생 이벤트 
				$("#trash-delete").on("click", function(){
					if((recvArr.length == 0) && (sendArr.length == 0)){
						alert("삭제하실 쪽지를 선택해주세요.")
					}else{
						if(confirm("삭제된 쪽지는 복구가 불가능합니다. 삭제하시겠습니까?")){
							
							if(recvArr.length == 0){
								
								$.ajax({
									url : "sendMsgUpdate.mg",
									
									type :"get",
		            				
		            				traditional: true, //배열 넘기는 옵션
									
		            				data : {msgNoArr : sendArr},
									
									success : function(result){
										
										if(result == "YYYY"){
											alert("쪽지가 삭제되었습니다.")
										}else{
											alert("쪽지 삭제에 실패하였습니다. 다시 시도해 주세요 ")
										}
										
										location.reload();
									}
								
								});
							}else if(sendArr.length == 0) {
								
								$.ajax({
									url : "recvMsgUpdate.mg",
									
									type :"get",
		            				
		            				traditional: true, //배열 넘기는 옵션
									
		            				data : {msgNoArr : recvArr},
									
									success : function(result){
										if(result == "YYYY"){
											alert("쪽지가 삭제되었습니다.")
										}else{
											alert("쪽지 삭제에 실패하였습니다. 다시 시도해 주세요 ")
										}
										
										location.reload();
									}
								
								});
								
							}else{
								
								$.ajax({
									url : "recvMsgUpdate.mg",
									
									type :"get",
		            				
		            				traditional: true, //배열 넘기는 옵션
									
		            				data : {msgNoArr : recvArr},
	
		            				async : false,
		            				
									success : function(result){
										
										if(result == "YYYY"){
											
											$.ajax({
												url : "sendMsgUpdate.mg",
												
												type :"get",
					            				
					            				traditional: true, //배열 넘기는 옵션
												
					            				data : {msgNoArr : sendArr},
												
												success : function(result){
													
													if(result == "YYYY"){
														alert("쪽지가 삭제되었습니다.")
													}else{
														alert("쪽지 삭제에 실패하였습니다. 다시 시도해 주세요 ")
													}
												}
											
											});
											
										}else{
											alert("쪽지 삭제에 실패하였습니다. 다시 시도해 주세요 ")
										}
										
										location.reload();
									}
									
								});
							}
						}
					}
				})	
				
				
				/*선택 복구 */
				$("#trash-recover").on("click",function(){
					if((recvArr.length == 0) && (sendArr.length == 0)){
						alert("복구할 쪽지를 선택해주세요.")
					}else{
						if(confirm("쪽지를 복구하시겠습니까?")){
							
							if(recvArr.length == 0){
								
								$.ajax({
									url : "sendMsgRecover.mg",
									
									type :"get",
		            				
		            				traditional: true, //배열 넘기는 옵션
									
		            				data : {msgNoArr : sendArr},
									
									success : function(result){
										
										if(result == "YYYY"){
											alert("복구가 완료 되었습니다.")
											
										}else{
											alert("쪽지 복구에 실패하였습니다. 다시 시도해 주세요 ")
										}
										
										location.reload();
									}
								
								});
							}else if(sendArr.length == 0) {
								
								$.ajax({
									url : "recvMsgRecover.mg",
									
									type :"get",
		            				
		            				traditional: true, //배열 넘기는 옵션
									
		            				data : {msgNoArr : recvArr},
									
									success : function(result){
										if(result == "YYYY"){
											alert("복구가 완료 되었습니다.")
										}else{
											alert("쪽지 복구에 실패하였습니다. 다시 시도해 주세요 ")
										}
										
										location.reload();										
									}
								})
								
							}else{
								
								$.ajax({
									url : "recvMsgRecover.mg",
									
									type :"get",
		            				
		            				traditional: true, //배열 넘기는 옵션
									
		            				data : {msgNoArr : recvArr},
	
		            				async : false,
		            				
									success : function(result){
										
										if(result == "YYYY"){
											
											$.ajax({
												url : "sendMsgRecover.mg",
												
												type :"get",
					            				
					            				traditional: true, //배열 넘기는 옵션
												
					            				data : {msgNoArr : sendArr},
												
												success : function(result){
													
													if(result == "YYYY"){
														alert("복구가 완료 되었습니다.")
													}else{
														alert("쪽지 복구에 실패하였습니다. 다시 시도해 주세요 ")
													}
												}
											});
											
										}else{
											alert("쪽지 복구에 실패하였습니다. 다시 시도해 주세요 ")
										}
										
		            					location.reload();
									}
								});
							}
						}
						
					}
				});
			});
		
		</script>		
		
            <br clear="both"><br>
        </div>
	</div>
</body>
</html>
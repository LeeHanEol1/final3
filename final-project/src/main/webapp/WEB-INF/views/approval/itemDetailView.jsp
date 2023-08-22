<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	
    <script src="https://cdn.tiny.cloud/1/omjcnn5e647lx0jwm8neb7k3o37nkkx0hrgiaxjo1oc1bnvd/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
          selector: '#docContent',
          plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
          toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
        });
     </script>
	<link rel="stylesheet" href="/final3/resources/css/Approval_ItemDetail.css" >
     <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Song+Myung&display=swap" rel="stylesheet">
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <br><br><br><br>
    <hr>
    <h1 align="center">구매 품의서</h1>
    <hr>
        <div class="item-area">
        	<input type="hidden" name="deptCode" value="${loginUser.deptCode }">
        	<input type="hidden" name="docType" value="2">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
           	<c:if test="${(a.secondApproverNo == loginUser.userNo) || (a.lastApproverNo == loginUser.userNo) }">
	            <div id="item-btn-area">
	                <button type="button" class="btn btn-primary" id="approval-btn" onclick="approval();">승인</button>
    	            <button type="button" class="btn btn-danger" id="reject-btn" data-toggle="modal" data-target="#rejectModal">반려</button>
    	            <button type="button" class="btn btn-success" onclick="saveApproval();">나가기</button>
        	        <input type="checkbox" id="emergency-btn" value="${ad.emergency }"><label for="긴급">긴급문서</label>
	            </div>
           	</c:if>
            <div id="item-header">
            <!-- 중간결재자 유무에 따른 div -->
               <c:choose>
               		<c:when test="${!empty a.secondApprover }">
			    		<table class='table table-bordered' id='approver-signature'>
			                <tbody>
			                    <tr><th rowspan="5">결재</th></tr>
			                    <tr><td><input type="text" value="${a.lastJobName}" readonly/></td></tr>
			                    <tr><td><input type="text" id="lastSignature" value="${a.lastSignature }" style="font-family: 'Song Myung', serif;font-size: 20px" readonly/></td></tr>
			                    <tr><td><input type="text" id="lastApprover" value="${a.lastApprover }" style="font-size: 12px" readonly/></td></tr>
			                	<tr><td><input type="text" id="lastDate" value="${a.lastDate}" style="font-size: 12px" readonly></td></tr>
			                </tbody>
			    		</table>
               			<table class='table table-bordered' id='approver-signature'>
			                <tbody>
			                    <tr><th rowspan="5">결재</th></tr>
			                    <tr><td><input type="text" value="${a.secondJobName}" readonly/></td></tr>
			                    <tr><td><input type="text" id="secondSignature" value="${a.secondSignature }" style="font-family: 'Song Myung', serif;font-size: 20px" readonly/></td></tr>
			                    <tr><td><input type="text" id="secondApprover" value="${a.secondApprover}" style="font-size: 12px" readonly/></td></tr>
			                	<tr><td><input type="text" id="secondDate" value="${a.secondDate}" style="font-size: 12px" readonly></td></tr>
			                </tbody>
			    		</table>
               		</c:when>
               		<c:otherwise>
               			<table class='table table-bordered' id='approver-signature'>
			                <tbody>
			                    <tr><th rowspan="5">결재</th></tr>
			                    <tr><td><input type="text" value="${a.lastJobName}" readonly/></td></tr>
			                    <tr><td><input type="text" id="lastSignature" value="${a.lastSignature }" style="font-family: 'Song Myung', serif;font-size: 23px" readonly/></td></tr>
			                    <tr><td><input type="text" id="lastApprover" value="${a.lastApprover }" style="font-size: 12px" readonly/></td></tr>
			                	<tr><td><input type="text" id="lastDate" value="${a.lastDate}" style="font-size: 12px" readonly></td></tr>
			                </tbody>
			    		</table>
               		</c:otherwise>
               </c:choose>
            </div>
            <hr>
            <div id="item-content">
                <div id="item-content1">
                    <table class="table table-bordered" width="100%" height="100%" style="border-collapse: collapse;vertical-align: middle">
                        <tr>
                            <th width="15%">작성자</th>
                            <td><input type="text" id="docWriter" value="${loginUser.userName}" readonly></td>
                            <th width="15%">전화번호</th>
                            <td><input type="text" id="phone" value="${loginUser.phone}" readonly></td>
                            <th width="15%">문서번호</th>
                            <td><input type="text" id="docNo" value="${ad.docNo}" readonly></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td colspan="5"><input type="text" id="docTitle" name="docTitle" value="${ad.docTitle}" readonly></td>
                        </tr>
                    </table>
                </div>
                <br><br>
                <div id="item-content2">
                    <textarea id="docContent" name="docContent" readonly>${ad.docContent }</textarea>
                </div>
                <div id="item-content3">
                    <table class="table table-bordered" id="id-table" style="border-collapse: collapse;">
                    	<thead>
	                        <tr>
	                           <th width="5%"></th>
	                           <th width="15%">신청일</th>
	                           <th width="45%">품명</th>
	                           <th width="15%">규격</th>
	                           <th width="10%">수량</th>
	                           <th width="10%">단가</th>
	                        </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="i" items="${iList }">
				                <tr>
				                   <td></td>
				                   <td><input type="text" value="${i.createDate}" readonly></td>
					               <td><input type="text" value="${i.supplyName}" readonly></td>
					               <td><input type="text" value="${i.supplySize}" readonly></td>
					               <td><input type="text" value="${i.amount}" readonly></td>
				                   <td><input type="text" value="${i.price}" readonly></td>
		                        </tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                    <br><br>
                    
	               <div class="mb-3" id="file-area">
				   		<table class="table table-bordered" id="file-table" >
				            <thead>
				                <tr>
				                    <th width="5%"></th>
					                <th>첨부파일</th>          
				                </tr>
				            </thead>
				            <tbody>
				            	<c:forEach var="at" items="${at}">
				                <tr>
				                    <td></td>
				                    <td><a href="/final3${at.filePath }" download="${at.originName }" style="float:left">${at.originName}</a></td>
				                </tr>
				                </c:forEach>
				            </tbody>
				        </table>
					</div>
 					
                </div>
            </div>
        </div>
        <br><br><br><br><br><br><br><br><br><br>
	
	<!-- 반려 이유 입력 -->
	<div class="modal fade" id="rejectModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">반려사유</h1>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
		      <textarea name="returnReason" id="returnReason">${a.returnReason}</textarea>	      
		  </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" onclick="updateReject();">완료</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script>
	//긴급문서 체크
	$(function(){
		var result = $("#emergency-btn").val();
		
		if(result == 'Y'){
			$("#emergency-btn").attr("checked",true);
		}else{
			$("#emergency-btn").attr("checked",false);
		}
	});
	//승인
	function approval(){
		var loginUserNo = "${loginUser.userNo}";
		var loginUserName = "${loginUser.userName}"
		var lastApprover = "${a.lastApproverNo}";
		var secondApprover = "${a.secondApproverNo}";
		var docNo = "${ad.docNo}";
		var secondDate = "${a.secondDate}";
		var lastDate = "${a.lastDate}";
		
		var lastSignature = "${a.lastApprover}";
		var secondSignature = "${a.secondApprover}";
		var docWriter = "${ad.docWriter}";
		var docTitle = "${ad.docTitle}";
		var docType = "${dt}";
		
		if(loginUserNo === secondApprover){
			$.ajax({
				url : "updateSecondApprover.ap",
				type : "POST",
				data : {
					secondSignature : loginUserName,
					docNo : docNo
				},
				beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				success : function(result){
					if(result>0){
						$("#secondSignature").attr("value",loginUserName);
						$("#secondDate").attr("value",secondDate);
						location.reload();
    					
						//실시간 알림 서버에 보내기 
						if(secondSignature != docWriter){
							if (socket != null) {
							    var message = "itemApproval," + secondSignature + ","+ docWriter +","+ docNo+","+ docTitle+","+ docType;
							    console.log(message);
							    socket.send(message);
							}
						}
						
						alert("승인이 완료되었습니다.")
					}
				},
				error : function(){
					console.log("통신오류")
				}
			});
		}else if(loginUserNo===lastApprover){
			if("${a.secondApprover}" ==null){
				alert("중간결재자의 승인이 누락되었습니다.");
			}else{
				$.ajax({
    				url : "updateLastApprover.ap",
    				type : "POST",
    				data : {
    					lastSignature : loginUserName,
    					docNo : docNo,
    					status:'Y'
    				},
    				beforeSend : function(xhr)
                    {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
    				success : function(result){
    					console.log(result)
    					if(result>0){
    						$("#lastSignature").attr("value",loginUserName);
    						$("#approval-btn").attr("disabled",true);
    						$("#reject-btn").attr("disabled",true);
    						$("#emergency-btn").attr("checked",false);
    						$("#lastDate").attr("value",lastDate);
    						location.reload();
    						
    						//실시간 알림 서버에 보내기 
    						if(lastSignature != docWriter){
    							if (socket != null) {
    							    var message = "itemApproval," + lastSignature + ","+ docWriter +","+ docNo+","+ docTitle+","+ docType;
    							    console.log(message);
    							    socket.send(message);
    							}
    						}
    						
    						alert("승인이 완료되었습니다.");
    					}
    				},
    				error : function(){
    					console.log("통신오류")
    				}
    			})
			}
		}
		
	}
	//반려
	function updateReject(){
		var loginUserNo = "${loginUser.userNo}";
		var lastApprover = "${a.lastApproverNo}";
		var secondApprover = "${a.secondApproverNo}";
		var docNo = "${ad.docNo}";
		var returnReason = $("#returnReason").val();
		var secondDate = "${a.secondDate}";
		var lastDate = "${a.lastDate}";
		
		var lastSignature = "${a.lastApprover}";
		var secondSignature = "${a.secondApprover}";
		var docWriter = "${ad.docWriter}";
		var docTitle = "${ad.docTitle}";
		var docType = "${dt}";
		
		if(secondApprover == loginUserNo){
			if(confirm("반려하시겠습니까?")){
	    		$.ajax({
					url: "updateSecondReturnReason.ap",
					type:"POST",
					data:{
						returnReason:returnReason,
						docNo : docNo,
					},
					beforeSend : function(xhr)
	                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                },
					success : function(result){
						if(result>0){
							$("#secondSignature").attr("value","반려");	
							$("#secondDate").attr("value",secondDate);
							location.reload();
							
							//실시간 알림 서버에 보내기 
    						if(secondSignature != docWriter){
    							if (socket != null) {
    							    var message = "itemUpdateReject," + secondSignature + ","+docWriter+","+docNo+","+docTitle+","+docType;
									console.log(message);
    							    socket.send(message);
    							}
    						}
						}else{
							console.log("실패");
						}
					},
					error : function(){
						console.log("통신오류");
					}
				});
			}
		}else if(loginUserNo == lastApprover){
			if("${a.secondApprover}" ==null){
				alert("중간결재자의 승인이 누락되었습니다.");
			}else if(confirm("반려하시겠습니까?")){
	    		$.ajax({
					url: "updateLastReturnReason.ap",
					type:"POST",
					data:{
						returnReason:returnReason,
						docNo : docNo,
						status:'R'
					},
					beforeSend : function(xhr)
	                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                },
					success : function(result){
						console.log(result);
						if(result>0){
							$("#lastSignature").attr("value","반려");	
							$("#emergency-btn").attr("checked",false);
							$("#returnReason").attr("readonly",true);
							$("#approval-btn").attr("disabled",true);
							$("#reject-btn").attr("disabled",true);
							$("#lastDate").attr("value",lastDate);
							location.reload();
							
							//실시간 알림 서버에 보내기 
    						if(lastSignature != docWriter){
    							if (socket != null) {
    							    var message = "itemUpdateReject," + lastSignature + ","+docWriter+","+docNo+","+docTitle+","+docType;
									console.log(message);
    							    socket.send(message);
    							}
    						}
						}else{
							console.log("실패");
						}
					},
					error : function(){
						console.log("통신오류");
					}
				});
			}
		}
		$("#rejectModal").modal('hide');
	}
	
	//반려와 승인이이후 버튼 막기
	$(function(){
		var status = "${ad.status}"
		if(status == 'Y'){
			$("#approval-btn").attr("disabled",true);
			$("#reject-btn").attr("disabled",true);
			$("#emergency-btn").attr("checked",false);
		}else if(status=='R'){
			$("#approval-btn").attr("disabled",true);
			$("#reject-btn").attr("disabled",true);
			$("#emergency-btn").attr("checked",false);
		}
	});
	function saveApproval(){
		location.href ="list.ap";
	}
	
	$(function(){
		var result = $("#emergency-btn").val();
		
		if(result == 'Y'){
			$("#emergency-btn").attr("checked",true);
		}else{
			$("#emergency-btn").attr("checked",false);
		}
	});
	</script>
</body>
</html>
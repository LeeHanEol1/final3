<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<%@ include file="../common/menubar.jsp" %>
	<link rel="stylesheet" href="/final3/resources/css/Approval_LeaveForm.css" >
	
</head>
<body>
	<br><br><br><br>
    <form action="leave.ap" method="post" enctype="multipart/form-data" onsubmit="return chkLeaveForm();">
        <h1 align="center">휴가계</h1>
        <br><br>
        <div class="leave-area">
            <input type="hidden" name="deptCode" value="${loginUser.deptCode }">
            <input type="hidden" name="docType" value="1">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="docWriter" value="${loginUser.userNo}">
            
            <div id="leave-btn-area">
                <button type="submit" class="btn btn-primary">기안</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#approverModal">
                   	결재선
                </button>
                <input type="checkbox" name="emergency" id="emergency-btn" onclick="emergencyChk();"><label for="긴급">긴급문서</label>
            </div>
            <div id="leave-header">
            </div>
            <div id="leave-content">
                <div id="leave-content1">
                    <table class="table table-bordered" width="100%" height="100%" id="member-info-table";>
                        <tr>
                            <th width="13%">작성자</th>
                            <td><input type="text" id="docWriter" value="${loginUser.userName }" readonly></td>
                            <th width="13%">전화번호</th>
                            <td><input type="text" id="phone" name="phone" value="${loginUser.phone }" readonly></td>
                            <th width="13%">문서번호</th>
                            <td><input type="text" id="docNo" readonly></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td colspan="5"><input type="text" id="docTitle" name="docTitle"></td>
                        </tr>
                    </table>
                </div>
                <br><br>
                <div id="leave-content2">
                    <table class="table table-bordered" style="text-align: center;">
                            <th width="15%">연차현황</th>
                            <th width="15%">발생현황</th>
                            <td><input type="text" value="" id="total-leave" readonly></td>
                            <th width="15%">사용현황</th>
                            <td><input type="text" value="" id="use-leave" readonly></td>
                            <th width="15%">잔여현황</th>
                            <td><input type="text" value="" id="remain-leave" readonly></td>
                    </table>
                    <table class="table table-bordered" style="text-align: center;" id="leave-table">
                        <thead>
                            <tr>
                                <td colspan="6">
                                    <button type="button" class="btn btn-danger" style="float:right" onclick="deleteRow();">삭제</button>
                                    <button type="button" class="btn btn-primary" style="float:right" onclick="addRow();">추가</button>
                                </td>
                            </tr>
                            <tr>
                                <th width="4%"><input type="checkbox" id="checkBoxAll" onclick="checkAll();"></th>
                                <th width="17%">휴가신청구분</th>
                                <th width="15%">휴가구분</th>
                                <th width="15%">시작일</th>
                                <th width="15%">종료일</th>
                                <th width="15%">기간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" name="checkBox" onclick="isCheckAll();"></td>
                                <td>
                                    <select name=arrLeaveStatus id="select-option" >
                                        <option>선택</option>
                                        <option>신청</option>
                                        <option>취소</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="arrLeaveCode" id="select-leave-option" >
                                        <option value="">선택</option>
                                        <option value="L1">정상근무</option>
                                        <option value="L2">연차</option>
                                        <option value="L3">병가</option>
                                        <option value="L4">오전반차</option>
                                        <option value="L5">오후반차</option>
                                        <option value="L6">휴직</option>
                                        <option value="L7">육아휴직</option>
                                        <option value="L8">재택근무</option>
                                        <option value="L9">복직</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="date" name="arrStartDate" id="start-date">
                                </td>
                                <td>
                                    <input type="date" name="arrEndDate" id="end-date">
                                </td>
                                <td>
                                    <input type="text" value="" id="total-date">
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                            <th colspan="6">사유</th>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <textarea name="leaveContent" id="reason" cols="30" rows="5"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="3" style="vertical-align: middle;" >업무인수자</th>
                                <td colspan="3">
                                    <input type="text" name="workReceiver" value="" style="width: 80%;vertical-align: middle;" >
                                    <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#workReceiverModal" value="검색" style="float: right;height: 35px;vertical-align: middle;">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <pre name="leave-notice" id="leave-notice" readonly>
[증빙서류 첨부안내]
(1) 훈련
- 예비군/민방위 훈련 확인서
(2) 휴직
- 병가휴직 : 1개월 이상 3개월 이내 의사 진단서
(3) 출산
- 본인출산(女) : 출산예정일이 적힌 산모수첩이나 의사진단서
- 배우자 출산휴가(男) : 출생증명서
                                    </pre>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                    <br><br>
                    <div class="mb-3" id="file-area">
                        <table class="table table-bordered" id="file-table" >
                         <thead>
                             <tr>
                                 <td colspan="2">
                                     <button type="button" class="btn btn-danger" style="float:right" onclick="deleteFile();">삭제</button>
                                     <button type="button" class="btn btn-primary" style="float:right" onclick="addFile();">추가</button>
                                 </td>
                             </tr>
                             <tr>
                                 <th width="5%"><input type="checkbox" id="fileCheckBoxAll" onclick="checkAllFile();"></th>
                                 <th>첨부파일</th>          
                             </tr>
                         </thead>
                         <tbody>
                             <tr>
                                 <td><input type="checkbox" name="fileCheckBox" onclick="isCheckAllFile();"></td>
                                 <td><input class="form-control" type="file" id="upfile" name="upfile"></td>
                             </tr>
                         </tbody>
                     </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
    
<!-- 업무 인수자 선택 -->
        <div class="modal fade" id="workReceiverModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" style="width:1100px">
            <div class="modal-content">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title" id="workReceiverModalLabel">업무인수자 선택</h2>
                </div>
                <div class="modal-body" style="height:500px;">
                    <div id="organization-area">
                        <div id="organization-list">
                            <button type="button" id="organization-btn" onclick="selectReceiverList();">조직도</button>
                            <button type="button" id="organization-btn" onclick="selectReceiverList('D1');">기타</button>
                            <button type="button" id="organization-btn" onclick="selectReceiverList('D2');">회계관리부</button>               
                            <button type="button" id="organization-btn" onclick="selectReceiverList('D3');">마케팅부</button>
                            <button type="button" id="organization-btn" onclick="selectReceiverList('D4');">국내영업부</button>
                            <button type="button" id="organization-btn" onclick="selectReceiverList('D5');">해외영업부</button>
                            <button type="button" id="organization-btn" onclick="selectReceiverList('D6');">기술지원부</button>
                            <button type="button" id="organization-btn" onclick="selectReceiverList('D7');">총무부</button>
                            <button type="button" id="organization-btn" onclick="selectReceiverList('D8');">회계부</button>
                            <button type="button" id="organization-btn" onclick="selectReceiverList('D9');">인사관리부</button>
                        </div>
                </div>
                <div id="search-area">
                                <select name="status" id="receiver-search-select">
                                <option value="1">부서</option>
                                <option value="2">이름</option>
                            </select>
                                <input class="form-control me-2" id="receiver-keyword" type="text" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success" type="submit" onclick="searchReceiver();">Search</button>
                    <table id="receiverList" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th width="10%"></th>
                                    <th width="20%">이름</th>
                                    <th width="20%">직위</th>
                                    <th width="30%">부서</th>
                                    <th width="20%">사원ID</th>
                                </tr>
                            </thead>
                            <tbody>
	                           
                            </tbody>
                        </table>
                </div>
                <div id="selectReceiver">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="2">업무 인수자 선택</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td rowspan="3">
                                    <button type="button" class="btn btn-primary" id="receiver-btn" onclick="addReceiver();">추가하기</button>
                                    <button type="button" class="btn btn-danger" id="receiver-btn" onclick="deleteReceiver();">삭제하기</button>
                                </td>
                                </tr>
                                <tr><td>업무 인수자</td></tr>
                                <tr><td><input type="text" id="workReceiver" readonly></td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="selectReceiver();">완료</button>
                </div>
            </div>
            </div>
        </div>


<!-- 결재라인 선택 -->
		<div class="modal fade" id="approverModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" style="width:1000px">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h2 class="modal-title" id="exampleModalLabel">결재라인 선택</h2>
		      </div>
		      <div class="modal-body" style="height:500px;">
                   <div id="organization-area">
                        <div id="organization-list">
                            <button type="button" id="organization-btn" onclick="selectApproverList();">조직도</button>
                            <button type="button" id="organization-btn" onclick="selectApproverList('D1');">기타</button>
                            <button type="button" id="organization-btn" onclick="selectApproverList('D2');">회계관리부</button>               
                            <button type="button" id="organization-btn" onclick="selectApproverList('D3');">마케팅부</button>
                            <button type="button" id="organization-btn" onclick="selectApproverList('D4');">국내영업부</button>
                            <button type="button" id="organization-btn" onclick="selectApproverList('D5');">해외영업부</button>
                            <button type="button" id="organization-btn" onclick="selectApproverList('D6');">기술지원부</button>
                            <button type="button" id="organization-btn" onclick="selectApproverList('D7');">총무부</button>
                            <button type="button" id="organization-btn" onclick="selectApproverList('D8');">회계부</button>
                            <button type="button" id="organization-btn" onclick="selectApproverList('D9');">인사관리부</button>
                        </div>
                 </div>
                 <div id="search-area">
		                  	<select name="select" id="approval-search-select">
		                         <option value="1">부서</option>
		                         <option value="2">이름</option>
		                    </select>
		                         <input class="form-control me-2" id="approval-keyword" type="text" placeholder="Search" aria-label="Search">
		                         <button class="btn btn-outline-success" type="submit" onclick="searchApprover();">Search</button>
			        <table id="approverList" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th width="10%"></th>
                                    <th width="20%">이름</th>
                                    <th width="20%">직위</th>
                                    <th width="30%">부서</th>
                                    <th width="20%">사원ID</th>
                                </tr>
                            </thead>
                            <tbody style="overflow:auto;">
                               
                            </tbody>
                        </table>
		         </div>
		         <div id="selectApprover">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="2">결재 단계선택</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td rowspan="3">
                                    <button type="button" class="btn btn-primary" id="approver-btn" onclick="addApprover1();">추가하기</button>
                                    <button type="button" class="btn btn-danger" id="approver-btn" onclick="deleteApprover1();">삭제하기</button>
                                </td>
                                </tr>
                                <tr><td>중간결재자</td></tr>
                                <tr><td><input type="text" id="approver1" readonly></td></tr>
                                <tr>
                                    <td rowspan="3">
                                        <button type="button" class="btn btn-primary" id="approver-btn" onclick="addApprover2();">추가하기</button>
                                        <button type="button" class="btn btn-danger" id="approver-btn"onclick="deleteApprover2();">삭제하기</button>
                                    </td>
                                </tr>
                                <tr><td>최종결재자</td></tr>
                                <tr><td><input type="text" id="approver2" readonly required></td></tr>
                            </tbody>
                        </table>
		      		</div>
		      	</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" id="select-approver-btn" onclick="selectApprover();">완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		<script>
		//시간 계산
		$(function() {
		  $("#leave-table").on("change", "#start-date, #end-date", function() {
		    var startDate = new Date($(this).closest("tr").find("#start-date").val());
		    if (isNaN(startDate)) {
		      // 잘못된 형식의 날짜 입력 처리
		      // 예: 오류 메시지 출력 또는 기본 값 설정
		      // $(this).closest("tr").find("#start-date").val("");
		      return;
		    }
		
		    var endDate = new Date($(this).closest("tr").find("#end-date").val());
		    if (isNaN(endDate)) {
		      // 잘못된 형식의 날짜 입력 처리
		      // 예: 오류 메시지 출력 또는 기본 값 설정
		      // $(this).closest("tr").find("#end-date").val("");
		      return;
		    }
		
		    var timeDiff = endDate.getTime() - startDate.getTime();
		    var dayDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24))+1;
		
		    if (dayDiff < 0) {
		      // 마이너스 값인 경우 알림 창 띄우기
		      alert("종료일은 시작일보다 이후여야 합니다.");
		      return;
		    }
		
		    $(this).closest("tr").find("#total-date").val(dayDiff+"일");
		  });
		});
		
		
	//업무 인수자 조직도 조회
    function selectReceiverList(deptCode){
    		$.ajax({
    			url:"selectApproverList.ap",
    			type : "POST",
    			data:{
    				deptCode : deptCode
    			},
    			beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
    			success : function(list){
    				str ="";
    				for(var i=0;i<list.length;i++){
    					str += "<tr>"
    						 + "<td><input type='checkbox' id='chkMember'></td>"
    						 + "<td>"+list[i].userName+"</td>"
    						 + "<td>"+list[i].jobCode+"</td>"
    						 + "<td>"+list[i].deptCode+"</td>"
    						 + "<td>"+list[i].userNo+"</td>"
    						 + "</tr>"
    				}
	    			$("#receiverList>tbody").html(str);
    			},
    			error : function(){
    				console.log("통신오류");
    			}
    		});
    	}
    	//업무 인수자 검색
    	function searchReceiver(){
			var status = $("#receiver-search-select").val();
			var keyword = $("#receiver-keyword").val();
    		$.ajax({
    			url : "selectApproverList.ap",
    			type : "POST",
    			
    			data :{
    				status : status,
    				keyword : keyword
    			},
    			beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
    			success : function(list){
    				str ="";
    				for(var i=0;i<list.length;i++){
    					str += "<tr>"
    						 + "<td><input type='checkbox' id='chkMember'></td>"
    						 + "<td>"+list[i].userName+"</td>"
    						 + "<td>"+list[i].jobCode+"</td>"
    						 + "<td>"+list[i].deptCode+"</td>"
    						 + "<td>"+list[i].userNo+"</td>"
    						 + "</tr>"
    				}
	    			$("#receiverList>tbody").html(str);
    			},
    			error : function(){
    				console.log("통신오류");
    			}
    		});
    	}
    	//인수자 추가
    	function addReceiver(){
    		var tdReceiver = new Array();
    		var checkbox1 = $("#chkMember:checked");
    		var loginUserNo = "${loginUser.userNo}";

    		checkbox1.each(function(i){
    			var tr = checkbox1.parent().parent().eq(i);
    			var td = tr.children();
    			
    			
    			var username = td.eq(1).text();
    			var jobname = td.eq(2).text();
    			var deptname = td.eq(3).text();
    			var userno = td.eq(4).text();
    			
    			tdReceiver.push(username);
    			tdReceiver.push(jobname);
    			tdReceiver.push(deptname);
    			tdReceiver.push(userno);
    			
    		});
    			if(tdReceiver[3] == loginUserNo){
    				alert("인수자와 작성자가 동일합니다. 다시확인해주세요.");
    				$("#receiverList>tbody input[type=checkbox]").prop("checked",false);
    				$("#workReceiver").attr("value",'');
    			}else{
	    			$("#workReceiver").attr("value", tdReceiver[0]+"("+tdReceiver[1]+","+tdReceiver[2]+")");
	    			$("#receiverList>tbody input[type=checkbox]").prop("checked",false);
    			}
    	}
    	//인수자 삭제
    	function deleteReceiver(){
    		$("#workReceiver").attr("value","");
    	}
    	
    	//인수자 입력
    	function selectReceiver(){
    		
    		var receiver = $("#workReceiver").val();
    		
    		if($("#workReceiver").val()==''){
    			alert("인수자를 선택해주세요.")
    		}else{
    			$("input[name=workReceiver]").attr("value",receiver);
    			$("#workReceiverModal").modal('hide');
    		}
    	}
        //행추가
    	function addRow(){
    		var trCount = $("#leave-table>tbody>tr").length;
    		var insertTr = "";
    		
    		if(trCount<5){
	    		insertTr += "<tr>";
	    		insertTr += "<td><input type='checkbox' name='checkBox'onclick='isCheckAll();''></td>";
	    		insertTr += "<td>";
	            insertTr += "<select name='arrLeaveStatus' id='select-option'>";
	            insertTr += "<option>선택</option>";
	            insertTr += "<option>신청</option>";
	            insertTr += "<option>취소</option>";
	            insertTr += "</select>";
	            insertTr += "</td>";
	            insertTr += "<td>";
	            insertTr += "<select name='arrLeaveCode' id='select-leave-option'>";
	            insertTr += "<option value=''>선택</option>";
	            insertTr += "<option value='L1'>정상근무</option>";
	            insertTr += "<option value='L2'>연차</option>";
	            insertTr += "<option value='L3'>병가</option>";
	            insertTr += "<option value='L4'>오전반차</option>";
	            insertTr += "<option value='L5'>오후반차</option>";
	            insertTr += "<option value='L6'>휴직</option>";
	            insertTr += "<option value='L7'>육아휴직</option>";
	            insertTr += "<option value='L8'>재택근무</option>";
	            insertTr += "<option value='L9'>복직</option>";
	            insertTr += "</select>";
	            insertTr += "</td>";
	            insertTr += "<td>";
	            insertTr += "<input type='date' name='arrStartDate' id='start-date'>"
	            insertTr += "</td>";
	            insertTr += "<td>";
	            insertTr += "<input type='date' name='arrEndDate' id='end-date'>"
	            insertTr += "</td>";
	            insertTr += "<td>";
	            insertTr += "<input type='text' value='' id='total-date'>"
	            insertTr += "</td>";
	    		insertTr += "</tr>";
	    		
	    		$("#leave-table tbody").append(insertTr);
    		}else{
    			alert("최대 5개까지만 가능합니다.")
    		}
    	}                            
    	//행삭제
    	function deleteRow(){
    		var idTable = document.getElementById("leave-table");
    		var lastRow=document.querySelectorAll("#leave-table>tbody>tr").length;
    		if(lastRow>1){
    			if(confirm("정말로 삭제하시겠습니까?")){
    	    		for(var i=lastRow-1;i>-1;i--){
    	    			if(document.querySelectorAll("#leave-table>tbody>tr")[i].cells[0].firstChild.checked){
    	    				document.querySelectorAll("#leave-table>tbody>tr")[i].remove();
        				}
      	    		}
        		}
    		}
    	}
		//전체선택, 전체 해제
    	function checkAll(){
    		if($("#checkBoxAll").is(":checked")){
    			$("input[name=checkBox]").prop("checked",true);
    		}else{
    			$("input[name=checkBox]").prop("checked",false);
    		}
    	}
    	function isCheckAll(){
    		var checkBox = document.getElementsByName("checkBox");
    		for(var i=0;i<checkBox.length;i++){
	   			if(checkBox[i].checked == false){
    			document.getElementById("checkBoxAll").checked = false;	   				
	   			}
	    	}
	    }
    	//파일 행 추가
    	function addFile(){
    		var insertTrFile = "";
    		
    		insertTrFile += "<tr>";
    		insertTrFile += "<td><input type='checkbox' name='fileCheckBox' onclick='isCheckAllFile();'></td>";
    		insertTrFile += "<td><input class='form-control' type='file' id='upfile' name='upfile'></td>";
    		insertTrFile += "</tr>";
    		
    		$("#file-table").append(insertTrFile);
    	}
    	//파일 행 삭제
    	function deleteFile(){
    		var lastRow=document.querySelectorAll("#file-table>tbody>tr").length;
    		if(lastRow>1){
    			if(confirm("정말로 삭제하시겠습니까?")){
    	    		for(var i=lastRow-1;i>-1;i--){
    	    			if(document.querySelectorAll("#file-table>tbody>tr")[i].cells[0].firstChild.checked){
    	    				document.querySelectorAll("#file-table>tbody>tr")[i].remove();
        				}
    	    		}
        		}
    		}
    	}
    	//파일 테이블 전체 선택/해제
    	function checkAllFile(){
    		if($("#fileCheckBoxAll").is(":checked")){
    			$("input[name=fileCheckBox]").prop("checked",true);
    		}else{
    			$("input[name=fileCheckBox]").prop("checked",false);
    		}
    	}
    	function isCheckAllFile(){
    		var checkBox = document.getElementsByName("fileCheckBox");
    		for(var i=0;i<checkBox.length;i++){
	   			if(checkBox[i].checked == false){
    			document.getElementById("fileCheckBoxAll").checked = false;	   				
	   			}
	    	}
	    }
    	//조직도 조회
    	function selectApproverList(deptCode){
    		$.ajax({
    			url:"selectApproverList.ap",
    			type : "POST",
    			data:{
    				deptCode : deptCode
    			},
    			beforeSend : function(xhr)
                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
    			success : function(list){
    				str ="";
    				for(var i=0;i<list.length;i++){
    					str += "<tr>"
    						 + "<td><input type='checkbox' id='chkMember'></td>"
    						 + "<td>"+list[i].userName+"</td>"
    						 + "<td>"+list[i].jobCode+"</td>"
    						 + "<td>"+list[i].deptCode+"</td>"
    						 + "<td>"+list[i].userNo+"</td>"
    						 + "</tr>"
    				}
	    			$("#approverList>tbody").html(str);
    			},
    			error : function(){
    				console.log("통신오류");
    			}
    		});
    	}
    	//결재자 검색
    	function searchApprover(){
			var status = $("#approval-search-select").val();
			var keyword = $("#approval-keyword").val();
			if(keyword == ''){
				alert("검색어를 입력해주세요");
			}else{
				$.ajax({
	    			url : "selectApproverList.ap",
	    			type : "POST",
	    			data :{
	    				status : status,
	    				keyword : keyword
	    			},
	    			beforeSend : function(xhr)
	                {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                },
	    			success : function(list){
	    				str ="";
	    				for(var i=0;i<list.length;i++){
	    					str += "<tr>"
	    						 + "<td><input type='checkbox' id='chkMember'></td>"
	    						 + "<td>"+list[i].userName+"</td>"
	    						 + "<td>"+list[i].jobCode+"</td>"
	    						 + "<td>"+list[i].deptCode+"</td>"
	    						 + "<td>"+list[i].userNo+"</td>"
	    						 + "</tr>"
	    				}
		    			$("#approverList>tbody").html(str);
	    			},
	    			error : function(){
	    				console.log("통신오류");
	    			}
	    		});
			}
    	}
    	//결재선 추가
    	function addApprover1(){
    		var tdArr1 = new Array();
    		var checkbox1 = $("#chkMember:checked");
    		var loginUserNo = "${loginUser.userNo}";
    		
    		checkbox1.each(function(i){
    			var tr = checkbox1.parent().parent().eq(i);
    			var td = tr.children();
    			
    			var username = td.eq(1).text();
    			var jobname = td.eq(2).text();
    			var deptname = td.eq(3).text();
    			var userno = td.eq(4).text();
    			
    			tdArr1.push(username);
    			tdArr1.push(jobname);
    			tdArr1.push(deptname);
    			tdArr1.push(userno);
    			
    		});
    		if(tdArr1[3] == loginUserNo){
    			alert("결재자와 작성자가 동일합니다. 다시확인해주세요.");
    			$("#approver1").attr("value",'');
    			$("#approverList>tbody input[type='checkbox']").prop("checked",false);    			
    		}else{
    			$("#approver1").attr("value",tdArr1);
    			$("#approverList>tbody input[type='checkbox']").prop("checked",false);
    		}
    	}
    	function addApprover2(){
    		var tdArr2 = new Array();
    		var checkbox2 = $("#chkMember:checked");
    		var loginUserNo = "${loginUser.userNo}";
    		
    		checkbox2.each(function(i){
    			var tr = checkbox2.parent().parent().eq(i);
    			var td = tr.children();
    			
    			
    			var username = td.eq(1).text();
    			var jobname = td.eq(2).text();
    			var deptname = td.eq(3).text();
    			var userno = td.eq(4).text();
    			
    			tdArr2.push(username);
    			tdArr2.push(jobname);
    			tdArr2.push(deptname);
    			tdArr2.push(userno);
    			
    			
    			});
    		if(tdArr2[3] == loginUserNo){
    			alert("결재자와 작성자가 동일합니다. 다시확인해주세요.");
    			$("#approver2").attr("value",'');
    			$("#approverList>tbody input[type='checkbox']").prop("checked",false);    			
    		}else{
    			$("#approver2").attr("value",tdArr2);
    			$("#approverList>tbody input[type='checkbox']").prop("checked",false);
    		}
    	}
    	
    	//결재선 삭제
    	function deleteApprover1(){
    		$("#approver1").attr("value","");
    	}
    	
    	function deleteApprover2(){
    		$("#approver2").attr("value","");
    	}
 		
    	//결재 테이블생성
    	function selectApprover(){
    		var approver1 = $("#approver1").val().split(',');
    		var approver2 = $("#approver2").val().split(',');
    		
    		var username1 = approver1[0];
			var jobname1 = approver1[1];
			var userNo1 = approver1[3];
			var username2 = approver2[0];
			var jobname2 = approver2[1];
			var userNo2 = approver2[3];
    		

    		var insertTB = "";
    		
    		if(approver1==''){
    			insertTB += "<input type='hidden' name='lastApproverNo' value='"+userNo2+"'></td></tr>";
	    		insertTB += "<table class='table table-bordered' id='approver-signature'>";
    			insertTB += "<tbody>";
    			insertTB += "<tr><th rowspan='4'>결재</th></tr>";
    			insertTB += "<tr><td><input type='text' name='lastJobName' value='"+jobname2+"'></td></tr>";
    			insertTB += "<tr><td><input type='text' name='lastApprover' value='"+username2+"'></td></tr>";
    			insertTB += "<tr><td>&nbsp;</td></tr>";
    			insertTB += "</tbody>";
    			insertTB += "</table>";
    		}else{
    			insertTB += "<input type='hidden' name='secondApproverNo' value='"+userNo1+"'></td></tr>";
    			insertTB += "<input type='hidden' name='lastApproverNo' value='"+userNo2+"'></td></tr>";
    			insertTB += "<table class='table table-bordered' id='approver-signature'>";
    			insertTB += "<tbody>";
    			insertTB += "<tr><th rowspan='4'>결재</th></tr>";
    			insertTB += "<tr><td><input type='text' name='lastJobName' value='"+jobname2+"'></td></tr>";
    			insertTB += "<tr><td><input type='text' name='lastApprover' value='"+username2+"'></td></tr>";
    			insertTB += "<tr><td>&nbsp;</td></tr>";
    			insertTB += "</tbody>";
    			insertTB += "</table>";
    			insertTB += "<table class='table table-bordered' id='approver-signature'>";
    			insertTB += "<tbody>";
    			insertTB += "<tr><th rowspan='4'>결재</th></tr>";
    			insertTB += "<tr><td><input type='text' name='secondJobName' value='"+jobname1+"'></td></tr>";
    			insertTB += "<tr><td><input type='text' name='secondApprover' value='"+username1+"'></td></tr>";
    			insertTB += "<tr><td>&nbsp;</td></tr>";
    			insertTB += "</tbody>";
    			insertTB += "</table>";
    		}
    		if($("#approver2").val()=='' && $("#approver1").val()==''){
    			alert("결재자를 선택해주세요.")
    		}else if($("#approver2").val()==''){
    			alert("최종결재자를 선택해주세요.")
    		}else if(($("#approver1").val()!='' || $("#approver2").val()!='')&&
   	        	 ($("#approver1").val() == $("#approver2").val())){
    			alert("결재자가 동일합니다. 다시 선택해주세요");
    		}else{
	    		$("#leave-header").html(insertTB);
	    		$("#approverModal").modal('hide');
    		}
    	}
    	//긴급문서
    	function emergencyChk(){
    		if($("#emergency-btn").is(":checked")){
    			$("#emergency-btn").attr("value","Y");
    		}else{
    			$("#emergency-btn").attr("value","N");
    		}
    	}
    	//결재자 확인
    	function chkLeaveForm(){
    		var today = new Date().toISOString().split('T')[0];
    		var startDate2 = $("#start-date").val();
    		var endDate2 = $("#end-date").val();
    		var flag = "";
    		
    		if($("input[name=lastApprover]").val()==null){
    			alert("결재자를 선택해주세요.");
    			flag = false;
    		}else if(today>startDate2){
    			alert("오늘 날짜 이후로만 입력가능합니다.")
    			flag = false;
    		}else if(today>endDate2){
    			alert("오늘 날짜 이후로만 입력가능합니다.")
    			flag = false;
    		}else if($("#docTitle").val()==''){
    			alert("제목을 입력해주세요.");
    			flag = false;
    		}else{
    			flag = true;
    		}
    		return flag;
    	}
		</script>
   </body>
</html>
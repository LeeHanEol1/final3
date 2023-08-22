<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link rel="stylesheet" href="/final3/resources/css/Approval_ItemForm.css" >
	<%@ include file="../common/menubar.jsp" %>
    <script src="https://cdn.tiny.cloud/1/omjcnn5e647lx0jwm8neb7k3o37nkkx0hrgiaxjo1oc1bnvd/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
          selector: 'textarea',
          plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
          toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
        });
     </script>
</head>        
<body>
    <br><br><br><br>
    <form action="item.ap" method="post" enctype="multipart/form-data" id="item-form" onsubmit="return chkItemForm();">
    <h1 align="center">구매 품의서</h1>
    <br><br>
        <div class="item-area">
        	<input type="hidden" name="deptCode" value="${loginUser.deptCode }">
        	<input type="hidden" name="docType" value="2">
        	<input type="hidden" name="docWriter" value="${loginUser.userNo}">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div id="item-btn-area">
                <button type="submit" class="btn btn-primary">기안</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                	결재선
                </button>
                <input type="checkbox" name="emergency" id="emergency-btn" onclick="emergencyChk();"><label for="긴급">긴급문서</label>
            </div>
            <div id="item-header">
               
            </div>
            <div id="item-content">
                <div id="item-content1">
                    <table class="table table-bordered" width="100%" height="100%" id="member-info-table">
                        <tr>
                            <th width="15%">작성자</th>
                            <td><input type="text" id="docWriter"  value="${loginUser.userName}" readonly></td>
                            <th width="15%">전화번호</th>
                            <td><input type="text" id="phone" name="phone" value="${loginUser.phone}" readonly></td>
                            <th width="15%">문서번호</th>
                            <td><input type="text" id="docNo" readonly></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td colspan="5"><input type="text" id="docTitle" name="docTitle"></td>
                        </tr>
                    </table>
                </div>
                <div id="item-content2">
                    <textarea name=docContent>
                     </textarea>
                </div>
                <div id="item-content3">
                    <table class="table table-bordered" id="item-table" style="border-collapse: collapse;">
                    	<thead>
	                    	<tr>
	                            <td colspan="6" align="right">
	                            	<button type="button" class="btn btn-danger" style="float:right" onclick="deleteRow();">삭제</button>
	                            	<button type="button" class="btn btn-primary" style="float:right" onclick="addRow();">추가</button>
	                            </td>
	                        </tr>
	                        <tr>
	                           <th width="5%"><input type="checkbox" id="checkBoxAll" onclick="checkAll();"></th>
	                           <th width="15%">신청일</th>
	                           <th width="45%">품명</th>
	                           <th width="15%">규격</th>
	                           <th width="10%">수량</th>
	                           <th width="10%">단가</th>
	                        </tr>
                        </thead>
                        <tbody>
	                        <tr>
	                        	<td><input type="checkbox" name="checkBox" onclick="isCheckAll();"></td>
	                            <td><input type="date"></td>
	                            <td><input type="text" name="arrSupplyName" ></td>
	                            <td><input type="text" name="arrSupplySize" value="0"></td>
	                            <td><input type="text" name="arrAmount" value="0"></td>
	                            <td><input type="text" name="arrPrice" value="0"></td>
	                        </tr>
                        </tbody>
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
        <br><br><br><br><br><br><br><br><br><br>
    </form>
        <!-- 결재라인 선택 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" style="width:1000px">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">결재라인 선택</h1>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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
		                  	<select name="status" id="search-select">
		                         <option value="1">부서</option>
		                         <option value="2">이름</option>
		                    </select>
		                         <input class="form-control me-2" id="keyword" type="text" placeholder="Search" aria-label="Search">
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
                            <tbody>
                               
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
		        <button type="submit" class="btn btn-primary" onclick="selectApprover();">완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		<script>
		//행추가
		function addRow(){
    		var trCount = $("#item-table>tbody>tr").length;
    		var insertTr = "";
    		
    		if(trCount<10){
    			insertTr += "<tr>";
    			insertTr += "<td><input type='checkbox' name='checkBox' onclick='isCheckAll();'></td>";
    			insertTr += "<td><input type='date'></td>";
    			insertTr += "<td><input type='text' name='arrSupplyName' ></td>";
    			insertTr += "<td><input type='text' name='arrSupplySize' value='0'></td>";
    			insertTr += "<td><input type='text' name='arrAmount' value='0'></td>";
    			insertTr += "<td><input type='text' name='arrPrice' value='0'></td>";
    			insertTr += "</tr>";
	    		
	    		$("#item-table tbody").append(insertTr);
    		}else{
    			alert("최대 10개까지만 가능합니다.")
    		}
		}
    	//행삭제
    	function deleteRow(){
    		var idTable = document.getElementById("item-table");
    		var lastRow=document.querySelectorAll("#item-table>tbody>tr").length;
    		if(lastRow>1){
    			if(confirm("정말로 삭제하시겠습니까?")){
    	    		for(var i=lastRow-1;i>-1;i--){
    	    			if(document.querySelectorAll("#item-table>tbody>tr")[i].cells[0].firstChild.checked){
    	    				document.querySelectorAll("#item-table>tbody>tr")[i].remove();
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
    		var fileTable = document.getElementById("file-table");
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
			var status = $("#search-select").val();
			var keyword = $("#keyword").val();
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
    			insertTB += "<tr'><td><input type='text' name='lastApprover' value='"+username2+"'></td></tr>";
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
	    		$("#item-header").html(insertTB);
	    		$("#exampleModal").modal('hide');
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
    	function chkItemForm(){
    		var flag = "";
    		
    		if($("input[name=lastApprover]").val()==null){
    			alert("결재자를 선택해주세요.");
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
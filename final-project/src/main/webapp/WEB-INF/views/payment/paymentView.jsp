<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 명세서 조회 </title>
<style>
	
	.content{
        width: 1570px;
    }
    
    .payment_content{
		width:100%;
        height:100%;
        margin:auto;
        padding:2%;
        background-color:white;
    }
    
    .payment_content>h1{
    	margin : 0;
    }
    
    .payment_content #payment_search_area{
		margin-top: 20px;
		margin-bottom : 20px;		    	
    }
    
    #payment_search_area>input{
    	width : 10%;
    	float: left;
    	margin-right:5px;
    }
    
    .payment_content #payment_list{
    	width : 100%;
    
    }
    
    #payment_table th{
    	width: 8%;
    	text-align:center;
    
    }
	
	#payment_table>thead td, #payment_table>thead th{
		border-bottom : 3px solid #ddd;
	}
	
	.payment_content *{
		font-family: 'KimjungchulGothic-Bold';
	}
	
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<div class="content">
	<div class="payment_content">
        <h1 id="payHeader">급여 명세서</h1>
      
        <div id ="payment_search_area">
            <input type="month" id="monthly" name="monthly" class="form-control"> <button type="button" id="search-btn" class="btn btn-secondary" > 조회 </button>
            <button type="button" class="btn btn-seconary" data-toggle="modal" data-target="#account"> 계좌등록/변경 </button>
            <button type="button" id="print-btn" class="btn btn-primary">인쇄하기</button>
        </div>
        <script>
        	//영역 지정 프린트 
        	$(function(){
        		$("#print-btn").on("click", function(){
        			var printHeader = document.getElementById("payHeader");
        			var printContent = document.getElementById("payment_list");
                	var winPrint = window.open('','','left=0,top=0,width=1000,height=600,toolbar=0,scrollbars=0,status=0');

                	winPrint.document.write(printHeader.innerHTML);
                	winPrint.document.write(printContent.innerHTML);
                	winPrint.document.write('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>') //적용한 cssLinkTag도 함께 불러와야 적용된채로 출력 
                	winPrint.document.close();
                	winPrint.focus();
                	winPrint.print();
                	winPrint.close();
        		})
        	});
        	
        
        </script>
        
        <div id="payment_list">
            <table  class="table table" id="payment_table">
               	<thead>
	                <tr>
	                    <td colspan="2" style="font-weight:700; text-align:center;" >사번</td>
	                    <td colspan="2" style="text-align:center;">${mInfo.userNo}</td>
	                    <td colspan="2" style="font-weight:700; text-align:center; ">성명</td>
	                    <td colspan="2" style="text-align:center;">${mInfo.userName}</td>
	                    <td colspan="2" style="font-weight:700; text-align:center; ">지급월 </td>
	                    <td colspan="2" style="text-align:center;" id="month"></td>
	                    
	                </tr>
	                <tr>
	                	<td colspan="2" style="font-weight:700; text-align:center; ">부서</td>
	                    <td colspan="2" style="text-align:center;">${mInfo.deptName}</td> 
	                    <td colspan="2" style="font-weight:700; text-align:center; ">직급</td>
	                    <td colspan="2" style="text-align:center;">${mInfo.jobName}</td> 
	                    <td colspan="2" style="font-weight:700; text-align:center;">지급계좌</td>
	                    <td colspan="2" style="text-align:center;">${mInfo.accountNumber }</td>
	                </tr>
                 	<tr>
	                    <th colspan="3">지급내역</th>
	                    <th colspan="3">지급액</th>
	                    <th colspan="3">공제내역</th>
	                    <th colspan="3">공제액</th>
	                </tr>
                </thead>
                <tbody>
	               
	                <tr >
	                	<th colspan="3">기본급</th>
	                    <td colspan="3" style="text-align:right;" id="salary"></td>
	                    <th colspan="3">국민연금</th>
	                    <td colspan="3" style="text-align:right;" id="nationalPension"></td>
	               </tr>
	               <tr>
	               		<th colspan="3" style="border-top:0px;" >식대</th>
	                    <td colspan="3" style="border-top:0px; text-align:right;" id="meals"></td>
	                    <th colspan="3" style="border-top:0px;">건강보험</th>
	                    <td colspan="3" style="border-top:0px; text-align:right;" id="healthInsurance"></td>
	               </tr>
	               <tr>
	               		<th colspan="3" style="border-top:0px;">추가근로수당</th>
	                    <td colspan="3" style="border-top:0px; text-align:right;" id="overtimePay"></td>
	                    <th colspan="3" style="border-top:0px;">고용보험</th>
	                    <td colspan="3" style="border-top:0px; text-align:right;" id="empInsurance"></td>
	               </tr>
	               <tr>
	               		<th colspan="3" style="border-top:0px;">휴일근로수당</th>
	                    <td colspan="3" style="border-top:0px; text-align:right;" id="holidayPay"></td>
	                    <th colspan="3" style="border-top:0px;">장기요양보험</th>
	                    <td colspan="3" style="border-top:0px; text-align:right;" id="lngInsurance"></td>
	               </tr>
	               <tr>
	               		<th colspan ="3" style="border-top:0px;" >연차수당</th>
	                    <td colspan ="3" style="border-top:0px; text-align:right;" id="annualLeavePay"></td>
	                    <th colspan ="3" style="border-top:0px;"></th>
	                    <td colspan ="3" style="border-top:0px;"></td>
	               </tr>
	               <tr>
	               		<th colspan ="3" style="border-top:0px;">그외수당</th>
	                    <td colspan ="3" style="border-top:0px; text-align:right;" id="otherPay"></td>
	                    <th colspan ="3" style="border-top:0px;"></th>
	                    <td colspan ="3" style="border-top:0px;"></td>
	               </tr>
	               <tr>
	                    <th colspan ="3" ></th>
	                    <td colspan ="3" ></td>
	               		<th colspan ="3">공제계액</th>
	                    <td colspan ="3" style="text-align: right;" id="deductionSum"></td>
	               </tr>
	               <tr>
	                    <th colspan ="3" style="border-bottom:3px solid #ddd;">지급계액</th>
	                    <td colspan ="3" style="border-bottom:3px solid #ddd; text-align:right;" id="originTotal"></td>
	               		<th colspan ="3" style="border-bottom:3px solid #ddd;">차인지급액</th>
	                    <td colspan ="3" style="border-bottom:3px solid #ddd; text-align:right;" id="totalPay" ></td>
	               </tr>
                </tbody>
            </table>
        </div>
        <div id = "account-area">
        	<!--  계좌 신청 모달 --> 
        	<div class="modal fade" id="account" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			      	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
			        <h2 class="modal-title fs-5" id="staticBackdropLabel">계좌변경/신청</h2>
			      </div>
			      <div class="modal-body">
			      	<!-- 계좌정보 -->
			      	<select name="bank" id="bankName" class="form-control" style="width:20%; float:left; margin-right:5px;">
			      		<option >은행명</option>
			      		<option value="국민은행">국민은행</option>
			      		<option value="신한은행">신한은행</option>
			      		<option value="하나은행">하나은행</option>
			      		<option value="농협은행">농협은행</option>
			      		<option value="기업은행">기업은행</option>
			      		<option value="sc제일은행">sc제일은행</option>
			      		<option value="저축은행">저축은행</option>
			      		<option value="새마을금고">새마을금고</option>
			      		<option value="우체국">우체국</option>
			      		<option value="신협">신협</option>
			      		<option value="수협">수협</option>
			      	</select>
			      	<input type="text" placeholder="-를 포함하여 입력해주세요" class="form-control" id="accountNumber" style="width: 50%; float:left; margin-right:5px;" required>
			      	<button type="button" id="change-account" class="btn btn-primary">등록/변경</button>
			      </div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close" >취소</button>
			        
			      </div>
			    </div>
			  </div>
			</div>
        </div>
        <!-- 계좌 등록/변경 script -->
        <script>
       	 	payment();
        		//$("#payment_list").css("display:none");
        		//계좌 변경및 등록 신청
        		$("#change-account").on("click",function(){
        			var $account = $("#accountNumber").val();
					var chk = /^[\d\-]{10,16}/
					
        			if($account==""){
        				alert("계좌번호를 입력해주세요");
        				$("#accountNumber").focus();
        			}else if(!$account.match(chk)){
        				alert("잘못된 형식입니다. 다시 입력해주세요")
        				$("#accountNumber").focus();
        			}else if($("#bankName").val()== "은행명"){
        				alert("은행명을 선택해주세요")
        			}else{
        				if(confirm("계좌 변경을 신청하시겠습니까?")){
        					$.ajax({
        						
	        					url : "account.pa",
	        					type : "post",
	        					beforeSend : function(xhr){
	        			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        			        },
	        					data : {
	        						userNo : '${loginUser.userNo}',
	        						bank : $("#bankName").val(),
	        						accountNumber : $("#accountNumber").val()
	        					},
	        					success : function(result){
	        						if(result == "YYYY"){
	        							 alert("급여 계좌 등록/변경 신청이 완료되었습니다.")
	        						}else{
	        							alert("급여 계좌 등록/변경 신청에 실패하였습니다. 다시 시도해주세요")
	        						}
	        						location.reload();
	        					},	
	        					error : function(){
	        						console.log("통신실패");
	        					}
        				
        					});
        					
        				}
        			}
        		});
        		
        	//월별 조회 
        	$(function(){
        		$("#search-btn").on("click",function(){
        			if($("#monthly").val()==""){
        				alert("원하는 조회달을 선택해주세요")
        				$("#monthly").focus()
        			}else{
        				
        				$.ajax({
	        				url : "monthPayment.me",
	        				type : "post",
	        				beforeSend : function(xhr){
				                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				        	},
	        				data : { 
	        					userNo : '${loginUser.userNo}',
	        					monthly : $("#monthly").val()
	        				},
	        				
	        				success : function(pay){
	        					if(pay != null){
	        						$("#month").html(pay.monthly) //지급월 
		        					$("#salary").html(pay.salary.toLocaleString()+'₩'); //급여
		        					$("#nationalPension").html(pay.nationalPension.toLocaleString()+'₩'); //국민연금
		        					$("#meals").html(pay.meals.toLocaleString()+'₩'); //식대
		        					$("#healthInsurance").html(pay.healthInsurance.toLocaleString()+'₩'); //건강보험
		        					$("#overtimePay").html(pay.overtimePay.toLocaleString()+'₩'); //추가근무수당
		        					$("#empInsurance").html(pay.empInsurance.toLocaleString()+'₩'); //고용보험
		        					$("#holidayPay").html(pay.holidayPay.toLocaleString()+'₩'); //휴일근무수당
		        					$("#lngInsurance").html(pay.lngInsurance.toLocaleString()+'₩'); //장기요양보험
		        					$("#annualLeavePay").html(pay.annualLeavePay.toLocaleString()+'₩'); //연차수당
		        					$("#otherPay").html(pay.otherPay.toLocaleString()+'₩'); //그외수당 
		        					
		        					//세금합계 
		        					var deduction = pay.nationalPension + pay.healthInsurance + pay.empInsurance + pay.lngInsurance ;
									
		        					//급여 합계 
		        					var originTotal = pay.salary + pay.meals + pay.overtimePay + pay.holidayPay +pay.annualLeavePay +pay.otherPay;
		        					
		        					//총급여 
		        					var totalPay = originTotal-deduction;
		        					
		        					$("#deductionSum").html(deduction.toLocaleString()+'₩') // 공제합계 
		        					$("#originTotal").html(originTotal.toLocaleString()+'₩') //지급계액 
		        					$("#totalPay").html(totalPay.toLocaleString()+'₩') //차인지급액 
		        					
	        					}else{
	        						alert("조회된 내역이 없습니다.");
	        					}
	        				},
	        				
	        				error : function(){
	        					console.log("통신실패");
	        				}
        				
        				});
        			}
        			
        		});
        		
        	});
        	
        	//가장 최근 급여 명세서 조회  
    		function payment(){
    			$.ajax({
    				url : "newestPayment.pa",
    				type : "post",
    				beforeSend : function(xhr){
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        	},
    				data : { 
    					userNo : '${loginUser.userNo}'
    				},
    				
    				success : function(pay){
    					if(pay != null){

    						$("#month").html(pay.monthly) //지급월 
    						$("#monthly").val(pay.monthly)
        					$("#salary").html(pay.salary.toLocaleString()+'₩'); //급여
        					$("#nationalPension").html(pay.nationalPension.toLocaleString()+'₩'); //국민연금
        					$("#meals").html(pay.meals.toLocaleString()+'₩'); //식대
        					$("#healthInsurance").html(pay.healthInsurance.toLocaleString()+'₩'); //건강보험
        					$("#overtimePay").html(pay.overtimePay.toLocaleString()+'₩'); //추가근무수당
        					$("#empInsurance").html(pay.empInsurance.toLocaleString()+'₩'); //고용보험
        					$("#holidayPay").html(pay.holidayPay.toLocaleString()+'₩'); //휴일근무수당
        					$("#lngInsurance").html(pay.lngInsurance.toLocaleString()+'₩'); //장기요양보험
        					$("#annualLeavePay").html(pay.annualLeavePay.toLocaleString()+'₩'); //연차수당
        					$("#otherPay").html(pay.otherPay.toLocaleString()+'₩'); //그외수당 
        					
        					//세금합계 
        					var deduction = pay.nationalPension + pay.healthInsurance + pay.empInsurance + pay.lngInsurance ;
							
        					//급여 합계 
        					var originTotal = pay.salary + pay.meals + pay.overtimePay + pay.holidayPay +pay.annualLeavePay +pay.otherPay;
        					
        					//총급여 
        					var totalPay = originTotal-deduction;
        					
        					$("#deductionSum").html(deduction.toLocaleString()+'₩') // 공제합계 
        					$("#originTotal").html(originTotal.toLocaleString()+'₩') //지급계액 
        					$("#totalPay").html(totalPay.toLocaleString()+'₩') //차인지급액 
        					
    					}else{
    						alert("조회된 내역이 없습니다.");
    					}
    				},
    				
    				error : function(){
    					console.log("통신실패");
    				}
    			})
    		}
        	
        </script>
    </div>
</div>
</body>
</html>
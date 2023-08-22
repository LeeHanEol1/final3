<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 명세서 조회 </title>
<style>
	*{
		font-family: 'KimjungchulGothic-Bold';
	}
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
	
	#payment_table input{
		background-color : white;
	}
	
	#payment_table>thead td, #payment_table>thead th{
		border-bottom : 3px solid #ddd;
	}
	
	#userPaymentList{
		width : 100%;
		height : 300px;
		overflow: auto;
		margin-top: 30px;
		display : none;
	}
	
	

</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<div class="content">
	<div class="payment_content">
        <h1>급여 명세서 작성</h1>
        <div id ="payment_search_area">
       		<button type="button" onclick="location.href='payment.ad'" class="btn btn-primary" style="background-color: #0E6251;" > 목록으로 </button>
            <button type="button" id="paymentList" class="btn btn-secondary" > 전체 조회 </button>
            <button type="button" id="entryPayment" class="btn btn-primary" > 작성 완료 </button>
        </div>
        <div id="payment_list">
            <table  class="table table" id="payment_table">
               	<thead>
	                <tr>
	                    <td style="font-weight:700; text-align:center;" >사번
	                    <td style="text-align:center;" >${mInfo.userNo}</td>
	                    <td style="font-weight:700; text-align:center; ">성명</td>
	                    <td style="text-align:center;">${mInfo.userName}</td>
	                    <td style="font-weight:700; text-align:center; ">부서</td>
	                    <td style="text-align:center;">${mInfo.deptName}</td> 
	                    <td style="font-weight:700; text-align:center; ">직급</td>
	                    <td style="text-align:center;">${mInfo.jobName}</td> 
	                </tr>
	                <tr>
	                	<td style="font-weight:700; text-align:center; ">입사일</td>
	                    <td style="text-align:center;">${mInfo.empolymentDate}</td>
	                    <td style="font-weight:700; text-align:center; ">지급월 </td>
	                    <td style="text-align:center;"><input type="date" class="form-control" id="monthly" name="monthly"></td>
	                    <td style="font-weight:700; text-align:center; ">계좌번호</td>
	                    <td style="text-align:center;" >${mInfo.bank}</td>
	                    <td colspan ="2" style="text-align:center;" >${mInfo.accountNumber}</td>
	                </tr>
	                 <tr>
	                    <th colspan="4">지급내역</th>
	                    <th colspan="4">지급액</th>
	                </tr>
                </thead>
                <tbody>
	               
	                <tr >
	                	<th colspan="4">기본급</th>
	                    <td colspan="4"><input type="number" name="salary" id="salary" class="form-control"></td>
	               </tr>
	               <tr>
	               		<th colspan="4" style="border-top:0px;">식대</th>
	                    <td colspan="4" style="border-top:0px;"><input type="number" name="meals" id="meals" class="form-control"></td>
	               </tr>
	               <tr>
	               		<th colspan="4" style="border-top:0px;">추가근로수당</th>
	                    <td colspan="4" style="border-top:0px;"><input type="number" name="overtimePay" id="overtimePay" value="0" class="form-control"></td>
	               </tr>
	               <tr>
	               		<th colspan="4" style="border-top:0px;">휴일근로수당</th>
	                    <td colspan="4" style="border-top:0px;"><input type="number" name="holidayPay" id="holidayPay" value="0" class="form-control"></td>
	               </tr>
	               <tr>
	               		<th colspan ="4" style="border-top:0px;" >연차수당</th>
	                    <td colspan ="4" style="border-top:0px;"><input type="number" name="annualLeavePay" id="annualLeavePay" value="0" class="form-control"></td>
	               </tr>
	               <tr>
	               		<th colspan ="4" style="border-bottom:3px solid #ddd;">그외수당</th>
	                    <td colspan ="4" style="border-bottom:3px solid #ddd;"><input type="number" name="otherPay" id="otherPay" value="0" class="form-control"></td>
	               </tr>
                </tbody>
            </table>
        </div>
        <!-- 해당 유저 급여 목록 영역 (숨겨뒀다 버튼 클릭시 나오도록)  -->
        <div id="userPaymentList">
        	<table class="table table-hover">
	        	<thead>
	        		<tr>
	        			<th>NO.</th>
	        			<th>사번</th>
	        			<th>이름</th>
	        			<th>부서</th>
	        			<th>직급</th>
	        			<th>발행일</th>
	        		</tr>
	        	</thead>	
	        	<tbody>
	        		<!-- 조회 결과 영역  -->
	        	</tbody>
        	</table>
        </div>
    </div>
</div>
	<script>
		$(function(){
			
			$("#overtimePay").on("click",function(){
				$("#overtimePay").val("");
			});
			
			$("#holidayPay").on("click",function(){
				$("#holidayPay").val("");
			});
			
			$("#annualLeavPay").on("click",function(){
				$("#annualLeavPay").val("");
			});
			
			$("#otherPay").on("click",function(){
				$("#otherPay").val("");
			});
			
			$("#entryPayment").on("click",function(){
				var bank = '${mInfo.bank}';
				var account = '${mInfo.accountNumber}';
				
				if(bank == '' || account ==''){
					alert("계좌 미등록 상태입니다. 계좌 정보를 업데이트 해주세요 ")
				}else if($("#monthly").val() == ""){
					alert("등록일자를 선택해주세요 ")
					$("#monthly").focus();
				}else if($("#salary").val() == ""){
					alert("급여를 입력해주세요")
					$("#salary").focus();
				}else if($("#meals").val()==""){
					alert("식대를 입력해주세요")
					$("#meals").focus();
				}else{
					//추가근로수당,휴일근로수당,연차수당,그외수당이 빈문자열로 넘어올 경우 0으로 다시 세팅
					if($("#overtimePay").val()==""){
						$("#overtimePay").val(0);
					}else if($("#holidayPay").val()==""){
						$("#holidayPay").val(0)
					}else if($("annualLeavPay").val()==""){
						$("annualLeavPay").val(0)
					}else if($("otherPay").val()==""){
						$("otherPay").val(0)
					}
					
					if(confirm("급여명세서를 등록하시겠습니까?")){
						//급여 등록 요청 
						$.ajax({
							url : "insertPayment.ad",
							
							type: "post",
							
							beforeSend : function(xhr)
				            {
				                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				            },
				            
				            data : {
				            	
				            	userNo : '${mInfo.userNo}',
				            	monthly : $("#monthly").val(),
				            	salary : $("#salary").val(),
				            	meals : $("#meals").val(),
				            	overtimePay : $("#overtimePay").val(),
				            	holidayPay : $("#holidayPay").val(),
				            	annualLeavePay : $("annualLeavPay").val(),
				            	otherPay : $("otherPay").val()
				            	
				            },
				            
				            success : function(result){
				            	console.log(result);
				            	if(result == 'YYYY'){
				            		alert("급여 등록이 완료되었습니다.")
				            	}else if(result ="duplicate"){
				            		alert("이미 등록된 급여 명세서가 존재합니다.")	
				            	}else{
				            		alert("급여 등록에 실패하였습니다. 다시 시도해주세요");
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
		})
		
		$(function(){
			$("#paymentList").on("click",function(){
				
				//해당 회원의 급여 명세서 list조회
				$.ajax({
					url : "list.pa",
					
					data : {
						userNo : '${mInfo.userNo}'
					},
					
					success : function(list){
						var str = "";
						if(list.length !=0){
							for(var i = 0 ; i <list.length ; i++){
								str += "<tr>"
									+ "<td>" + list[i].payNo + "</td>"
									+ "<td>" + list[i].userNo + "</td>"
									+ "<td>" + list[i].userName+ "</td>"
									+ "<td>" + list[i].deptName + "</td>"
									+ "<td>" + list[i].jobName + "</td>"
									+ "<td>" + list[i].monthly + "</td>"
									+ "</tr>";
							}
						}else{
							str += "<tr>"
								+ "<td colspan='6' style='text-align:center;'> 조회 결과가 없습니다. </td>"
								+ "</tr>"
						}
						
						$("#userPaymentList>table>tbody").html(str);
					}
				})
				if($("#userPaymentList").css("display") =="none"){
					$("#userPaymentList").show();
				}else{
					$("#userPaymentList").hide();
				}
			})
		})
	
	</script>
</body>
</html>
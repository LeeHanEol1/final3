<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지쓰기</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
<style>
	@font-face {
	    font-family: 'KimjungchulGothic-Bold';
	    font-style: normal;
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2') format('woff2');
	}
		
	@font-face {
    	font-family: 'HallymGothic-Regular';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2204@1.0/HallymGothic-Regular.woff2') format('woff2');
   	 	font-style: normal;
    }

	.messenger_content {
	    background-color:#0E6251;
	    width:100%;
	    height: 750px;
	    margin:auto;
	}
	.innerOuter {
	    border:1px solid lightgray;
	    width:970px;
	    height:100%;
	    margin:auto;
	    padding:3% 7%;
	    background-color:white;
	}
	
   	/* navi 영역 */
	.innerOuter>#msg_nav{
		width:100%;
		height: 130px;
	}
	      
	#msg_nav>ul{
		list-style-type: none;
		padding: 0;
		margin-top: 10px;
		margin-bottom : 10px;
	     	
	}
	     
	#msg_nav li a{
		text-decoration-line: none;
		color: black;
		font-size: 20px;
		font-weight: 700;
	}
	
	#msg_nav li a:hover{
		font-size :23px;
		color: #009966;
	}
	
	#msg-enrollForm{
	    width:100%;
	}
	
	#msg-enrollForm>#msg_btn_area{
		width : 100%;
		margin-top : 10px;
		margin-bottom :20px;
	}
	
	#msg-enrollForm>table {
	    width:100%;
	}
	
	#msg-enrollForm>table * {
	    margin:5px;
	}
	
	/* modal style  */
	.modal-content{
		width:550px;
	}
	#msg-searchNameList{
		table-layout:fixed;
	}
	
	#msg-searchNameList th, #msg-searchNameList td{
		text-align: center;
	}
	
	h1, h2, a, th, select{
		font-family: 'KimjungchulGothic-Bold';
	}
	
	td, input {
 		font-family: 'HallymGothic-Regular';
	}
	
	.messenger_content button {
		font-family: 'KimjungchulGothic-Bold';
	}
	
	.modal-content button {
		font-family: 'KimjungchulGothic-Bold';
	}
	
</style>
</head>
<body>
	<div class="messenger_content">
		<div class="innerOuter">
			<h2>쪽지 쓰기 </h2> 
			<div id="msg_nav">
				<ul>
					<li><a href="insert.mg">쪽지쓰기</a></li>
					<li><a href="list.mg">받은쪽지함</a></li>
					<li><a href="slist.mg">보낸쪽지함</a></li>
					<li><a href="tlist.mg">휴지통</a></li>
				</ul>
			</div>
			<script>
				/* 긴급 체크박스 변화시 value값 변경 */
				$(function(){
					$("#emcChk").on("change",function(){
						if($(this).prop("checked") == true){
							$("input[name=emcStatus]").val("Y");
						}else{
							$("input[name=emcStatus]").val("N");
						}
					});
				});
				
				/* 취소하기 버튼 클릭 */
				$(function(){
					$("#insert-reset").on("click", function(){
						if(confirm("쪽지 작성을 취소하시겠습니까?")){
							location.href="list.mg";
						}
					})
				})
			</script>
			<div id="msg_list">
				<form id="msg-enrollForm" action="insert.mg" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                <div id="msg_btn_area">
	                    <button class="btn btn-primary">보내기</button>
	                    <button type="button" id="insert-reset" class="btn btn-danger">취소</button>
	                </div>
	                <!-- 쪽지 작성 영역 -->
	                <table id="msg-table" align="center">
	                    <tr>
	                        <th width="120">제목</th>
	                        <td width="80">
       	                			<input id="emcChk" type="checkbox" style="width:15px; height:15px;" > 긴급
	       	                		<input type="hidden" name="emcStatus" value="N">
                    		</td>
                    		<td width="500">
                    			<input name="msgTitle" type="text" class="form-control" style="width:100%; margin-right:0px;" maxlength="30" placeholder="제목을 입력해주세요" required >
                    		</td>
	                    </tr>
	                    <tr>
	                        <th>보낸사람</th>
	                        <td colspan="2">
	                        	<input type="text" class="form-control" value="${loginUser.userId} (${loginUser.userName})" readonly>
	                        	<input type="hidden" name="sender" value="${loginUser.userNo }"> <!-- controller에 보낼사람 번호  -->
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>받는사람</th>
	                        <td colspan="2">
	                        	<input type="text" id="recvUser" class="form-control" readonly>
	                         	<input type="hidden" id="recvUno" name="recvUno"> <!-- controller에 받는사람 번호 --> 
	                        </td>
	                        <td>
	                        	<button type="button" class="btn btn-secondary" id="address" style="margin-left:20px;" data-bs-toggle="modal" data-bs-target="#staticBackdrop">주소록</button>
                        	</td>
	                    </tr>
	                    <tr>
	                        <th>내용</th>
	                        <td colspan="2">
	                        	<textarea name="msgContent" id="content" class="form-control" rows="8" style="resize:none;" maxlength="320" placeholder="내용을 입력해주세요"required></textarea>
	                        </td>
	                    </tr>
	                </table>
	                <br>
	            </form>
	        </div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">주소록</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<table id="msg-searchName" class="table table">
	      		<thead>
	      			<tr>
						<td>
							<select id="deptCode" name="deptCode" class="form-control"  style="width:30%; float:left; margin-right:5px; text-align:center">
								<option value="전체">전체</option>
								<option value="D1">기타</option>
	                            <option value="D2">회계관리부</option>
	                            <option value="D3">마케팅부</option>
	                            <option value="D4">국내영업부</option>
	                            <option value="D5">해외영업부</option>
	                            <option value="D6">기술지원부</option>
	                            <option value="D7">총무부</option>
	                            <option value="D8">회계부</option>
	                            <option value="D9">인사관리부</option>
							</select>
							<input type="text" id="searchName" class="form-control" style="width:50%; float:left; margin-right:5px;">
							<button id="addressSearch" class="btn btn-secondary" type="button" onclick="searchAdd();">검색</button>
						</td>
	      			</tr>
	      		</thead>
	      	</table>
	      	
	      	<table id="msg-searchNameList" class="table table" >
	      		<thead style="display: block;">
	      			<tr>
	      				<th width="40">NO.</th>
	      				<th width="60">선택</th> 
						<th width="120">아이디</th>
						<th width="100">이름</th>
						<th width="120">부서</th>
						<th width="80">직급</th>
	      			</tr>
	      		</thead>
				<tbody style= " display: block; height: 300px; width:100%; overflow:auto;">
					<!-- 검색 결과를 담아줄 곳  -->
				</tbody>	      			
	      	</table>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="button" id="searchSubmit" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		/* 주소록 검색 script */
		//여러 사람을 선택할 경우를 위해 배열 생성 -- script 전역에서 사용하기 위해 가장 바깥에 생성함  
		var objArray = new Array();
		//1. 주소록 버튼 눌렀을 때 발생할 이벤트 
		$("#address").on("click", function(){
			
			//$("#recvUser").val(); //기존에 입력된 id값이 있다면 지워주기
			
			$("#searchName").val(""); //기존에 검색한 키워드가 있다면 지워주기 
		});
		
		//2.Modal - 키워드 검색시 발생할 이벤트  
		function searchAdd(){
			
			var $keyword = $("#searchName").val(); //input창에 작성한 검색 키워드 변수에 담아주기 
			var $deptCode =$("#deptCode").val();
			
			var str = ""; //검색 내역을 띄워줄 내용을 담을 변수 
			
			$.ajax({
				
				url : "searchName.mg",
				
				data : {keyword : $keyword, deptCode : $deptCode},
				
				success : function(result){
					
					if(result.length != 0){ //list가 비어있는지 유무는 length로 판단 
						for(var i in result){
							if(result[i].userNo != '${loginUser.userNo}' ){
								str += "<tr>"
									+"<td width='40'>"+ result[i].userNo +"</td>"
									+"<td width='60'><input name='searchChk' type='checkbox' style=' margin:auto; width:15px; height:15px'></td>"
									+"<td width='120'>" + result[i].userId + "</td>"
									+"<td width='100'>" + result[i].userName + "</td>"
									+"<td width='120'>" + result[i].deptName + "</td>"
									+"<td width='80'>" + result[i].jobName + "</td>"
									+"</tr>";
							}
						}
	      			
					}else{
						str +="<tr>"
							+"<td width='520' colspan='6'> 검색 결과가 존재하지 않습니다. </td>"
							+ "</tr>";
					}
					
					//Modal의 content 부분의table에 뿌려주기
					$("#msg-searchNameList>tbody").html(str);
					
				},
				
				error : function(){
					console.log("통신실패");
				}
			});
				
		};
		
		//3.선택한 받는사람 목록 input창에 띄워주기 위한 함수  
		$(function(){
			//체크박스 클릭시 발생할 이벤트 함수
			$("#msg-searchNameList>tbody").on("change","tr input[type=checkbox]",function(){
					
					//객체 배열(objArray)에 담을 변수 
					var $uno = $(this).parent().siblings().eq(0).text(); 	//받는사람 회원번호  
					var $uId = $(this).parent().siblings().eq(1).text(); 	//받는사람 아이디 
					var $uName = $(this).parent().siblings().eq(2).text(); 	//받는사람 이름 
					
					//클릭한 체크박스가 체크되어 있다면 배열에 담기 
					if($(this).prop("checked") == true){
						for(var i = 0 ; i<objArray.length; i++){ 
            				if(objArray[i].userNo === $uno){ // 두번 선택되는것을 방지 
            					alert("이미 선택되었습니다. ")
		            			return false;
            				}
            			}
						objArray.push({userNo : $uno, userId: $uId, userName:$uName})
					}else{
						for(let i = 0 ; i<objArray.length; i++){
            				if(objArray[i].userNo === $uno){
            					objArray.splice(i,1);
            					console.log("확인")            					
            				}
            			}
					}
					//console.log(objArray);
			});
			
			//모달창에서 확인 클릭시 검색 내역 -> 보낸사람 value에 담고 기존 검색 내역 삭제 
			$("#searchSubmit").on("click",function(){
			 	var str="";
			 	var unoStr ="";
				for(var i = 0 ; i <objArray.length ; i++){
					//input창에 띄워줄 받는사람 목록 
					str += objArray[i].userId+"("+objArray[i].userName+")" + ",";
					
					//controller로 넘겨줄 hidden의 value값에 담아줄 받는사람 번호 배열 
					unoStr +=objArray[i].userNo + ","
				}
					// 맨 마직막에 붙은 구분자 ',' 잘라주기 
					var resultStr = str.slice(0,-1);
					var resultUno = unoStr.slice(0,-1);
					
					//받는사람 input, hidden value 에 넣어주기 
					$("#recvUser").val(resultStr);
					$("#recvUno").val(resultUno);
				
					$("#searchName").val(""); //주소록에 검색 내역 삭제 
			});
			
		});
			
	</script>
	
	
</body>
</html>
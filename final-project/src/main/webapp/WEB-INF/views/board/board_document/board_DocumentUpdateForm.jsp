<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>자료실 수정페이지</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
	*{
		font-family: 'KimjungchulGothic-Bold';
	}	  
	.content{
	  	width: 1570px;
		margin-top:-105px;
	}
	
   #boardList-btn > button{
   		background-color: #0E6251;
   		color: white;
   }
  	
  	/*navibar*/
	#board-tap-area{
		width: 80%;
		height : 50px;
		margin: auto;
	}
	
	#board-tap-area>ul{
		width:100%;
		list-style-type : none;
	}
	
	#nav-tabs{
		padding : 0;
		display: flex;
	}
	
    #board-tap-area>ul li{
    	width :98px;
    	margin-right: 5px;
    	float : left;
    }
    
    #board-tap-area>ul li a{
    	width: 100%;
    	height : 100%;
    	display: inline-block;
    	text-align: center;
    	line-height: 40px;
    	background-color: lightgrey;
    	text-decoration: none;
    	color: black;	
    }
    
   #board-tap-area>ul li:not(.active):hover{
    	border-top: 1px solid #dee2e6;
		border-left: 1px solid #dee2e6;
		border-right: 1px solid #dee2e6;
		border-top-left-radius:0.25rem;
		border-top-right-radius:0.25rem; 
    }
	
	#board-tap-area .active a{
	 	border-botton: none;
	 	background-color: #0E6251;
	 	color: white;
	} 	    
	
	/* 게시글 영역  */
	#board-detail-area{
        width: 80%;
        margin: auto;
        margin-top : 10px;
    }
    
    /* 게시글 테이블 영역 */
    #document-table{
    	width : 80%;
		
    }
    
    #document-table th,  #document-table td{
        text-align:center;
        vertical-align: middle;
        font-size: 15px;
    }
    
   	#document-table select{
    	font-size: 15px !important;
    	border: 1px solid #c0c0c0;
    }
    
    /* btn-area */
    #board-btn-area{
        text-align: center;
    }

    #board-btn-area>button{
        margin: 20px 10px 20px 10px;
    }
	
	select,input,textarea{
		padding: 0;
		border: 0;
	}
    </style>
    
</head>
<%@ include file="../../common/menubar.jsp" %>
<div class="content">
	<div id="board-tap-area">
		<ul id="nav-tabs"  class="nav-tabs nav-pills">
			<li role="presentation">
				<a href="list.no">공지사항</a>
			</li>
			<li role="presentation" class="active">
	 			<a href="list.dc" >자료실</a>
			</li>
			<li role="presentation">
				<a href="list.re">대여</a>
			</li>
			<li role="presentation">
				<a href="list.fr">커뮤니티</a>
			</li>
		</ul>
	</div>
	<br>
	
	<div id="document-detail-area">
		<form action="update.dc" method="post" enctype="multipart/form-data">
	   		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	   		<input type="hidden" name="boardNo" value="${b.boardNo}">
		<table id="document-table" class="table table-hover" align="center">
			<thead>
				<tr>
					<td width="12%" style="font-weight: 800;">중요도</td>
					<td width="7%">
						<select name="importanceLevel" class="form-control" style=" width :100%; height:100%; font-size: 20px; ">
	               		<c:choose>
                        	<c:when test="${b.importanceLevel eq 'R'}">
                      			<option value="R">일반</option>
   	                    		<option value="I">중요</option>
							</c:when>
                    		<c:otherwise>
	       	                    <option value="I">중요</option>	                            			
								<option value="R">일반</option>
                           	</c:otherwise>
                     	</c:choose>
                     	</select>
					</td>
					<td width="7%" style="font-weight: 800;">카테고리</td> 
					<td width="12%">
						<select name="categoryCode" class="form-control" style=" width :100%; height:100%; font-size: 20px; ">
                   			<c:choose>
                       			<c:when test="${b.categoryCode eq 'B1'}">
  	                        		<option value="B1">공지사항</option>
      	                    		<option value="B2">자료실</option>
      	                    		<option value="B3">커뮤니티</option>
                       			</c:when>
                       			<c:when test="${b.categoryCode eq 'B2'}">
      	                    		<option value="B2">자료실</option>
  	                        		<option value="B1">공지사항</option>
      	                    		<option value="B3">커뮤니티</option>
                       			</c:when>
                       			<c:otherwise>
      	                    		<option value="B3">커뮤니티</option>
  	                        		<option value="B1">공지사항</option>
      	                    		<option value="B2">자료실</option>
                       			</c:otherwise>
                      		</c:choose>
						</select>
					</td> 
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td style="font-weight: 800;">제목</td>  
					<td colspan="5"><input value="${b.boardTitle}" name="boardTitle" type="text" class="form-control" style="width :100%; height:100%; font-size: 17px;"></td>      
				</tr>
				<tr>
					<td style="font-weight: 800;" >작성자</td>
					<td  colspan="5" style="text-align: left;">${b.boardWriter}</td>
					
				</tr>
			</thead>
      		<tbody>
				<tr>
					<td style="font-weight: 800;" >업로드된 파일</td>
                  	<td colspan="5" style="text-align:left;">
                   		<c:forEach var="at" items="${atList}">
							<ul>
	                           <li>${at.originName}</li>
	                   		</ul>		
                     	</c:forEach>	
                   	</td>
				</tr>
				<tr>
					<td style="font-weight: 800;" >첨부파일</td>
                  	<td colspan="5">
                   		<input type="file" name="upfile" accept=".pdf,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,.hwp,.jpg"  multiple required>
                   	</td>
               	</tr>
              	<tr>
               		<td></td>
               		<td colspan="5">
               			<div id="upfile-area" style="text-align:left; font-size:17px">
               				<!-- 첨부파일 이름보여줄 영역 -->
               			</div>
               		</td>
               </tr>
              	
              	<tr>
                   <td colspan="6"><textarea name ="boardContent" style="resize: none; width: 100%; height: 300px; padding: 0;  font-family: 'HallymGothic-Regular'; " required>${b.boardContent}</textarea></td>
               	</tr>
               
           </tbody>
		</table>
		<hr style="width:80%;">
			<div id="board-btn-area">
				<button class="btn btn-secondary" onclick="location.href=list.dc">취소</button> <button type="submit" class="btn btn-success">확인</button>               
			</div>
		</form>
	</div>
	<script>
		//선택된 첨부파일 이름 보여주기 
		$(function(){
			$("input[type=file]").on('change',function(){
				//첨부파일 입력 input 태그에 변화가 생겼을 때 등록된 첨부파일 개수 구하기 
				var fileCount = $("input[type=file]")[0].files.length;
				
				var str = "";
				//선택된 파일 개수만큼 반복하면서 각 파일의 이름을 꺼내서 더하기 
				for(var i = 0; i<fileCount ; i++){
					var name = $("input[type=file]")[0].files[i].name;
					
					str +="<li>" + name +"</li>"
				}
					
				$("#upfile-area").html(str);
			
			})
		});
	</script>
</div>
</body>
</html>


				


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>자료실 상세페이지 </title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <style>
	
	.content{
	  	width: 1570px;
		margin-top:-105px;
	}
	
	/* 이전으로버튼 */
   #boardList-btn{
   		margin-right: 150px;
   		text-align: right;
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
     /* 버튼영역 */
    #board-btn-area{
       width: 100%;
       height: 50px;
       text-align:center;
    }

    #board-btn-area>button{
        margin: 20px 10px 20px 10px;
    }
	
	select,input,textarea{
		padding: 0;
		border: 0;
	}

	/* 게시글영역 */
    #board-detail-area{
        width: 80%;
        margin: auto;
        margin-top : 10px;
    }
    
    #document-table{
    	font-size: 16px;
    
    }
    
    #document-table a{
    	text-decoration: none;
    	color : black;
    }
    
    #fileLink:hover{
    	cursor:pointer;
    	font-size : 17px;
    }
    
    th {
    	font-family: 'KimjungchulGothic-Bold';
    }
    
    td {
     	font-family: 'HallymGothic-Regular';
    }
    
    #board-tap-area, #boardList-btn>button, #board-btn-area button{
    	font-family: 'KimjungchulGothic-Bold';
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
	 				<a href="list.dc">자료실</a>
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
     	<div id="boardList-btn">
   			<button class="btn btn-sm" onclick="location.href='list.dc'">목록으로</button>
		</div>
		<br>
        <div id="board-detail-area">
			<table id="document-table" class="table" align="center">
                 <thead>
                     <tr>
                         <th width="10%" style="text-align: center; border-bottom:1px;">제목</th>
                         <c:choose>
                          <c:when test="${b.importanceLevel eq 'I'}">
                           <td width="65%"><b style="color: red;">[중요]</b> &nbsp; ${b.boardTitle}</td>      
                          </c:when>
                          <c:otherwise>
                              <td width="65%"> &nbsp; ${b.boardTitle}</td>
                          </c:otherwise>
                         </c:choose>      
                         <td width="10%" style="text-align: center;"><b>조회수</b></td>
                         <td style="text-align: center;" >${b.count}</td>
                     </tr>
                     <tr>
                         <th style="text-align: center; border-bottom:1px;">작성자</th>
                         <td> &nbsp; ${b.boardWriter} [${b.deptName}]</td>
                         <th style="text-align: center; border-bottom:1px; ">작성일</th>
                         <td style="text-align: center;">${b.createDate}</td>
                         
                     </tr>
                 </thead>
                 <tbody id="file-area">
           			<tr>
             			<th style="text-align: center; border-bottom:1px; ">첨부파일</th>
          				<td colspan="4">
                  	 		<c:forEach var="at" items="${atList}">
                        		<ul style="padding-left:10px;">
                        			<li><a id="fileLink" onclick="window.open('/final3${at.filePath}','${at.originName}','width = 1100, height = 900')">${at.originName}</a></li>
                        		</ul>
                			</c:forEach>		
                   		</td>
           			</tr>
                 	<tr>
                 		<td colspan="4" style="padding-left: 40px;"><p style="height:300px;"> ${b.boardContent} </p></td>
                 	</tr>
                 </tbody>
        	</table>
	    <hr>   
       	</div>
       	<c:if test = "${loginUser.userName eq b.boardWriter}">
		<div id="board-btn-area">
		    	<button class="btn btn-danger" onclick="documentDelete();">삭제</button> 
		    	<button type="submit" class="btn btn-success" onclick="location.href='update.dc?bno='+${b.boardNo}">수정</button>               
		</div>
       	</c:if>
		<script>
		/* 게시글 삭제 이벤트  */
		    function documentDelete(){
		    	
		    	var bno=${b.boardNo};
		    	
		    	if(confirm("게시글은 삭제후 복구가 불가능 합니다. 삭제 하시겠습니까?")){
			    	$.ajax({
						url: "delete.dc",
						
						data : {bno : bno},
						
						success : function(result){
							console.log(result);
							
							if(result="YYYY"){
								alert("삭제가 완료되었습니다.")
							}else{
								alert("삭제에 실패하였습니다 다시 시도해주세요")

							}
								location.href="/final3/member/list.dc";
								
						},
						
						error : function(){
							console.log("통신실패")
						}
			    		
		    		
			    	});
		    		
		    	}
		    }
		</script>
	</div>
</body>
</html>
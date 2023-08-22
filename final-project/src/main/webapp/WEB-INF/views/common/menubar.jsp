<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
	<!--아이콘 cdn-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
	<!-- 풀캘린더 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script> <!-- 동현님 -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> <!-- socket.js 사용 cdn -->
    
	<!-- <link href="/final3/resources/css/menubar.css" rel="stylesheet"> -->
    <!-- <link rel="stylesheet" href="/css/chat.css"> --> 

	<!--
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	-->	
<style>
/* 폰트 */	
@font-face {
    font-family: 'KimjungchulGothic-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

@font-face {
    font-family: 'HallymGothic-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2204@1.0/HallymGothic-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}	

:root{
	--header-height: 5.4rem;
	--nav-width: 80px;
	--menubar-color: #0E6251; /*메뉴바 색상*/
	--menubar-font-color: white; /*메뉴바 글씨 색상*/
	--header-color: #F3F5F3; /*헤더 색상*/
	--body-font: ; /*폰트*/
	--normal-font-size: 1.7rem; /*기본 글씨 크기*/
	--z-fixed: 100; /*?*/
}*,

::before, ::after{
    box-sizing: border-box;
}

body{
    position: relative;
    margin: var(--header-height) 0 0 0;
    padding: 0 1rem;
    font-family: var(--body-font);
    font-size: var(--normal-font-size);
}

a{
    text-decoration: none;
}

.header{
    width: 100%;
    height: var(--header-height);
    position: fixed;
    top: 0;
 	left: 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 1rem;
    background-color: var(--header-color);
    z-index: var(--z-fixed);
    transition: .5s;
}


.head{
    font-size: 2.4rem;
    cursor: pointer;
}

.header_right{
    display: flex;
    padding: .5rem 1rem 0 0;
    column-gap: 4rem;
    font-size: 2.4rem;
    cursor: pointer;
    align-items: center;
}

.header_profile img{
/*     border: 1px solid black; */
    width: 40px;
    height: 40px;
    display: flex;
    justify-content: center;
    border-radius: 50%;
    cursor: pointer;
}

/* menubar 전체 div */
.menubar{
    position: fixed;
    background-color: var(--menubar-color);
    top: 0;
    left: -30%;
    width: var(--nav-width);
    height: 100vh;
    padding: .5rem 1rem 0 0;
    transition: .5s;
    z-index: var(--z-fixed);
    font-family: 'HallymGothic-Regular';
}

.nav{
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    overflow: hidden;
}

.nav_logo{
/*  	margin-top: 10px; */

}

.nav_logo, .nav_link{
    display: grid;
    grid-template-columns: max-content max-content;
    align-items: center;
    column-gap: 1rem;
	padding: .5rem 0 .5rem 1.5rem; 
	position: relative;
}

.nav_link{
    position: relative;
    color: var(--menubar-font-color);
    transition: .3s;
}

.nav_link:hover{
    color: var(--white-color);
	text-decoration: none;
}


/*로그아웃 영역 */
.nav_logout{
    margin-left: 15px;
    margin-top: auto;
	margin-bottom: 40px;
}
   
/* 로그아웃 버튼이 이상해서 따로 설정함 */
#menubar_logout {
	background-color: #0E6251;
	border: 0px;
	color: #999999;
}
   	
#menubar_logout:hover{
	color: white;
}
       
@media (max-width: 768px) {
	.nav_logo,
	.nav_link,
	.nav_logout {
		display: block;
		text-align: center;
		margin-top: 10px;
	}
}

.show{
	left: 0;
}

.body-pd{
	padding-left: calc(var(--nav-width) + 1rem);
}
       
.active{
	color: var(--white-color);
}
.active::before{
	content: '';
	position: absolute;
	left: 0;
	width: 2px;
	height: 32px;
	background-color: var(--white-color);
}
.height-100{
	height:100vh;
}
@media screen and (min-width: 768px){
	body{
		margin: calc(var(--header-height) + 1rem) 0 0 0;
		padding-left: calc(var(--nav-width) + 2rem);
	}
	
	.header{
		height: calc(var(--header-height) + 1rem);
		padding: 0 2rem 0 calc(var(--nav-width) + 2rem);
	}
	
	.header_profile{
		width: 40px;
		height: 40px;
	}
	
	.header_profile img{
		width: 45px;
	}
	
	.menubar{
		left: 0;
		padding: 1rem 1rem 0 0;
	}
	
	.show{
		width: calc(var(--nav-width) + 156px);
	}
	
	.body-pd{
		padding-left: calc(var(--nav-width) + 188px);
	}
}

/* 사이드바를 감싸고있는 div */
.sidebar-nav { 
    width: 250px;
    /* margin-left: 10px;
    padding: 0; */
    margin: 0 0 0 0;
    padding: 0 0 0 0;
}

/* 큰 ul */
.sidebar-nav ul {
    width: 250px;
    margin: 10px;
    padding: 0;
    list-style: none;
}

/* 큰 ul 안에 있는 li */
.sidebar-nav li {
    line-height: 60px;
}

/* 소메뉴 */
.sidebar-nav li a {
    display: block;
    padding-left: 20px;
    text-decoration: none;
    color: #999;
}

/* 소메뉴 hover */
.sidebar-nav li a:hover {
    text-decoration: none;
    color: #fff;
    background: rgba(0, 0, 0, 0.2);
}


.sidebar-nav li a:active, .sidebar-nav li a:focus {
    text-decoration: none;
}

.sidebar-nav li a.active{
    text-decoration: none;
    color: #fff;
    background: rgba(0, 0, 0, 0.2);
}

#menu_submenu{
    display: none;
}

/* --------------- */
/* 프로필 호버시 메뉴 */
.header_profile_menu{
    list-style: none;
    margin: 0;
    padding: 0;
}

.header_profile_submenu{
    list-style: none;
    /* margin: 0; */
    /* padding: 0; */
}
.header_profile_submenu a {
	text-decoration: none;
}

.header_profile_menu:after{
    display: block;
    content: '';
    clear: both;
}

.header_profile_menu>li{
    position: relative;
    float: left;
    margin-right: 5px;
}

.header_profile_menu>li>a{
    display: block;
    padding: 0 25px 0 0;
    height: 48px;
    line-height: 40px;
}

.header_profile_menu>li:hover .header_profile_submenu,
.header_profile_menu:hover .hd_pro_con{
    display: block;
}

.header_profile_menu .header_profile_submenu{
    display: none;
    position: absolute;
    right: 1px;
    text-align: center;
}

.header_profile_menu .header_profile_submenu a {
    display: block;
    padding: 5px;
    font-size: 17px;
    background-color: #0E6251;
    color: white;
    width: 100px;
    height: 40px;
    padding: 10px 0;
    font-family: 'HallymGothic-Regular';
    
}
   
/* 말풍선 말꼬리 만들기  */
.hd_pro_con::after{
    content: "";
    position: absolute;
    top: 25px;
    left: 8px;
    border: 13px solid transparent;
    border-bottom: 10px solid #0E6251;
    z-index: 999;
}

.header_profile_menu .hd_pro_con {
    display: none;
}

.header_profile_menu:hover .hd_pro_con {
    display: block;
}

.header_profile_submenu a:hover{
	background: #234d42;
}

.content{
	width: 1570px;
	/* height: 800px; */
	margin-top: 80px;
	/* background-color: khaki; */
}
   
   /* 상태표시 모달  */
   .active_update{
    width: 200px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 12px 13px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}

.active_update:focus{
    border: 1px solid #9B51E0;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 10px;
}
/* 알림 전체 div */
#menuAlertDiv{
	width: 340px;
	height: 390px;
}

.menuAlertHeader{
	margin: 10px 20px 3px;
}

#menuAlertAllTitle{
	
	font-size: 27px;
	font-weight: bold;
	font-family: 'KimjungchulGothic-Bold';
}

.menuAlertHeader button{
	border: none;
	background-color: #0E6251;
	color: white;
	font-family: 'HallymGothic-Regular';
	margin-left: 105px;
}

/* 알림 내역구간 */
.menuAlertList{
	list-style-type: none;
	margin: 10px 0 0 0;
	padding: 0 0 0 10px;
	font-family: 'HallymGothic-Regular';
}

.menuAlertList a{
	text-decoration: none;
	color: black;
}

.menuAlertList p{
	font-size: 20px;
	margin: 0 0 0 0;
}

.menuAlertList span{
	font-size: 16px;
}

/* 토스트 css */
#toast {
    position: fixed;
    bottom: 30px;
    right: 50px;
    padding: 15px 20px;
    transform: translate(0, 10px);
    border-radius: 30px;
    overflow: hidden;
    font-size: .8rem;
    opacity: 0;
    visibility: hidden;
    transition: opacity .5s, visibility .5s, transform .5s;
    background: rgba(0, 0, 0, .35);
    color: #fff;
    z-index: 100000;
    font-family: 'HallymGothic-Regular';
}

#toast.reveal {
    opacity: 1;
    visibility: visible;
    transform: translate(-50%, 0)
}
</style>
</head>
<body id="body-pd">
	<!-- 알림메세지 -->
	<c:if test="${not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	<c:if test="${not empty errorMsg }">
		<script>
			alert("${errorMsg}")		
		</script>
		<c:remove var="errorMsg" scope="session"/>
	</c:if>
	

    <div class="header" id="header">
    	<div id="toast" class="toast"></div>
    	<!-- 헤더 메뉴버튼  -->
        <div class="head">
            <i class="fa-sharp fa-solid fa-bars fa-lg" id="header-toggle" style="color: #0E6251;"></i>
        </div>

		<!-- 헤더 오른쪽  -->
        <div class="header_right">
        	<!-- 쪽지  -->
            <div class="header_letter">
            	<a href="#">
                	<i id="messenger" class="fa-sharp fa-solid fa-paper-plane fa-lg" style="color: #0E6251;"></i>
            	</a>
            </div>
            <script>
				/* 쪽지 아이콘 클릭시 새창 띄우기 */
				$(function(){
					$("#messenger").on("click",function(){
						window.open("list.mg","메신저","width = 1100 , height = 600");
					})
				})	
			
			</script>

			<!-- 메일  -->
            <div class="header_mail">
            	<a href="email.em">
                	<i class="fa-sharp fa-solid fa-envelope fa-lg" style="color: #0E6251;"></i>
                </a>
            </div>

			<!-- 실시간 채팅  -->
<!--             <div class="header_chat"> -->
<!--             <div id="alarm">7</div> -->
<!--                 	<i class="fa-sharp fa-solid fa-comments fa-lg" style="color: #0E6251;"></i> -->
<!--             </div> -->
       

			<!-- 알림  -->
            <div class="header_alert">
            	<div class="dropdown">
	            	<a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" onclick="menuAlertList();">
	                	<i class="fa-sharp fa-solid fa-bell fa-lg" style="color: #0E6251;"></i>
	                </a>
	                
	                <div id="menuAlertDiv" class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
		                <div class="menuAlertHeader">
			                <span id="menuAlertAllTitle" class="title mb-0">알림 목록</span>
			                <button id="menuAlertAllDelete" onclick="menuAlertAllDelete()"> 모두 지우기</button>
						</div>
						<div style="border:1px solid lightgray;"></div>
						<div>
							<ul class="menuAlertList" style="max-height: 300px; overflow-y: auto;">
								
							</ul>
						</div>
	                </div>
				</div>
            </div>
            
            <!-- 회원 프로필  -->
            <div class="header_profile">
            	<ul class="header_profile_menu">
                    <li>
                        <a href="#" id="menuProfileImg">
<!--                         	<img src="https://i.imgur.com/hczKIze.jpg" alt="" > -->
                        </a>

                        <div class="hd_pro_con">
                            <ul class="header_profile_submenu">
                                <li>
                                	<a href="#user_active" data-toggle="modal">상태 표시</a>
                                </li>
                                <li>
                                	<a href="myPage.me">마이 페이지</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>  
        </div>
    </div>

	<!-- auth 추출해서 소문자로 바꾸기 -->
    <c:set var="lastIndex" value="${fn:length(loginUser.auth)}"/>
    <c:set var="subString_auth" value="${fn:substring(loginUser.auth,5,lastIndex)}"/>
    <c:set var="role" value="${fn:toLowerCase(subString_auth)}"/>
    
    <div class="menubar" id="nav-bar">
        <nav class="nav"> <!--nav는 블럭요소, span은 인라인요소-->
            <div>
            	<!--로고 부분-->
                <a href="#" class="nav_logo"> 
                    <img style="width: 50px; height: 50px; margin-left:3px" src="/final3/resources/image/logoWhite.png">
<!--                     <span class="nav_logo_name">로고</span> -->
                </a>

                <div class="sidebar-nav">
                    <ul>
                        <!--  홈  -->
                        <li>
                            <a href="/final3/${role}/mainPage.me" class="nav_link active">
                                <i class="fa-sharp fa-solid fa-house fa-xl" id="menu_img" style="color: #ffffff;"></i>
                                &nbsp;
                                <span class="nav_name">홈</span>
                            </a>
                        </li>
                        
                        <!-- 근태관리  -->
                        <li>
                            <a href="userAtt.at" class="nav_link">
                                <i class="fa-sharp fa-solid fa-business-time" style="color: #ffffff; font-size: 22px;"></i>
                                &nbsp;
                                <span class="nav_name">근태관리</span>
                            </a>
                        </li>
						<!-- 전자결재 -->
                        <li class ="menu">
                            <a href="home.ap" class="nav_link" data-toggle="collapse" data-target="">
                                <i class="fa-sharp fa-solid fa-pen-to-square fa-xl" style="color: #ffffff;"></i>
                                &nbsp;
                                <span class="nav_name">전자결재</span>
                            </a>
                            <ul id="menu_submenu" class="collapse">
                                <li>
                                    <a href="home.ap">결재홈</a>
                                </li>
                                <li>
                                    <a href="enrollList.ap">결재 작성</a>
                                </li>
                                <li>
                                    <a href="list.ap">결재함</a>
                                </li>
                            </ul>
                        </li>
                        
                        <!-- 인사관리  -->
                        <li class="menu2">
                            <a href="#" class="nav_link">
                                <i class="fa-sharp fa-solid fa-users" style="color: #ffffff; font-size: 21px;"></i>
                                &nbsp;
                                <span class="nav_name">인사관리</span>
                            </a>
                            <ul id="menu_submenu2" class="collapse">
                                <li>
                                    <a href="/final3/${role}/list.me">임직원 조회</a>
                                </li>
                                 <li>
                                    <a href="payment.me?userNo=${loginUser.userNo}">급여명세서 조회</a>
                                </li>
                                <c:if test="${(loginUser.auth eq 'ROLE_ADIM' and loginUser.deptCode eq 'D7') or (loginUser.deptCode eq 'D7') or
                                			  (loginUser.auth eq 'ROLE_ADIM' and loginUser.deptCode eq 'D8') or (loginUser.deptCode eq 'D8') or
                                			  (loginUser.auth eq 'ROLE_ADIM' and loginUser.deptCode eq 'D9') or (loginUser.deptCode eq 'D9')}">
                                <li>
                                    <a href="payment.ad">급여명세서 작성</a>
                                </li>
                                </c:if>
                            </ul>
                            
                        </li>

						<!-- 일정관리  -->
                        <li>
                            <a href="schedule.sc" id="scheduleIcon"  class="nav_link">
                                <i class="fa-sharp fa-solid fa-calendar-day" style="color: #ffffff; font-size: 28px;"></i>
                                &nbsp;
                                <span class="nav_name">&nbsp;일정관리</span>
                            </a>
                        </li>
                       
                        <!--커뮤니티  -->
                        <li>
                            <a href="list.no" class="nav_link">
                                <i class="fa-sharp fa-solid fa-newspaper fa-xl" style="color: #ffffff; font-size: 28px;"></i>
                                &nbsp;
                                <span class="nav_name">커뮤니티</span>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>

			<!-- 로그아웃  -->
            <div class="nav_logout">
                <a href="#" class="nav_link">
                    <i class="fa-sharp fa-solid fa-right-from-bracket fa-xl" style="color: #ffffff; "></i>
                    <span class="nav_n">
						<form action="/final3/logout" method="post">
					        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					        <button type="submit" id="menubar_logout">LOGOUT</button>
						</form>
                    </span>
                </a>
            </div>
        </nav>
    </div>
    
    <div class="modal fade" id="user_active" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">상태 업데이트 </h4>
				</div>
				<div class="modal-body">
						<form action="">
							<select class="active_update">
								<option value="" selected>활동중 </option>
								<option value="">퇴근 </option>
								<option value="">자리 비움 </option>
							</select>
						
						</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기 </button>
					<button type="button" class="btn btn-primary">변경 </button>
				</div>
			</div>
		</div>
		
		
	</div>
	
    <script>
    	$(function() {
    		menuSelectProfileImg();
    	});	
    	
    	document.addEventListener("DOMContentLoaded", function(event) {
        const showNavbar = (toggleId, navId, bodyId, headerId) =>{
		const toggle = document.getElementById(toggleId),
		nav = document.getElementById(navId),
		bodypd = document.getElementById(bodyId),
		headerpd = document.getElementById(headerId)

		// Validate that all variables exist
		if(toggle && nav && bodypd && headerpd){
			toggle.addEventListener('click', ()=>{
			// show navbar
			nav.classList.toggle('show')
			// add padding to body
			bodypd.classList.toggle('body-pd')
			// add padding to header
			headerpd.classList.toggle('body-pd')
			})
		}
		}

		showNavbar('header-toggle','nav-bar','body-pd','header')

		const linkColor = document.querySelectorAll('.nav_link')

		function colorLink(){
			if(linkColor){
				linkColor.forEach(l=> l.classList.remove('active'))
				this.classList.add('active')
			}
		}
		
		linkColor.forEach(l=> l.addEventListener('click', colorLink))
	});

	/* 메뉴바 소메뉴  */
    $(document).ready(function(){
	    $("#header-toggle").click(function() {
	        var submenu = $(this).parents('.header').next(".menubar").find("#menu_submenu");
	
	        if(submenu.is(":visible")) {
	            submenu.slideUp();
	        }
	    });
	});

    $(document).ready(function(){
        $(".menu>a").click(function() {
            var submenu = $(this).next("#menu_submenu");

            if(submenu.is(":visible")) {
                submenu.slideUp();
            }else {
                submenu.slideDown();
            }
        });
        
        $(document).ready(function(){
		    $("#header-toggle").click(function() {
		        var submenu2 = $(this).parents('.header').next(".menubar").find("#menu_submenu2");
		
		        if(submenu2.is(":visible")) {
		            submenu2.slideUp();
		        }
		    });
		});

        $(document).ready(function(){
            $(".menu2>a").click(function() {
                var submenu2 = $(this).next("#menu_submenu2");

                if(submenu2.is(":visible")) {
                    submenu2.slideUp();
                }else {
                    submenu2.slideDown();
                }
            });
        });
        
    });
    
    /* 알림 목록 조회 */
   	function menuAlertList() {
    	$.ajax({
    		url: "menuAlertList.ma",
    		type : "POST",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				//console.log(result[0].lastSignature);
				var str = "";
				if(result.length == 0){
					str = "알림이 없습니다. ";
				}
				
				for(var i in result) {
					if(result[i].lastSignature != '반려') {//반려일때 조건 걸기 
					str += "<li>"
						+ "<input type='hidden' id='menuAlertNo' value='"+result[i].alertNo+"'>"
						+ "<input type='hidden' id='menuAlertStatus' value='"+result[i].status+"'>"
						+ "<input type='hidden' id='menuAlertDocNo' value='"+result[i].docNo+"'>"
						+ "<input type='hidden' id='menuAlertDocType' value='"+result[i].docType+"'>"
						+ "<a class='menuAlertLink'>"
						+ "<p>["+result[i].docType+"]</p>"
						+ "<span>"+result[i].sender+"님이 "+result[i].content+"의 전자결재를 승인하셨습니다.</span>"
						+ "</a>"
						+ "</li>"
						+ "<li role='separator' class='divider'></li>"
					}else{
						str += "<li>"
							+ "<input type='hidden' id='menuAlertNo' value='"+result[i].alertNo+"'>"
							+ "<input type='hidden' id='menuAlertStatus' value='"+result[i].status+"'>"
							+ "<input type='hidden' id='menuAlertDocNo' value='"+result[i].docNo+"'>"
							+ "<input type='hidden' id='menuAlertDocType' value='"+result[i].docType+"'>"
							+ "<a class='menuAlertLink'>"
							+ "<p>["+result[i].docType+"]</p>"
							+ "<span>"+result[i].sender+"님이 "+result[i].content+"의 전자결재를 반려하셨습니다.</span>"
							+ "</a>"
							+ "</li>"
							+ "<li role='separator' class='divider'></li>"
					}
				}
				
				$('.menuAlertList').html(str);
				
				$('.menuAlertLink').click(function(event) {
		                event.preventDefault();
		                var alertNo = $(this).prevAll('#menuAlertNo').val();
		                var status = $(this).prevAll('#menuAlertStatus').val();
		                var docNo = $(this).prevAll('#menuAlertDocNo').val();
		               	var docType = $(this).prevAll('#menuAlertDocType').val();
		               	
		                location.href = "detail.ap?docNo="+docNo+"&docType="+docType;
		                menuAlertUpdate(alertNo, status);
		         });
				
			},
			error : function(result) {
				console.log("알림 조회 실패!!");
			}
    	});
    }
    
    /* a태그 클릭 시 읽음 상태로 수정 */
    function menuAlertUpdate(alertNo, status) {
    	$.ajax({
    		url: "menuAlertUpdate.ma",
    		data : {
    			alertNo : alertNo,
    			status : status
    		},
    		type: "POST",
		    beforeSend: function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		    },
		    success: function(result) {

		    },
		    error: function() {
		    	console.log("알림 상태 수정 오류 ");
		    }
    	});
    }
    
    /* 알림 모두 삭제 */
    function menuAlertAllDelete() {
    	var ans = confirm("리스트를 모두 삭제하시겠습니까?");
        if(!ans) return false;
        
    	$.ajax({
    		url: "menuAlertAllDelete.ma",
    		data: {
    			userNo : "${loginUser.userNo}"
    		},
    		type : "POST",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				if(result == "success") {
					alert("모두 삭제했습니다.");
				}
				
				location.reload();
			},
			error : function() {
				console.log("투두 삭제 오류 ");
			}
    	})
    }

    /* 알림 웹소켓 */
    var socket;
   	$(document).ready(function(){
   			alertConnect();
   	});
   		
   	function alertConnect() {
    	if(!socket) { //중복 접속 막음 
	    	var url = "ws://localhost:8888/final3/ws-alert";
	    	socket = new WebSocket(url);
    	}
    	
    	socket.onopen = function() {
    		console.log("알림 서버와 연결되었습니다.");
    	};
    
    	socket.onclose = function() {
    		console.log("알림 서버와의 연결이 종료되었습니다.");
    	};
    	
    	socket.onerror = function() {
    		console.log("알림 서버 연결과정에서 오류가 발생했습니다.");
    	};
    	
    	socket.onmessage = function(evt) {
    		console.log("알림이 도착하였습니다.");
    		//console.log("AlertMessage : "+evt.data);
    		
    		var data = JSON.parse(evt.data);
    		var text = data.sender + "님이 [" + data.docType + "] "+ data.content;
    		toast(text);
    	};
    }
   	
   	//토스트 
   	function toast(text) {
   	    const toast = document.getElementById("toast");

	   	 clearTimeout(toast.removeTimeout); // 이전 토스트 제거 타임아웃을 취소
	
	     toast.classList.remove("reveal"); // 토스트 숨김 
	     toast.innerText = text;
	
	     // 토스트 스타일 적용 
	     setTimeout(function () {
	       toast.classList.add("reveal");
	     }, 10);
	
	     // 토스트 숨기는 스타일 적용/ 일정시간 후 제거 
	     toast.removeTimeout = setTimeout(function () {
	       toast.classList.remove("reveal");
	     }, 100000);
   	}
   	
   	/* 프로필 첨부파일 조회 */
   	function menuSelectProfileImg() {
		$.ajax({
			url: "selectProfile.ma",
			type : "POST",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				console.log(result);
				var str = "";
				
				if(result.length == 0) {
					str += "<img src='/final3/resources/image/청록이.jpg'>"
					
					$("#menuProfileImg").html(str);
				}else {
					str += "<img src='/final3/"+result[0].changeName+"'>"
					
					$("#menuProfileImg").html(str);
				}
			},
			error : function(){
				console.log("프로필 사진 오류");
			}
			
		})
		
	}
</script>
</body>
</html>
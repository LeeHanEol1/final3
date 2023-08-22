<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content{
            height: 800px;
        }
	.main_collect{
            border: 1px solid black;
            width: 1000px;
            height: 180px;
            border-radius: 20px;
            background-color: rgb(203, 235, 216);
            margin: 0 auto;
            display: flex;
        }

        .admin_c{
            border: 1px solid black;
            /* float: left; */
            
            /* padding: 10px 100px 0 10px; */
            /* position: absolute; */
            /* top: 20px; */
            /* margin: 15px 0 0 0; */
            margin: 30px 30px;
        }

        #admin_total_user{
            float: left;
        }
        #admin_wait_app{
            float: left;
        }

        #admin_wait_reserve{
            float: left;
        }

        #admin_vacation{
            border: 1px solid black;
            float: left;
        }

        /* 메인 왼쪽 div전체 */
        .content_left{
            background-color: gold;
            border: 1px solid black;
            float: left;
            width: 780px;
            height: 77%;
            /* margin-left: 20px; */
        }

        /* 메인 오른쪽 div 전체 */
        .content_right{
            border: 1px solid black;
            background-color: lightyellow;
            float: right;
            width: 780px;
            height: 77%;
        }

        /* 관리자 메일 영역 */
        .main_admin_mail_area{
            border: 1px solid black;
            border-radius: 20px;
            width: 100%;
            height: 47%;
            margin-top: 12px;
            background-color: pink;
        }

        /* 관리자 게시판 영역 */
        .main_admin_board_area{
            border: 1px solid black;
            border-radius: 20px;
            width: 100%;
            height: 47%;
            margin-top: 15px;
            background-color: pink;
            float: left;
        }

        /* 관리자 일정 영역 */
        .main_admin_calender_area{
            border: 1px solid black;
            border-radius: 20px;
            width: 100%;
            height: 80%;
            margin-top: 15px;
            background-color: pink;
        }

        /* 제목 */
        .main_admin_title{
            float: left;
            margin: 12px 0 0 25px;
            font-size: 25px;
        }

         /* 플러스 아이콘 */
        .main_admin_plus{
            float: right;
            margin: 18px 25px;
            cursor: pointer;
        }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="content">
        <div class="main_collect">
            <div class="admin_c" id="admin_total_user">
                <i class="fa-sharp fa-solid fa-users" style="color: #0E6251; font-size: 80px;"></i>
                <p>총 사원 수</p>
            </div>
            <div class="admin_c" id="admin_wait_app">
                <i class="fa-sharp fa-solid fa-pen-to-square" style="color: #0E6251; font-size: 80px;"></i>
                <p>대기 중인 <br> 전자결재 건수</p>
            </div>
            <div class="admin_c" id="admin_wait_reserve">
                <i class="fa-solid fa-clock" style="color: #0E6251; font-size: 80px;"></i>
                <p>예약 건수</p>
            </div>
            <div class="admin_c" id="admin_vacation">
                <i class="fa-solid fa-plane" style="color: #0E6251; font-size: 80px;"></i>
                <p>휴가 신청건</p>
            </div>
            <div class="admin_c" id="admin_insert">
                <i class="fa-solid fa-plane" style="color: #0E6251; font-size: 80px;"></i>
                <p>사원가입</p>
            </div>            
        </div>

        <!-- 관리자 메인 메일 -->
        <div class="content_left">
            <div class="main_admin_mail_area">
                <div>
                    <div class="main_admin_title">
                        <span>최근 온 메일</span>
                    </div>
                    <div class="main_admin_plus">
                        <a href="#">
                            <i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
                        </a>
                    </div>
                </div>
            </div>
    
            <!-- 관리자 메인 게시판 영역-->
            <div class="main_admin_board_area">
                <div>
                    <div class="main_admin_title">
                        <span>최근 온 메일</span>
                    </div>
                    <div class="main_admin_plus">
                        <a href="#">
                            <i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        

        <div class="content_right">
            <div id="ad_sysdate">
                <br>
                <p id="user_date"style="font-size: 22px; margin: 0 0 0 0;"></p>
                <h1 id="user_clock"></h1>
                <!-- <span style="font-size: 45px; font-weight: bold;"></span> -->
            </div>
            <!-- 관리자 메인 캘린더 영역 -->
            <div class="main_admin_calender_area">
                <div>
                    <div class="main_admin_title">
                        <span>최근 온 메일</span>
                    </div>
                    <div class="main_admin_plus">
                        <a href="#">
                            <i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
	</div>
	
	<script>
	//자바스크립트 실시간 시계
    function getTime() {
        const clock = document.getElementById("user_clock");
        const date = document.getElementById("user_date");
        const time = new Date();
        const weekList = ['일', '월', '화', '수', '목', '금', '토'];
        const calendar = time.getFullYear() + "년 " + (time.getMonth()+1) + "월 " + time.getDate() +"일 " + weekList[time.getDay()] + "요일";
        let amPm = "AM";
        let hours = addZeros(time.getHours(),2);
        const minutes = addZeros(time.getMinutes(),2);
        const seconds = addZeros(time.getSeconds(),2);

        if(hours >= 12) {
            amPm="PM"
            hours = addZeros(hours-12,2);
        }

        date.innerHTML = calendar;
        clock.innerHTML = amPm + " " + hours + ":" + minutes + ":" + seconds;

        setTimeout(getTime, 1000);
   }

   function addZeros(num, digit){
        let zero = "";
        num = num.toString();
        if(num.length < digit) {
            for(let i =0; i<digit - num.length; i++){
                zero += "0";
            }
        }
        return zero + num;
   }

   getTime();
   
   $("#admin_insert").click(function(){
	  location.href = "/final3/admin/memberEnroll.me";
   });
	</script>
</body>
</html>
package com.kh.final3.schedule.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Schedule {
	
	 private int scheduleNo;			//DEPT_SCHEDULE_NO NUMBER PRIMARY KEY,
     private String deptCode;				//DEPT_CODE VARCHAR2(4) NOT NULL,
     private int userNo;					//USER_NO NUMBER
     private String scheduleType;			//SCHEDULE_TYPE
     private String scheduleTitle;			//SCHEDULE_TITLE VARCHAR2(100) NOT NULL,
     private String scheduleContent;		//SCHEDULE_CONTENT VARCHAR2(300),
     private String enrollDate;				//ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
     private String modifyDate;				//MODIFY_DATE DATE
     private String startDate;				//START_DATE DATE,
     private String endDate;				//END_DATE DATE,
     private String status;					//STATUS VARCHAR2(1) DEFAULT 'N' CHECK(STATUS IN('N','Y')),
     
     private String userName;  //등록자 이름 보여주기 위해 생성 
}

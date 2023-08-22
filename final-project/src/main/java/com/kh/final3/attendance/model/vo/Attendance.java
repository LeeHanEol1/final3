package com.kh.final3.attendance.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Attendance {
	private int attRecordNo;
	private int userNo;
	private String userName;
	private String deptName;
	private String workDate;
	private String onTime;
	private String offTime;
	private String leaveType;
	private String leaveCode;
	private String currDate;
	private String todoContent;
	private int todoNo;
	private String status;
}

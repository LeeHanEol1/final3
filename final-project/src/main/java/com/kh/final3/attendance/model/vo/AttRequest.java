package com.kh.final3.attendance.model.vo;


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
public class AttRequest {
	private int refAtno;
	private int userNo;
	private String userName;
	private String deptName;
	private String workDate;
	private String onTime;
	private String updateOnTime;
	private String offTime;
	private String updateOffTime;
	private String leaveCode;
	private String leaveType;
	private String updateContent;
	private String createDate;
	private String status;
}

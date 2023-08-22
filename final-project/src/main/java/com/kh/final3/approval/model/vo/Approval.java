package com.kh.final3.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Approval {
	private int appNo;
	private int DocNo;
	private String deptCode;
	private String secondJobName;
	private String secondApproverNo;
	private String secondApprover;
	private String secondSignature;
	private String lastApproverNo;
	private String lastJobName;
	private String lastApprover;
	private String lastSignature;
	private String secondDate;
	private String lastDate;
	private String returnReason;
	private String returnDate;
	private String status;
	
	//메인에 필요한 vo
	private String docTitle;
	private String createDate;
	private String docName;
	private String docWriter;
	
}

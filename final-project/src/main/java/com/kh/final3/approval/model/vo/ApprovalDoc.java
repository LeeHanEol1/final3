package com.kh.final3.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApprovalDoc {
	private int docNo;
	private String deptCode;
	private String docType;
	private String docWriter;
	private String userName;
	private String docTitle;
	private String docContent;
	private String createDate;
	private String status;
	private String emergency;
	private String secondDate;
	private String lastDate;
	private String returnDate;
	
	private int approval;
	private int reject;
	private String secondApproverNo;
	private String lastApproverNo;
	
}
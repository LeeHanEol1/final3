package com.kh.final3.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ApprovalAttachment {
	private int appFileNo;
	private int docNo;
	private String deptCode;
	private String originName;
	private String changeName;
	private String uploadDate;
	private String filePath;
}

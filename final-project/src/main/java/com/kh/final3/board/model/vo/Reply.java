package com.kh.final3.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Reply {
	private int replyNo;
	private int refBno;
	private String replyWriter;
	private String replyContent;
	private String createDate;
	private Date modifyDate;
	private String status;
	private String deptName;
	private String userName;
}

package com.kh.final3.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int boardNo;
	private String boardWriter;
	private String categoryCode;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private Date modifyDate;
	private int count;
	private String status;
	private String importanceLevel;
	private String deptName;
	private String attachmentNo; // 첨부파일 여부
	private int refUno; // 즐겨찾기여부
	private String categoryName; //카테고리 이름
	private int recommendCount; //추천개수
	private String refMid;


}

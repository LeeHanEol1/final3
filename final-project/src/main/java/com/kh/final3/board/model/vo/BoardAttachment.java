package com.kh.final3.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardAttachment {
	public int attachmentNo;		//ATTACHMENT_NO	NUMBER
	public int refBno;				//REF_BNO	NUMBER
	public String categoryCode; 	//CATEGORY_CODE	VARCHAR2(1 BYTE)
	public String originName;		//ORIGIN_NAME	VARCHAR2(1000 BYTE)
	public String changeName;		//CHANGE_NAME	VARCHAR2(1000 BYTE)
	public String filePath;			//FILE_PATH	VARCHAR2(1000 BYTE)
	public String status;			//STATUS	VARCHAR2(1 BYTE)
	public String editorName;
}


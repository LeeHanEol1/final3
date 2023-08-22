package com.kh.final3.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberAttachment {

	private int memAttachmentNo;//	MEM_ATTACHMENT_NO	NUMBER
	private int refUno;//	REF_UNO	NUMBER
	private String originName;//	ORIGIN_NAME	VARCHAR2(1000 BYTE)
	private String changeName;//	CHANGE_NAME	VARCHAR2(1000 BYTE)
	private String filePath;//	FILE_PATH	VARCHAR2(1000 BYTE)
	private String status;//	STATUS	VARCHAR2(1 BYTE)

}

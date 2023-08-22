package com.kh.final3.alert.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class Alert {
	private int alertNo; //ALERT_NO
	private String docNo; //DOC_NO
	private String docType; //DOC_TYPE
	private String sender; //SENDER
	private String receiver; //RECEIVER
	private String content; //ALERT_CONTENT
	private String alertDate; //ALERT_DATE
	private String url; //URL
	private String status; //STATUS
	
	private String cmd; //ALERT_TYPE
	private String lastSignature;
}

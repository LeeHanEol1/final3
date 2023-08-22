package com.kh.final3.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Item {
	private int docNo;
	private String deptCode;
	private String[] arrSupplyName;
	private String[] arrSupplySize;
	private String[] arrAmount;
	private String[] arrPrice;
	private String createDate;
	
	
	private String supplyName;
	private String supplySize;
	private String amount;
	private String price;
	
}
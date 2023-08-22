package com.kh.final3.common.vo;


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
public class PageInfo {
	private int listCount; 
	private int currentPage; 
	private int pageLimit; 
	private int boardLimit; 
	
	private int maxPage; 
	private int startPage; 
	private int endPage; 
}

package com.kh.final3.board.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Reservation {
	private int reservationNo;
	private int userNo;
	private String revDate;
	private String startTime;
	private String endTime;
	private String reserveCategory;
	private String status;
	private String roomCode;
	private String userName;
}

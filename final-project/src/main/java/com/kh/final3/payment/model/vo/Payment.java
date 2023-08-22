package com.kh.final3.payment.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Payment {

	private int payNo;					//PAY_NO	NUMBER
	private int userNo;					//USER_NO	NUMBER
	private String accountNumber;		//ACCOUNT_NUMBER	VARCHAR2(20 BYTE)
	private String bank;				//BANK VARCHAR2
	private String monthly;				//MONTHLY	DATE
	private int salary;					//SALARY	NUMBER
	private int meals;					//MEALS	NUMBER
	private int overtimePay;			//OVERTIME_PAY	NUMBER
	private int holidayPay;				//HOLIDAY_PAY	NUMBER
	private int annualLeavePay;			//ANNUAL_LEAVE_PAY	NUMBER
	private int otherPay;				//OTHER_PAY	NUMBER
	private int nationalPension;		//NATIONAL_PENSION	NUMBER
	private int healthInsurance;		//HEALTH_INSURANCE	NUMBER
	private int empInsurance;			//EMP_INSURANCE	NUMBER
	private int lngInsurance;			//LNG_INSURANCE	NUMBER
	private String accountStatus;		//ACCOUNT_STATUS      
	
	private String userName;
	private String deptName;
	private String jobName;
}

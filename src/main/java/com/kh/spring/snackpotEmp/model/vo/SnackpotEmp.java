package com.kh.spring.snackpotEmp.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class SnackpotEmp {

	private int sempNum;
	private String sempComCode;
	private String sempPw;
	private String sempName;
	private String sempDept;
	private String sempJob;
	private String sempEmail;
	private String sempStatus;
	
}

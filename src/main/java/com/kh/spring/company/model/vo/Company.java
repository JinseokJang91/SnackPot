package com.kh.spring.company.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Company {

	private String comCode;
	private String comName;
	private String comAddress;
	private String comAdmin;
	private String sempNum;
	private String snackStatus;
	private String birthStatus;
	
	public Company(String comCode, String comName, String comAddress, String comAdmin, String sempNum) {
		super();
		this.comCode = comCode;
		this.comName = comName;
		this.comAddress = comAddress;
		this.comAdmin = comAdmin;
		this.sempNum = sempNum;
	}
	
	

}



package com.kh.spring.companyEmp.model.vo;

import java.sql.Date;

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
public class CompanyEmp {

	private int cempSeq;
	private String cempName;
	private String cempDept;
	private String cempJob;
	private String cempEmail;
	private String cempPhone;
	private Date cempBirth;
	private int cempNum;
	private String cempStatus;
	private String comCode;
	private String birth;		
	
}

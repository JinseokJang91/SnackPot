package com.kh.spring.birthday.sendList.model.vo;

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
public class SendList {

	private String sListNo;
	private int cempSeq;
	private int cempNum;
	private String cempDept;
	private String cempJob;
	private String cempName;
	private String cempPhone;
	private String cempEmail;
	private Date cempBirth;
	private String sendMsgDate;
	private String sListStatus;
	private String glistNo;
	
	private String comCode;
}

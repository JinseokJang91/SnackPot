package com.kh.spring.birthday_HO.sendList_HO.model.vo;

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
public class HO_SendList {

	private String sListNo;
	private int cempSeq;
	private String cempDept;
	private String cempJob;
	private String cempName;
	private String cempPhone;
	private Date cempBirth;
	private String sendMsgDate;
	private String sListStatus;
	private String glistNo;
	
	private int sendingTime;
	private String comCode;
}

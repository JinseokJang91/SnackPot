package com.kh.spring.birthday.sendingStatus.model.vo;

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
public class SendingStatus {

	private int curStatusNo;
	private int cempSeq;
	private int cempNum;
	private String cempDept;
	private String cempJob;
	private String cempName;
	private String cempPhone;
	private String cempEmail;
	private Date cempBirth;
	private String sendingMsgDate;
	private Date selectDate;
	
	private int sendingTime;
	private String comCode;
	private String cempBirthSdf; //Date객체에 담아온 값을 수정 페이지에 원하는 형식으로 나타내기 위함
}

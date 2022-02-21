package com.kh.spring.snack.snackList.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ComListInfo {
	
	private int subsNo;
	private String comCode;
	private String comName;
	private String listTransDate;
	private String orderDeadline;
	private String deliveryDate;
	private String wishEndDate;
	private Date settleDate;
	private String status;
	private int budget;
	private int totalPrice;
	private int listNo;
	private int orderNo;
	
}

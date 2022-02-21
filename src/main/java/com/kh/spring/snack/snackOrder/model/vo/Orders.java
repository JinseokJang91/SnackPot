package com.kh.spring.snack.snackOrder.model.vo;

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
public class Orders {

	private int orderNo;
	private String comCode;
	private String comName;
	private String orderStatus;
	private String status;
	private int budget;
	private int totalPrice;
	private Date orderDeadline;
	private Date deliveryDate;
	private Date orderDate;
	private Date releaseDate;
	private int wishNo;
	
}

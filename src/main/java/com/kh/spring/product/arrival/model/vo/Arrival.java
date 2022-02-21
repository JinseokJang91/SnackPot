package com.kh.spring.product.arrival.model.vo;

import java.util.Date;

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

public class Arrival {
	
	private int arrivalNo;
	private int amount;
	private String unit;
	private String remark;
	private Date arrivalDate;
	private int snackNo;
	private String snackName;
	private int stock;

	
	
	

}

package com.kh.spring.snack.snackSubs.model.vo;

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
public class SnackSubs {

	private int subsNo;
	private String comCode;
	private int budget;
	private int snackRatio;
	private int drinkRatio;
	private int retortRatio;
	private String snackCategory;
	private String drinkCategory;
	private String retortCategory;
	private String preferTaste;
	private String dislikeFlavour;
	private int deliveryDate;
	private Date settleDate;
	private Date modifyDate;
	private Date cancelDate;
	private String subsStatus;
}

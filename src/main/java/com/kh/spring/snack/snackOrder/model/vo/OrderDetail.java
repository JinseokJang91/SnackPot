package com.kh.spring.snack.snackOrder.model.vo;

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
public class OrderDetail {

	private int orderDNo;
	private int orderNo;
	private int categoryNo;
	private String categoryName;
	private int subCategoryNo;
	private String subCategoryName;
	private int snackNo;
	private String snackName;
	private int amount;
	private int releasePrice;
	private int stock;
	private String imageName;
	
}

package com.kh.spring.snack.snackList.model.vo;


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
public class SnackDList {

	private int snackDNo;
	private int rowNum;
	private int snackListNo;
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

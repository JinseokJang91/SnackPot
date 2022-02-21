package com.kh.spring.product.model.vo;

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
public class WishListDtail {
	
	private int wishDetailNo;
	private String comCode;
	private String comName;
	private int wishNo;
	private int categoryNo;
	private int snackNo;
	private String snackName;
	private int count;
	private int releasePrice; 
	private Date wishEndDate;
	private String changeName;
	private String categoryName;
	private int subCategoryNo;
	private String subCategoryName;
	private int stock;
	
}

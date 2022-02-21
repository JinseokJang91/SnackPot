package com.kh.spring.product.release.model.vo;

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

public class Release {

	private int releaseNo;
	private int amount;
	private String unit;
	private String remark;
	private Date releaseDate;
	private int snackNo;
	private String snackName;
	private int stock;

	
	
}

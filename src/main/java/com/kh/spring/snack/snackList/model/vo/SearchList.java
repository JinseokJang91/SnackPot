package com.kh.spring.snack.snackList.model.vo;

import java.sql.Date;
import java.util.HashMap;

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
public class SearchList {

	private String category;
	private String search;
	private Date startDate;
	private Date endDate;
	private String comCode;
	private HashMap comArr;
	
}

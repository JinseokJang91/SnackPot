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
public class SearchSnack {

	private int category;
	private int subCategory;
	private String search;
		
}

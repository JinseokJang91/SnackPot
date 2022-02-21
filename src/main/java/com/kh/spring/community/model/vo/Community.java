package com.kh.spring.community.model.vo;

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
public class Community {

	private int communityNo;
	private String content;
	private int views;
	private int recommend;
	private int n_recommend;
	private Date writerDate;
	private String communityStatus;
	private String writer;
	private String title;
	private String originName;
	private String changeName;
	private String comCode;
	private int reCount;
	
}

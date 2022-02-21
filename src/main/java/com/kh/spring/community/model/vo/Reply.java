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
public class Reply {
	
	private int reNo;
	private int communityNo;
	private int reGroup;
	private int reGroups;
	private int reGroupDept;
	private String reWriter;
	private String reContent;
	private Date reDate;
	
}

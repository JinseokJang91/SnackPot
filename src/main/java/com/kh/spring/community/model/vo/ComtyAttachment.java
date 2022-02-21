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
public class ComtyAttachment {
	
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int communityNo;
	
	
}

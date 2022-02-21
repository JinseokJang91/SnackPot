package com.kh.spring.qna.model.vo;


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
public class Qna {
	
	private int qNo;
	private String writer;
	private String qTitle;
	private String qContent;
	private Date createDate;
	private String aTitle;
	private String aContent;
	private Date aDate;
	private String changeName;
	private String status;
	private String name;
	private String viewDate;
	
	
	

}

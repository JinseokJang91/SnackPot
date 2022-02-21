package com.kh.spring.qna.model.vo;

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
public class QnaAttachment {

	
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;

}

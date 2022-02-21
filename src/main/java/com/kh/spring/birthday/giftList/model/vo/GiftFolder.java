package com.kh.spring.birthday.giftList.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class GiftFolder {

	private String glistNo;
	private String glistName;
	private int folderGiftCount;
	
	private int cempSeq;
}

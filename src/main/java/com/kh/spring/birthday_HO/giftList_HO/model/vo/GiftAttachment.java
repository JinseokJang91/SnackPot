package com.kh.spring.birthday_HO.giftList_HO.model.vo;

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
public class GiftAttachment {

	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String giftRefNo;
}

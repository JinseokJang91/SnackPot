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
public class GiftList {

	private String giftNo;
	private String giftBrand;
	private String giftName;
	private int giftPrice;
	private String changeName;
}

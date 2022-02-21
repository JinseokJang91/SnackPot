package com.kh.spring.birthday_HO.giftList_HO.model.service;

import java.util.ArrayList;

import com.kh.spring.birthday_HO.giftList_HO.model.vo.GiftAttachment;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.HO_GiftList;

public interface HO_GiftListService {

	ArrayList<HO_GiftList> selectGiftList();

	ArrayList<HO_GiftList> selectCtgry(int ctgryNum);
	
	HO_GiftList checkedGiftList(String giftNo);

	void insertGift(HO_GiftList gl);

	void insertAttachment(GiftAttachment at);

	HO_GiftList selectGiftOne(String giftNo);

	void updateGift(HO_GiftList gl);

	void updateAttachment(GiftAttachment at);

	int deleteGift(String[] delArr);

}

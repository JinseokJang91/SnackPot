package com.kh.spring.birthday.giftList.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.spring.birthday.giftList.model.vo.GiftFolder;
import com.kh.spring.birthday.giftList.model.vo.GiftFolderDetail;
import com.kh.spring.birthday.giftList.model.vo.GiftList;

public interface GiftListService {

	String selectPerAmount(String comCode);
	
	ArrayList<GiftList> selectGiftList(int perAmountMax);

	ArrayList<GiftList> selectCtgry(Map<String,Integer> map);

	ArrayList<GiftFolder> selectFolderList();

	int addGiftFolder(String folderName);

	ArrayList<GiftList> selectFolderInfo(int rowNum);

	int addGiftDetail(String[] detailArr);

	GiftFolderDetail checkDuplicate(String[] detailArr);

	int deleteGiftFolder(String glistNo);

	int deleteFolderDetail(String[] delGiftArr);

}

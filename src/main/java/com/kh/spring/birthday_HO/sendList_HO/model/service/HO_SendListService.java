package com.kh.spring.birthday_HO.sendList_HO.model.service;

import java.util.ArrayList;

import com.kh.spring.birthday_HO.sendList_HO.model.vo.HO_SendList;

public interface HO_SendListService {

	ArrayList<HO_SendList> selectSendingList(String comCode);

	int subscribeChk(String comCode);

	String selectSendingTime(String comCode);

}

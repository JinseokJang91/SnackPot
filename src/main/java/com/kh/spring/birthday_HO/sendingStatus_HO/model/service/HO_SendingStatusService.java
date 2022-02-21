package com.kh.spring.birthday_HO.sendingStatus_HO.model.service;

import java.util.ArrayList;

import com.kh.spring.birthday_HO.sendingStatus_HO.model.vo.HO_SendingStatus;

public interface HO_SendingStatusService {

	ArrayList<HO_SendingStatus> selectList(HO_SendingStatus selectInfo);

	int subscribeChk(String comCode);

	String selectSendingTime(String comCode);

	ArrayList<HO_SendingStatus> completeStatusList(String comCode);

}

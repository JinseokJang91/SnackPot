package com.kh.spring.birthday.sendingStatus.model.service;

import java.util.ArrayList;

import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;

public interface SendingStatusService {

	int subscribeChk(String comCode);
	
	ArrayList<SendingStatus> sendingcursts(SendingStatus selectInfo);

	int deleteSendStatus(int cempSeq);

	int insertSendStatus(SendingStatus s);

	SendingStatus selectEmpOne(int cempSeq);

	int updateSendStatus(SendingStatus s);

	String selectSendingTime(String comCode);

	int insertSendStatus2(SendingStatus s);

	ArrayList<SendingStatus> completeCursts(String comCode);

}

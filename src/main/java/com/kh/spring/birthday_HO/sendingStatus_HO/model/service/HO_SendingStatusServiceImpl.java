package com.kh.spring.birthday_HO.sendingStatus_HO.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday_HO.sendingStatus_HO.model.dao.HO_SendingStatusDao;
import com.kh.spring.birthday_HO.sendingStatus_HO.model.vo.HO_SendingStatus;

@Service
public class HO_SendingStatusServiceImpl implements HO_SendingStatusService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private HO_SendingStatusDao sendingStsDao;
	
	@Override
	public ArrayList<HO_SendingStatus> selectList(HO_SendingStatus selectInfo) {
		
		return sendingStsDao.selectList(sqlSession, selectInfo);
	}

	@Override
	public ArrayList<HO_SendingStatus> completeStatusList(String comCode) {
		// TODO Auto-generated method stub
		return sendingStsDao.completeStatusList(sqlSession, comCode);
	}
	
	@Override
	public int subscribeChk(String comCode) {

		int result = sendingStsDao.subscribeChk(sqlSession, comCode);
		
		return result;
	}

	@Override
	public String selectSendingTime(String comCode) {
		// TODO Auto-generated method stub
		return sendingStsDao.selectSendingTime(sqlSession, comCode);
	}

}

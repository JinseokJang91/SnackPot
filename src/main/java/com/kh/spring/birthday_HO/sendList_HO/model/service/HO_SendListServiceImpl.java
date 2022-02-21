package com.kh.spring.birthday_HO.sendList_HO.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday_HO.sendList_HO.model.dao.HO_SendListDao;
import com.kh.spring.birthday_HO.sendList_HO.model.vo.HO_SendList;

@Service
public class HO_SendListServiceImpl implements HO_SendListService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private HO_SendListDao sendListDao;
	
	@Override
	public ArrayList<HO_SendList> selectSendingList(String comCode) {
		// TODO Auto-generated method stub
		return sendListDao.selectList(sqlSession, comCode);
	}

	@Override
	public int subscribeChk(String comCode) {

		int result = sendListDao.subscribeChk(sqlSession, comCode);
		
		return result;
	}

	@Override
	public String selectSendingTime(String comCode) {
		// TODO Auto-generated method stub
		return sendListDao.selectSendingTime(sqlSession, comCode);
	}

}

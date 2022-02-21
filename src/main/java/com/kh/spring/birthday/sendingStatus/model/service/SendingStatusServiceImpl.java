package com.kh.spring.birthday.sendingStatus.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday.sendingStatus.model.dao.SendingStatusDao;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;
import com.kh.spring.common.exception.CommException;
@Service
public class SendingStatusServiceImpl implements SendingStatusService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SendingStatusDao sendingStatusDao;
	
	@Override
	public int subscribeChk(String comCode) {

		int result = sendingStatusDao.subscribeChk(sqlSession, comCode);
		
		return result;
	}
	
	@Override
	public ArrayList<SendingStatus> sendingcursts(SendingStatus selectInfo) {
		// TODO Auto-generated method stub
		return sendingStatusDao.sendingcursts(sqlSession, selectInfo);
	}

	@Override
	public ArrayList<SendingStatus> completeCursts(String comCode) {
		// TODO Auto-generated method stub
		return sendingStatusDao.completeCursts(sqlSession, comCode);
	}

	@Override
	public int deleteSendStatus(int cempSeq) {
		
		int result = sendingStatusDao.deleteSendStatus(sqlSession, cempSeq);
		
		if(result < 0) {
			throw new CommException("발송현황 선택 삭제 실패");
		}
		
		return result;
	}

	@Override
	public int insertSendStatus(SendingStatus s) {

		int result = sendingStatusDao.insertSendStatus(sqlSession, s);
		
		if(result < 0) {
			throw new CommException("발송현황 추가하기 실패");
		}
		
		return result;
	}

	@Override
	public SendingStatus selectEmpOne(int cempSeq) {
		
		return sendingStatusDao.selectEmpOne(sqlSession, cempSeq);
	}

	@Override
	public int updateSendStatus(SendingStatus s) {

		int result = sendingStatusDao.updateSendStatus(sqlSession, s);
		
		if(result < 0) {
			throw new CommException("발송현황 수정하기 실패");
		}
		
		return result;
	}

	@Override
	public String selectSendingTime(String comCode) {
		// TODO Auto-generated method stub
		return sendingStatusDao.selectSendingTime(sqlSession, comCode);
	}

	@Override
	public int insertSendStatus2(SendingStatus s) {

		int result = sendingStatusDao.insertSendStatus2(sqlSession, s);
		
		if(result < 0) {
			throw new CommException("발송현황2 추가하기 실패");
		}
		
		return result;
	}

}

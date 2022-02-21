package com.kh.spring.birthday.sendList.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday.giftList.model.vo.GiftFolder;
import com.kh.spring.birthday.sendList.model.dao.SendListDao;
import com.kh.spring.birthday.sendList.model.vo.SendList;
import com.kh.spring.birthday.sendingStatus.model.dao.SendingStatusDao;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;
import com.kh.spring.common.exception.CommException;

@Service
public class SendListServiceImpl implements SendListService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SendListDao sendListDao;

	@Override
	public int subscribeChk(String comCode) {

		int result = sendListDao.subscribeChk(sqlSession, comCode);
		
		return result;
	}
	
	@Override
	public ArrayList<SendList> selectSendList(String comCode) {
		// TODO Auto-generated method stub
		return sendListDao.selectSendList(sqlSession, comCode);
	}

	@Override
	public int deleteSendList(int cempSeq) {

		int result = sendListDao.deleteSendList(sqlSession, cempSeq);
		
		if(result < 0) {
			throw new CommException("발송리스트 선택 삭제 실패");
		}
		
		return result;
	}

	@Override
	public int insertSendList(SendList s) {

		int result = sendListDao.insertSendList(sqlSession, s);
		
		if(result < 0) {
			throw new CommException("발송리스트 추가하기 실패");
		}
		
		return result;
	}

	@Override
	public SendingStatus selectEmpOne(int cempSeq) {
		// TODO Auto-generated method stub
		return sendListDao.selectEmpOne(sqlSession, cempSeq);
	}

	@Override
	public int updateSendList(SendingStatus s) {

		int result = sendListDao.updateSendList(sqlSession, s);
		
		if(result < 0) {
			throw new CommException("발송리스트 수정하기 실패");
		}
		
		return result;
	}

	@Override
	public String selectSendingTime(String comCode) {
		// TODO Auto-generated method stub
		return sendListDao.selectSendingTime(sqlSession, comCode);
	}

	@Override
	public int insertSendList2(SendList s) {

		int result = sendListDao.insertSendList2(sqlSession, s);
		
		if(result < 0) {
			throw new CommException("발송리스트2 추가하기 실패");
		}
		
		return result;
	}

	@Override
	public ArrayList<GiftFolder> selectGiftFolder() {
		// TODO Auto-generated method stub
		return sendListDao.selectGiftFolder(sqlSession);
	}

	@Override
	public int updateGiftList(GiftFolder gf) {

		int result = sendListDao.updateGiftList(sqlSession, gf);
		
		if(result < 0) {
			throw new CommException("발송리스트 선물리스트 저장 실패");
		}
		
		return result;
	}

}

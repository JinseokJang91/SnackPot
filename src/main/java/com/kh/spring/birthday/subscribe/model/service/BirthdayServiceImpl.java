package com.kh.spring.birthday.subscribe.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday.subscribe.model.dao.BirthdayDao;
import com.kh.spring.birthday.subscribe.model.vo.Birthday;
import com.kh.spring.common.exception.CommException;

@Service
public class BirthdayServiceImpl implements BirthdayService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BirthdayDao bDao;
	
	@Override
	public int subscribe(Birthday b) {
		
		int result = bDao.subscribe(sqlSession, b);
		
		if(result < 0) {
			throw new CommException("생일 구독 신청 실패");
		}
		
		return result;
		
	}

	@Override
	public Birthday subscribeInfo(String comCode) {
		
		Birthday b = null;
		
		b = bDao.subscribeInfo(sqlSession, comCode);

		return b;
	}

	@Override
	public int subscribeChk(String com_code) {
		
		int result = bDao.subscribeChk(sqlSession, com_code);
		
		return result;
	}

	@Override
	public int countEmp(String comCode) {
		// TODO Auto-generated method stub
		return bDao.countEmp(sqlSession, comCode);
	}

	@Override
	public void updateSubscribe(Birthday b) {

		int result = bDao.updateSubscribe(sqlSession, b);
		
		if(result < 0) {
			throw new CommException("구독 정보 수정 실패");
		}	
	}

	@Override
	public void deleteSubscribe(String bservice_no) {

		int result = bDao.deleteSubscribe(sqlSession, bservice_no);
		
		if(result < 0) {
			throw new CommException("구독 취소 실패");
		}	
		
	}

}

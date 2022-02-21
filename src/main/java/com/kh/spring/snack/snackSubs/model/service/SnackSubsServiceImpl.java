package com.kh.spring.snack.snackSubs.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.model.vo.Aroma;
import com.kh.spring.product.model.vo.SnackSubCategory;
import com.kh.spring.product.model.vo.Taste;
import com.kh.spring.snack.snackList.model.dao.HoSnackListDao;
import com.kh.spring.snack.snackList.model.vo.SnackList;
import com.kh.spring.snack.snackOrder.model.dao.SnackOrderDao;
import com.kh.spring.snack.snackSubs.model.dao.SnackSubsDao;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

@Service
public class SnackSubsServiceImpl implements SnackSubsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SnackSubsDao snackSubsDao;
	
	@Autowired
	private SnackOrderDao snackOrderDao;
	
	@Autowired
	private HoSnackListDao hoSnackListDao;

	
	@Override
	public ArrayList<SnackSubCategory> selectSubCategory(int categoryNo) {
		return snackSubsDao.selectSubCategory(sqlSession, categoryNo);
	}

	@Override
	public ArrayList<Aroma> selectAroma() {
		return snackSubsDao.selectAroma(sqlSession);
	}

	@Override
	public ArrayList<Taste> selectTaste() {
		return snackSubsDao.selectTaste(sqlSession);
	}

	@Override
	public void insertSnackSubs(SnackSubs snackSubs) {
		
		int result = snackSubsDao.insertSnackSubs(sqlSession, snackSubs);
		
		if(result < 0 ) {
			throw new CommException("구독 신청 실패");
		}
		
	}

	@Override
	public SnackSubs selectSubsInfo(String comCode) {
		
		return snackSubsDao.selectSubsInfo(sqlSession, comCode);
	}

	@Override
	public void updateSnackSubs(SnackSubs snackSubs) {
		
		int result = snackSubsDao.updateSnackSubs(sqlSession, snackSubs);
		
		if(result < 0 ) {
			throw new CommException("구독 수정 실패");
		}
	}

	@Override
	public void cancelSnackSubs(int subsNo, String comCode) {
		
		int cancelListResult = hoSnackListDao.cancelSnackList(sqlSession, comCode);
		
		if(cancelListResult < 0 ) {
			throw new CommException("cancelListResult 실패");
		}
		
		int cancelOrderResult = snackOrderDao.cancelOrders(sqlSession, comCode);
		
		if(cancelOrderResult < 0 ) {
			throw new CommException("cancelOrderResult 실패");
		}
		
		int result = snackSubsDao.cancelSnackSubs(sqlSession, subsNo);
		
		if(result < 0 ) {
			throw new CommException("cancelSnackSubs 실패");
		}
	}

	@Override
	public int checkSubsDup(String comCode) {
		
		return snackSubsDao.checkSubsDup(sqlSession, comCode);
	}


}

package com.kh.spring.snack.snackList.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.WishListDtail;
import com.kh.spring.snack.snackList.model.dao.HoSnackListDao;
import com.kh.spring.snack.snackList.model.vo.ComListInfo;
import com.kh.spring.snack.snackList.model.vo.SearchList;
import com.kh.spring.snack.snackList.model.vo.SearchSnack;
import com.kh.spring.snack.snackList.model.vo.SnackDList;
import com.kh.spring.snack.snackList.model.vo.SnackList;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

@Service
public class HoSnackListServiceImpl implements HoSnackListService {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	@Autowired
	private HoSnackListDao hoSnackListDao;


	@Override
	public int listCheck(String comCode) {
		return hoSnackListDao.listCheck(sqlSession, comCode);
	}


	@Override
	public ArrayList<ComListInfo> selectSubsInfo(HashMap map) {
		return hoSnackListDao.selectSubsInfo(sqlSession, map);
	}


	@Override
	public ArrayList<Product> searchSnack(SearchSnack search) {
		return hoSnackListDao.searchSnack(sqlSession, search);
	}


	@Override
	public int selectSnackListNo(String comCode) {
		return  hoSnackListDao.selectSnackListNo(sqlSession, comCode);
	}


	@Override
	public ArrayList<SnackDList> selectSnackDList(int listNo) {
		return hoSnackListDao.selectSnackDList(sqlSession, listNo);
	}


	@Override
	public void insertSanckList(String comCode) {
		
		int result = hoSnackListDao.insertSanckList(sqlSession, comCode);
		
		if(result < 0) {
			throw new CommException("insertSanckList 실패");
		}
		
	}


	@Override
	public ArrayList<SnackDList> selectSnack(SnackSubs subs) {
		return  hoSnackListDao.selectSnack(sqlSession, subs);
	}


	@Override
	public void insertSnackDList(ArrayList<SnackDList> dList) {

		int result = hoSnackListDao.insertSnackDList(sqlSession, dList);
		
		if(result < 0) {
			throw new CommException("insertSnackDList 실패");
		}
	}


	@Override
	public int selectTotalPrice(int listNo) {
		return hoSnackListDao.selectTotalPrice(sqlSession, listNo);
	}


	@Override
	public void deleteSnackDList(int listNo) {
		
		int result = hoSnackListDao.deleteSnackDList(sqlSession, listNo);
		
		if(result < 0) {
			throw new CommException("deleteSnackDList 실패");
		}
	}


	@Override
	public void deleteSnackDNo(String snackDNoCheck) {
		
		int result = hoSnackListDao.deleteSnackDNo(sqlSession, snackDNoCheck);
		
		if(result < 0) {
			throw new CommException("deleteSnackDNo 실패");
		}
	}


	@Override
	public void addSanckDList(SnackDList snackD) {
		
		int result = hoSnackListDao.addSanckDList(sqlSession, snackD);
		
		if(result < 0) {
			throw new CommException("addSanckDList 실패");
		}
	}


	@Override
	public int checkSnackDup(SnackDList snackD) {
		return hoSnackListDao.checkSnackDup(sqlSession, snackD);
	}


	@Override
	public void updateSnackAmount(SnackDList snackD) {
		
		int result = hoSnackListDao.updateSnackAmount(sqlSession, snackD);
		
		if(result < 0) {
			throw new CommException("updateSnackAmount 실패");
		}
	}
	
	@Override
	public ArrayList<WishListDtail> selectWishList(ComListInfo info) {
		return hoSnackListDao.selectWishList(sqlSession, info);
	}


	@Override
	public void insertOrder(ComListInfo info) {
		
		int result1 = hoSnackListDao.insertOrder(sqlSession, info);
		
		if(result1 < 0) {
			throw new CommException("insertOrder 실패");
		}
		
		int result2 = hoSnackListDao.insertOrderDetail(sqlSession, info);
		
		if(result2 < 0) {
			throw new CommException("insertOrderDetail 실패");
		}
		
		int result3 = hoSnackListDao.updateTransStatus(sqlSession, info);
		
		if(result3 < 0) {
			throw new CommException("updateTransStatus 실패");
		}
		
	}

	@Override
	public ArrayList<SnackList> selectSendingList(HashMap map, PageInfo pi) {
		
		return hoSnackListDao.selectSendingList(sqlSession, map, pi);
	}


	@Override
	public SnackList selectSnackList(int snackListNo) {
		return hoSnackListDao.selectSnackList(sqlSession, snackListNo);
	}


	@Override
	public int selectOrderNo() {
		return hoSnackListDao.selectOrderNo(sqlSession);
	}


	@Override
	public ArrayList<SnackList> searchSendingList(SearchList searchList, PageInfo pi) {
		return  hoSnackListDao.searchSendingList(sqlSession, searchList, pi);
	}


	@Override
	public ArrayList<SnackDList> selectWish(ComListInfo info) {
		return hoSnackListDao.selectWish(sqlSession, info);
	}


	@Override
	public int selectListCount(HashMap map) {
		return hoSnackListDao.selectListCount(sqlSession, map);
	}


	@Override
	public int selectSearchListCount(SearchList searchList) {
		return hoSnackListDao.selectSearchListCount(sqlSession, searchList);
	}






}

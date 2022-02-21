package com.kh.spring.birthday.giftList.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday.giftList.model.dao.GiftListDao;
import com.kh.spring.birthday.giftList.model.vo.GiftFolder;
import com.kh.spring.birthday.giftList.model.vo.GiftFolderDetail;
import com.kh.spring.birthday.giftList.model.vo.GiftList;
import com.kh.spring.common.exception.CommException;

@Service
public class GiftListServiceImpl implements GiftListService {

	@Autowired
	private GiftListDao giftListDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public String selectPerAmount(String comCode) {
		// TODO Auto-generated method stub
		return giftListDao.selectPerAmount(sqlSession, comCode);
	}
	
	@Override
	public ArrayList<GiftList> selectGiftList(int perAmountMax) {
		// TODO Auto-generated method stub
		return giftListDao.selectGiftList(sqlSession, perAmountMax);
	}

	@Override
	public ArrayList<GiftFolder> selectFolderList() {
		// TODO Auto-generated method stub
		return giftListDao.selectFolderList(sqlSession);
	}
	
	@Override
	public ArrayList<GiftList> selectCtgry(Map<String,Integer> map) {
		// TODO Auto-generated method stub
		return giftListDao.selectCtgry(sqlSession, map);
	}

	@Override
	public int addGiftFolder(String folderName) {

		int result = giftListDao.addGiftFolder(sqlSession, folderName);
		
		if(result < 0) {
			throw new CommException("폴더 추가 실패!");
		}
		
		return result;
	}

	@Override
	public ArrayList<GiftList> selectFolderInfo(int rowNum) {
		// TODO Auto-generated method stub
		return giftListDao.selectFolderInfo(sqlSession, rowNum);
	}

	@Override
	public int addGiftDetail(String[] detailArr) {
		
		int result = giftListDao.addGiftDetail(sqlSession, detailArr);
		
		if(result < 0) {
			throw new CommException("폴더 상세 추가 실패!");
		}
		
		return result;
	}

	@Override
	public GiftFolderDetail checkDuplicate(String[] detailArr) {

		GiftFolderDetail result = giftListDao.checkDuplicate(sqlSession, detailArr);

		return result;
	}

	@Override
	public int deleteGiftFolder(String glistNo) {

		int result = giftListDao.deleteGiftFolder(sqlSession, glistNo);
		
		if(result < 0) {
			throw new CommException("폴더 삭제 실패!");
		}
		
		return result;
	}

	@Override
	public int deleteFolderDetail(String[] delGiftArr) {

		int result = giftListDao.deleteFolderDetail(sqlSession, delGiftArr);
		
		if(result < 0) {
			throw new CommException("폴더 상세 내용 삭제 실패!");
		}
		
		return result;
	}

}

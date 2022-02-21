package com.kh.spring.birthday_HO.giftList_HO.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday_HO.giftList_HO.model.dao.HO_GiftListDao;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.GiftAttachment;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.HO_GiftList;
import com.kh.spring.common.exception.CommException;

@Service
public class HO_GiftListServiceImpl implements HO_GiftListService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private HO_GiftListDao giftListDao;
	
	@Override
	public ArrayList<HO_GiftList> selectGiftList() {
		// TODO Auto-generated method stub
		return giftListDao.selectGiftList(sqlSession);
	}

	@Override
	public ArrayList<HO_GiftList> selectCtgry(int ctgryNum) {
		// TODO Auto-generated method stub
		return giftListDao.selectCtgry(sqlSession, ctgryNum);
	}

	@Override
	public HO_GiftList checkedGiftList(String giftNo) {
		// TODO Auto-generated method stub
		return giftListDao.checkedGiftList(sqlSession, giftNo);
	}

	@Override
	public void insertGift(HO_GiftList gl) {

		int result = giftListDao.insertGift(sqlSession, gl);
		
		if(result < 0) {
			throw new CommException("선물 상품 등록 실패!");
		}
	}

	@Override
	public void insertAttachment(GiftAttachment at) {
		
		int result = giftListDao.insertAttachment(sqlSession, at);
		
		if(result < 0) {
			throw new CommException("선물 사진 등록 실패!");
		}
		
	}

	@Override
	public HO_GiftList selectGiftOne(String giftNo) {
		// TODO Auto-generated method stub
		return giftListDao.selectGiftOne(sqlSession, giftNo);
	}

	@Override
	public void updateGift(HO_GiftList gl) {
		
		int result = giftListDao.updateGift(sqlSession, gl);
		
		if(result < 0) {
			throw new CommException("선물 상품 수정 실패!");
		}
	}

	@Override
	public void updateAttachment(GiftAttachment at) {

		int result = giftListDao.updateAttachment(sqlSession, at);
		
		if(result < 0) {
			throw new CommException("선물 사진 수정 실패!");
		}
	}

	@Override
	public int deleteGift(String[] delArr) {
		
		int result = giftListDao.deleteGift(sqlSession, delArr);
		
		if(result<0) {
			throw new CommException("선물 상품 삭제 실패");
		}
		
		return result;
	}

}

package com.kh.spring.birthday_HO.giftList_HO.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday_HO.giftList_HO.model.vo.GiftAttachment;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.HO_GiftList;

@Repository
public class HO_GiftListDao {

	public ArrayList<HO_GiftList> selectGiftList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper_HO.selectGiftList");
	}

	public ArrayList<HO_GiftList> selectCtgry(SqlSessionTemplate sqlSession, int ctgryNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper_HO.selectCtgry", ctgryNum);
	}
	
	public HO_GiftList checkedGiftList(SqlSessionTemplate sqlSession, String giftNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper_HO.checkedGiftList", giftNo);
	}

	public int insertGift(SqlSessionTemplate sqlSession, HO_GiftList gl) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper_HO.insertGift", gl);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, GiftAttachment at) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper_HO.insertAttachment", at);
	}

	public HO_GiftList selectGiftOne(SqlSessionTemplate sqlSession, String giftNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper_HO.selectGiftOne", giftNo);
	}

	public int updateGift(SqlSessionTemplate sqlSession, HO_GiftList gl) {
		// TODO Auto-generated method stub
		return sqlSession.update("birthdayMapper_HO.updateGift", gl);
	}

	public int updateAttachment(SqlSessionTemplate sqlSession, GiftAttachment at) {
		// TODO Auto-generated method stub
		return sqlSession.update("birthdayMapper_HO.updateAttachment", at);
	}

	public int deleteGift(SqlSessionTemplate sqlSession, String[] delArr) {
		// TODO Auto-generated method stub
		return sqlSession.delete("birthdayMapper_HO.deleteGift", delArr);
	}

}

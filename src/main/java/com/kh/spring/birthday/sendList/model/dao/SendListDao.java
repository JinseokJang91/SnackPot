package com.kh.spring.birthday.sendList.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday.giftList.model.vo.GiftFolder;
import com.kh.spring.birthday.sendList.model.vo.SendList;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;

@Repository
public class SendListDao {

	public int subscribeChk(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.subscribeChk", comCode);
	}
	
	public ArrayList<SendList> selectSendList(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectSendList", comCode);
	}

	public int deleteSendList(SqlSessionTemplate sqlSession, int cempSeq) {
		// TODO Auto-generated method stub
		return sqlSession.delete("birthdayMapper.deleteSendStatus", cempSeq);
	}

	public int insertSendList(SqlSessionTemplate sqlSession, SendList s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.insertSendList", s);
	}

	public SendingStatus selectEmpOne(SqlSessionTemplate sqlSession, int cempSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.selectEmpOne", cempSeq);
	}

	public int updateSendList(SqlSessionTemplate sqlSession, SendingStatus s) {
		// TODO Auto-generated method stub
		return sqlSession.update("birthdayMapper.updateSendList", s);
	}

	public String selectSendingTime(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.selectSendingTime", comCode);
	}

	public int insertSendList2(SqlSessionTemplate sqlSession, SendList s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.insertSendList2", s);
	}

	public ArrayList<GiftFolder> selectGiftFolder(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.selectGiftFolder");
	}

	public int updateGiftList(SqlSessionTemplate sqlSession, GiftFolder gf) {
		// TODO Auto-generated method stub
		return sqlSession.update("birthdayMapper.updateGiftList", gf);
	}

}

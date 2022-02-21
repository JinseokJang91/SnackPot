package com.kh.spring.birthday_HO.sendingStatus_HO.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday_HO.sendingStatus_HO.model.vo.HO_SendingStatus;

@Repository
public class HO_SendingStatusDao {

	public ArrayList<HO_SendingStatus> selectList(SqlSessionTemplate sqlSession, HO_SendingStatus selectInfo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper_HO.selectStatusList", selectInfo);
	}

	public ArrayList<HO_SendingStatus> completeStatusList(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper_HO.completeStatusList", comCode);
	}

	
	public String selectSendingTime(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper_HO.selectSendingTime", comCode);
	}
 
	public int subscribeChk(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper_HO.subscribeChk", comCode);
	}

}

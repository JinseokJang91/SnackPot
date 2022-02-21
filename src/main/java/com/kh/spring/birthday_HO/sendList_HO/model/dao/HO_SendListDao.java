package com.kh.spring.birthday_HO.sendList_HO.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday_HO.sendList_HO.model.vo.HO_SendList;

@Repository
public class HO_SendListDao {

	public ArrayList<HO_SendList> selectList(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper_HO.selectSendList", comCode);
	}

	public int subscribeChk(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper_HO.subscribeChk", comCode);
	}

	public String selectSendingTime(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper_HO.selectSendingTime", comCode);
	}

}

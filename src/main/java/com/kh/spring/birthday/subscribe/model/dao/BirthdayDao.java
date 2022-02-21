package com.kh.spring.birthday.subscribe.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday.subscribe.model.vo.Birthday;


@Repository
public class BirthdayDao {

	public int subscribe(SqlSessionTemplate sqlSession, Birthday b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.subscribe", b);
	}

	public Birthday subscribeInfo(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.subscribeInfo", comCode);
	}

	public int subscribeChk(SqlSessionTemplate sqlSession, String com_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.subscribeChk", com_code);
	}

	public int countEmp(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.countEmp", comCode);
	}

	public int updateSubscribe(SqlSessionTemplate sqlSession, Birthday b) {
		// TODO Auto-generated method stub
		return sqlSession.update("birthdayMapper.updateSubscribe", b);
	}

	public int deleteSubscribe(SqlSessionTemplate sqlSession, String bservice_no) {
		// TODO Auto-generated method stub
		return sqlSession.update("birthdayMapper.deleteSubscribe", bservice_no);
	}

}

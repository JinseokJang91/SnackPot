package com.kh.spring.birthday.sendingStatus.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;

@Repository
public class SendingStatusDao {

	public int subscribeChk(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.subscribeChk", comCode);
	}
	
	public ArrayList<SendingStatus> sendingcursts(SqlSessionTemplate sqlSession, SendingStatus selectInfo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.sendingcursts", selectInfo);
	}
	
	public ArrayList<SendingStatus> completeCursts(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("birthdayMapper.completeCursts", comCode);
	}

	public int deleteSendStatus(SqlSessionTemplate sqlSession, int cempSeq) {
		// TODO Auto-generated method stub
		return sqlSession.delete("birthdayMapper.deleteSendStatus", cempSeq);
	}

	public int insertSendStatus(SqlSessionTemplate sqlSession, SendingStatus s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.insertSendStatus", s);
	}

	public SendingStatus selectEmpOne(SqlSessionTemplate sqlSession, int cempSeq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.selectEmpOne", cempSeq);
	}

	public int updateSendStatus(SqlSessionTemplate sqlSession, SendingStatus s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.updateSendStatus", s);
	}

	public String selectSendingTime(SqlSessionTemplate sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("birthdayMapper.selectSendingTime", comCode);
	}

	public int insertSendStatus2(SqlSessionTemplate sqlSession, SendingStatus s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("birthdayMapper.insertSendStatus2", s);
	}

}

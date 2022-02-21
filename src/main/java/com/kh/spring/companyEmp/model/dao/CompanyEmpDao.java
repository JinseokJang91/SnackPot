package com.kh.spring.companyEmp.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.companyEmp.model.vo.CompanyEmp;

@Repository
public class CompanyEmpDao {

	public ArrayList<CompanyEmp> selectEmpList(SqlSessionTemplate sqlSession, String comCode) {
		
		return (ArrayList)sqlSession.selectList("companyEmpMapper.selectEmpList", comCode);
	}

	public int checkNum(SqlSessionTemplate sqlSession, String cempNum, String comCode) {
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("comCode", comCode);
		parameters.put("cempNum", cempNum);
		
		int result = sqlSession.selectOne("companyEmpMapper.checkNum", parameters);
		
		return result;
	}

	public int insertEmp(SqlSessionTemplate sqlSession, CompanyEmp ce) {
		
		return sqlSession.insert("companyEmpMapper.insertEmp", ce);
	}

	public CompanyEmp selectEmp(SqlSessionTemplate sqlSession, String cempNum, String comCode) {
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("comCode", comCode);
		parameters.put("cempNum", cempNum);
		
		return sqlSession.selectOne("companyEmpMapper.selectEmp", parameters);
	}

	public int updateEmp(SqlSessionTemplate sqlSession, CompanyEmp ce) {
		
		return sqlSession.update("companyEmpMapper.updateEmp", ce);
	}

	public int deleteEmp(SqlSessionTemplate sqlSession, String cempNum, String comCode) {
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("comCode", comCode);
		parameters.put("cempNum", cempNum);
		
		return sqlSession.update("companyEmpMapper.deleteEmp", parameters);
	}

}

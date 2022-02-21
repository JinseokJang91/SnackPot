package com.kh.spring.snackpotEmp.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.birthday.subscribe.model.vo.Birthday;
import com.kh.spring.company.model.vo.Company;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;
import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

@Repository
public class SnackpotEmpDao {

	public SnackpotEmp loginEmp(SqlSessionTemplate sqlSession, SnackpotEmp se) {
		
		SnackpotEmp loginEmp = sqlSession.selectOne("snackpotEmpMapper.loginEmp", se);
		
		return loginEmp;
	}

	public ArrayList<SnackpotEmp> selectEmpList(SqlSessionTemplate sqlSession) {
	
		return (ArrayList)sqlSession.selectList("snackpotEmpMapper.selectEmpList");
	}

	public int insertEmp(SqlSessionTemplate sqlSession, SnackpotEmp se) {
		
		return sqlSession.insert("snackpotEmpMapper.insertEmp", se);
	}

	public int checkNum(SqlSessionTemplate sqlSession, String sempNum) {
		int result = sqlSession.selectOne("snackpotEmpMapper.checkNum", sempNum);
		
		return result;
	}

	public SnackpotEmp selectEmp(SqlSessionTemplate sqlSession, int sempNum) {
		
		SnackpotEmp se = sqlSession.selectOne("snackpotEmpMapper.selectEmp", sempNum);
		
		return se;
	}

	public int updateEmp(SqlSessionTemplate sqlSession, SnackpotEmp se) {
		
		return sqlSession.update("snackpotEmpMapper.updateEmp", se);
	}

	public int deleteEmp(SqlSessionTemplate sqlSession, String sempNum) {
		
		return sqlSession.update("snackpotEmpMapper.deleteEmp", sempNum);
	}

	public String searchComCode(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("companyMapper.searchComCode", comCode);
	}

	public ArrayList<Company> selectCompanyList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("companyMapper.selectCompanyList");
	}

	public String searchSempName(SqlSessionTemplate sqlSession, String sempNum) {

		return sqlSession.selectOne("snackpotEmpMapper.searchSempName", sempNum);
	}

	public Company searchComName(SqlSessionTemplate sqlSession, String comName) {

		return sqlSession.selectOne("companyMapper.searchComName", comName);
	}

	public int updateCompany(SqlSessionTemplate sqlSession, String comCode, String sempNum) {
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("comCode", comCode);
		parameters.put("sempNum", sempNum);
		
		return sqlSession.update("snackpotEmpMapper.updateCompany", parameters);
	}

	public int updateSempNum(SqlSessionTemplate sqlSession, String comName, String sempNum) {
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("comName", comName);
		parameters.put("sempNum", sempNum);
		
		return sqlSession.update("companyMapper.updateSempNum", parameters);
	}

	public ArrayList<Company> selectOriginCom(SqlSessionTemplate sqlSession, String sempNum) {
		
		return (ArrayList)sqlSession.selectList("companyMapper.selectOriginCom", sempNum);
	}

	public int updateComNull(SqlSessionTemplate sqlSession, String comCode) {
		
		String empty = "미정";
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("empty", empty);
		parameters.put("comCode", comCode);
		
		return sqlSession.update("companyMapper.updateComNull", parameters);
	}

	public int updatePw(SqlSessionTemplate sqlSession, SnackpotEmp se) {
		
		return sqlSession.update("snackpotEmpMapper.updatePw", se);
	}

	public Company selectSempCompany(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("companyMapper.selectSempCompany", comCode);
	}

	public ArrayList<SnackpotEmp> selectComCodeCheck(SqlSessionTemplate sqlSession, String comCode) {
		
		return (ArrayList)sqlSession.selectList("snackpotEmpMapper.selectComCodeCheck", comCode);
	}

	public int deleteSempComCode(SqlSessionTemplate sqlSession, SnackpotEmp se) {
		
		return sqlSession.update("snackpotEmpMapper.deleteSempComCode", se);
	}

	public SnackSubs selectSnackSub(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("snackSubsMapper.selectSnackSub", comCode);
	}

	public Birthday selectBirthSub(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("birthdayMapper.selectBirthSub", comCode);
	}

	public int findPw(SqlSessionTemplate sqlSession, int sempNum, String sempName, String sempEmail) {
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("sempNum", sempNum);
		parameters.put("sempName", sempName);
		parameters.put("sempEmail", sempEmail);
		
		return sqlSession.selectOne("snackpotEmpMapper.findPw", parameters);
	}


}

package com.kh.spring.companyMember.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.company.model.vo.Company;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@Repository
public class CompanyMemberDao {

	public int idCheck(SqlSessionTemplate sqlSession, String memId) {
	
		int result = sqlSession.selectOne("companyMemberMapper.idCheck", memId);
		
		return result;
	}

	public int codeCheck(SqlSessionTemplate sqlSession, String comCode) {
		
		int result = sqlSession.selectOne("companyMemberMapper.codeCheck", comCode);
		
		return result;
	}

	public int insertCompany(SqlSessionTemplate sqlSession, Company co) {
		
		return sqlSession.insert("companyMapper.insertCompany", co);
	}

	public int insertCompanyMember(SqlSessionTemplate sqlSession, CompanyMember m) {

		return sqlSession.insert("companyMemberMapper.insertCompanyMember", m);
	}

	public int insertCompanyAdmin(SqlSessionTemplate sqlSession, CompanyMember m) {
	
		return sqlSession.insert("companyMemberMapper.insertCompanyAdmin", m);
	}

	public CompanyMember loginMember(SqlSessionTemplate sqlSession, CompanyMember m) {
		
		return sqlSession.selectOne("companyMemberMapper.loginMember", m);
	}

	public String findId(SqlSessionTemplate sqlSession, String memName, String memPhone) {
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("memName", memName);
		parameters.put("memPhone", memPhone);
		CompanyMember mem = sqlSession.selectOne("companyMemberMapper.findId", parameters);
		
		return mem.getMemId();
	}

	public Company selectCompany(SqlSessionTemplate sqlSession, String comCode) {
		
		Company co = sqlSession.selectOne("companyMapper.selectCompany", comCode);
		
		return co;
	}

	public int updateCompany(SqlSessionTemplate sqlSession, Company co) {
		
		return sqlSession.update("companyMapper.updateCompany", co);
	}

	public int updateMember(SqlSessionTemplate sqlSession, CompanyMember m) {
		
		return sqlSession.update("companyMemberMapper.updateMember", m);
	}

	public int updatePw(SqlSessionTemplate sqlSession, CompanyMember m) {
	
		return sqlSession.update("companyMemberMapper.updatePw", m);
	}

	public int deleteMem(SqlSessionTemplate sqlSession, String memId) {
		
		return sqlSession.update("companyMemberMapper.deleteMem", memId);
	}

	public int insertNewAdmin(SqlSessionTemplate sqlSession, CompanyMember m) {
		
		return sqlSession.insert("companyMemberMapper.insertNewAdmin", m);
	}

	public int retireAdmin(SqlSessionTemplate sqlSession, String memId) {
		
		return sqlSession.update("companyMemberMapper.retireAdmin", memId);
	}

	public int updateCompanyAdmin(SqlSessionTemplate sqlSession, String memId, String comCode) {
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("memId", memId);
		parameters.put("comCode", comCode);
		
		return sqlSession.update("companyMapper.updateCompanyAdmin", parameters);
	}

	public String selectId(SqlSessionTemplate sqlSession, String memId, String comCode) {
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("memId", memId);
		parameters.put("comCode", comCode);
		
		return sqlSession.selectOne("companyMemberMapper.selectId", parameters);
	}

	public int updateNewAdmin(SqlSessionTemplate sqlSession, String memId, String comCode) {
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("memId", memId);
		parameters.put("comCode", comCode);
		
		return sqlSession.update("companyMemberMapper.updateNewAdmin", parameters);
	} 

	public String selectSnackSubSta(SqlSessionTemplate sqlSession, String memId) {
		
		String snackStatus = sqlSession.selectOne("companyMemberMapper.selectSnackSubSta", memId);
				
		return snackStatus;
	}

	public String selectbirthSubSta(SqlSessionTemplate sqlSession, String memId) {
		String birthStatus = sqlSession.selectOne("companyMemberMapper.selectbirthSubSta", memId);
		
		return birthStatus;
	}

	public int deleteAllMem(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.update("companyMemberMapper.deleteAllMem", comCode);
	}

	public CompanyMember readMember(SqlSessionTemplate sqlSession, String memId) {
		
		return sqlSession.selectOne("companyMemberMapper.readMember", memId);
	}

	public int checkMember(SqlSessionTemplate sqlSession, CompanyMember m) {
		
		return sqlSession.selectOne("companyMemberMapper.checkMember", m);
	}


}

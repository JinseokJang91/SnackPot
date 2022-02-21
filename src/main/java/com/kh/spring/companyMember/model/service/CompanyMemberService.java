package com.kh.spring.companyMember.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.spring.company.model.vo.Company;
import com.kh.spring.companyMember.model.vo.CompanyMember;

public interface CompanyMemberService {

	int idCheck(String memId);

	int codeCheck(String comCode);

	void insertCompany(Company co);

	void insertCompanyMember(CompanyMember m);

	int insertCompanyAdmin(CompanyMember m);

	CompanyMember loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, CompanyMember m);

	String findId(String memName, String memPhone);

	Company selectCompany(String comCode);

	void updateCompany(Company co);

	void updateMember(CompanyMember m);

	void updatePw(CompanyMember m);

	void deleteMem(String memId);

	void insertNewAdmin(CompanyMember m);

	void retireAdmin(String memId);

	void updateCompanyAdmin(String newMemId, String comCode);

	String selectId(String memId, String comCode);

	void updateNewAdmin(String originMemId, String comCode);

	String selectSnackSubSta(String memId);

	String selectbirthSubSta(String memId);

	void deleteAllMem(String comCode);

	int checkMember(CompanyMember m);

	 

}

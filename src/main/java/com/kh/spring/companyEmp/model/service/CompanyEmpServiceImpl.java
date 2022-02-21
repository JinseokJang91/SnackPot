package com.kh.spring.companyEmp.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.companyEmp.model.dao.CompanyEmpDao;
import com.kh.spring.companyEmp.model.vo.CompanyEmp;

@Service
public class CompanyEmpServiceImpl implements CompanyEmpService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CompanyEmpDao ced;
	
	@Override
	public ArrayList<CompanyEmp> selectEmpList(String comCode) {
		
		return ced.selectEmpList(sqlSession, comCode);
	}

	@Override
	public int checkNum(String cempNum, String comCode) {
		int result = ced.checkNum(sqlSession, cempNum, comCode);
		
		return result;
	}

	@Override
	public void insertEmp(CompanyEmp ce) {
		int result = ced.insertEmp(sqlSession, ce);
		
		if(result < 0) {
			throw new CommException("사원등록에 실패했습니다");
		}
	}

	@Override
	public CompanyEmp selectEmp(String cempNum, String comCode) {
		
		return ced.selectEmp(sqlSession, cempNum, comCode);
	}

	@Override
	public void updateEmp(CompanyEmp ce) {
		int result = ced.updateEmp(sqlSession, ce);
		
		if(result < 0) {
			throw new CommException("사원정보 변경에 실패했습니다");
		}
		
	}

	@Override
	public int deleteEmp(String cempNum, String comCode) {
		int result = ced.deleteEmp(sqlSession, cempNum, comCode);
		
		if(result < 0) {
			throw new CommException("사원 삭제에 실패했습니다");
		}
		return result;
	}

}

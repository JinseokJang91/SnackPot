package com.kh.spring.snackpotEmp.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.spring.birthday.subscribe.model.vo.Birthday;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.company.model.vo.Company;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;
import com.kh.spring.snackpotEmp.model.dao.SnackpotEmpDao;
import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;


@Service
public class SnackpotEmpServiceImpl implements SnackpotEmpService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SnackpotEmpDao sed;
	
	@Override
	public SnackpotEmp loginEmp(BCryptPasswordEncoder bCryptPasswordEncoder, SnackpotEmp se) {
		
		SnackpotEmp loginEmp = sed.loginEmp(sqlSession, se);
		
		if(loginEmp != null) {
			
			if(loginEmp.getSempNum() != 0) {
			
				if(!bCryptPasswordEncoder.matches(se.getSempPw(), loginEmp.getSempPw())) {
				throw new CommException("암호 불일치");
				}
			}
			
		}else {
			throw new CommException("회원정보가 존재하지 않습니다"); 
		}
		
		
		
		return loginEmp;
	}

	@Override
	public ArrayList<SnackpotEmp> selectEmpList() {

		return sed.selectEmpList(sqlSession);
	}

	@Override
	public void insertEmp(SnackpotEmp se) {
		int result = sed.insertEmp(sqlSession, se);
		
		if(result < 0) {
			throw new CommException("사원등록에 실패했습니다");
		}
	}

	@Override
	public int checkNum(String sempNum) {
		int result = sed.checkNum(sqlSession, sempNum);
		
		return result;
	}

	@Override
	public SnackpotEmp selectEmp(int sempNum) {
		
		return sed.selectEmp(sqlSession, sempNum);
	}

	@Override
	public void updateEmp(SnackpotEmp se) {
		int result = sed.updateEmp(sqlSession, se);
		
		if(result < 0) {
			throw new CommException("사원정보 변경에 실패했습니다");
		}
		
	}

	@Override
	public int deleteEmp(String sempNum) {
		int result = sed.deleteEmp(sqlSession, sempNum);
		
		if(result < 0) {
			throw new CommException("사원 삭제에 실패했습니다");
		}
		return result;
	}

	@Override
	public String searchComCode(String string) {
		
		return sed.searchComCode(sqlSession, string);
	}

	@Override
	public ArrayList<Company> selectCompanyList() {
		
		return sed.selectCompanyList(sqlSession);
	}

	@Override
	public String searchSempName(String num) {
		
		return sed.searchSempName(sqlSession, num);
	}

	@Override
	public Company searchComName(String string) {
		
		return sed.searchComName(sqlSession, string);
	}

	@Override
	public int updateCompany(String comCode, String sempNum) {
		
		int result = sed.updateCompany(sqlSession, comCode, sempNum);
		
		if(result < 0) {
			throw new CommException("사원 거래처 변경에 실패했습니다");
		}
		
		return result;
	}

	@Override
	public void updateSempNum(String string, String sempNum) {
		
		int result = sed.updateSempNum(sqlSession, string, sempNum);
		
		if(result < 0) {
			throw new CommException("사원 번호 변경에 실패했습니다");
		}
	}

	@Override
	public ArrayList<Company> selectOriginCom(String sempNum) {
		
		return sed.selectOriginCom(sqlSession, sempNum);
	}

	@Override
	public void updateComNull(String comCode) {
		
		int result = sed.updateComNull(sqlSession, comCode);
		
		if(result < 0) {
			throw new CommException("사원 번호 삭제에 실패했습니다");
		}
	}

	@Override
	public void updatePw(SnackpotEmp se) {
		
		int result = sed.updatePw(sqlSession, se);
		
		if(result < 0) {
			throw new CommException("비밀번호 변경에 실패했습니다");
		}
		
	}

	@Override
	public Company selectSempCompany(String string) {
		
		return sed.selectSempCompany(sqlSession, string);
	}

	@Override
	public ArrayList<SnackpotEmp> selectComCodeCheck(String check) {
		
		return sed.selectComCodeCheck(sqlSession, check);
	}

	@Override
	public void deleteSempComCode(SnackpotEmp se) {
		int result = sed.deleteSempComCode(sqlSession, se);
		
		if(result < 0) {
			throw new CommException("기존 사원 담당 회사 삭제에 실패했습니다");
		}
		
	}

	@Override
	public SnackSubs selectSnackSub(String comCode) {
		
		return sed.selectSnackSub(sqlSession, comCode);
	}

	@Override
	public Birthday selectBirthSub(String comCode) {
		
		return sed.selectBirthSub(sqlSession, comCode);
	}

	@Override
	public int findPw(int sempNum, String sempName, String sempEmail) {
		int result = sed.findPw(sqlSession, sempNum, sempName, sempEmail);
		
		if(result < 0) {
			throw new CommException("사원 비밀번호 찾기에 실패했습니다");
		}
		
		return result;
	}

}

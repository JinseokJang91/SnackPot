package com.kh.spring.companyMember.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.company.model.vo.Company;
import com.kh.spring.companyMember.model.dao.CompanyMemberDao;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@Service
public class CompanyMemberServiceImpl implements CompanyMemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CompanyMemberDao cmd;
	

	@Override
	public int idCheck(String memId) {
		
		int result = cmd.idCheck(sqlSession, memId);
		
		return result;
	}

	@Override
	public int codeCheck(String comCode) {
		int result = cmd.codeCheck(sqlSession, comCode);
		
		return result;
	}

	@Override
	public void insertCompany(Company co) {
		int result = cmd.insertCompany(sqlSession, co);
		
		if(result < 0) {
			throw new CommException("회사등록에 실패했습니다");
		}
	}

	@Override
	public void insertCompanyMember(CompanyMember m) {
		int result = cmd.insertCompanyMember(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("회사등록에 실패했습니다");
		}
	}

	@Override
	public int insertCompanyAdmin(CompanyMember m) {
		int result = cmd.insertCompanyAdmin(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("회사등록에 실패했습니다");
		}
		return result;
	}

	@Override
	public CompanyMember loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, CompanyMember m) {
		CompanyMember loginUser = cmd.loginMember(sqlSession, m);
		if(loginUser == null) {
			throw new CommException("회원정보가 존재하지 않습니다"); 
		}

		if(!bCryptPasswordEncoder.matches(m.getMemPw(), loginUser.getMemPw())) {
			throw new CommException("암호 불일치");
		}
		
		return loginUser;
	}

	@Override
	public String findId(String memName, String memPhone) {
	
		String id = cmd.findId(sqlSession, memName, memPhone);
		
		return id;
	}

	@Override
	public Company selectCompany(String comCode) {
		
		Company co = cmd.selectCompany(sqlSession, comCode);
		
		return co;
	}

	@Override
	public void updateCompany(Company co) {
		int result = cmd.updateCompany(sqlSession, co);
		
		if(result < 0) {
			throw new CommException("회사정보 변경에 실패했습니다");
		}
	}

	@Override
	public void updateMember(CompanyMember m) {
		int result = cmd.updateMember(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("회원정보 변경에 실패했습니다");
		}
	}

	@Override
	public void updatePw(CompanyMember m) {
		int result = cmd.updatePw(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("비밀번호 변경에 실패했습니다");
		}
	}

	@Override
	public void deleteMem(String memId) {
		int result = cmd.deleteMem(sqlSession, memId);
		
		if(result < 0) {
			throw new CommException("회원탈퇴에 실패했습니다");
		}
	}

	@Override
	public void insertNewAdmin(CompanyMember m) {
		int result = cmd.insertNewAdmin(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("담당자 등록에 실패했습니다");
		}	
	}

	@Override
	public void retireAdmin(String memId) {
		int result = cmd.retireAdmin(sqlSession, memId);
		
		if(result < 0) {
			throw new CommException("담당자 권한 회수에 실패했습니다");
		}
	}

	@Override
	public void updateCompanyAdmin(String newMemId, String comCode) {
		int result = cmd.updateCompanyAdmin(sqlSession, newMemId, comCode);
		
		if(result < 0) {
			throw new CommException("담당자 아이디 변경에 실패했습니다");
		}
	}

	@Override
	public String selectId(String memId, String comCode) {
	
		String id = cmd.selectId(sqlSession, memId, comCode);
		
		return id;
	}

	@Override
	public void updateNewAdmin(String originMemId, String comCode) {
		int result = cmd.updateNewAdmin(sqlSession, originMemId, comCode);
		
		if(result < 0) {
			throw new CommException("담당자 권한 변경에 실패했습니다");
		}
	}

	@Override
	public String selectSnackSubSta(String memId) {
		String snackStatus = cmd.selectSnackSubSta(sqlSession, memId);
		return snackStatus;
	}
 
	@Override
	public String selectbirthSubSta(String memId) {
		String birthStatus = cmd.selectbirthSubSta(sqlSession, memId);
		return birthStatus;
	}

	@Override
	public void deleteAllMem(String comCode) {
		int result = cmd.deleteAllMem(sqlSession, comCode);
		
		if(result < 0) {
			throw new CommException("회원탈퇴에 실패했습니다");
		}
	}

	@Override
	public int checkMember(CompanyMember m) {
		int result = cmd.checkMember(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("멤버찾기에 실패했습니다");
		}
		return result;
	}
	
}

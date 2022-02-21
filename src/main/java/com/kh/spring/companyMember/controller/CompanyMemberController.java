package com.kh.spring.companyMember.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.company.model.vo.Company;
import com.kh.spring.companyMember.model.service.CompanyMemberService;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@SessionAttributes("loginUser")
@Controller
public class CompanyMemberController {
	
	@Autowired
	private CompanyMemberService cms;
	
	@Autowired
	private Company co;
	
	private String memId;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("findId.co")
	public String findId() {
		return "company/companyMember/companyMemberFindId";
	}
	
	@RequestMapping("findPw.co")
	public String findPw() {
		return "company/companyMember/companyMemberFindPw";
	}
	
	@RequestMapping("enrollForm.co")
	public String enrollForm() {
		return "company/companyMember/companyMemberEnrollForm";
	}
	
	@RequestMapping("login.co")
	public String login() {
		return "company/companyMember/companyMemberLogin";
	}
	
	@RequestMapping("modifyMember.co")
	public String modifyMember() {
		return "company/companyMember/companyMemberModify";
	}
	
	@RequestMapping("modifyAdmin.co")
	public String modifyAdmin() {
		return "company/companyMember/companyAdminModify";
	}
	
	@RequestMapping("modifyPw.co")
	public String modifyPw() {
		return "company/companyMember/companyMemberModifyPw";
	}
	
	@RequestMapping("main.co")
	public String main() {
		return "redirect:/";
	}
	
	@RequestMapping("changeAdmin.co")
	public String changeAdmin() {
		return "company/companyMember/companyChangeAdmin";
	}
	 
	@ResponseBody
	@RequestMapping("idCheck.co")
	public String idCheck(String memId) {
		
		int result = cms.idCheck(memId);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("selectId.co")
	public String selectId(String memId, HttpSession session) {
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		
		String id = "";
		try {
		id = cms.selectId(memId, loginUser.getComCode());
		}catch(Exception e) {
			id = null;
		}
		
		return id;
	}
	
	@ResponseBody
	@RequestMapping("codeCheck.co")
	public String codeCheck(String comCode) {
		
		int result = cms.codeCheck(comCode);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("findIdSelect.co")
	public String findIdSelect(@ModelAttribute CompanyMember m, String memName, String memPhone) {
		
		String id = "";
		try {
		id = cms.findId(memName, memPhone);
		}catch(Exception e) {
			id = null;
		} 
		
		return id;
	}
	
	@RequestMapping("insertComMem.co")
	public String insertMember(@ModelAttribute CompanyMember m, String comCodeMem, String memType, String comName, String comAddress, Model model) {
		
		//암호회된 비밀번호
		String encPwd = bCryptPasswordEncoder.encode(m.getMemPw());
		m.setMemPw(encPwd);
		
		m.setMemStatus("Y");
		
		//회원과 관리자에 따라 구분 
		if(memType.equals("member")) {
			m.setAdmin("N");
			m.setComCode(comCodeMem);
			cms.insertCompanyMember(m);
		}else {
			m.setAdmin("Y");
			co.setComName(comName);
			co.setComAddress(comAddress);
			co.setComAdmin(m.getMemId());
			co.setSempNum("미정");
			
			//회사코드 만들기
			String first = comName.substring(0, 1);
			Date today = new Date ( );
			SimpleDateFormat formatter = new SimpleDateFormat ( "YYMMddHHmm", Locale.KOREA );
	        String time = formatter.format (today);
	        String comCode = first.concat(time);
	        
	        m.setComCode(comCode);
	        co.setComCode(comCode);
	        System.out.println("멤버 : " + m);
	        System.out.println("회사 : " + co);
			int result = cms.insertCompanyAdmin(m);
			if(result > 0) {
				cms.insertCompany(co);
			}
			
		}
		
		model.addAttribute("msg","회원가입이 완료되었습니다.");
        model.addAttribute("url","/");
	
        return "common/alert";	
	}
	
	@RequestMapping("loginMember.co")
	public String loginMember(CompanyMember m, Model model) {
		
		CompanyMember loginUser;

		loginUser = cms.loginMember(bCryptPasswordEncoder, m);
		
		//담당자면 세션에 회사명, 회사주소 담기
		if(loginUser.getAdmin().equals("Y")) {
			
			String comCode = loginUser.getComCode();
			co = cms.selectCompany(comCode);
			loginUser.setComName(co.getComName());
			loginUser.setComAddress(co.getComAddress());
		}
		model.addAttribute("loginUser", loginUser); 
		return "redirect:/"; 
	}
	
	@RequestMapping("logout.co")
	public String logoutMember(SessionStatus status) { 
		status.setComplete(); 
		return "redirect:/";
	}
	
	@RequestMapping("updateAdmin.co")
	public String updateAdmin(@ModelAttribute CompanyMember m, HttpSession session, Model model) {
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		
		if (bCryptPasswordEncoder.matches(m.getMemPw(), loginUser.getMemPw())) {
			
			//회원정보 업데이트
			cms.updateMember(m);	
			loginUser.setMemName(m.getMemName());
			loginUser.setMemPhone(m.getMemPhone());
			loginUser.setMemEmail(m.getMemEmail());
			
			
			//회사정보 업데이트
			co.setComCode(loginUser.getComCode());
			co.setComName(m.getComName());
			co.setComAddress(m.getComAddress());
			cms.updateCompany(co);
			loginUser.setComName(m.getComName());
			loginUser.setComAddress(m.getComAddress());
			
			model.addAttribute("msg","회원정보 변경에 성공하였습니다.");
	        model.addAttribute("url","/");
			
		}else {
			model.addAttribute("msg","비밀번호가 일치하지 않아 변경에 실패했습니다.");
	        model.addAttribute("url","/modifyAdmin.co");
		}
		return "common/alert";	
	}
	
	@RequestMapping("updateMember.co")
	public String updateMember(@ModelAttribute CompanyMember m, HttpSession session, Model model) {
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		
		if (bCryptPasswordEncoder.matches(m.getMemPw(), loginUser.getMemPw())) {
			cms.updateMember(m);	
			loginUser.setMemName(m.getMemName());
			loginUser.setMemPhone(m.getMemPhone());
			loginUser.setMemEmail(m.getMemEmail());
			
			model.addAttribute("msg","회원정보 변경에 성공하였습니다.");
	        model.addAttribute("url","/");
			
		}else {
			model.addAttribute("msg","비밀번호가 일치하지 않아 변경에 실패했습니다.");
	        model.addAttribute("url","/modifyMember.co");
		}
		return "common/alert";	
	}
	
	@RequestMapping("updatePw.co")
	public String updatePw(@ModelAttribute CompanyMember m, String originPw, String memPw, String memPwCheck, HttpSession session, Model model) {
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		
		if (bCryptPasswordEncoder.matches(originPw, loginUser.getMemPw())) {
			String encPw = bCryptPasswordEncoder.encode(memPw);
			m.setMemId(loginUser.getMemId());
			m.setMemPw(encPw);
			cms.updatePw(m);
			
			loginUser.setMemPw(encPw);
			
			model.addAttribute("msg","비밀번호 변경에 성공하였습니다.");
	        model.addAttribute("url","/");
	        
		}else {
			model.addAttribute("msg","비밀번호가 일치하지 않아 변경에 실패했습니다.");
	        model.addAttribute("url","/modifyPw.co");
		}
		return "common/alert";	
	}
	
	@RequestMapping("deleteMem.co")
	public String deleteMem(HttpSession session, Model model) {
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String memId = loginUser.getMemId();
		cms.deleteMem(memId);
		
		model.addAttribute("msg","탈퇴가 완료되었습니다.");
        model.addAttribute("url","/logout.co");
        
        return "common/alert";	
	}
	
	@RequestMapping("changingAdmin.co")
	public String changingAdmin(@ModelAttribute CompanyMember m, String originMemId, String memType, HttpSession session, Model model) {
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		
		//기존회원 담당자로 변경
		if(memType.equals("origin")) {
			
			//담당자로 변경
			cms.updateNewAdmin(originMemId, loginUser.getComCode());
			
			//기존 담당자 권한 회수
			String memId = loginUser.getMemId();
			cms.retireAdmin(memId);
			loginUser.setAdmin("N");
			
			//구독회사 테이블에 새로운 담당자로 변경
			cms.updateCompanyAdmin(originMemId, loginUser.getComCode());
			
		//새로운 회원 담당자로 변경 
		}else if(memType.equals("new")){
			
			//새로운 담당자로 추가
			m.setComCode(loginUser.getComCode());
			String encPwd = bCryptPasswordEncoder.encode(m.getMemPw());
			m.setMemPw(encPwd);
			m.setAdmin("Y");
			m.setMemStatus("Y");
			cms.insertNewAdmin(m);
			
			//기존 담당자 권한 회수
			String memId = loginUser.getMemId();
			cms.retireAdmin(memId);
			loginUser.setAdmin("N");
			
			//구독회사 테이블에 새로운 담당자로 변경
			String newMemId = m.getMemId();
			String comCode = m.getComCode();
			cms.updateCompanyAdmin(newMemId, comCode);
			
		}
		
		model.addAttribute("msg","담당자 변경이 완료되었습니다.");
        model.addAttribute("url","/");
		
		return "common/alert";	
	}
	
	@ResponseBody
	@RequestMapping("selectSubStatus.co")
	public String selectSubStatus(String memId) {
		
		String subStatus = "";
		
		//간식, 생일 구독의 상태 각각 확인
		String snackStatus = cms.selectSnackSubSta(memId);
		String birthStatus = cms.selectbirthSubSta(memId);
		
		//둘 중 하나라도 구독 중일 경우 Y 넘겨줌
		if(snackStatus.equals("Y") || birthStatus.equals("Y")) {
			subStatus = "Y";
		}else {
			subStatus = "N";
		}
		
		System.out.println("구독상태 : " + subStatus);
		return subStatus;
	}
	
	@RequestMapping("deleteAdmin.co")
	public String deleteAdmin(HttpSession session, Model model) {
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		
		String comCode = loginUser.getComCode();
		cms.deleteAllMem(comCode);
		
		model.addAttribute("msg","탈퇴가 완료되었습니다.");
        model.addAttribute("url","/logout.co");
		
		return "common/alert";	
	}
	
	@ResponseBody
	@RequestMapping("findMemPw.co")
	public String findPwPOST(@ModelAttribute CompanyMember m, String memId, String memName, String memPhone) {
		
		m.setMemId(memId);
		m.setMemName(memName);
		m.setMemPhone(memPhone);
		
		int result = cms.checkMember(m);
		
		this.memId = memId;
		
		return String.valueOf(result);
	}
	
	@RequestMapping("modifyNewPw.co")
	public String modifyNewPw(@ModelAttribute CompanyMember m, Model model) {
		
		// 임시 비밀번호 생성
		String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		
		//암호회된 비밀번호
		String encPwd = bCryptPasswordEncoder.encode(pw);
		
		m.setMemId(memId);
		m.setMemPw(encPwd);
		
		cms.updatePw(m);
		
		model.addAttribute("msg","임시 비밀번호는 " + pw + " 입니다.");
        model.addAttribute("url","/login.co");
		
		return "common/alert";	
	}
	
}

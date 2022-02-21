package com.kh.spring.companyEmp.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.companyEmp.model.service.CompanyEmpService;
import com.kh.spring.companyEmp.model.vo.CompanyEmp;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@SessionAttributes("loginUser")
@Controller
public class CompanyEmpController {
	
	@Autowired
	private CompanyEmpService ces;
	
	private String cempNum;

	@RequestMapping("empManage.em")
	public String empManage(Model model, HttpSession session) {
		
		//현재 로그인한 담당자의 회사코드를 들고가서 셀렉트
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String comCode = loginUser.getComCode();
		
		ArrayList <CompanyEmp> list = ces.selectEmpList(comCode);
		
		model.addAttribute("list", list);
		
		return "company/companyEmp/empList";
	}
	
	@RequestMapping("enrollEmp.em")
	public String enrollEmp() {
		return "company/companyEmp/enrollEmp";
	}
	
	@ResponseBody
	@RequestMapping("checkNum.em")
	public String checkNum(String cempNum, HttpSession session) {
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String comCode = loginUser.getComCode();
		
		int result = ces.checkNum(cempNum, comCode);
		
		return String.valueOf(result);
	}
	
	@RequestMapping("insertEmp.em")
	public String insertEmp(@ModelAttribute CompanyEmp ce, Model model, HttpSession session) {
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String comCode = loginUser.getComCode();
		
		ce.setComCode(comCode);
		ce.setCempStatus("Y");
		
		//생일 변환  String -> Date
		String birth = ce.getBirth();

		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
        
        SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");

        java.util.Date tempDate = null;
        
        try {
			tempDate = beforeFormat.parse(birth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        String transDate = afterFormat.format(tempDate);

        Date bDay = Date.valueOf(transDate);    
        
        ce.setCempBirth(bDay);
        
        ces.insertEmp(ce);
		
		model.addAttribute("msg","사원등록이 완료되었습니다.");
        model.addAttribute("url","/empManage.em");
        
		return "common/alert";
	}
	
	@ResponseBody
	@RequestMapping("modifyEmp.em")
	public String modifyEmp(String cempNum) {
		
		this.cempNum = cempNum;
		
		String result = "ok";
		return result;
	}

	@RequestMapping("modify.em")
	public String modify(Model model, HttpSession session) {
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String comCode = loginUser.getComCode();
		
		CompanyEmp ce = ces.selectEmp(cempNum, comCode);
		
		//생일값 8자리로 바꿔서 넘겨주는 작업
		String birth = String.valueOf(ce.getCempBirth());
		String temp [] = birth.split("-");
		String b = temp[0].concat(temp[1]);
		b = b.concat(temp[2]);
	
		ce.setBirth(b);
		
		model.addAttribute("cemp", ce);
		
		return "company/companyEmp/modifyEmp";
	}
	
	@RequestMapping("updateEmp.em")
	public String updateEmp(@ModelAttribute CompanyEmp ce, Model model, HttpSession session) {
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String comCode = loginUser.getComCode();
		
		ce.setComCode(comCode);
		
		//생일 변환  String -> Date
		String birth = ce.getBirth();

		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");
        
        SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");

        java.util.Date tempDate = null;
        
        try {
			tempDate = beforeFormat.parse(birth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        String transDate = afterFormat.format(tempDate);

        Date bDay = Date.valueOf(transDate);    
        
        ce.setCempBirth(bDay);
        
        ces.updateEmp(ce);
		
		model.addAttribute("msg","사원정보 변경이 완료되었습니다.");
        model.addAttribute("url","/empManage.em");
		
		return "common/alert";	
	}
	
	@ResponseBody
	@RequestMapping("deleteEmp.em")
	public String deleteEmp(String cempNum, HttpSession session) {
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String comCode = loginUser.getComCode();
		
		int result = ces.deleteEmp(cempNum, comCode);
		
		return String.valueOf(result);
	}
	
}

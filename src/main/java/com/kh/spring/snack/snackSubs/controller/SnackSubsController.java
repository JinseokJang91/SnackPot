package com.kh.spring.snack.snackSubs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.companyMember.model.vo.CompanyMember;
import com.kh.spring.snack.snackSubs.model.service.SnackSubsService;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;


@SessionAttributes("o")
@Controller
public class SnackSubsController {
	
	@Autowired
	private SnackSubsService snackSubsService;
	

	@RequestMapping("subsForm.sn")
	public String snackSubsForm(Model model) {
		
		/*categoryNo 1 -> 스낵, 2 -> 음료, 3 -> 간편식;*/
		
		model.addAttribute("snackCategory", snackSubsService.selectSubCategory(1));
		model.addAttribute("drinkCategory", snackSubsService.selectSubCategory(2));
		model.addAttribute("retortCategory", snackSubsService.selectSubCategory(3));
		model.addAttribute("flavour", snackSubsService.selectAroma());
		model.addAttribute("taste", snackSubsService.selectTaste());
		
		return "company/snack/snackSubsForm";
	}
	
	@ResponseBody
	@RequestMapping("checkSubsDup.sn")
	public int checkSubsDup(String comCode) {
		
		return snackSubsService.checkSubsDup(comCode);
	}
	
	@RequestMapping("insertSubs.sn")
	public String insertSnackSubs(SnackSubs snackSubs, HttpSession session) {
		
		snackSubsService.insertSnackSubs(snackSubs);
		
		session.setAttribute("m", "간식 구독이 성공적으로 완료되었습니다.");
		
		return "redirect:subsInfo.sn";
	}
	
	@RequestMapping("subsInfo.sn")
	public String snackSubsInfo(Model model, HttpSession session) {
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		
		model.addAttribute("snackCategory", snackSubsService.selectSubCategory(1));
		model.addAttribute("drinkCategory", snackSubsService.selectSubCategory(2));
		model.addAttribute("retortCategory", snackSubsService.selectSubCategory(3));
		model.addAttribute("flavour", snackSubsService.selectAroma());
		model.addAttribute("taste", snackSubsService.selectTaste());
		model.addAttribute("subs", snackSubsService.selectSubsInfo(comCode));
		
		return "company/snack/snackSubsInfo";
	}
	
	@RequestMapping("updateSubs.sn")
	public String updateSnackSubs(SnackSubs snackSubs, HttpSession session) {
		
		snackSubsService.updateSnackSubs(snackSubs);
		
		session.setAttribute("m", "간식 구독 내용이 수정되었습니다.");
		return "redirect:subsInfo.sn";
	}
	
	@RequestMapping("cancelSubs.sn")
	public String cancelSnackSubs(@RequestParam int subsNo, HttpSession session, SessionStatus sessionStatus) {
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		
		snackSubsService.cancelSnackSubs(subsNo, comCode);
		sessionStatus.setComplete();
		
		session.setAttribute("m", "간식 구독이 취소되었습니다.");
		return "company/snack/snackSubsInfo";
	}
	

	
}

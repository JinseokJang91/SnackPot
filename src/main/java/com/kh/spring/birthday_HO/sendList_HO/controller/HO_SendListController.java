package com.kh.spring.birthday_HO.sendList_HO.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.birthday_HO.sendList_HO.model.service.HO_SendListService;
import com.kh.spring.birthday_HO.sendList_HO.model.vo.HO_SendList;
import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

@Controller
public class HO_SendListController {

	@Autowired
	private HO_SendListService sendListService;
	
	@RequestMapping(value="sendingList.ho")
	public String selectList(Model model, HttpSession session) {
		
		String comCode = ((SnackpotEmp)session.getAttribute("loginEmp")).getSempComCode();
		//구독 정보 중복 체크
		int birthSubsChk = sendListService.subscribeChk(comCode);
	
		int sendingTime = selectSendingTime(comCode);
	
		if(sendingTime < 0) {
			model.addAttribute("msg", "생일 구독을 신청하지 않은 회사입니다.");
			model.addAttribute("url", "/mainPage.ho");
			
			return "common/alert";
		}else {
			ArrayList<HO_SendList> list = sendListService.selectSendingList(comCode);
	
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			int thisYear = cal.get(Calendar.YEAR);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			for(int i=0; i<list.size(); i++) {

				cal.setTime(list.get(i).getCempBirth());
				cal.add(Calendar.DATE, -sendingTime);
				
				list.get(i).setSendMsgDate(thisYear + (sdf.format(cal.getTime())).substring(4));
			
				String phone = (list.get(i).getCempPhone()).substring(0,3)
								+"-"+(list.get(i).getCempPhone()).substring(3,7)
								+"-"+(list.get(i).getCempPhone().substring(7,11));
				
				list.get(i).setCempPhone(phone);
			}
			
			model.addAttribute("birthSubsChk", birthSubsChk);
			model.addAttribute("list", list);
			
			return "headoffice/birthday_HO/sending_list_HO";
		}

	}
	
	private int selectSendingTime(String comCode) {
		
		String sendingTime = sendListService.selectSendingTime(comCode);
		
		int result = 0;
		
		if(sendingTime != null) {
			switch(sendingTime) {
			case "당일" :
				result = 0;
				break;
			case "3일전" :
				result = 3;
				break;
			case "5일전" :
				result = 5;
				break;
			}
		}else {
			result = -1;
		}
		
		return result;
	}
}

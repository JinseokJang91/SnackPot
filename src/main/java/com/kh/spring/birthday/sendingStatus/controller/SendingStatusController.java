package com.kh.spring.birthday.sendingStatus.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.birthday.giftList.model.vo.GiftList;
import com.kh.spring.birthday.sendingStatus.model.service.SendingStatusService;
import com.kh.spring.birthday.sendingStatus.model.vo.SendingStatus;
import com.kh.spring.birthday_HO.sendingStatus_HO.model.vo.HO_SendingStatus;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@Controller
public class SendingStatusController {

	@Autowired
	private SendingStatusService sendingStatusService;
	
	// *발송 현황 리스트
	@RequestMapping(value="sendingcursts.birth")
	public String sendingcursts(Model model, HttpSession session) {
		// 1. 구독 정보 존재여부 확인 - session에 담긴 loginUser객체의 회사 코드를 사용
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		
		int birthSubsChk = sendingStatusService.subscribeChk(comCode);
		
		int sendingTime = selectSendingTime(comCode);
		
		SendingStatus selectInfo = new SendingStatus();
		selectInfo.setSendingTime(sendingTime);
		selectInfo.setComCode(comCode);
		// 2. 구독 정보 데이터 list에 담기
		if(sendingTime < 0) {
			model.addAttribute("msg", "구독 정보가 존재하지 않습니다.");
			
			return "common/alert";
		}else {
			// 2-1. 데이터를 우선 list에 담는다.
			ArrayList<SendingStatus> list = sendingStatusService.sendingcursts(selectInfo);

			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			int thisYear = cal.get(Calendar.YEAR);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			for(int i=0; i<list.size(); i++) {
				// 2-2. 발송 날짜를 원하는 형식으로 출력
				cal.setTime(list.get(i).getCempBirth());
				cal.add(Calendar.DATE, -sendingTime);
				
				list.get(i).setSendingMsgDate(thisYear + (sdf.format(cal.getTime())).substring(4));
				// 2-3. 전화번호를 원하는 형식으로 출력
				String phone = (list.get(i).getCempPhone()).substring(0,3)+"-"
							  +(list.get(i).getCempPhone()).substring(3,7)+"-"
							  +(list.get(i).getCempPhone().substring(7,11));
				
				list.get(i).setCempPhone(phone);
			}

			
			
			model.addAttribute("birthSubsChk", birthSubsChk);
			model.addAttribute("list", list);
			
			return "company/birthday/sending_current_status";
		}

	}

	@ResponseBody
	@RequestMapping(value="completeCursts.birth")
	public ArrayList<SendingStatus> completeCursts(String comCode) {
		
		ArrayList<SendingStatus> list = new ArrayList<SendingStatus>();
		
		list = sendingStatusService.completeCursts(comCode);

		return list;
	}
	
	private int selectSendingTime(String comCode) {
		
		String sendingTime = sendingStatusService.selectSendingTime(comCode);
		
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
	
	@ResponseBody
	@RequestMapping(value="delSendSts.birth")
	public int deleteSendStatus(HttpServletRequest request) {
		
		String[] chkArr = request.getParameterValues("chkArr");
		
		int result = 0;
		int resultSum = 0;
		for(int i=0; i<chkArr.length; i++) {			
			result = sendingStatusService.deleteSendStatus(Integer.parseInt(chkArr[i]));
			resultSum += result;			
		}
		
		if(resultSum == chkArr.length) {
			return resultSum;
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="insSendSts.birth")
	public String insertSendStatus(SendingStatus s) {
		
		int result = sendingStatusService.insertSendStatus(s);
		
		int sendingTime = selectSendingTime(s.getComCode());
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int thisYear = cal.get(Calendar.YEAR);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		cal.setTime(s.getCempBirth());
		cal.add(Calendar.DATE, -sendingTime);
			
		s.setSendingMsgDate(thisYear + (sdf.format(cal.getTime())).substring(4));

		int result2 = sendingStatusService.insertSendStatus2(s);
		
		return String.valueOf(result + result2);
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectEmpOne.birth")
	public SendingStatus selectEmpOne(int cempSeq) {

		SendingStatus s = sendingStatusService.selectEmpOne(cempSeq);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		s.setCempBirthSdf(sdf.format(s.getCempBirth()));	
		
		return s;
		
	}
	
	@ResponseBody
	@RequestMapping(value="updSendSts.birth")
	public String updateSendStatus(SendingStatus s) {
		
		int result = sendingStatusService.updateSendStatus(s);
		
		return String.valueOf(result);
		
	}
}

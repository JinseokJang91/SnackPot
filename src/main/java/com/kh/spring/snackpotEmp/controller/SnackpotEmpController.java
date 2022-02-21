package com.kh.spring.snackpotEmp.controller;

import java.util.ArrayList;

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

import com.kh.spring.birthday.subscribe.model.vo.Birthday;
import com.kh.spring.company.model.vo.Company;
import com.kh.spring.companyEmp.model.service.CompanyEmpService;
import com.kh.spring.companyEmp.model.vo.CompanyEmp;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;
import com.kh.spring.snackpotEmp.model.service.SnackpotEmpService;
import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

@SessionAttributes("loginEmp")
@Controller
public class SnackpotEmpController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private SnackpotEmpService ses;
	
	@Autowired
	private CompanyEmpService ces;
	
	private Company co;
	private SnackSubs sSub;	
	private Birthday bSub;
	
	private int sempNum;
	private String sempComName;
	private String comCode;
	private String comName;
	
	@RequestMapping("login.sn")
	public String modifyAdmin() {
		return "headoffice/snackpotEmp/loginEmp";
	}
	
	@RequestMapping("enrollEmp.sn")
	public String enrollEmp() {
		return "headoffice/snackpotEmp/enrollEmp";
	}
	
	@RequestMapping("empList.sn")
	public String empList(Model model) {
		
		ArrayList <SnackpotEmp> list = ses.selectEmpList();
	
		model.addAttribute("list", list);
		
		return "headoffice/snackpotEmp/empList";
	}
	
	@RequestMapping("loginEmp.sn")
	public String loginEmp(@ModelAttribute SnackpotEmp se, Model model) {
		
		String encPwd = bCryptPasswordEncoder.encode(se.getSempPw());
		System.out.println("암호화 : " + encPwd);
		
		SnackpotEmp loginEmp = ses.loginEmp(bCryptPasswordEncoder, se);
		
		
		
		model.addAttribute("loginEmp", loginEmp);
		
		return "redirect:/mainPage.ho";
	}
	
	@RequestMapping("insertEmp.sn")
	public String insertEmp(@ModelAttribute SnackpotEmp se, Model model) {
		
		//암호회된 비밀번호
		String encPwd = bCryptPasswordEncoder.encode(se.getSempPw());
		se.setSempPw(encPwd);
		
		se.setSempStatus("Y");
		ses.insertEmp(se);
		
		model.addAttribute("msg","사원등록이 완료되었습니다.");
        model.addAttribute("url","/empList.sn");
        
		return "common/alert";
	}
	
	@ResponseBody
	@RequestMapping("checkNum.sn")
	public String checkNum(String sempNum) {
		
		int result = ses.checkNum(sempNum);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("modifyEmp.sn")
	public String modifyEmp(int sempNum) {
		
		this.sempNum = sempNum;
		
		String result = "ok";
		return result;
	}

	@RequestMapping("modify.sn")
	public String modify(Model model) {
		
		SnackpotEmp se = ses.selectEmp(sempNum);
		
		model.addAttribute("semp", se);
		
		return "headoffice/snackpotEmp/modifyEmp";
	}
	
	@RequestMapping("updateEmp.sn")
	public String updateEmp(@ModelAttribute SnackpotEmp se, Model model) {
		
		ses.updateEmp(se);
		
		model.addAttribute("msg","사원정보 변경이 완료되었습니다.");
        model.addAttribute("url","/empList.sn");
		
		return "common/alert";	
	}
	
	@ResponseBody
	@RequestMapping("deleteEmp.sn")
	public String deleteEmp(String sempNum) {
		
		int result = ses.deleteEmp(sempNum);
		
		return String.valueOf(result);
	}
	
	@RequestMapping("logout.sn")
	public String logoutMember(SessionStatus status) { 
		status.setComplete(); 
		return "redirect:/login.sn";
	}
	
	@RequestMapping("empCompanyList.sn")
	public String empCompanyList(Model model) {
		
		ArrayList <SnackpotEmp> list = ses.selectEmpList();
		
		ArrayList<SnackpotEmp> empComList = new ArrayList<SnackpotEmp>();
		
		String[] sempComCode = new String[list.size()];
		
		String comCode = "";
		
		String encCode = "";
		
		for(int i=0; i<list.size(); i++) {
			
			//본사직원 객체 생성해서 리스트 값들 담아주기
			SnackpotEmp se = list.get(i);
			
			//객체에서 담당회사코드만 꺼내서 따로 선언해준 스트링 배열에 담기
			sempComCode[i] = se.getSempComCode();
			
			//해당 열 사원의 담당회사코드 가져오기
			comCode = sempComCode[i];
			
			//"/" 문자 포함이면 여러 회사를 담당하고 있는 사원
			if(comCode.contains("/")) {
				
				//"/" 구분자로 코드들을 새로운 배열에 담기
				String codes[] = comCode.split("/");
				for(int x=0; x<codes.length; x++) {
					//한글변환코드 변수에 각 코드들의 회사명 담아주기
					encCode = ses.searchComCode(codes[x]);
					
					if(x == codes.length-1) {
						sempComCode[i] += encCode;
					}else if(x == 0){
						sempComCode[i] = encCode + ", ";
					}else {
						sempComCode[i] += encCode + ", ";
					}
					
				}
				
			//미정이라면 아무 회사도 담당하고 있지 않은 사원	
			}else if(comCode.equals("미정")){
				sempComCode[i] = comCode;
				
			//그 외 -> 한 회사만 담당하고 있는 사원	
			}else {
				encCode = ses.searchComCode(comCode);
				sempComCode[i] = encCode;
			}
			
			se.setSempComCode(sempComCode[i]);
			
			//바꾼 회사코드를 담은 객체를 새로운 어레이리스트 이식
			empComList.add(se);
			
		}
		
		model.addAttribute("list", empComList);
		
		return "headoffice/snackpotEmp/empCompanyList";
	}
	
	@ResponseBody
	@RequestMapping("modifyCom.sn")
	public String modifyCom(int sempNum, String sempComName) {
		
		this.sempNum = sempNum;
		this.sempComName = sempComName;
		
		String result = "ok";
		return result;
	}
	
	@RequestMapping("modifyCompany.sn")
	public String modifyCompany(Model model) {
		
		//구독이 활성화된 모든 회사 
		ArrayList <Company> list = ses.selectCompanyList();
		SnackpotEmp se = ses.selectEmp(sempNum);
		ArrayList <Company> comList = new ArrayList<Company>();
		
		//사원번호를 이름으로 바꿔서 넘겨주기
		String[] sempNum = new String[list.size()];
		String num = "";
		String sempName = "";
		
		for(int i=0; i<list.size(); i++) {
			
			co = list.get(i);
			
			if(!co.getSempNum().equals("미정")) {
				sempNum[i] = co.getSempNum();
			}
			
			num = sempNum[i];
			
			sempName = ses.searchSempName(num);
			
			co.setSempNum(sempName);
			
			comList.add(co);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("semp", se);
		model.addAttribute("sempComName", sempComName);
		
		return "headoffice/snackpotEmp/modifyCompany";
	}
	
	@ResponseBody
	@RequestMapping("updateCompany.sn")
	public String updateCompany(String comName, String sempNum) {
		
		//검색결과
		String searchYn = "";
		String comCode = "";
		//코드 중복 체크용 변수
		String check = "";
		//중복 코드 제거용 변수
		String newCode = "";
		
		
		//회사명으로 회사 존재 여부 찾기 (여러 개일 경우 자르기)
		//1. 회사가 여러 개일 경우
		if(comName.contains(",")) {
			
			//"," 구분자로 회사명을 새로운 배열에 담기
			String name[] = comName.split(",");
			for(int i=0; i<name.length; i++) {
				//회사가 존재하는지 서치 
				name[i] = name[i].replace(" ", "");
				co = ses.searchComName(name[i]);
				
				//존재한다면 comCode 변수에 구분자를 넣어 담아주기
				if(co != null) {
					
					//업데이트 해주기 전에, 먼저 업데이트할 코드를 갖고 있는 직원이 있는지 체크
					check = "%" + co.getComCode() + "%";
					ArrayList <SnackpotEmp> sempList = ses.selectComCodeCheck(check);
					
					for(int y=0; y<sempList.size(); y++) {

					//조회한 직원의 사번이 바꿀 직원이랑 같으면 패스, 같지 않으면 지워줘야함
					if(sempList.get(y).getSempNum() != Integer.parseInt(sempNum)) {
						
						String sempComCode = sempList.get(y).getSempComCode();
						
						//코드가 있을 4가지의 경우
//						String code1 = co.getComCode();
						String code2 = co.getComCode() + "/";
						String code3 = "/" + co.getComCode();
						String code4 = "/" + co.getComCode() + "/";
						
						//코드가 여러개인 경우
						if(sempComCode.contains("/")) {
							
							//사이에 있는 경우
							if(sempComCode.contains(code4)) {
								newCode = sempComCode.replace(code2, "");
							}else {
								//맨 앞에 있는 경우
								if(sempComCode.contains(code2)) {
									newCode = sempComCode.replace(code2, "");
								//맨 뒤에 있는 경우	
								}else if(sempComCode.contains(code3)) {
									newCode = sempComCode.replace(code3, "");
								}	
							}
							
							//없애준 코드 넣어주기
							sempList.get(y).setSempComCode(newCode);
							
							//기존 직원의 회사 지워주기
							ses.deleteSempComCode(sempList.get(y));
							
							//코드가 1개인 경우
							}else if(!sempComCode.contains("/")){
							
								sempList.get(y).setSempComCode("미정");
								
								//기존 직원의 회사 지워주기
								ses.deleteSempComCode(sempList.get(y));
							
							}
						
					}
				}
					
					if(i == name.length-1) {
					comCode += co.getComCode();
					}else if(i == 0){
						comCode = co.getComCode() + "/";
					}else {
						comCode += co.getComCode() + "/";
					}
					
				}else {
					//둘 중 하나라도 없으면 null
					comCode = null;
				}
				
			}
			
			//회사가 존재한다면
			if(comCode != null) {
				
				//해당 직원의 sempComCode에 추가 
				int result = ses.updateCompany(comCode, sempNum);
				
				//구독회사 테이블 업데이트
				if(result > 0) {
					
					//기존 회사는 null로 업데이트를 먼저 해줘야함
						//sempNum으로 해당 사원이 맡고있던 기존 회사들 찾기 (여러 개일수도 있으니 리스트 사용)
						ArrayList <Company> comList = ses.selectOriginCom(sempNum);
						
						//null로 업데이트
						for(int x=0; x<comList.size(); x++) {
							System.out.println("널업데이트 : " + comList.get(x).getComCode());
							ses.updateComNull(comList.get(x).getComCode());
						}
					
					for(int i=0; i<name.length; i++) {
						
						//이제 새로 입력한 회사로 추가
						ses.updateSempNum(name[i], sempNum);
						
					}
					
					searchYn = "Y";
				}
			
			}
			
		// 2. 회사가 1개일 경우 	
		}else {
			co = ses.searchComName(comName);
			
			//회사가 존재한다면
			if(co != null) {
				
				//직원 테이블에 수정한 회사 업데이트
				int result = ses.updateCompany(co.getComCode(), sempNum);
				
				//구독회사 테이블 업데이트 
				if(result > 0) {
					
					ArrayList <Company> comList = ses.selectOriginCom(sempNum);
					
					//null로 업데이트
					for(int x=0; x<comList.size(); x++) {
						ses.updateComNull(comList.get(x).getComCode());
					}
					
					//새로 입력한 회사 추가 
					ses.updateSempNum(co.getComName(), sempNum);
					
					searchYn = "Y";
				}
				
				//기존 직원 테이블 회사는 지우기
				//수정할 회사를 담당하고 있는 직원이 있는지 조회
				check = "%" + co.getComCode() + "%";
				ArrayList <SnackpotEmp> sempList = ses.selectComCodeCheck(check);
				
				for(int y=0; y<sempList.size(); y++) {

				//조회한 직원의 사번이 바꿀 직원이랑 같으면 패스, 같지 않으면 지워줘야함
				if(sempList.get(y).getSempNum() != Integer.parseInt(sempNum)) {
					
					String sempComCode = sempList.get(y).getSempComCode();
					
					//코드가 있을 4가지의 경우
//					String code1 = co.getComCode();
					String code2 = co.getComCode() + "/";
					String code3 = "/" + co.getComCode();
					String code4 = "/" + co.getComCode() + "/";
					
					//코드가 여러개인 경우
					if(sempComCode.contains("/")) {
						
						//사이에 있는 경우
						if(sempComCode.contains(code4)) {
							newCode = sempComCode.replace(code2, "");
						}else {
							//맨 앞에 있는 경우
							if(sempComCode.contains(code2)) {
								newCode = sempComCode.replace(code2, "");
							//맨 뒤에 있는 경우	
							}else if(sempComCode.contains(code3)) {
								newCode = sempComCode.replace(code3, "");
							}	
						}
						
						//없애준 코드 넣어주기
						sempList.get(y).setSempComCode(newCode);
						
						//기존 직원의 회사 지워주기
						ses.deleteSempComCode(sempList.get(y));
						
						//코드가 1개인 경우
						}else if(!sempComCode.contains("/")){
						
							sempList.get(y).setSempComCode("미정");
							
							//기존 직원의 회사 지워주기
							ses.deleteSempComCode(sempList.get(y));
						
						}
					
					}
				}
			
			}
		}
		
		return searchYn;
	}
	
	@RequestMapping("modifyPw.sn")
	public String modifyPw() {
		return "headoffice/snackpotEmp/modifyPw";
	}
	
	@RequestMapping("updatePw.sn")
	public String updatePw(String originPw, String sempPw, String sempPwcheck, HttpSession session, Model model) {
		
		SnackpotEmp se = new SnackpotEmp(); 
		SnackpotEmp loginEmp = (SnackpotEmp) session.getAttribute("loginEmp");
		
			if(bCryptPasswordEncoder.matches(originPw, loginEmp.getSempPw())) {
				String encPw = bCryptPasswordEncoder.encode(sempPw);
				se.setSempNum(loginEmp.getSempNum());
				se.setSempPw(encPw);
				ses.updatePw(se);
				
				loginEmp.setSempPw(encPw);
				
				model.addAttribute("msg","비밀번호 변경에 성공하였습니다.");
		        model.addAttribute("url","/mainPage.ho");
		        
			}else {
				model.addAttribute("msg","비밀번호가 일치하지 않아 변경에 실패했습니다.");
		        model.addAttribute("url","/modifyPw.sn");	
				
			}
			
		return "common/alert";
	}
	
	@RequestMapping("companyList.sn")
	public String companyList(HttpSession session, Model model) {
		
		SnackpotEmp loginEmp = (SnackpotEmp) session.getAttribute("loginEmp");
		String comCode = loginEmp.getSempComCode();
		ArrayList <Company> list = new ArrayList<Company>();
		
		//"/" 문자 포함이면 여러 회사를 담당하고 있는 사원
		if(comCode.contains("/")) {
			
			//"/" 구분자로 코드들을 새로운 배열에 담기
			String codes[] = comCode.split("/");
			for(int i=0; i<codes.length; i++) {
				//회사코드로 company 정보 가져오기
				Company co = ses.selectSempCompany(codes[i]);
				list.add(co);
			}
			
		//미정이라면 아무 회사도 담당하고 있지 않은 사원	
		}else if(comCode.equals("미정")){
			
		//그 외 -> 한 회사만 담당하고 있는 사원	
		}else {
			Company co = ses.selectSempCompany(comCode);
			list.add(co);
		}
		
		model.addAttribute("list", list);
		
		return "headoffice/snackpotEmp/companyList";
	}
	
	@ResponseBody
	@RequestMapping("searchCompany.sn")
	public String searchCompany(String comCode, String comName) {
		
		this.comCode = comCode;
		this.comName = comName;
		
		String result = "ok";
		return result;
	}
	
	@ResponseBody
	@RequestMapping("searchEmp.sn")
	public String searchEmp(String comCode, String comName) {
		
		this.comCode = comCode;
		this.comName = comName;
		
		String result = "ok";
		return result;
	}
	
	@RequestMapping("selectCompany.sn")
	public String selectCompany(Model model) {
		
		//회사코드로 해당 회사의 간식구독 정보 객체 받아오기 
		sSub = ses.selectSnackSub(comCode);
		
		//회사코드로 해당 회사의 생일구독 정보 객체 받아오기 
		bSub = ses.selectBirthSub(comCode);
		
		System.out.println("간식구독 : " +  sSub);
		System.out.println("생일구독 : " +  bSub);
		
		String setSDate = "";
		String setBDate = "";
		SnackSubs changeKor = new SnackSubs();
		
		if(sSub != null && bSub != null) {
			if(sSub.getSubsStatus().equals("N") && bSub.getBservice_status().equals("Y")) {
			sSub = null;
			 setBDate = String.valueOf(bSub.getSettlement_date()).substring(8,10);
			}else if(bSub.getBservice_status().equals("N") && sSub.getSubsStatus().equals("Y")) {
				bSub = null;
				 setSDate = String.valueOf(sSub.getSettleDate()).substring(8,10);
				 changeKor = changeKor(sSub);
			}else if(sSub.getSubsStatus().equals("Y") && bSub.getBservice_status().equals("Y")) {
				 setSDate = String.valueOf(sSub.getSettleDate()).substring(8,10);
				 setBDate = String.valueOf(bSub.getSettlement_date()).substring(8,10);	
				 changeKor = changeKor(sSub);
			}else {
				sSub = null;
				bSub = null;
			}
		}else if(sSub != null && bSub == null) {
			setSDate = String.valueOf(sSub.getSettleDate()).substring(8,10);	
			changeKor = changeKor(sSub);
		}else if(sSub == null && bSub != null) {
			setBDate = String.valueOf(bSub.getSettlement_date()).substring(8,10);
		}
		
		model.addAttribute("changeKor", changeKor);
		model.addAttribute("setSDate", setSDate);
		model.addAttribute("setBDate", setBDate);
		model.addAttribute("sSub", sSub);
		model.addAttribute("bSub", bSub);
		model.addAttribute("comName", comName);
		
		return "headoffice/snackpotEmp/subCompanyList";
	}
	
	public SnackSubs changeKor(SnackSubs sSub) {
		
		String sc = "";
		String dc = "";
		String rc = "";
		String pt = "";
		String df = "";
		 
		//스낵
		//여러 개일 때
		if(sSub.getSnackCategory().contains(",")) {
			String temp [] = sSub.getSnackCategory().split(",");
		
			for(int i=0; i<temp.length; i++) {
				
				switch(temp[i]) {
				case "1": temp[i] = "스낵"; 
				break;
				case "2": temp[i] = "파이 및 비스킷"; 
				break;
				case "3": temp[i] = "초콜릿"; 
				break;
				case "4": temp[i] = "캔디"; 
				break;
				case "5": temp[i] = "젤리"; 
				break;
				case "6": temp[i] = "껌"; 
				break;
				case "7": temp[i] = "시리얼바"; 
				break;
				}
				
				if(i == temp.length-1) {
					sc += temp [i];
				}else if(i == 0){
					sc += temp [i] + ", ";
				}else {
					sc += temp [i] + ", ";
				}
			}
			
			sSub.setSnackCategory(sc);
			
		//한 개일 때	
		}else {
			
			switch(sSub.getSnackCategory()) {
			case "1": sSub.setSnackCategory("스낵");
			break;
			case "2": sSub.setSnackCategory("파이 및 비스킷"); 
			break;
			case "3": sSub.setSnackCategory("초콜릿");  
			break;
			case "4": sSub.setSnackCategory("캔디"); 
			break;
			case "5": sSub.setSnackCategory("젤리"); 
			break;
			case "6": sSub.setSnackCategory("껌"); 
			break;
			case "7": sSub.setSnackCategory("시리얼바"); 
			break;
			}
		}
		
		//음료
		//여러 개일 때
		if(sSub.getDrinkCategory().contains(",")) {
			String temp [] = sSub.getDrinkCategory().split(",");
		
			for(int i=0; i<temp.length; i++) {
				
				switch(temp[i]) {
				case "8": temp[i] = "탄산음료"; 
				break;
				case "9": temp[i] = "이옴음료"; 
				break;
				case "10": temp[i] = "과일음료"; 
				break;
				case "11": temp[i] = "에너지음료"; 
				break;
				case "12": temp[i] = "유산균음료"; 
				break;
				case "13": temp[i] = "커피"; 
				break;
				}
				
				if(i == temp.length-1) {
					dc += temp [i];
				}else if(i == 0){
					dc += temp [i] + ", ";
				}else {
					dc += temp [i] + ", ";
				}
			}
			
			sSub.setDrinkCategory(dc);
			
		//한 개일 때	
		}else {
			
			switch(sSub.getDrinkCategory()) {
			case "8": sSub.setDrinkCategory("탄산음료");
			break;
			case "9": sSub.setDrinkCategory("이옴음료"); 
			break;
			case "10": sSub.setDrinkCategory("과일음료");  
			break;
			case "11": sSub.setDrinkCategory("에너지음료"); 
			break;
			case "12": sSub.setDrinkCategory("유산균음료"); 
			break;
			case "13": sSub.setDrinkCategory("커피"); 
			break;
			}
		}
	

		//음료
		//여러 개일 때
		if(sSub.getRetortCategory().contains(",")) {
			String temp [] = sSub.getRetortCategory().split(",");
		
			for(int i=0; i<temp.length; i++) {
				
				switch(temp[i]) {
				case "14": temp[i] = "컵라면"; 
				break;
				case "15": temp[i] = "핫도그 및 소시지"; 
				break;
				case "16": temp[i] = "계란"; 
				break;
				case "17": temp[i] = "시리얼"; 
				break;
				case "18": temp[i] = "컵밥"; 
				break;
				}
				
				if(i == temp.length-1) {
					rc += temp [i];
				}else if(i == 0){
					rc += temp [i] + ", ";
				}else {
					rc += temp [i] + ", ";
				}
			}
			
			sSub.setRetortCategory(rc);
			
		//한 개일 때	
		}else {
			
			switch(sSub.getRetortCategory()) {
			case "14": sSub.setRetortCategory("탄산음료");
			break;
			case "15": sSub.setRetortCategory("이옴음료"); 
			break;
			case "16": sSub.setRetortCategory("과일음료");  
			break;
			case "17": sSub.setRetortCategory("에너지음료"); 
			break;
			case "18": sSub.setRetortCategory("유산균음료"); 
			break;
			}
		}

		//선호하는 맛
		//여러 개일 때
		if(sSub.getPreferTaste().contains(",")) {
			String temp [] = sSub.getPreferTaste().split(",");
		
			for(int i=0; i<temp.length; i++) {
				
				switch(temp[i]) {
				case "1": temp[i] = "달콤"; 
				break;
				case "2": temp[i] = "짭잘"; 
				break;
				case "3": temp[i] = "담백"; 
				break;
				case "4": temp[i] = "고소"; 
				break;
				case "5": temp[i] = "새콤"; 
				break;
				case "6": temp[i] = "매콤"; 
				break;
				}
				
				if(i == temp.length-1) {
					pt += temp [i];
				}else if(i == 0){
					pt += temp [i] + ", ";
				}else {
					pt += temp [i] + ", ";
				}
			}
			
			sSub.setPreferTaste(pt);
			
		//한 개일 때	
		}else {
			
			switch(sSub.getPreferTaste()) {
			case "1": sSub.setPreferTaste("달콤");
			break;
			case "2": sSub.setPreferTaste("짭잘"); 
			break;
			case "3": sSub.setPreferTaste("담백");  
			break;
			case "4": sSub.setPreferTaste("고소"); 
			break;
			case "5": sSub.setPreferTaste("새콤"); 
			break;
			case "6": sSub.setPreferTaste("매콤"); 
			break;
			}
		}
		
		//싫어하는 향
		//여러 개일 때
		if(sSub.getDislikeFlavour().contains(",")) {
			String temp [] = sSub.getDislikeFlavour().split(",");
		
			for(int i=0; i<temp.length; i++) {
				
				switch(temp[i]) {
				case "1": temp[i] = "꿀"; 
				break;
				case "2": temp[i] = "녹차"; 
				break;
				case "3": temp[i] = "커피"; 
				break;
				case "4": temp[i] = "초코"; 
				break;
				case "5": temp[i] = "바닐라"; 
				break;
				case "6": temp[i] = "요거트"; 
				break;
				case "7": temp[i] = "치즈"; 
				break;
				case "8": temp[i] = "감자"; 
				break;
				case "9": temp[i] = "고구마"; 
				break;
				case "10": temp[i] = "곡물"; 
				break;
				case "11": temp[i] = "와사비"; 
				break;
				case "12": temp[i] = "양파"; 
				break;
				case "13": temp[i] = "해물"; 
				break;
				}
				
				if(i == temp.length-1) {
					df += temp [i];
				}else if(i == 0){
					df += temp [i] + ", ";
				}else {
					df += temp [i] + ", ";
				}
			}
			
			sSub.setDislikeFlavour(df);
			
		//한 개일 때	
		}else {
			
			switch(sSub.getDislikeFlavour()) {
			case "1": sSub.setDislikeFlavour("꿀");
			break;
			case "2": sSub.setDislikeFlavour("녹차"); 
			break;
			case "3": sSub.setDislikeFlavour("커피");  
			break;
			case "4": sSub.setDislikeFlavour("초코"); 
			break;
			case "5": sSub.setDislikeFlavour("바닐라"); 
			break;
			case "6": sSub.setDislikeFlavour("요거트"); 
			break;
			case "7": sSub.setDislikeFlavour("치즈");
			break;
			case "8": sSub.setDislikeFlavour("감자"); 
			break;
			case "9": sSub.setDislikeFlavour("고구마");  
			break;
			case "10": sSub.setDislikeFlavour("곡물"); 
			break;
			case "11": sSub.setDislikeFlavour("와사비"); 
			break;
			case "12": sSub.setDislikeFlavour("양파"); 
			break;
			case "13": sSub.setDislikeFlavour("해물"); 
			break;
			}
		}
		
		return sSub;
	}
	
	@RequestMapping("selectEmp.sn")
	public String selectEmp(Model model) {
		
		ArrayList <CompanyEmp> list = ces.selectEmpList(comCode);
		
		model.addAttribute("list", list);
		model.addAttribute("comName", comName);
		
		return "headoffice/snackpotEmp/subEmpList";
	}
	
	@RequestMapping("findPw.sn")
	public String findPw() {
		
		return "headoffice/snackpotEmp/findPw";
	}
	
	@ResponseBody
	@RequestMapping("findPwSelect.sn")
	public String findIdSelect(int sempNum, String sempName, String sempEmail) {
		
		int result = ses.findPw(sempNum, sempName, sempEmail);
		this.sempNum = sempNum;
		
		return String.valueOf(result);
	}
	
	@RequestMapping("modifyNewPw.sn")
	public String modifyNewPw(@ModelAttribute SnackpotEmp se, Model model) {
		
		// 임시 비밀번호 생성
		String pw = "";
		for (int i = 0; i < 7; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		
		//암호회된 비밀번호
		String encPwd = bCryptPasswordEncoder.encode(pw);
		
		se.setSempNum(sempNum);
		se.setSempPw(encPwd);
		ses.updatePw(se);
		
		model.addAttribute("msg","임시 비밀번호는 " + pw + " 입니다.");
        model.addAttribute("url","/login.sn");
		
		return "common/alert";	
	}
}


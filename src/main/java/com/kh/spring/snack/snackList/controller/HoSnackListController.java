package com.kh.spring.snack.snackList.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.SnackSubCategory;
import com.kh.spring.product.model.vo.WishListDtail;
import com.kh.spring.snack.snackList.model.service.HoSnackListService;
import com.kh.spring.snack.snackList.model.vo.ComListInfo;
import com.kh.spring.snack.snackList.model.vo.SearchList;
import com.kh.spring.snack.snackList.model.vo.SearchSnack;
import com.kh.spring.snack.snackList.model.vo.SnackDList;
import com.kh.spring.snack.snackList.model.vo.SnackList;
import com.kh.spring.snack.snackSubs.model.service.SnackSubsService;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;
import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

@Controller
public class HoSnackListController {
	
	@Autowired
	private HoSnackListService hoSnackListService;
	
	@Autowired
	private SnackSubsService snackSubsService;
	
	@RequestMapping("listSchedule.sn")
	public String listScheduleForm(Model model, HttpSession session) {
	
		//세션에서 로그인 사원의 담당 회사 코드 불러오기
		String comCode = ((SnackpotEmp)session.getAttribute("loginEmp")).getSempComCode();
		
		model.addAttribute("schedule", companyInfo(comCode));
		
		return "headoffice/snack/snackListSchedule";
	}
	
	@RequestMapping("createListForm.sn")
	public String createSnackListForm(String comCode, ComListInfo info, Model model) {
		
		//회사 정보 객체 만들어 불러오기 : 회사명, 주문 마감일, 예산, 총 금액, 리스트 번호
		
		//리스트 생성 여부 확인, 발송 여부에 N이 있으면 추가 X 기존 리스트No 불러오기, N이 없으면 insert
		int listNo = selectSnackListNo(comCode);
		ArrayList<SnackDList> dList = null;
		
		if(listNo > 0) {
			dList = selectSnackDList(listNo);
		}else {
			hoSnackListService.insertSanckList(comCode);
			listNo = selectSnackListNo(comCode);
		}
		
		info.setListNo(listNo);
		info.setTotalPrice(selectTotalPrice(listNo));
		
		model.addAttribute("dList", dList);
		model.addAttribute("i", info);
		
		return "headoffice/snack/createSnackList";
	}
	
	@RequestMapping("createList.sn")
	public String createList(String comCode, int listNo, int defaultAmount, Model model){
		
		deleteSnackDList(listNo);
		insertSnackDList(comCode, listNo, defaultAmount);
		
		ComListInfo info = companyInfo(comCode).get(0);
		info.setTotalPrice(selectTotalPrice(listNo));
		info.setListNo(listNo);
		
		model.addAttribute("i", info);
		model.addAttribute("dList", selectSnackDList(listNo));
		
		return "headoffice/snack/createSnackList";
	
	}
	
	//검색 카테고리 불러오는 메소드
	@ResponseBody
	@RequestMapping(value="selectSubCate.sn" , produces="application/json; charset=utf-8")
	public ArrayList<SnackSubCategory> selectSubCategory(@RequestParam int cNo) {
		
		ArrayList<SnackSubCategory> category = snackSubsService.selectSubCategory(cNo);
		
		return category;
	}
	
	//검색 결과 리스트 반환 메소드
	@RequestMapping("searchSnack.sn")
	public String searchSnack(String comCode, int listNo, SearchSnack search, Model model) {
		
		ArrayList<Product> searchList = hoSnackListService.searchSnack(search);
		
		ComListInfo info = companyInfo(comCode).get(0);
		info.setTotalPrice(selectTotalPrice(listNo));
		info.setListNo(listNo);
		
		model.addAttribute("i", info);
		model.addAttribute("dList", selectSnackDList(listNo));
		model.addAttribute("searchList", searchList);
		
		return "headoffice/snack/createSnackList";
	}
	
	@RequestMapping("deleteSnackDNo.sn")
	public String deleteSnackDNo(String comCode, int listNo, String snackDNoCheck, Model model) {
		
		hoSnackListService.deleteSnackDNo(snackDNoCheck);
		
		ComListInfo info = companyInfo(comCode).get(0);
		info.setTotalPrice(selectTotalPrice(listNo));
		info.setListNo(listNo);
		
		model.addAttribute("dList", selectSnackDList(listNo));
		model.addAttribute("i", info);
		
		return "headoffice/snack/createSnackList";
	}
	
	@RequestMapping("addDList.sn")
	public String addSanckDList(String comCode, SnackDList snackD, Model model) {
		
		hoSnackListService.addSanckDList(snackD);
		int listNo = snackD.getSnackListNo();
		
		ComListInfo info = companyInfo(comCode).get(0);
		info.setTotalPrice(selectTotalPrice(listNo));
		info.setListNo(listNo);
		
		model.addAttribute("dList", selectSnackDList(listNo));
		model.addAttribute("i", info);
		
		return "headoffice/snack/createSnackList";
	}
	
	
	@ResponseBody
	@RequestMapping(value="checkSnackDup.sn", produces="application/json; charset=utf-8")
	public int checkSnackDup(int listNo, int snackNo) {
		
		SnackDList sncakD = new SnackDList();
		sncakD.setSnackListNo(listNo);
		sncakD.setSnackNo(snackNo);
		
		return hoSnackListService.checkSnackDup(sncakD);
	}
	
	
	@RequestMapping("updateSnackAmount.sn")
	public String updateSnackAmount(String comCode, int listNo, SnackDList snackD, Model model) {
		
		hoSnackListService.updateSnackAmount(snackD);
		
		ComListInfo info = companyInfo(comCode).get(0);
		info.setTotalPrice(selectTotalPrice(listNo));
		info.setListNo(listNo);
		
		model.addAttribute("dList", selectSnackDList(listNo));
		model.addAttribute("i", info);
		
		return "headoffice/snack/createSnackList";
	}
	
	@ResponseBody
	@RequestMapping(value="selectWishList.sn", produces="application/json; charset=utf-8")
	public ArrayList<WishListDtail> selectWishList(String comCode) {
		
		ComListInfo info = companyInfo(comCode).get(0);
		
		ArrayList<WishListDtail> wishList = hoSnackListService.selectWishList(info);
		
		return wishList;
	}
	
	@RequestMapping("sendSnackList.sn")
	public String sendSnackList(ComListInfo info, Model model, HttpSession session) {
		
		info.setOrderNo(hoSnackListService.selectOrderNo());
		
		hoSnackListService.insertOrder(info);
		
		session.setAttribute("m", "간식 리스트 발송이 완료되었습니다.");
		return "redirect:/listSchedule.sn";
	}
	
	@RequestMapping("sendingList.sn")
	public String snackSendingList(@RequestParam(value="currentPage", required = false , defaultValue = "1") int currentPage, Model model, HttpSession session) {
		
		String comCode = ((SnackpotEmp)session.getAttribute("loginEmp")).getSempComCode();
		
		HashMap map = new HashMap();
		String[] comArr = comCode.split("/");
		map.put("comArr", comArr);
		
		int listCount = hoSnackListService.selectListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<SnackList> list =  hoSnackListService.selectSendingList(map, pi);
		
		model.addAttribute("sendingList", list);
		model.addAttribute("pi", pi);
		
		return "headoffice/snack/snackSendingList";
	}
	
	@RequestMapping("sendingDetail.sn")
	public String snackSendingDetail(int snackListNo, Model model) {
		
		SnackList sList = hoSnackListService.selectSnackList(snackListNo);
		
		
		model.addAttribute("sList", sList);
		model.addAttribute("dList", selectSnackDList(snackListNo));
		
		return "headoffice/snack/snackSendingDetail";
	}
	
	@RequestMapping("searchList.sn")
	public String searchSendingList(@RequestParam(value="currentPage", required = false , defaultValue = "1") int currentPage, SearchList searchList, Model model, HttpSession session) {
		
		String comCode = ((SnackpotEmp)session.getAttribute("loginEmp")).getSempComCode();
		
		String[] arr = comCode.split("/");
		HashMap<String, String> comArr = new HashMap<String, String>();
		
		for(int i=0; i < arr.length; i++) {
			comArr.put("arr"+i, arr[i]);
		}
		
		searchList.setComArr(comArr);
		
		int listCount = hoSnackListService.selectSearchListCount(searchList);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<SnackList> sendingList = hoSnackListService.searchSendingList(searchList, pi);

		model.addAttribute("sendingList", sendingList);
		model.addAttribute("pi", pi);
		
		return "headoffice/snack/snackSearchSendingList";
	}
	
	//구독 회사의 리스트 정보(스케줄)를 생성하는 메소드 comListInfo
	public ArrayList<ComListInfo> companyInfo(String comCode) {
		
		//회사 코드로 회사명,  간식 배송 예정일, 신청일, 해당 월 리스트 발송 여부 알아오기
		
		HashMap map = new HashMap();
		String[] comArr = comCode.split("/");
		map.put("comArr", comArr);

		ArrayList<ComListInfo> info = hoSnackListService.selectSubsInfo(map);

		// 현재 월에 신청한 구독 건은 제외
		// 리스트 발송 예정일 : 배송 예정일 -7, 주문 마감일 : -2 , 배송예정일 : 해당월 배송일

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		for (ComListInfo i : info) {

			Calendar cal = Calendar.getInstance();

			// 배송 예정일자
			int dDay = Integer.parseInt(i.getDeliveryDate());

			// 발송일이 7이하일 경우 month에 1더해주기

			if (dDay <= 7) {
				cal.set(Calendar.DAY_OF_MONTH, dDay);
				cal.add(Calendar.MONTH, 1);
			} else {
				// 오늘 날짜 기준 해당월의 시작일 + dDay
				cal.set(Calendar.DAY_OF_MONTH, dDay);
			}

			i.setDeliveryDate(sdf.format(cal.getTime()));

			// 주문 마감일 : 배송예정일 -2
			cal.add(Calendar.DATE, -2);
			i.setOrderDeadline(sdf.format(cal.getTime()));

			// 리스트 발송일 : 배송예정일 -5
			cal.add(Calendar.DATE, -5);
			i.setListTransDate(sdf.format(cal.getTime()));
			
			//위시 리시트 마감일
			cal.add(Calendar.DATE, -1);
			i.setWishEndDate(sdf.format(cal.getTime()));

			// 해당 월 리스트 발송 여부 확인
			// 리스트가 존재해도 transStatus 상태값이 N이면 set 'N'
			int result = hoSnackListService.listCheck(i.getComCode());

			if (result > 0) {
				i.setStatus("Y");
			} else {
				i.setStatus("N");
			}
		}

		return info;
	}
	
	//간식 리스트 번호 불러오는 메소드, 리스트 번호가 없을 경우 0 리턴
	public int selectSnackListNo(String comCode) {
		
		return hoSnackListService.selectSnackListNo(comCode);
	}
	
	//간식 상세 리스트 불러오는  메소드
	public ArrayList<SnackDList> selectSnackDList(int listNo){
		
		return hoSnackListService.selectSnackDList(listNo);
	}
	
	//해당 간식 리스트의 총 금액을 불러오는 메소드
	public int selectTotalPrice(int listNo) {
		
		return hoSnackListService.selectTotalPrice(listNo);
	}
	
	//간식 상세 리스트 삭제 메소드
	public void deleteSnackDList(int listNo) {
		
		hoSnackListService.deleteSnackDList(listNo);
	}
	
	//리스트 생성 버튼 클릭시 간식 리스트 생성 후 간식 상세 리스트 insert하는 메소드
	public void insertSnackDList(String comCode, int listNo, int defaultAmount) {
		
		SnackSubs subs = snackSubsService.selectSubsInfo(comCode);
		ArrayList<SnackDList> list =  hoSnackListService.selectSnack(subs);
		ArrayList<SnackDList> dList = new ArrayList<SnackDList>();
		
		int amount = defaultAmount;
		int budget = subs.getBudget();
		int snackBudget = budget * subs.getSnackRatio()/100;
		int drinkBudget = budget * subs.getDrinkRatio()/100;
		int retortBudget = budget * subs.getRetortRatio()/100;
		
		
		//위시 리스트에 있는 상품을 list에서는 삭제, dList에는 추가, 추가된 항목 budget에서 금액 빼기
		ComListInfo info = companyInfo(comCode).get(0);
		ArrayList<SnackDList> wList = hoSnackListService.selectWish(info);
		
		if(!wList.isEmpty()) {
			for(SnackDList w : wList) {
				
				Iterator<SnackDList> iter = list.iterator();
				while(iter.hasNext()) {
					
					SnackDList l = iter.next();
					if(w.getSnackNo() == l.getSnackNo()) {
						iter.remove();
					}
				}
				
				w.setSnackListNo(listNo);
				dList.add(w);
				
				switch(w.getCategoryNo()) {
				case 1: snackBudget -= w.getReleasePrice()*w.getAmount(); break;
				case 2: drinkBudget -= w.getReleasePrice()*w.getAmount(); break;
				case 3: retortBudget -= w.getReleasePrice()*w.getAmount(); break;
				}
			}
			
			budget = snackBudget + drinkBudget + retortBudget;
		}
		
		//랜덤으로 상품번호 가져와서 list에 번호가 있는지 확인
		//있으면 수량 체크(재고 있는지)확인
		//재고가 있으면 수량 * 금액 각 카테고리 번호 확인하여 해당 카테고리 금액에서 마이너스, 예산에서 뺀 금액에 마이너스가 되면 continue
		//insert되면 해당 객체는 리스트에서 삭제(중복 값 피하기 위해)
		
		while(budget > 0) {
			
			if(list.isEmpty()) break; //무한루프 방지
			
			int r = (int)((Math.random())*list.size()); //랜덤 범위 지정
			SnackDList s = list.get(r);
			
			if(s.getStock() >= amount) {
				switch(s.getCategoryNo()){
				case 1: 
					if(snackBudget > 0) {
						snackBudget -= s.getReleasePrice()*amount;
					}else{
						list.remove(r);
						continue;
					}break;
				case 2: 
					if(drinkBudget > 0) {
						drinkBudget -= s.getReleasePrice()*amount;
					}else{
						list.remove(r);
						continue;
					}break;
				case 3: 
					if(retortBudget > 0) {
						retortBudget -= s.getReleasePrice()*amount;
					}else{
						list.remove(r);
						continue;
					}break;	
				}
				s.setAmount(amount);
				s.setSnackListNo(listNo);
				dList.add(s);
				budget = snackBudget + drinkBudget + retortBudget;
			}
			list.remove(r);
		}
		
		hoSnackListService.insertSnackDList(dList);
		
	}
	
}

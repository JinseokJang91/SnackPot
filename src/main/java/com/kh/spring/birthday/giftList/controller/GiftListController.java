package com.kh.spring.birthday.giftList.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.spring.birthday.giftList.model.service.GiftListService;
import com.kh.spring.birthday.giftList.model.vo.GiftFolder;
import com.kh.spring.birthday.giftList.model.vo.GiftFolderDetail;
import com.kh.spring.birthday.giftList.model.vo.GiftList;
import com.kh.spring.companyMember.model.vo.CompanyMember;

@Controller
public class GiftListController {

	@Autowired
	private GiftListService giftListService;
	
	@RequestMapping(value="giftList.birth")
	public String selectGiftList(Model model, HttpSession session) {
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		String perAmount = giftListService.selectPerAmount(comCode);
		
		if(perAmount != null) {
			int perAmountMax = Integer.parseInt(perAmount);
			
			//메인 화면에 나타나는 상품 정보
			ArrayList<GiftList> list = giftListService.selectGiftList(perAmountMax);
			
			model.addAttribute("list", list);

			return "company/birthday/gift_list";
			
		}else {
			//perAmount값이 없으면 구독을 안 하고 있는 것
			model.addAttribute("msg", "구독 정보가 존재하지 않습니다.");
			
			return "common/alert";
		}
	
	}
	
	@ResponseBody
	@RequestMapping(value="selectFolderList.birth", produces="application/json; charset=utf-8")
	public String selectFolderList(){
		
		ArrayList<GiftFolder> folderList = giftListService.selectFolderList();
		
		return new Gson().toJson(folderList);
	}
	
	// *카테코리별 선물 리스트 출력
	@ResponseBody
	@RequestMapping(value="selectCtgry.birth")
	public ArrayList<GiftList> selectCtgry(int ctgryNum, HttpSession session){
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		String perAmount = giftListService.selectPerAmount(comCode);
		int perAmountMax = Integer.parseInt(perAmount);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("perAmountMax", perAmountMax);
		map.put("ctgryNum", ctgryNum);
		
		ArrayList<GiftList> list = new ArrayList<GiftList>();
		
		list = giftListService.selectCtgry(map);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="addGiftFolder.birth", produces="application/json; charset=utf-8")
	public String addGiftFolder(String folderName) {
		
		int result = 0;
		
		if(folderName != "") {
			result = giftListService.addGiftFolder(folderName);
		}
		
		if(result > 0) {
			return new Gson().toJson(folderName);
		}else {
			return new Gson().toJson("");
		}		
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectFolderInfo.birth")
	public ArrayList<GiftList> selectFolderInfo(int rowNum){
		
		ArrayList<GiftList> list = new ArrayList<GiftList>();
		
		list = giftListService.selectFolderInfo(rowNum);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="addGiftDetail.birth")
	public String addGiftDetail(String[] detailArr) {

		int result = giftListService.addGiftDetail(detailArr);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="checkDuplicate.birth")
	public int checkDuplicate(String[] detailArr) {

		GiftFolderDetail result = giftListService.checkDuplicate(detailArr);
		
		if(result != null) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="delGiftFolder.birth")
	public String deleteGiftFolder(String glistNo) {
		
		int result = giftListService.deleteGiftFolder(glistNo);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="delFolderDetail.birth")
	public String deleteFolderDetail(String[] delGiftArr) {
		
		int result = giftListService.deleteFolderDetail(delGiftArr);
		
		return String.valueOf(result);
	}
}

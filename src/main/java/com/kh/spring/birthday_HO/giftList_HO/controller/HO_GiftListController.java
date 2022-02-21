package com.kh.spring.birthday_HO.giftList_HO.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.birthday_HO.giftList_HO.model.service.HO_GiftListService;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.GiftAttachment;
import com.kh.spring.birthday_HO.giftList_HO.model.vo.HO_GiftList;
import com.kh.spring.common.exception.CommException;

@Controller
public class HO_GiftListController {

	@Autowired
	private HO_GiftListService giftListService;
	
	@RequestMapping(value="giftList.ho")
	public String selectGiftList(Model model) {
		
		ArrayList<HO_GiftList> list = giftListService.selectGiftList();

		model.addAttribute("list",list);
		
		return "headoffice/birthday_HO/gift_list_HO";
	}
	
	@ResponseBody
	@RequestMapping(value="selectCtgry.ho")
	public ArrayList<HO_GiftList> selectCtgry(int ctgryNum){

		ArrayList<HO_GiftList> list = new ArrayList<HO_GiftList>();
		
		list = giftListService.selectCtgry(ctgryNum);
		
		return list;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="checkedGiftList.ho")
	public ArrayList<HO_GiftList> checkedGiftList(String[] chkArr){

		ArrayList<HO_GiftList> list = new ArrayList<HO_GiftList>();
		HO_GiftList giftOne = new HO_GiftList();
		
		for(int i=0; i<chkArr.length; i++) {
			giftOne = giftListService.checkedGiftList(chkArr[i]);
			
			list.add(giftOne);
		}

		return list;
	}
	
	@RequestMapping(value="insertGift.ho")
	public String insertGift(HttpServletRequest request, HO_GiftList gl, GiftAttachment at,
							@RequestParam(name="insertImgFile") MultipartFile file) {

		String savePath = request.getSession().getServletContext().getRealPath("/resources/images");

		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				at.setOriginName(file.getOriginalFilename());
				at.setChangeName(changeName);
				at.setFilePath(savePath);
			}
			
			giftListService.insertGift(gl);
			giftListService.insertAttachment(at);
		}
		
		return "redirect:giftList.ho";
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\images\\";
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf(".")); //파일명에서 .뒤의 확장자만 가져옴
		
		String changeName = currentTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException();
		}
		
		return changeName;
	}
	
	@ResponseBody
	@RequestMapping(value="selectGiftOne.ho")
	public HO_GiftList selectGiftOne(String giftNo) {
		
		HO_GiftList gl = giftListService.selectGiftOne(giftNo);
		
		return gl;
		
	}
	
	@RequestMapping(value="updateGift.ho")
	public String updateGift(HttpServletRequest request, HO_GiftList gl, GiftAttachment at,
							@RequestParam(name="updateImgFile") MultipartFile file) {

		String savePath = request.getSession().getServletContext().getRealPath("/resources/images");
		//수정할 때 기존 이미지를 변경하지 않고 그대로 유지하는 경우
		if(file.isEmpty()) {
			giftListService.updateGift(gl);
		//수정할 때 이미지도 함께 변경하는 경우
		}else {
			
			if(!file.getOriginalFilename().equals("")) {
				
				String changeName = saveFile(file, request);
				
				if(changeName != null) {
					at.setOriginName(file.getOriginalFilename());
					at.setChangeName(changeName);
					at.setGiftRefNo(gl.getGiftNo());
					at.setFilePath(savePath);
				}
				
				giftListService.updateGift(gl);
				giftListService.updateAttachment(at);
			}
		}

		return "redirect:giftList.ho";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteGift.ho")
	public String deleteGift(String[] delArr) {

		int result = giftListService.deleteGift(delArr);
		
		return String.valueOf(result);
	}
	
}

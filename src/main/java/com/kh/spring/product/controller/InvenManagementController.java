package com.kh.spring.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.arrival.model.vo.Arrival;
import com.kh.spring.product.model.service.InvenManagementService;
import com.kh.spring.product.model.vo.Chart;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.ProductAttachment;
import com.kh.spring.product.model.vo.Snack;
import com.kh.spring.product.release.model.vo.Release;
import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.Pagination;

@Controller
public class InvenManagementController {

	@Autowired
	private InvenManagementService invenManagementService;

	// 제품등록 페이지로 이동
	@RequestMapping("snackEnrollForm.pm")
	public String snackEnrollForm() {

		return "headoffice/invenManagement/snackEnrollForm";
	}

	// 제품 insert
	@RequestMapping("insert.pm")
	public String insertSnack(Product p, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		System.out.println(file.getOriginalFilename());

		System.out.println(file);
		System.out.println(p);

		ProductAttachment pa = new ProductAttachment();
		if (!file.getOriginalFilename().equals("")) {

			pa = saveFile(file, request, p.getSnackNo());

		}

		invenManagementService.insertSnack(p);
		invenManagementService.insertSnackAttach(pa);

		model.addAttribute("msg", "상품 등록이 완료되었습니다.");
		model.addAttribute("url", "/snackEnrollForm.pm");

		return "common/alert";
	}

	// 상품 등록 첨부파일
	private ProductAttachment saveFile(MultipartFile file, HttpServletRequest request, int snackNo) {

		ProductAttachment pa = new ProductAttachment();

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "/images/";

		System.out.println("savePath : " + savePath);

		String originName = file.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ext;

		System.out.println(changeName);

		try {
			file.transferTo(new File(savePath + changeName));
			pa.setChangeName(changeName);
			pa.setFilePath(savePath);
			pa.setSnackNo(snackNo);
			pa.setOriginName(originName);

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			throw new CommException("file upload error");
		}

		return pa;
	}

	// 출고 리스트로 이동
	@RequestMapping("releaseList.im")
	private String ReleaseList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {

		return "headoffice/invenManagement/snackReleaseList";
	}

	// 입고 리스트로 이동
	@RequestMapping("arrivalList.im")
	private String todayArrivalList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {

		// int listCount = invenManagementService.todayArrivalCount();
		// System.out.println(listCount);

		// PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		// ArrayList<Arrival> list = invenManagementService.todayArrivalList(pi);

		// System.out.println(list);

		// model.addAttribute("list", list);
		// model.addAttribute("pi", pi);

		return "headoffice/invenManagement/snackArrivalList";
	}

	// 출고 등록
	@RequestMapping("releaseInsert.im")
	private String ReleaseEnrollForm(Release r, Model model) {

		System.out.println(r);

		invenManagementService.releaseInsert(r);

		model.addAttribute("msg", "출고 등록이 완료되었습니다.");
		model.addAttribute("url", "/releaseList.im");

		return "common/alert";
	}

	// 입고 등록
	@RequestMapping("arrivalInsert.im")
	private String ArrivalEnrollForm(Arrival a, Model model) {
		// @RequestParam(name = "remark", required = false) String remark) {

		System.out.println(a);

		invenManagementService.arrivalInsert(a);

		model.addAttribute("msg", "입고 등록이 완료되었습니다.");
		model.addAttribute("url", "/arrivalList.im");

		return "common/alert";
	}

	// 입고 목록 Ajax
	@ResponseBody
	@RequestMapping(value = "arrivalListAjax.im", produces = "application/json; charset=utf-8")
	private String arrivalListajax(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "date") Date beforeDate) {

		System.out.println("넘어온 날짜 ==================== " + beforeDate);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");

		String date = transFormat.format(beforeDate);

		int listCount = invenManagementService.todayArrivalCount(date);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 15);

		ArrayList<Arrival> list = invenManagementService.todayArrivalList(pi, date);

		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create().toJson(list);
	}

	// 출고목록Ajax
	@ResponseBody
	@RequestMapping(value = "releaseListAjax.im", produces = "application/json; charset=utf-8")
	private String releaseListAjax(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "date") Date beforeDate) {

		System.out.println("넘어온 날짜 ==================== " + beforeDate);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");

		String date = transFormat.format(beforeDate);

		int listCount = invenManagementService.todayReleaseCount(date);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 15);

		ArrayList<Release> list = invenManagementService.todayReleaseList(pi, date);

		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create().toJson(list);
	}

	@RequestMapping("invenList.pm")
	private String invenList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {

		int listCount = invenManagementService.invenListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 15);

		ArrayList<Snack> list = invenManagementService.invenList(pi);

		System.out.println(list);

		model.addAttribute("invenList", list);
		model.addAttribute("pi", pi);

		return "headoffice/invenManagement/invenList";
	}

	@RequestMapping("searchSno.im")
	private String searchSno(@RequestParam(value = "category") int category,
			@RequestParam(value = "search") String before,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {

		System.out.println("category 0 ========================== ");

		int search = Integer.parseInt(before);
		int listCount = invenManagementService.sNoSearchCount(search);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 15);

		ArrayList<Snack> list = invenManagementService.sNoSearch(pi, search);

		System.out.println(list);

		System.out.println("확인 1=====================");
		model.addAttribute("search", search);
		model.addAttribute("category", category);
		model.addAttribute("searchList", list);
		model.addAttribute("pi", pi);

		return "headoffice/invenManagement/invenSearchList";
	}

	@RequestMapping("searchSname.im")
	private String searchSname(@RequestParam(value = "category") int category,
			@RequestParam(value = "search") String search,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {

		System.out.println("category 1 ========================== ");
		int listCount = invenManagementService.sNameSearchCount(search);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 15);

		ArrayList<Snack> list = invenManagementService.sNameSearch(pi, search);

		System.out.println(list);

		System.out.println("확인 2=====================");
		model.addAttribute("search", search);
		model.addAttribute("category", category);
		model.addAttribute("searchList", list);
		model.addAttribute("pi", pi);

		return "headoffice/invenManagement/invenSearchList";
	}

	@RequestMapping("invenDetail.im")
	private String invenDetail(@RequestParam(value = "snackNo") int snackNo, Model model) {

		System.out.println("invenDetail" + snackNo);

		Snack snack = invenManagementService.invenDetail(snackNo);
		ProductAttachment pa = invenManagementService.invenDetailAttach(snackNo);

		model.addAttribute("snack", snack);
		model.addAttribute("pa", pa);
		

		return "headoffice/invenManagement/invenDetail";
	}

	@RequestMapping("snackChart.im")
	private String snackChart(Model model) {

		// 데이터 호출
		ArrayList<Chart> chart = invenManagementService.snackChart();

		// 데이터 가공

		String nameResult = "";
		String amountResult = "";

		for (int i = 0; i < chart.size(); i++) {

			if (i != 0 && chart.size() > i) {
				nameResult += ",";
				amountResult += ",";
			}
			nameResult += "'" + chart.get(i).getSnackName() + "', {role : 'annotation'}";
			amountResult += chart.get(i).getAmount() + "," + chart.get(i).getAmount();

		}

		System.out.println(nameResult);
		System.out.println(amountResult);

		model.addAttribute("chart", chart);
		model.addAttribute("name", nameResult);
		model.addAttribute("amount", amountResult);

		return "headoffice/chart/snackChart";
	}

	@ResponseBody
	@RequestMapping(value = "checkAmount.im")
	private int checkAmount(@RequestParam(value = "amount") int amount, @RequestParam(value = "snackNo") int snackNo) {

		int result = 1;
		System.out.println("넘어온 값 : " + amount);

		int stock = invenManagementService.checkAmount(snackNo);

		System.out.println("재고 : " + stock);

		if ((stock - amount) >= 0) {

			result = 0;

		}

		System.out.println(result);

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "checkSnackNo.im", produces = "application/json; charset=utf-8")
	private Snack checkSnackNo(@RequestParam(value = "snackNo") int snackNo) {

		System.out.println("넘어온 값 : " + snackNo);

		int count = invenManagementService.checkSnackNo(snackNo);
		System.out.println(count);
		int stock = 0;
		String name = "";
		if (count > 0) {

			name = invenManagementService.getsnackName(snackNo);
			stock = invenManagementService.checkAmount(snackNo);
			System.out.println(name);
			System.out.println(stock);

		}

		Snack s = new Snack();
		s.setSnackName(name);
		s.setStock(stock);

		return s;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "enrollSnackNo.im")
	private int enrollSnackNo(@RequestParam(value = "snackNo") int snackNo) {

		

		
		return invenManagementService.checkSnackNo(snackNo);
	}
}

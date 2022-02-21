package com.kh.spring.snack.snackOrder.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.companyMember.model.vo.CompanyMember;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.WishListDtail;
import com.kh.spring.snack.snackList.model.service.HoSnackListService;
import com.kh.spring.snack.snackList.model.vo.SearchList;
import com.kh.spring.snack.snackList.model.vo.SearchSnack;
import com.kh.spring.snack.snackOrder.model.service.SnackOrderService;
import com.kh.spring.snack.snackOrder.model.vo.OrderDetail;
import com.kh.spring.snack.snackOrder.model.vo.Orders;
import com.kh.spring.snackpotEmp.model.vo.SnackpotEmp;

@SessionAttributes("o")
@Controller
public class SnackOrderController {

	@Autowired
	private SnackOrderService snackOrderService;
	
	@Autowired
	private HoSnackListService hoSnackListService;
	
	@RequestMapping("comSnackList.sn")
	public String selectComSnackList(Model model, HttpSession session) {
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		Orders order  = snackOrderService.selectOrder(comCode);
		ArrayList<OrderDetail> dList = null;
		
		if(order != null) {
			dList = snackOrderService.selectOrderDetail(order.getOrderNo());
		}
		
		model.addAttribute("o", order);
		model.addAttribute("dList", dList);
		
		return "company/snack/snackListView";
	}
	
	@ResponseBody
	@RequestMapping("totalPrice.sn")
	public int selectTotalPrice(int orderNo) {
		
		return snackOrderService.selectTotalPrice(orderNo);
	}
	
	@RequestMapping("comSearchSnack.sn")
	public String comSearchSnack(SearchSnack search, Model model, HttpSession session) {
	
		int orderNo = ((Orders)session.getAttribute("o")).getOrderNo();
		
		ArrayList<Product> searchList = hoSnackListService.searchSnack(search);
		ArrayList<OrderDetail> dList = snackOrderService.selectOrderDetail(orderNo);
		
		model.addAttribute("searchList", searchList);
		model.addAttribute("dList", dList);
		
		return "company/snack/snackListView";
	}
	
	@ResponseBody
	@RequestMapping(value="checkOrderSnackDup.sn", produces="application/json; charset=utf-8")
	public int checkOrderSnackDup(int orderNo, int snackNo) {
		
		OrderDetail orderD = new OrderDetail();
		orderD.setOrderNo(orderNo);
		orderD.setSnackNo(snackNo);
		
		return snackOrderService.checkOrderSnackDup(orderD);
	}
	
	@RequestMapping("addOrderDList.sn")
	public String addOrderDList(OrderDetail orderD) {
		
		snackOrderService.addOrderDList(orderD);
		
		return "redirect:comSnackList.sn";
	}
	
	@RequestMapping("deleteOrderDNo.sn")
	public String deleteOrderDNo(String orderDNoCheck, int orderNo, Model model) {
		
		snackOrderService.deleteOrderDNo(orderDNoCheck);
		
		ArrayList<OrderDetail> dList = snackOrderService.selectOrderDetail(orderNo);
		model.addAttribute("dList", dList);
		
		return "company/snack/snackListView";
	}
	
	@RequestMapping("updateOrderAmount.sn")
	public String updateOrderAmount(OrderDetail orderD, Model model) {
		
		snackOrderService.updateOrderAmount(orderD);
		
		return "redirect:comSnackList.sn";
	}
	
	@ResponseBody
	@RequestMapping(value="selectComWishList.sn", produces="application/json; charset=utf-8")
	public ArrayList<WishListDtail> selecComtWishList(int wishNo) {
		
		return snackOrderService.selecComtWishList(wishNo);
	}
	
	@ResponseBody
	@RequestMapping(value="checkOrderStock.sn", produces="application/json; charset=utf-8")
	public ArrayList<OrderDetail> checkOrderStock(int orderNo) {
		
		return snackOrderService.checkOrderStock(orderNo);
	}
	
	
	@RequestMapping("snackOrder.sn")
	public String updateSnackOrder(int orderNo, SessionStatus sessionStatus, HttpSession session) {
		
		snackOrderService.updateSnackOrder(orderNo);
		sessionStatus.setComplete();
		
		session.setAttribute("m", "주문이 완료되었습니다. 주문 내역을 확인해 주세요.");
		return "redirect:comSnackList.sn";
	}
	
	@RequestMapping("comOrderList.sn")
	public String selectComOrderedList(@RequestParam(value="currentPage", required = false , defaultValue = "1") int currentPage, HttpSession session, Model model) {
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		
		int listCount = snackOrderService.selectListCountForString(comCode);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Orders> orderList = snackOrderService.selectComOrderedList(comCode, pi);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pi", pi);
		
		return "company/snack/comOrderList";
	}
	
	@RequestMapping("comSearchOrder.sn")
	public String selectComSearchOrder(@RequestParam(value="currentPage", required = false , defaultValue = "1") int currentPage, SearchList search, HttpSession session, Model model) {
		
		String comCode = ((CompanyMember)session.getAttribute("loginUser")).getComCode();
		search.setComCode(comCode);
		
		int listCount = snackOrderService.selectListCountForComSearch(search);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Orders> orderList = snackOrderService.selectComSearchOrder(search, pi);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pi", pi);
		
		return "company/snack/comSearchOrderList";
	}
	
	
	@RequestMapping("comOrderDetail.sn")
	public String selectComOrderedDetail(int orderNo, Model model) {
		
		Orders orders = snackOrderService.selectOrderForNo(orderNo);
		ArrayList<OrderDetail> dList = snackOrderService.selectOrderDetail(orderNo);
		
		model.addAttribute("orders", orders);
		model.addAttribute("dList", dList);
		
		return "company/snack/comOrderDetail";
	}
	
	
	@RequestMapping("hoOrderList.sn")
	public String selectHoOrderedList(@RequestParam(value="currentPage", required = false , defaultValue = "1") int currentPage, HttpSession session, Model model) {
		
		String comCode = ((SnackpotEmp)session.getAttribute("loginEmp")).getSempComCode();
		
		HashMap map = new HashMap();
		String[] comArr = comCode.split("/");
		map.put("comArr", comArr);
		
		int listCount = snackOrderService.selectListCountForMap(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Orders> orderList = snackOrderService.selectHoOrderedList(map, pi);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pi", pi);
		
		return "headoffice/snack/hoOrderList";
	}
	
	@RequestMapping("hoSearchOrder.sn")
	public String selectHoSearchOrder(@RequestParam(value="currentPage", required = false , defaultValue = "1") int currentPage, SearchList search, HttpSession session, Model model) {
		
		String comCode = ((SnackpotEmp)session.getAttribute("loginEmp")).getSempComCode();
		
		String[] arr = comCode.split("/");
		HashMap<String, String> comArr = new HashMap<String, String>();
		
		for(int i=0; i < arr.length; i++) {
			comArr.put("arr"+i, arr[i]);
		}
		search.setComArr(comArr);
		
		int listCount = snackOrderService.selectListCountForHoSearch(search);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Orders> orderList = snackOrderService.selectHoSearchOrder(search, pi);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pi", pi);
		
		return "headoffice/snack/hoSearchOrderList";
	}
	
	@RequestMapping("hoOrderDetail.sn")
	public String selectHoOrderedDetail(int orderNo, Model model) {
		
		Orders orders = snackOrderService.selectOrderForNo(orderNo);
		ArrayList<OrderDetail> dList = snackOrderService.selectOrderDetail(orderNo);
		
		model.addAttribute("orders", orders);
		model.addAttribute("dList", dList);
		
		return "headoffice/snack/hoOrderDetail";
	}
	
	@RequestMapping("orderRelease.sn")
	public String orderRelease(int orderNo, Model model, HttpSession session) {
		
		snackOrderService.orderRelease(orderNo);
		
		Orders orders = snackOrderService.selectOrderForNo(orderNo);
		ArrayList<OrderDetail> dList = snackOrderService.selectOrderDetail(orderNo);
		
		model.addAttribute("orders", orders);
		model.addAttribute("dList", dList);
		
		session.setAttribute("m", "간식 출고가 완료되었습니다.");
		return "headoffice/snack/hoOrderDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="orderCancel.sn", produces="application/String; charset=utf-8")
	public String orderCancel(int orderNo, Model model) {
		
		orderCancel(orderNo);
		
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="comOrderCancel.sn", produces="application/String; charset=utf-8")
	public String comOrderCancel(int orderNo) {
		
		orderCancel(orderNo);
		
		return "success";
	}
	
	public void orderCancel(int orderNo) {
		
		int newOrderNo = hoSnackListService.selectOrderNo();
		
		HashMap order = new HashMap();
		order.put("orderNo", orderNo);
		order.put("newOrderNo", newOrderNo);
		
		snackOrderService.orderCancel(order);
		
	}
	
	
}

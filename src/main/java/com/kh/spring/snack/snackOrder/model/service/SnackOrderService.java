package com.kh.spring.snack.snackOrder.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.common.PageInfo;
import com.kh.spring.product.model.vo.WishListDtail;
import com.kh.spring.snack.snackList.model.vo.SearchList;
import com.kh.spring.snack.snackOrder.model.vo.OrderDetail;
import com.kh.spring.snack.snackOrder.model.vo.Orders;

public interface SnackOrderService {

	Orders selectOrder(String comCode);

	ArrayList<OrderDetail> selectOrderDetail(int orderNo);

	int selectTotalPrice(int orderNo);

	int checkOrderSnackDup(OrderDetail orderD);

	void addOrderDList(OrderDetail orderD);

	void deleteOrderDNo(String orderDNoCheck);

	void updateOrderAmount(OrderDetail orderD);

	ArrayList<WishListDtail> selecComtWishList(int wishNo);

	ArrayList<OrderDetail> checkOrderStock(int orderNo);

	void updateSnackOrder(int orderNo);

	ArrayList<Orders> selectComOrderedList(String comCode, PageInfo pi);

	ArrayList<Orders> selectHoOrderedList(HashMap map, PageInfo pi);

	Orders selectOrderForNo(int orderNo);

	void orderRelease(int orderNo);

	void orderCancel(HashMap order);

	ArrayList<Orders> selectComSearchOrder(SearchList search, PageInfo pi);

	ArrayList<Orders> selectHoSearchOrder(SearchList search, PageInfo pi);

	int selectListCountForString(String comCode);

	int selectListCountForMap(HashMap map);

	int selectListCountForComSearch(SearchList search);

	int selectListCountForHoSearch(SearchList search);

	

}

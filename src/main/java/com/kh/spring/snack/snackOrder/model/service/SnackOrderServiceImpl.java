package com.kh.spring.snack.snackOrder.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.model.vo.WishListDtail;
import com.kh.spring.snack.snackList.model.vo.SearchList;
import com.kh.spring.snack.snackOrder.model.dao.SnackOrderDao;
import com.kh.spring.snack.snackOrder.model.vo.OrderDetail;
import com.kh.spring.snack.snackOrder.model.vo.Orders;

@Service
public class SnackOrderServiceImpl implements SnackOrderService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SnackOrderDao snackOrderDao;
	
	@Override
	public Orders selectOrder(String comCode) {
		return snackOrderDao.selectOrder(sqlSession, comCode);
	}

	@Override
	public ArrayList<OrderDetail> selectOrderDetail(int orderNo) {
		return snackOrderDao.selectOrderDetail(sqlSession, orderNo);
	}

	@Override
	public int selectTotalPrice(int orderNo) {
		return snackOrderDao.selectTotalPrice(sqlSession, orderNo);
	}

	@Override
	public int checkOrderSnackDup(OrderDetail orderD) {
		return snackOrderDao.checkOrderSnackDup(sqlSession, orderD);
	}

	@Override
	public void addOrderDList(OrderDetail orderD) {
		
		int result = snackOrderDao.addOrderDList(sqlSession, orderD);
		
		if(result < 0) {
			throw new CommException("addOrderDList 실패");
		}
		
	}

	@Override
	public void deleteOrderDNo(String orderDNoCheck) {
		
		int result = snackOrderDao.deleteOrderDNo(sqlSession, orderDNoCheck);
		
		if(result < 0) {
			throw new CommException("deleteOrderDNo 실패");
		}
	}

	@Override
	public void updateOrderAmount(OrderDetail orderD) {
		
		int result = snackOrderDao.updateOrderAmount(sqlSession, orderD);
		
		if(result < 0) {
			throw new CommException("updateOrderAmount 실패");
		}
	}

	@Override
	public ArrayList<WishListDtail> selecComtWishList(int wishNo) {
		return snackOrderDao.selecComtWishList(sqlSession, wishNo);
	}

	@Override
	public ArrayList<OrderDetail> checkOrderStock(int orderNo) {
		
		return snackOrderDao.checkOrderStock(sqlSession, orderNo);
	}

	@Override
	public void updateSnackOrder(int orderNo) {
		
		int result = snackOrderDao.updateSnackOrder(sqlSession, orderNo);
		
		if(result < 0) {
			throw new CommException("snackOrder 실패");
		}
	}

	@Override
	public ArrayList<Orders> selectComOrderedList(String comCode, PageInfo pi) {
		return snackOrderDao.selectComOrderedList(sqlSession, comCode, pi);
	}

	@Override
	public ArrayList<Orders> selectHoOrderedList(HashMap map, PageInfo pi) {
		return snackOrderDao.selectHoOrderedList(sqlSession, map, pi);
	}

	@Override
	public Orders selectOrderForNo(int orderNo) {
		return snackOrderDao.selectOrderForNo(sqlSession, orderNo);
	}

	@Override
	public void orderRelease(int orderNo) {
		
		int insert = snackOrderDao.insertRelease(sqlSession, orderNo);
		
		if(insert < 0) {
			throw new CommException("insertRelease 실패");
		}
		
		int update = snackOrderDao.updateOrderRelease(sqlSession, orderNo);
		
		if(update < 0) {
			throw new CommException("updateOrderRelease 실패");
		}
	}

	@Override
	public void orderCancel(HashMap order) {
		
		int orderNo = (int) order.get("orderNo");
		
		int update = snackOrderDao.updateOrderStatus(sqlSession, orderNo);
		
		if(update < 0) {
			throw new CommException("updateOrderRelease 실패");
		}
		
		int insertOrder = snackOrderDao.insertNewOrder(sqlSession, order);
		
		if(insertOrder < 0) {
			throw new CommException("insertNewOrder 실패");
		}
		
		int insertDetail = snackOrderDao.insertNewOrderDetail(sqlSession, order);
		
		if(insertDetail < 0) {
			throw new CommException("insertNewOrderDetail 실패");
		}
		
	}

	@Override
	public ArrayList<Orders> selectComSearchOrder(SearchList search, PageInfo pi) {
		return snackOrderDao.selectComSearchOrder(sqlSession, search, pi);
	}

	@Override
	public ArrayList<Orders> selectHoSearchOrder(SearchList search, PageInfo pi) {
		return snackOrderDao.selectHoSearchOrder(sqlSession, search, pi);
	}

	@Override
	public int selectListCountForString(String comCode) {
		return snackOrderDao.selectListCountForString(sqlSession, comCode);
	}

	@Override
	public int selectListCountForMap(HashMap map) {
		return snackOrderDao.selectListCountForMap(sqlSession, map);
	}

	@Override
	public int selectListCountForComSearch(SearchList search) {
		return snackOrderDao.selectListCountForComSearch(sqlSession, search);
	}

	@Override
	public int selectListCountForHoSearch(SearchList search) {
		return snackOrderDao.selectListCountForHoSearch(sqlSession, search);
	}

}

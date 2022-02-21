package com.kh.spring.product.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.model.dao.ProductDao;
import com.kh.spring.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public ArrayList<Product> selectList(int dtc) {
		return productDao.selectList(sqlSession , dtc);
	}
	
	@Override //음료리스트
	public ArrayList<Product> selectDrinkList(int dtc) {
		
		return productDao.selectDrinkList(sqlSession , dtc);
	}

	@Override
	public ArrayList<Product> selectFoodList(int dtc) {
		
		return productDao.selectFoodList(sqlSession , dtc);
	}

	@Override
	public String selectDeliveryDate(String comCode) {
		
		return productDao.selectDeliveryDate(sqlSession , comCode);
	}
	
	@Override
	public int chkWishList(String comCode) {
		
		return productDao.chkWishList(sqlSession , comCode);
		
	}
	
	@Override
	public int insertWishList(HashMap<String, Object> map) {
		int result = productDao.insertWishList(sqlSession , map);
		
		return result;
	}

	@Override
	public int selectSubWishNo(String comCode) {
		
		return productDao.selectSubWishNo(sqlSession , comCode);
	}
	
	@Override
	public void insertWishDetail(HashMap<String, Object> map) {
		productDao.insertWishDetail(sqlSession , map);
		
	}

	@Override
	public int chkSnackNo(HashMap<String, Object> map) {
		
		return productDao.chkSnackNo(sqlSession , map);
	}
	
	@Override
	public void updateSnackCount(HashMap<String, Object> map) {
		
	 productDao.updateSnackCount(sqlSession , map);
		
	}

	@Override
	public ArrayList<Product> selectWishDetailList(String comCode) {
		
		return productDao.selectWishDetailList(sqlSession , comCode);
		
	}

	@Override
	public int updateWishEndDate(HashMap<String, Object> map) {
		
		int result2 = productDao.updateWishEndDate(sqlSession , map);
		return result2;
	}


	@Override
	public int updatePlusCount(HashMap<String, Object> map) {
		
		int result = productDao.updatePlusCount(sqlSession , map);
		
		return result;
	}

	@Override
	public int deleteSnack(HashMap<String, Object> map) {
		
		int result = productDao.deleteSnack(sqlSession , map);
		return result;
	}

	@Override
	public int endWishList(String wishNo) {
		
		int result = productDao.endWishList(sqlSession, wishNo);
		return result;
	}

	@Override
	public int chkEmpSub(String comCode) {
		
		int result = productDao.chkEmpSub(sqlSession , comCode);
		return result;
	}



	//스케줄러 테스트용
	@Override
	public void updateClosingDate(String today) {
		
		productDao.updateClosingDate(sqlSession , today);
		
	}


	

	
}

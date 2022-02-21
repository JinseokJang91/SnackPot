package com.kh.spring.product.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.kh.spring.product.model.vo.Product;

public interface ProductService {

	ArrayList<Product> selectList(int dtc);
	
	ArrayList<Product> selectDrinkList(int dtc);

	ArrayList<Product> selectFoodList(int dtc);

	String selectDeliveryDate(String comCode);
	
	int chkWishList(String comCode);

	int insertWishList(HashMap<String, Object> map);
	
	int selectSubWishNo(String comCode);
	
	void insertWishDetail(HashMap<String, Object> map);
	
	int chkSnackNo(HashMap<String, Object> map);

	void updateSnackCount(HashMap<String, Object> map);

	ArrayList<Product> selectWishDetailList(String comCode);

	int updateWishEndDate(HashMap<String, Object> map);

	int updatePlusCount(HashMap<String, Object> map);

	int deleteSnack(HashMap<String, Object> map);

	int endWishList(String wishNo);

	int chkEmpSub(String comCode);




	
	
	//스케줄러 테스트용
	void updateClosingDate(String today);


	

	



	





	



}

package com.kh.spring.product.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.spring.product.model.vo.Product;

@Repository
public class ProductDao {

	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, int dtc) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", dtc);
		
	}

	public ArrayList<Product> selectDrinkList(SqlSessionTemplate sqlSession, int dtc) {
	
		return (ArrayList)sqlSession.selectList("productMapper.selectDrinkList" , dtc);
	}

	public ArrayList<Product> selectFoodList(SqlSessionTemplate sqlSession, int dtc) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectFoodList" , dtc);
	}


	public String selectDeliveryDate(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("productMapper.selectDeliveryDate" , comCode);
		
	}
	
	public int chkWishList(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("productMapper.chkWishList" , comCode);
		
	}
	
	public int insertWishList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.insert("productMapper.insertWishList" , map);
	}

	public int selectSubWishNo(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("productMapper.selectSubWishNo" , comCode);
	}


	public void insertWishDetail(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		sqlSession.insert("productMapper.insertWishDetail" , map);
	}
	

	public int chkSnackNo(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.selectOne("productMapper.chkSnackNo" , map);
	}
	

	public void updateSnackCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		sqlSession.update("productMapper.updateSnackCount" , map);
	}

	public ArrayList<Product> selectWishDetailList(SqlSessionTemplate sqlSession, String comCode) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectWishDetailList" , comCode);
	}

	public int updateWishEndDate(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("productMapper.updateWishEndDate" , map);
		
	}


	public int updatePlusCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("productMapper.updatePlusCount" , map);
	}

	public int deleteSnack(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
	
		return sqlSession.delete("productMapper.deleteSnack" , map);
	}

	public int endWishList(SqlSessionTemplate sqlSession, String wishNo) {
	
		return sqlSession.update("productMapper.endWishList" , wishNo);
	}

	public int chkEmpSub(SqlSessionTemplate sqlSession, String comCode) {
		
		return sqlSession.selectOne("productMapper.chkEmpSub" , comCode);
	}
	
	
	//스케줄러 테스트용
	public void updateClosingDate(SqlSessionTemplate sqlSession, String today) {
		
		sqlSession.update("productMapper.updateClosingDate" , today);
	}


	

}

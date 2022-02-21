package com.kh.spring.product.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.product.arrival.model.vo.Arrival;
import com.kh.spring.product.model.dao.InvenManagementDao;
import com.kh.spring.product.model.vo.Chart;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.ProductAttachment;
import com.kh.spring.product.model.vo.Snack;
import com.kh.spring.product.release.model.vo.Release;
import com.kh.spring.qna.model.vo.PageInfo;

@Service
public class InvenManagementServiceImpl implements InvenManagementService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private InvenManagementDao invenManagementDao;
	
	@Override
	public void insertSnack(Product p) {
		int result = invenManagementDao.insertSnack(sqlSession, p);
		
		if(result < 0) {
			throw new CommException("상품 등록에 실패했습니다.");
		}
		
		
	}

	@Override
	public void insertSnackAttach(ProductAttachment pa) {
		int result = invenManagementDao.insertSnackAttach(sqlSession, pa);
		
		if(result < 0) {
			throw new CommException("상품 이미지 등록에 실패했습니다.");
		}
		
	}

	@Override
	public void arrivalInsert(Arrival a) {
		int result = invenManagementDao.arrivalInsert(sqlSession, a);
		
		if(result < 0) {
			throw new CommException("입고 등록에 실패했습니다.");
		}
		
	}

	@Override
	public int todayArrivalCount(String date) {
		// TODO Auto-generated method stub
		return invenManagementDao.todayArrivalCount(sqlSession, date);
	}

	@Override
	public ArrayList<Arrival> todayArrivalList(PageInfo pi, String date) {
		// TODO Auto-generated method stub
		return invenManagementDao.todayArrivalList(sqlSession, pi, date);
	}


	@Override
	public void releaseInsert(Release r) {
		int result = invenManagementDao.releaseInsert(sqlSession, r);
		
		if(result < 0) {
			throw new CommException("입고 등록에 실패했습니다.");
		}
		
		
		
	}

	@Override
	public int todayReleaseCount(String date) {
		// TODO Auto-generated method stub
		return invenManagementDao.todayReleaseCount(sqlSession, date);
	}

	@Override
	public ArrayList<Release> todayReleaseList(PageInfo pi, String date) {
		// TODO Auto-generated method stub
		return invenManagementDao.todayReleaseList(sqlSession, pi, date);
	}

	@Override
	public int invenListCount() {
		// TODO Auto-generated method stub
		return invenManagementDao.invenListCount(sqlSession);
	}

	@Override
	public ArrayList<Snack> invenList(PageInfo pi) {
		// TODO Auto-generated method stub
		return invenManagementDao.invenList(sqlSession, pi);
	}

	@Override
	public int sNoSearchCount(int search) {
		// TODO Auto-generated method stub
		return invenManagementDao.sNoSearchCount(sqlSession, search);
	}

	@Override
	public ArrayList<Snack> sNoSearch(PageInfo pi, int search) {
		// TODO Auto-generated method stub
		return invenManagementDao.sNoSearch(sqlSession, pi, search);
	}

	@Override
	public int sNameSearchCount(String search) {
		// TODO Auto-generated method stub
		return invenManagementDao.sNameSearchCount(sqlSession, search);
	}

	@Override
	public ArrayList<Snack> sNameSearch(PageInfo pi, String search) {
		// TODO Auto-generated method stub
		return invenManagementDao.sNameSearch(sqlSession, pi, search);
	}

	@Override
	public Snack invenDetail(int snackNo) {
		// TODO Auto-generated method stub
		return invenManagementDao.invenDetail(sqlSession, snackNo);
	}

	@Override
	public ProductAttachment invenDetailAttach(int snackNo) {
		// TODO Auto-generated method stub
		return invenManagementDao.invenDetailAttach(sqlSession, snackNo);
	}

	@Override
	public ArrayList<Chart> snackChart() {
		// TODO Auto-generated method stub
		return invenManagementDao.snackChart(sqlSession);
	}

	@Override
	public int checkAmount(int snackNo) {
		// TODO Auto-generated method stub
		return invenManagementDao.checkAmount(sqlSession, snackNo);
	}

	@Override
	public int checkSnackNo(int snackNo) {
		// TODO Auto-generated method stub
		return invenManagementDao.checkSnackNo(sqlSession, snackNo);
	}

	@Override
	public String getsnackName(int snackNo) {
		// TODO Auto-generated method stub
		return invenManagementDao.getsnackName(sqlSession, snackNo);
	}

	
	
	

}

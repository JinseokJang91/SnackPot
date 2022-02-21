package com.kh.spring.product.model.service;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.spring.product.arrival.model.vo.Arrival;
import com.kh.spring.product.model.vo.Chart;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.ProductAttachment;
import com.kh.spring.product.model.vo.Snack;
import com.kh.spring.product.release.model.vo.Release;
import com.kh.spring.qna.model.vo.PageInfo;

public interface InvenManagementService {

	void insertSnack(Product p);

	void insertSnackAttach(ProductAttachment pa);

	void arrivalInsert(Arrival a);

	int todayArrivalCount(String date);

	ArrayList<Arrival> todayArrivalList(PageInfo pi, String date);

	int todayReleaseCount(String date);

	ArrayList<Release> todayReleaseList(PageInfo pi, String date);

	void releaseInsert(Release r);

	int invenListCount();

	ArrayList<Snack> invenList(PageInfo pi);

	int sNoSearchCount(int search);

	ArrayList<Snack> sNoSearch(PageInfo pi, int search);

	int sNameSearchCount(String search);

	ArrayList<Snack> sNameSearch(PageInfo pi, String search);

	Snack invenDetail(int snackNo);

	ProductAttachment invenDetailAttach(int snackNo);

	ArrayList<Chart> snackChart();

	int checkAmount(int snackNo);

	int checkSnackNo(int snackNo);

	String getsnackName(int snackNo);

	
	

}

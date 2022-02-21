package com.kh.spring.snack.snackSubs.model.service;

import java.util.ArrayList;

import com.kh.spring.product.model.vo.Aroma;
import com.kh.spring.product.model.vo.SnackSubCategory;
import com.kh.spring.product.model.vo.Taste;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

public interface SnackSubsService {

	ArrayList<SnackSubCategory> selectSubCategory(int categoryNo);
	
	ArrayList<Aroma> selectAroma();

	ArrayList<Taste> selectTaste();

	void insertSnackSubs(SnackSubs snackSubs);

	SnackSubs selectSubsInfo(String comCode);

	void updateSnackSubs(SnackSubs snackSubs);

	void cancelSnackSubs(int subsNo, String comCode);

	int checkSubsDup(String comCode);


}

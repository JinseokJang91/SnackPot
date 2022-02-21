package com.kh.spring.snack.snackList.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.common.PageInfo;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.WishListDtail;
import com.kh.spring.snack.snackList.model.vo.ComListInfo;
import com.kh.spring.snack.snackList.model.vo.SearchList;
import com.kh.spring.snack.snackList.model.vo.SearchSnack;
import com.kh.spring.snack.snackList.model.vo.SnackDList;
import com.kh.spring.snack.snackList.model.vo.SnackList;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

public interface HoSnackListService {

	ArrayList<ComListInfo> selectSubsInfo(HashMap map);

	int listCheck(String comCode);

	ArrayList<Product> searchSnack(SearchSnack search);

	int selectSnackListNo(String comCode);

	ArrayList<SnackDList> selectSnackDList(int listNo);

	void insertSanckList(String comCode);

	ArrayList<SnackDList> selectSnack(SnackSubs subs);

	void insertSnackDList(ArrayList<SnackDList> dList);

	int selectTotalPrice(int listNo);

	void deleteSnackDList(int listNo);

	void deleteSnackDNo(String snackDNoCheck);

	void addSanckDList(SnackDList snackD);

	int checkSnackDup(SnackDList sncakD);

	void updateSnackAmount(SnackDList snackD);

	ArrayList<WishListDtail> selectWishList(ComListInfo info);
	
	void insertOrder(ComListInfo schedule);

	ArrayList<SnackList> selectSendingList(HashMap map, PageInfo pi);

	SnackList selectSnackList(int snackListNo);

	int selectOrderNo();

	ArrayList<SnackList> searchSendingList(SearchList searchList, PageInfo pi);

	ArrayList<SnackDList> selectWish(ComListInfo info);

	int selectListCount(HashMap map);

	int selectSearchListCount(SearchList searchList);



}

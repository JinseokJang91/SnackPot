package com.kh.spring.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.product.arrival.model.vo.Arrival;
import com.kh.spring.product.model.vo.Chart;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.product.model.vo.ProductAttachment;
import com.kh.spring.product.model.vo.Snack;
import com.kh.spring.product.release.model.vo.Release;
import com.kh.spring.qna.model.vo.PageInfo;

@Repository
public class InvenManagementDao {

	public int insertSnack(SqlSessionTemplate sqlSession, Product p) {
		// TODO Auto-generated method stub
		return sqlSession.insert("invenMapper.insertSnack", p);
	}

	public int insertSnackAttach(SqlSessionTemplate sqlSession, ProductAttachment pa) {
		// TODO Auto-generated method stub
		return sqlSession.insert("invenMapper.insertSnackAttach", pa);
	}

	public int arrivalInsert(SqlSessionTemplate sqlSession, Arrival a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("invenMapper.arrivalInsert", a);
	}

	public int todayArrivalCount(SqlSessionTemplate sqlSession, String date) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("invenMapper.todayArrivalCount", date);
	}

	public ArrayList<Arrival> todayArrivalList(SqlSessionTemplate sqlSession, PageInfo pi, String date) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("invenMapper.todayArrivalList", date, rowBounds);
	}

	public int todayReleaseCount(SqlSessionTemplate sqlSession, String date) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("invenMapper.todayReleaseCount", date);
	}

	public ArrayList<Release> todayReleaseList(SqlSessionTemplate sqlSession, PageInfo pi, String date) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("invenMapper.todayReleaseList", date, rowBounds);
	}

	public int releaseInsert(SqlSessionTemplate sqlSession, Release r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("invenMapper.releaseInsert", r);
	}

	public int invenListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("invenMapper.invenListCount");
	}

	public ArrayList<Snack> invenList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("invenMapper.invenList", null, rowBounds);
	}

	public int sNoSearchCount(SqlSessionTemplate sqlSession, int search) {
		
		
		return sqlSession.selectOne("invenMapper.sNoSearchCount", search);
	}

	public ArrayList<Snack> sNoSearch(SqlSessionTemplate sqlSession, PageInfo pi, int search) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("invenMapper.sNoSearch", search, rowBounds);
	}

	public int sNameSearchCount(SqlSessionTemplate sqlSession, String search) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("invenMapper.sNameSearchCount", search);
	}

	public ArrayList<Snack> sNameSearch(SqlSessionTemplate sqlSession, PageInfo pi, String search) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("invenMapper.sNameSearch", search, rowBounds);
	}

	public Snack invenDetail(SqlSessionTemplate sqlSession, int snackNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("invenMapper.invenDetail", snackNo);
	}

	public ProductAttachment invenDetailAttach(SqlSessionTemplate sqlSession, int snackNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("invenMapper.invenDetailAttach", snackNo);
	}

	public ArrayList<Chart> snackChart(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("invenMapper.snackChart");
	}

	public int checkAmount(SqlSessionTemplate sqlSession, int snackNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("invenMapper.checkAmount", snackNo);
	}

	public int checkSnackNo(SqlSessionTemplate sqlSession, int snackNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("invenMapper.checkSnackNo", snackNo);
	}

	public String getsnackName(SqlSessionTemplate sqlSession, int snackNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("invenMapper.getsnackName", snackNo);
	}

	
	
	
	

}

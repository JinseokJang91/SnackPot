package com.kh.spring.snack.snackSubs.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.product.model.vo.Aroma;
import com.kh.spring.product.model.vo.SnackSubCategory;
import com.kh.spring.product.model.vo.Taste;
import com.kh.spring.snack.snackSubs.model.vo.SnackSubs;

@Repository
public class SnackSubsDao {

	public ArrayList<SnackSubCategory> selectSubCategory(SqlSessionTemplate sqlSession, int categoryNo) {
		return (ArrayList)sqlSession.selectList("snackCategoryMapper.selectSubCategory", categoryNo);
	}

	public ArrayList<Aroma> selectAroma(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("snackCategoryMapper.selectAroma");
	}

	public ArrayList<Taste> selectTaste(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("snackCategoryMapper.selectTaste");
	}

	public int insertSnackSubs(SqlSessionTemplate sqlSession, SnackSubs snackSubs) {
		return sqlSession.insert("snackSubsMapper.insertSnackSubs", snackSubs);
	}

	public SnackSubs selectSubsInfo(SqlSessionTemplate sqlSession, String comCode) {
		return sqlSession.selectOne("snackSubsMapper.selectSubsInfo", comCode);
	}

	public int updateSnackSubs(SqlSessionTemplate sqlSession, SnackSubs snackSubs) {
		return sqlSession.update("snackSubsMapper.updateSnackSubs", snackSubs);
	}

	public int cancelSnackSubs(SqlSessionTemplate sqlSession, int subsNo) {
		return sqlSession.update("snackSubsMapper.cancelSnackSubs", subsNo);
	}

	public int checkSubsDup(SqlSessionTemplate sqlSession, String comCode) {
		return sqlSession.selectOne("snackSubsMapper.checkSubsDup", comCode);
	}



	
	
	
}

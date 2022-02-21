package com.kh.spring.qna.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.qna.model.vo.QnaAttachment;


@Repository
public class QnaDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaMapper.selectListCount");
		
	}

	public ArrayList<Qna> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList", null, rowBounds);
	}

	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qnaMapper.insertQna", q);
	}

	public int insertQnaAttachment(SqlSessionTemplate sqlSession, QnaAttachment qa) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qnaMapper.insertQnaAttachment", qa);
	}

	public Qna detailQna(SqlSessionTemplate sqlSession, int qno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaMapper.detailQna", qno);
	}

	public int deleteQna(SqlSessionTemplate sqlSession, int qno) {
		// TODO Auto-generated method stub
		return sqlSession.update("qnaMapper.deleteQna", qno);
	}

	public int updateQna(SqlSessionTemplate sqlSession, Qna q) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qnaMapper.updateQna", q);
	}

	public int answerInsert(SqlSessionTemplate sqlSession, Qna q) {
		// TODO Auto-generated method stub
		return sqlSession.update("qnaMapper.answerInsert",q);
	}

}

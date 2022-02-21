package com.kh.spring.qna.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.qna.model.dao.QnaDao;
import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.qna.model.vo.QnaAttachment;


@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private QnaDao qnaDao;

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return qnaDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Qna> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return qnaDao.selectList(sqlSession, pi);
	}

	@Override
	public void insertQna(Qna q) {
		int result = qnaDao.insertQna(sqlSession, q);
		
		if(result < 0) {
			throw new CommException("게시글 등록에 실패했습니다.");
		}
	}

	@Override
	public void insertQnaAttachment(QnaAttachment qa) {
		int result = qnaDao.insertQnaAttachment(sqlSession, qa);
		
		if(result < 0) {
			throw new CommException("첨부파일 등록에 실패했습니다.");
		}
	}

	@Override
	public Qna detailQna(int qno) {
		// TODO Auto-generated method stub
		return qnaDao.detailQna(sqlSession, qno);
	}

	@Override
	public void deleteQna(int qno) {
		int result = qnaDao.deleteQna(sqlSession, qno);
		
		if(result < 0) {
			throw new CommException("삭제에 실패했습니다.");
		}
	}

	@Override
	public void updateQna(Qna q) {
		int result = qnaDao.updateQna(sqlSession, q);
		
		if(result < 0) {
			throw new CommException("게시글 수정에 실패했습니다.");
		}
		
	}

	@Override
	public void answerInsert(Qna q) {
		int result = qnaDao.answerInsert(sqlSession, q);
		
		if(result < 0) {
			throw new CommException("답변 등록에 실패했습니다.");
		}
		
	}
	
	
}

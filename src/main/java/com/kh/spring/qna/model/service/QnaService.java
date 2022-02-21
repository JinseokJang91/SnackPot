package com.kh.spring.qna.model.service;

import java.util.ArrayList;

import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.qna.model.vo.QnaAttachment;


public interface QnaService {

	int selectListCount();

	ArrayList<Qna> selectList(PageInfo pi);

	void insertQna(Qna q);

	void insertQnaAttachment(QnaAttachment qa);

	Qna detailQna(int qno);

	void deleteQna(int qno);

	void updateQna(Qna q);

	void answerInsert(Qna q);
	

}

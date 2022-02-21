package com.kh.spring.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.community.model.dao.CommunityDao;
import com.kh.spring.community.model.vo.Community;
import com.kh.spring.community.model.vo.ComtyAttachment;
import com.kh.spring.community.model.vo.Reply;
import com.kh.spring.qna.model.vo.PageInfo;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private CommunityDao cmntDao;
	
	@Override
	public int selectListCount(String comCode) {
		return cmntDao.selectListCount(sqlSession , comCode);
	}

	
	@Override
	public ArrayList<Community> selectList(PageInfo pi, Community cmnt) {
		
		return cmntDao.selectList(sqlSession , pi , cmnt); 
	}

	
	@Override
	public ArrayList<Community> selectTopList(String comCode) {
		
		return cmntDao.selectTopList(sqlSession , comCode); 
	}

	
	@Override
	public void insertCommunity(Community cmnt) {
		
		cmntDao.insertCommunity(sqlSession , cmnt);
		
	}
	

	@Override
	public Community selectDetailCmnt(int cno) {
		
		return cmntDao.selectDetailCmnt(sqlSession , cno); 
	}

	@Override
	public void updateCmnt(Community cmnt) {
		
		cmntDao.updateCmnt(sqlSession , cmnt);
	}


	@Override
	public int updateViews(int cno) {
		
		return cmntDao.updateViews(sqlSession , cno);
		
	}

	@Override
	public void updateRecommend(String cno) {
		
		cmntDao.updateRecommend(sqlSession , cno);
	}

	@Override
	public void updateNrecommend(String cno) {
		
		cmntDao.updateNrecommend(sqlSession , cno);
		
	}

	@Override
	public int selectCmntNo(String memId) {
	
		return cmntDao.selectCmntNo(sqlSession, memId);
	}


	@Override
	public void insertCommunityAttachment(ComtyAttachment att) {
	
		cmntDao.insertCommunityAttachment(sqlSession , att);
		
	}


	@Override
	public void updateAttachment(ComtyAttachment att) {
		cmntDao.updateAttachment(sqlSession, att);
		
	}

	@Override
	public void deleteCmnt(Community cmnt) {
		
		cmntDao.deleteCmnt(sqlSession , cmnt);
		
	}


	@Override
	public void deleteCmntAttachment(ComtyAttachment att) {
		cmntDao.deleteCmntAttachment(sqlSession , att);
		
	}


	@Override
	public ArrayList<Community> selectMyWriter(Community cmnt, PageInfo pi) {
		
		return cmntDao.selectMyWriter(sqlSession , cmnt , pi);
		
	}




	@Override
	public ArrayList<Community> selectSearchCmnt(PageInfo pi, Community cmnt) {
		
		return cmntDao.selectSearchCmnt(sqlSession , pi , cmnt); 
	}


	@Override
	public int selectWriterListCount(Community cmnt) {
		
		return cmntDao.selectWriterListCount(sqlSession , cmnt);
		
	}



	/*댓글===========================================================================================*/
	@Override
	public ArrayList<Reply> selectReplyList(int cmntNo) {
		
		return cmntDao.selectReplyList(sqlSession , cmntNo);
		
	}


	@Override
	public int selectMaxGroupNo(int cno) {
		
		return cmntDao.selectMaxGroupNo(sqlSession , cno);
		
	}


	@Override
	public int insertReply(Reply r) {
		
		return cmntDao.insertReply(sqlSession , r);
	}


	@Override
	public int selectReplyCount(int cno) {
		
		return cmntDao.selectReplyCount(sqlSession , cno);
	}


	@Override
	public int insertNewReply(Reply r) {
		
		return cmntDao.insertNewReply(sqlSession , r);
		
	}


	@Override
	public int deleteReply(Reply r) {

		return cmntDao.deleteReply(sqlSession , r);
	}


	@Override
	public int updateReply(Reply r) {
		
		return cmntDao.updateReply(sqlSession , r);
		
	}


	@Override
	public int selectDeptNo(int reGroup) {
		
		return cmntDao.selectDeptNo(sqlSession , reGroup);
	}


	@Override
	public int insertReReply(Reply r) {
		
		return cmntDao.insertReReply(sqlSession, r);
	}


	@Override
	public int CountComCode(String comCode) {
	
		return cmntDao.CountComCode(sqlSession , comCode);
	}


	@Override
	public int selectCount(Reply r) {
		
		return cmntDao.selectCount(sqlSession , r);
	}


	@Override
	public int updateReplyContent(Reply r) {
		
		return cmntDao.updateReplyContent(sqlSession , r);
	}




}

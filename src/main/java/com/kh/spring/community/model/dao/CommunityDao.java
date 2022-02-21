package com.kh.spring.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spring.community.model.vo.Community;
import com.kh.spring.community.model.vo.ComtyAttachment;
import com.kh.spring.community.model.vo.Reply;
import com.kh.spring.qna.model.vo.PageInfo;

@Repository
public class CommunityDao {


	public int selectListCount(SqlSession sqlSession, String comCode) {
		
		return sqlSession.selectOne("cmntMapper.selectListCount", comCode);
	}


	
	public ArrayList<Community> selectList(SqlSession sqlSession, PageInfo pi, Community cmnt) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("cmntMapper.selectList" , cmnt, rowBounds);
	}

	

	public ArrayList<Community> selectTopList(SqlSession sqlSession, String comCode) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("cmntMapper.selectTopList" , comCode);
	}


	public int selectWriterListCount(SqlSession sqlSession, Community cmnt) {
		
		return sqlSession.selectOne("cmntMapper.selectWriterListCount", cmnt);
	}
	

	public ArrayList<Community> selectMyWriter(SqlSession sqlSession, Community cmnt, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("cmntMapper.selectMyWriter" , cmnt, rowBounds);
		
	}

	
	public void insertCommunity(SqlSession sqlSession, Community cmnt) {
		
		sqlSession.insert("cmntMapper.insertCommunity" , cmnt);
		
	}


	public Community selectDetailCmnt(SqlSession sqlSession, int cno) {
		
		return sqlSession.selectOne("cmntMapper.selectDetailCmnt" , cno);
	}


	public void updateCmnt(SqlSession sqlSession, Community cmnt) {
		
		sqlSession.insert("cmntMapper.updateCmnt" , cmnt);
	}


	public int updateViews(SqlSession sqlSession, int cno) {
	
		return sqlSession.update("cmntMapper.updateViews" , cno);
		
	}

	public void updateRecommend(SqlSession sqlSession, String cno) {
		
		sqlSession.update("cmntMapper.updateRecommend" , cno);
		
	}

	public void updateNrecommend(SqlSession sqlSession, String cno) {
		sqlSession.update("cmntMapper.updateNrecommend" , cno);
	}
	
	public int selectCmntNo(SqlSession sqlSession, String memId) {
		
		return sqlSession.selectOne("cmntMapper.selectCmntNo" , memId);
	}


	public void insertCommunityAttachment(SqlSession sqlSession, ComtyAttachment att) {
		
		sqlSession.insert("cmntMapper.insertCommunityAttachment" , att);
		
	}


	public void updateAttachment(SqlSession sqlSession, ComtyAttachment att) {
		
		sqlSession.update("cmntMapper.updateAttachment" , att);
	}


	public void deleteCmnt(SqlSession sqlSession, Community cmnt) {
		
		sqlSession.update("cmntMapper.deleteCmnt" , cmnt);
	}

	public void deleteCmntAttachment(SqlSession sqlSession, ComtyAttachment att) {
		
		sqlSession.delete("cmntMapper.deleteCmntAttachment" , att);		
	}


	public ArrayList<Community> selectSearchCmnt(SqlSession sqlSession, PageInfo pi, Community cmnt) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("cmntMapper.selectSearchCmnt" , cmnt, rowBounds);
	}





	

	/*댓글===========================================================================================*/

	public ArrayList<Reply> selectReplyList(SqlSession sqlSession, int cmntNo) {
		
		return (ArrayList)sqlSession.selectList("cmntMapper.selectReplyList", cmntNo);
	}



	public int selectMaxGroupNo(SqlSession sqlSession, int cno) {
		
		return sqlSession.selectOne("cmntMapper.selectMaxGroupNo" , cno);
	}



	public int insertReply(SqlSession sqlSession, Reply r) {
		
		return sqlSession.insert("cmntMapper.insertReply" , r);
	}



	public int selectReplyCount(SqlSession sqlSession, int cno) {
		
		return sqlSession.selectOne("cmntMapper.selectReplyCount" , cno);
	}



	public int insertNewReply(SqlSession sqlSession, Reply r) {
		
		return sqlSession.insert("cmntMapper.insertNewReply" , r);
	}



	public int deleteReply(SqlSession sqlSession, Reply r) {
		
		return sqlSession.delete("cmntMapper.deleteReply" , r);
	}

	public int updateReply(SqlSession sqlSession, Reply r) {
		
		return	sqlSession.update("cmntMapper.updateRely" , r);
		
	}



	public int selectDeptNo(SqlSession sqlSession, int reGroup) {
		
		return sqlSession.selectOne("cmntMapper.selectDeptNo" , reGroup);
		
	}



	public int insertReReply(SqlSession sqlSession, Reply r) {
		
		return sqlSession.insert("cmntMapper.insertReReply" , r);
	}



	public int CountComCode(SqlSession sqlSession, String comCode) {
		
		return sqlSession.selectOne("cmntMapper.CountComCode" , comCode);
	}



	public int selectCount(SqlSession sqlSession, Reply r) {

		return sqlSession.selectOne("cmntMapper.selectCount" , r);
	}



	public int updateReplyContent(SqlSession sqlSession, Reply r) {
		
		return sqlSession.update("cmntMapper.updateReplyContent" , r);
	}

















}

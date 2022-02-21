package com.kh.spring.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.community.model.vo.Community;
import com.kh.spring.community.model.vo.ComtyAttachment;
import com.kh.spring.community.model.vo.Reply;
import com.kh.spring.qna.model.vo.PageInfo;

public interface CommunityService {

	int selectListCount(String comCode);

	int selectCmntNo(String memId);

	void insertCommunityAttachment(ComtyAttachment att);
	
	ArrayList<Community> selectList(PageInfo pi, Community cmnt);

	void insertCommunity(Community cmnt);

	Community selectDetailCmnt(int cno);

	int updateViews(int cno);

	void updateRecommend(String cno);

	void updateNrecommend(String cno);

	ArrayList<Reply> selectReplyList(int cmntNo);

	void updateCmnt(Community cmnt);

	void updateAttachment(ComtyAttachment att);

	void deleteCmnt(Community cmnt);

	void deleteCmntAttachment(ComtyAttachment att);

	ArrayList<Community> selectTopList(String comCode);

	ArrayList<Community> selectMyWriter(Community cmnt, PageInfo pi);

	ArrayList<Community> selectSearchCmnt(PageInfo pi, Community cmnt);

	int selectWriterListCount(Community cmnt);

	int selectMaxGroupNo(int  cno);

	int insertReply(Reply r);

	int selectReplyCount(int cno);

	int insertNewReply(Reply r);

	int deleteReply(Reply r);

	int updateReply(Reply r);

	int selectDeptNo(int reGroup);

	int insertReReply(Reply r);

	int CountComCode(String comCode); //회사에 게시글이 있는지 없는지부터

	int selectCount(Reply r);

	int updateReplyContent(Reply r);

	










	



	





	
	

}

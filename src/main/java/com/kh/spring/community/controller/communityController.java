package com.kh.spring.community.controller;

import java.awt.List;
import java.io.File;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.attachment.AttachmentMarshaller;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.GsonBuilder;
import com.kh.spring.community.model.service.CommunityService;
import com.kh.spring.community.model.vo.Community;
import com.kh.spring.community.model.vo.ComtyAttachment;
import com.kh.spring.community.model.vo.Reply;
import com.kh.spring.companyMember.model.vo.CompanyMember;
import com.kh.spring.product.model.vo.Product;
import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.Pagination;

@Controller
public class communityController {
	
	@Autowired
	private CommunityService cmntService;
	
	@RequestMapping("list.cm") 
	public String selectCommunityList(Community cmnt , Model model ,@RequestParam(value="currentPage" ,required=false , defaultValue="1") int currentPage , HttpSession session) {
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String comCode = loginUser.getComCode();
		cmnt.setComCode(comCode);
		//1. 회사커뮤니티 글이 있는지 봐야한다
		int comCodeChk = cmntService.CountComCode(comCode);
		
		if(comCodeChk == 0) {
			return "company/community/newcommunityMainView";
		}else {
		
		int listCount = cmntService.selectListCount(comCode);
//		System.out.println("listCount글 갯수 : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Community> list = cmntService.selectList(pi , cmnt);
		ArrayList<Community> topList = cmntService.selectTopList(comCode); //인기글 가져오기
		
//		System.out.println("topList *****" + topList);
		System.out.println("list====> " + list);
		
		model.addAttribute("list" , list);
		model.addAttribute("topList" , topList);
		model.addAttribute("pi" , pi);
		
		return "company/community/communityMainView";	
		}
	}
	// 내가쓴글 보기
	@RequestMapping("myWriter.cm") //페이징처리 다시해야함 -- >페이지 따로 안만들어 줘도 될꺼같음
	public String selectMyWriter(Community cmnt , Model model , HttpSession session ,
								@RequestParam(value="currentPage" ,required=false , defaultValue="1") int currentPage ) {
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String memId = loginUser.getMemId();
		String comCode = loginUser.getComCode();
		cmnt.setWriter(memId);
		cmnt.setComCode(comCode);
		
		int listCount = cmntService.selectWriterListCount(cmnt);
		//System.out.println("내가쓴글 갯수 : " + listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Community> list = cmntService.selectMyWriter(cmnt , pi);
		model.addAttribute("list" , list);
		model.addAttribute("pi" , pi);
		
		System.out.println("내가쓴글======" + list);
		
		return "company/community/communityMyWriter";
	}
	
	//제목검색
	@RequestMapping("search.cm")   
	public String selectSearchCmnt(@RequestParam(value="title", required=false) String title , Community cmnt , HttpSession session , Model model ,
								   @RequestParam(value="currentPage" ,required=false , defaultValue="1") int currentPage) {
		
		System.out.println("검색한 제목은??--->" + title); 
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String comCode = loginUser.getComCode();
		cmnt.setComCode(comCode);
		cmnt.setTitle(title);
		
		
		int listCount = cmntService.selectListCount(comCode);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 7);
		
		ArrayList<Community> list = cmntService.selectSearchCmnt(pi , cmnt);
		System.out.println("제목에 들어간거 검색 리스트확인=====>" + list);
		
		model.addAttribute("list" , list);
		model.addAttribute("pi" , pi);
	
		ArrayList<Community> topList = cmntService.selectTopList(comCode);
		model.addAttribute("topList" , topList);
	
		return "company/community/communitySearchView";
		
	}
	
	
	
	@RequestMapping("enrollForm.cm")
	public String enrollForm() {
		return "company/community/communityEnrollForm";
	}
	
	@RequestMapping("insert.cm")// 
	public String insertContent( Community cmnt,  String title , String seContent ,HttpSession session, ComtyAttachment att,
			@RequestParam(name="uploadFile", required = false) MultipartFile file , HttpServletRequest request) {
				
	
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload_files/cmntAttachment/");
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String memId = loginUser.getMemId();
		String comCode = loginUser.getComCode();
		cmnt.setContent(seContent);
		cmnt.setTitle(title);
		cmnt.setWriter(memId);
		cmnt.setComCode(comCode);
		
		if(!file.getOriginalFilename().equals("")) { //첨부파일이 있으면 				  

			String changeName = saveFile(file, request);			
			
			if(changeName != null) {
				att.setOriginName(file.getOriginalFilename());
				att.setChangeName(changeName);
				att.setFilePath(savePath);
			}	
				cmntService.insertCommunity(cmnt);
				int cmntNo = cmntService.selectCmntNo(memId);
				att.setCommunityNo(cmntNo);
				cmntService.insertCommunityAttachment(att);
		}else {// 첨부파일이 없다면
		
			cmntService.insertCommunity(cmnt);
			
		}
		

		return "redirect:list.cm";
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
	
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload_files/cmntAttachment/");
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;					
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (Exception e) {
			System.out.println("파일 업로드 실패");
		}
		
		return changeName;
	}

	@RequestMapping("detail.cm")
	public String selectDetailCmnt(int cno , Model model ) {
		//조회수 올리기
		int result = cmntService.updateViews(cno);
		
		Community dlist = cmntService.selectDetailCmnt(cno);
		model.addAttribute("dlist" , dlist);
		System.out.println("dlist -----> " + dlist);
		
		return "company/community/communityDetailView";
	}
	
	//수정폼으로
	@RequestMapping("updateForm.cm")
	public String updateCmntForm(int cno , Model model) {
		System.out.println("커뮤니티 업데이트할 번호 : " + cno);
		
		Community ulist = cmntService.selectDetailCmnt(cno); 
		model.addAttribute("ulist" , ulist );
		System.out.println("ulist======================>" + ulist);
		
		return "company/community/communityUpdateForm";
		
	}
	
	//게시글 수정
	@RequestMapping("update.cm")
	public String updateCmnt(Community cmnt , int cno , String seContent , String title, ComtyAttachment att, 
			@RequestParam(name="reuploadFile", required = false) MultipartFile file , HttpServletRequest request ,
			RedirectAttributes ra) {
		
		cmnt.setContent(seContent); //내용 , 제목 , 첨부파일
		cmnt.setCommunityNo(cno);
		cmnt.setTitle(title);
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload_files/cmntAttachment/");
		
		if(!file.getOriginalFilename().equals("")) {//파일을 새로 첨부했다
			
			if(cmnt.getChangeName() != null) { //근데 이미 파일이 있었디 (기존파일)
				deleteFile(cmnt.getChangeName(), request); //파일을 삭제해준다
				
				String changeName = saveFile(file , request); //새로 첨부한 파일을 savefile로 만들어준다
				
				att.setOriginName(file.getOriginalFilename());
				att.setChangeName(changeName);
				att.setCommunityNo(cno);
				
				cmntService.updateCmnt(cmnt);
				cmntService.updateAttachment(att);
			}else {
				String changeName = saveFile(file , request); //새로 첨부한 파일을 savefile로 만들어준다
				
				att.setOriginName(file.getOriginalFilename());
				att.setChangeName(changeName);
				att.setCommunityNo(cno);
				
				cmntService.updateCmnt(cmnt);
				cmntService.insertCommunityAttachment(att);
				
			}
		
		}else {
			
		cmntService.updateCmnt(cmnt);
	
		}
		ra.addAttribute("cno" , cno);
		
		return "redirect:detail.cm";
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload_files/cmntAttachment/");
			
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}
	
	//게시글 삭제하기
	@RequestMapping("delete.cm")
	public String deleteCmnt(Community cmnt , ComtyAttachment att,   int cno) {
		cmnt.setCommunityNo(cno);
		att.setCommunityNo(cno);
		
		cmntService.deleteCmnt(cmnt);
		cmntService.deleteCmntAttachment(att);
		
		return "redirect:list.cm";
	}
	
	 
	//추천
	@RequestMapping("plusCount.recommend")
	 public void updateRecommend(@RequestParam("cno") String cno ) {
		//System.out.println("추천할 게시글 번호는?? : " + cno);
		
		cmntService.updateRecommend(cno);
	}
	//비추천
	@RequestMapping("plusCount.n_recommend")
	 public void updateNrecommend(@RequestParam("cno") String cno ) {
		
		cmntService.updateNrecommend(cno);
	}
	
	/*=================댓글===============================================================================*/	
	
	//댓글 리스트 
	@ResponseBody
	@RequestMapping(value="reList.cm" , produces = "application/json; charset=utf-8")
	public String selectReplyList(@RequestParam int cno , HttpSession session) {
		
		System.out.println("cno =====>" +  cno);
		ArrayList<Reply> list = cmntService.selectReplyList(cno);
		System.out.println("댓글 리스트? : " + list);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 ").create().toJson(list); 

	}
	
	//댓글 달기
	@ResponseBody
	@RequestMapping(value="reinsert.cm" )
	public String insertReply(Reply r , @RequestParam int  cno) {
		System.out.println("[r]" + r);
		//0. 글번호에 총 답글 갯수를 가져와서 0 이면 insert 
		int reCount = cmntService.selectReplyCount(cno);
		
		if(reCount == 0) {
			//그냥 insert해준다
			r.setCommunityNo(cno);
			int result = cmntService.insertNewReply(r);
			return String.valueOf(result); 
		}else {
		//1. re_Group의 마지막 번호를 가져와야한다 (cno를 기준으로)
		int count = cmntService.selectMaxGroupNo(cno);

		//2. re_Group에 +1 을 해주고 insert해준다 
		int reGroup = count+1;
		System.out.println("reGroup : " + reGroup);
		r.setReGroup(reGroup);
		r.setCommunityNo(cno);
		
		int result = cmntService.insertReply(r);
		return String.valueOf(result); 
	
		}
	}
	
	//댓글 삭제
	@RequestMapping(value="deleteReply.cm")
	public int deleteReply(Reply r , int cno , int reGroup) {
		
		r.setCommunityNo(cno);
		r.setReGroup(reGroup);
		
		//부모댓글에 달린 답글의 갯수
		int count = cmntService.selectCount(r); 
			
		if(count == 0) { //답글이 없다면 바로 댓글 삭제
			return cmntService.deleteReply(r);
			
		}else { //답글이 있다면  댓글 content에  '-1' 넣기
			return cmntService.updateReplyContent(r);
		}
	
	}
	//댓글수정
	@ResponseBody   
	@RequestMapping(value="reupdate.cm" , produces = "application/json; charset=utf-8")
	public int updateReply(Reply r) {
		
		System.out.println("업데이트할 댓글 : " + r);
		
		return cmntService.updateReply(r);
		
	}
	//답글수정
	@ResponseBody 
	@RequestMapping(value="insertReReply.cm" , produces = "application/json; charset=utf-8")
	public int insertReReply(Reply r , String reRecontent , int reGroup , int cmntNo , HttpSession session) {
		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");
		String memId = loginUser.getMemId();
		
		//1. re_no를 통해 re_group과  re_groupdept를 알아온다
		int deptNo = cmntService.selectDeptNo(reGroup);
		int lastReGroupDeptNo = deptNo +1;
		
		r.setCommunityNo(cmntNo);
		r.setReContent(reRecontent);
		r.setReGroup(reGroup);
		r.setReGroupDept(lastReGroupDeptNo);
		r.setReWriter(memId);
		return cmntService.insertReReply(r);
		
	}
	
	//답글삭제
	@ResponseBody
	@RequestMapping(value="deleteReReply.cm" , produces = "application/json; charset=utf-8")
	public int deleteReReply(Reply r ) {
		
		//System.out.println("삭제할  답글 r :" + r);
	
		return cmntService.deleteReply(r);
		
	}
	
	
}
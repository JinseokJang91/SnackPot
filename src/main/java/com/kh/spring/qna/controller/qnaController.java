package com.kh.spring.qna.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.companyMember.model.vo.CompanyMember;
import com.kh.spring.qna.model.service.QnaService;
import com.kh.spring.qna.model.vo.PageInfo;
import com.kh.spring.qna.model.vo.Pagination;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.qna.model.vo.QnaAttachment;

@Controller
public class qnaController {

	@Autowired
	private QnaService qnaService;

	// 문의 게시판 리스트 조회
	@RequestMapping("list.qna")
	private String qnaList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {

		int listCount = qnaService.selectListCount();
		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Qna> list = qnaService.selectList(pi);
		
		SimpleDateFormat fomat = new SimpleDateFormat("yyyy년 MM월 dd일");

		
		for( Qna q : list){
			
		q.setViewDate(fomat.format(q.getCreateDate())); 
		System.out.println(q.getViewDate());
			
		}

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "qnaBoard/qnaBoardList";
	}

	@RequestMapping("enrollForm.qna")
	private String EnrollForm() {

		return "qnaBoard/qnaEnrollForm";
	}

	@RequestMapping("insert.qna")
	private String insertQna(Qna q, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		
		CompanyMember loginUser = (CompanyMember) session.getAttribute("loginUser");

		q.setWriter(loginUser.getMemId());
		QnaAttachment qa = new QnaAttachment();
		if (!file.getOriginalFilename().equals("")) {

			qa = saveFile(file, request);
			q.setChangeName(qa.getChangeName());
			qnaService.insertQnaAttachment(qa);
			

		}

		qnaService.insertQna(q);

		

		model.addAttribute("msg", "게시글 등록이 완료되었습니다.");
		model.addAttribute("url", "/list.qna");

		return "common/alert";
	}
	
	private QnaAttachment saveFile(MultipartFile file, HttpServletRequest request) {

		QnaAttachment qa = new QnaAttachment();

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "/upload_files/qnaAttachment/";

		System.out.println("savePath : " + savePath);

		String originName = file.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ext;

		System.out.println(changeName);

		try {
			file.transferTo(new File(savePath + changeName));
			qa.setChangeName(changeName);
			qa.setFilePath(savePath);
			qa.setOriginName(originName);

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file upload error");
		}

		return qa;
	}
	
	@RequestMapping("detail.qna")
	private ModelAndView detailQna(int qno, ModelAndView mv) {
		

		Qna q = qnaService.detailQna(qno);

		SimpleDateFormat fomat = new SimpleDateFormat("yyyy년 MM월 dd일 HH : MM");
		
		q.setViewDate(fomat.format(q.getCreateDate()));
		
		mv.addObject("q", q).setViewName("qnaBoard/qnaDetailView");
		
		return mv;
	}
	
	@RequestMapping("updateForm.qna")
	private ModelAndView updateForm(int qno, ModelAndView mv) {
		
		Qna q = qnaService.detailQna(qno);
		

		mv.addObject("q", q).setViewName("qnaBoard/qnaUpdateForm");
		
		return mv;
	}
	
	
	@RequestMapping("delete.qna")
	private String deleteQna(int qno, ModelAndView mv, Model model) {
		
		System.out.println(qno);
		
		qnaService.deleteQna(qno);
		
		
		model.addAttribute("msg", "게시글이 삭제되었습니다.");
		model.addAttribute("url", "/list.qna");

		return "common/alert";
	}
	
	
	@RequestMapping("update.qna")
	public ModelAndView updateQna(Qna q, HttpServletRequest request, ModelAndView mv, 
			@RequestParam(name="reUploadFile", required = false) MultipartFile file) {
		
		
		QnaAttachment qa = new QnaAttachment();
		if(!file.getOriginalFilename().equals("")) {
			
			//String changeName = saveFile(file, request);
			if(q.getChangeName() != null) {
				deleteFile(q.getChangeName(), request);
				
			}
			
			qa = saveFile(file, request);
			
			q.setChangeName(qa.getChangeName());
			qnaService.insertQnaAttachment(qa);
			
		}
		
		qnaService.updateQna(q);
	
		
		
		mv.addObject("qno", q.getQNo()).setViewName("redirect:detail.qna");
		
		return mv;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "/upload_files/qnaAttachment/";
		
		System.out.println("savePath : " + savePath);
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
		
	}
	
	@RequestMapping("answerForm.qna")
	public ModelAndView answerForm(int qno, ModelAndView mv) {
		
		Qna q = qnaService.detailQna(qno);
		
		SimpleDateFormat fomat = new SimpleDateFormat("yyyy년 MM월 dd일 HH : MM");
		
		q.setViewDate(fomat.format(q.getCreateDate()));

		
		mv.addObject("q", q).setViewName("qnaBoard/qnaAnswerForm");
		
		return mv;

	}
	
	@RequestMapping("answerInsert.qna")
	public String answerInsert(Qna q, Model model) {
		
		qnaService.answerInsert(q);
		
		System.out.println(q);
		

		model.addAttribute("msg", "답변이 등록되었습니다.");
		model.addAttribute("url", "/adminList.qna");

		return "common/alert";
	}
	
	@RequestMapping("adminList.qna")
	private String adminList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {

		int listCount = qnaService.selectListCount();
		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Qna> list = qnaService.selectList(pi);
		
		SimpleDateFormat fomat = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		for( Qna q : list){
			
		q.setViewDate(fomat.format(q.getCreateDate())); 
		System.out.println(q.getViewDate());
			
		}


		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "qnaBoard/qnaAdminList";
	}


}

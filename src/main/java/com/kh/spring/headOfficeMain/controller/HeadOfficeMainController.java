package com.kh.spring.headOfficeMain.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HeadOfficeMainController {
	
	@RequestMapping("mainPage.ho")
	public String headOfficeMainView() {
		return "headoffice/headOfficeMain";
	}

}

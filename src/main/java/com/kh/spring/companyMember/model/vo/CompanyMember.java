package com.kh.spring.companyMember.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class CompanyMember {
	
	private String memId;
	private String memPw;
	private String memName;
	private String memPhone;
	private String memEmail;
	private String comCode;
	private String admin;
	private String memStatus;
	private String comName;
	private String comAddress;
	
	public CompanyMember(String memId, String memPw, String memName, String memPhone, String memEmail, String comCode,
			String admin, String memStatus) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.comCode = comCode;
		this.admin = admin;
		this.memStatus = memStatus;
	}
	
	
}

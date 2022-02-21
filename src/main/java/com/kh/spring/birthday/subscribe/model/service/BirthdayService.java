package com.kh.spring.birthday.subscribe.model.service;

import com.kh.spring.birthday.subscribe.model.vo.Birthday;

public interface BirthdayService {

	int subscribe(Birthday b);

	Birthday subscribeInfo(String comCode);

	int subscribeChk(String com_code);

	int countEmp(String comCode);

	void updateSubscribe(Birthday b);

	void deleteSubscribe(String bservice_no);

}

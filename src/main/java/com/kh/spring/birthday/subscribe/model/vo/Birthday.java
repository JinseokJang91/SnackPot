package com.kh.spring.birthday.subscribe.model.vo;

import java.sql.Date;

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
public class Birthday {

	private String bservice_no;
	private String per_amount;
	private String sending_time;
	private String notification_msg;
	private String completion_msg;
	private Date settlement_date;
	private String bservice_status;
	private String com_code;
}

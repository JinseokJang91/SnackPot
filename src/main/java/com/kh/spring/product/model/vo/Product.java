package com.kh.spring.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product {
	
	private int snackNo; //간식번호
	private String snackName; //간식이름
	private int purchasePrice; //구매가
	private int releasePrice; //공급가
	private Date enrollDate; // 등록일
	private String status; // 상태
	private int stock; // 재고
	private String unit; // 단위
	private int categoryNo; // 카테고리번호
	private int detailNo; // 세부카테고리번호
	private int tasteNo; // 맛번호
	private int aromaNo; //향 번호
	private String changeName; //간식이미지
	
	
}

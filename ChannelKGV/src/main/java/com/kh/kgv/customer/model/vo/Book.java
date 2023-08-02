package com.kh.kgv.customer.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class Book {
	// 예매 테이블
	private int bookNo;
	private int playNo;
	private int userNo;
	private int movieNo;
	private String bookDt;
	private String bookAge;
	private String bookSeat;
	private int bookPrice;
	private String bookSt;
	private int totalRow;
}

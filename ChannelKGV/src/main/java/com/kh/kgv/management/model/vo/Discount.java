package com.kh.kgv.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class Discount {
	//  할인 테이블
	private int discountNo;
	private int bookNo;
	private String discountDay;
	private String discountTime;
	private String discountDate;
	private String discountRate;
}

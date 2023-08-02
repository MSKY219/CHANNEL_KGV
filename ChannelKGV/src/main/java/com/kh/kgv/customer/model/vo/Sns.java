package com.kh.kgv.customer.model.vo;

import com.kh.kgv.items.model.vo.Seat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class Sns {
	// SNS 테이블
	private int snsNo;
	private int userNo;
	private String snsCat;
	private String snsId;
}

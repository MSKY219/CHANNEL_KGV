package com.kh.kgv.items.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
// @Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString
// @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class PayOrder {
	// 장르 테이블
	private int reserveNo;
	private int bookNo;
	private String reserveCodeNo;
	private String reserveSt;
}

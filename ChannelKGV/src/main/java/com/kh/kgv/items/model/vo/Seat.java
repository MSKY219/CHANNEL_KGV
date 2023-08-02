package com.kh.kgv.items.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class Seat {
	// 좌석 테이블
	private int seatId;
	private String seatNumber;
	private String seatType;
	private int screenNo;
	private int spNo;
	private int daNo;
}

package com.kh.kgv.management.model.vo;

import com.kh.kgv.items.model.vo.SeatPrice;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class WeeklyEnter {
	//  주간 접속자 수 테이블
	private String today;
	private String lastWeek;
}

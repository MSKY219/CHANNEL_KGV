package com.kh.kgv.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class DailyEnter {
	//  일일 접속자 수 테이블
	private int deNo;
	private String deDate;
	private String deIp;
	private int deCount;
	private String deDateStr;
}

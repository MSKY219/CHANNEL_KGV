package com.kh.kgv.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class Ask {
	//  문의 테이블
	private int askNo;
	private int userNo;
	private String askTitle;
	private String askContent;
	private String askFile;
}

package com.kh.kgv.management.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class Benefits {
	// 혜택 테이블
	private int benefitsNo;
	private String benefitsTitle;
	private String benefitsContent;
	private String benefitsStart;
	private String benefitsEnd;
	private String benefitsStatus;
	private String benefitsReg;
	private String benefitsImg;
}

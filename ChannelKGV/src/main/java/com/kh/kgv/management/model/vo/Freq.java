package com.kh.kgv.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class Freq {
	//  자주 찾는 질문 테이블
	private int freqNo;
	private String freqTitle;
	private String freqContent;
	private String freqFile;
	private String freqRegDate;
	private String freqUploader;
	private String freqFixDate;
	private String freqChanger;
	private String freqStatus;
}

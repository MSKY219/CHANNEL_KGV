package com.kh.kgv.management.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class Manager {
	//  관리자 테이블
	private int managerNo;
	private String managerId;
	private String managerPw;
	private String managerName;
	private String managerProfile;
	
}

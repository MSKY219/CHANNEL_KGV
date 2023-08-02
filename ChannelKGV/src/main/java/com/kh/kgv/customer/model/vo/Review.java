package com.kh.kgv.customer.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class Review {
	// 후기 테이블
	private int revNo;
	private int movieNo;
	private int userNo;
	private String revContent;
	private String revSt;
	private int revLike;
	private String revDate;
	private String revTime;
	private String revFixed;
	private String userNick; 
	private int totalRow;
}

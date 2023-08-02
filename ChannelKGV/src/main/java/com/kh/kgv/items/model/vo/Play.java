package com.kh.kgv.items.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Play {
	// 현재 상영중인 영화 테이블
	private int playNo;
	private int movieNo;
	private int screenNo;
	private String playStart; // myPage 영화 시작 시간
	private String playEnd;	  // myPage 영화 끝나는 시간
	private String playRegDate;
	private String playUploader;
	private int playBookCount;
	private String playBookSeat;
	private String playDate; // myPage 영화 본 날짜
	private String playSt;
}

package com.kh.kgv.items.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class Movie {
	// 영화 테이블
	private int movieNo; // 번호
	private String movieRuntime; // 상영시간
	private String  movieTitle; // 제목
	private String movieNation; // 국가
	private String movieOpen; // 개봉일
	private String mgNo; // 영화 등급
	private String movieContent; // 내용
	private String movieDirector; // 감독
	private String movieCast;	// 출연진
	private int moviePlayed; // 상영  횟수
	private int movieWatched; // 본 사람 수
	private String movieRegdate; // 등록일
	private String movieUploader; // 등록자
	private String genreName; // 장르 이름
	private String movieImg1; // 메인 이미지
	private String movieImg2; // 추가 이미지 1
	private String movieImg3; // 추가 이미지 2
	private String movieImg4; // 추가 이미지 3
	private String movieImg5; // 추가 이미지 4
	private String movieImg6; // 추가 이미지 5
	private String movieSt; // 영화 상영 등록 상태
}

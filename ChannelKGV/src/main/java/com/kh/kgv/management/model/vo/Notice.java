package com.kh.kgv.management.model.vo;

import com.kh.kgv.items.model.vo.SeatPrice;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Data를 쓰면, @Getter @Setter @RequiredArgsConstructor @ToString @EqulasAndHashCode를 한번에 설정한다.
@NoArgsConstructor
@AllArgsConstructor

public class Notice {
	//  공지사항 테이블
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeRegDate;
	private String noticeUploader;
	private String noticeStatus;
	private int noticeView;
	}

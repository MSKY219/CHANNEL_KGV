package com.kh.kgv.items.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class TimeCheck {

	private String areaIndex;
	private String cinemaIndex;
	private int screenIndex;
	private int movieIndex;
	private int screenNo;
	private String timeIndex;
	private String startDate;
	private String endDate;
	private int startTime;
	private int endTime;
}

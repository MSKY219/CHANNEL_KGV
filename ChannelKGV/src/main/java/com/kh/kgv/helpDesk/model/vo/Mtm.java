package com.kh.kgv.helpDesk.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor
@AllArgsConstructor
public class Mtm {
	private int mtmNo;
	private String mtmTitle;
	private String mtmContent;
	private String mtmSt;
	private String mtmType;
	private int userNo;
	private String mtmImage;
	private String mtmRegdate;
	private int mtmCount;
	private String mtmWriter;
	private String mtmRepWriter;
	private String mtmRepSt;
	private String mtmRepContent;
	private String mtmRepDate;
	private int mtmPw;
}

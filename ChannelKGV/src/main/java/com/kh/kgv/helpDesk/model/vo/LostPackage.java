package com.kh.kgv.helpDesk.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LostPackage {

	private int lostNo;
	private int userNo;
	private String lostTitle;
	private String lostItem;
	private String lostLocation;
	private String lostDate;
	private String lostFile;
	private String lostContent;
	private String lostWriter;
	private int lostView;
	private String lostSt;
	private String lostRepWriter;
	private String lostRepSt;
	private String lostRepContent;
	private String lostRepDate;
	private int lostPw;

}

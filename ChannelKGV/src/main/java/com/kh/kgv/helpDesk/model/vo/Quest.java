package com.kh.kgv.helpDesk.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Quest {
	private int questNo;
	private String questType;
	private String questTitle;
	private String questContent;
	private String questSt; 
	private int questTn;
}

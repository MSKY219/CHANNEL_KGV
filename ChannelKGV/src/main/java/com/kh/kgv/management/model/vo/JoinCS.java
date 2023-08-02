package com.kh.kgv.management.model.vo;

import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.helpDesk.model.vo.LostPackage;
import com.kh.kgv.helpDesk.model.vo.Mtm;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JoinCS {
	// 고객센터용 JOIN
	private User user;
	private Mtm mtm;
	private LostPackage losts;
}

package com.kh.kgv.login.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.login.model.dao.SignUpDAO;

@Service
public class SignUpServiceImpl implements SignUpService {
	
	@Autowired
	private SignUpDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	// 이메일 중복검사
	@Override
	public int emailDupCheck(String userEmail) {
		return dao.emailDupCheck(userEmail);
	}
	
	// 닉네임 중복검사
	@Override
	public int nicknameDupCheck(String userNick) {
		
		return dao.nicknameDupCheck(userNick);
	}
	
	// 이름 중복검사
	@Override
	public int nameDupCheck(String userName) {
		return dao.nameDupCheck(userName);
	}
	
	// 회원가입 서비스
	@Override
	public int signUp(User inputUser) {
		
		String encPw = bcrypt.encode(inputUser.getUserPw());
		
		inputUser.setUserPw(encPw);
		
		int result = dao.signUp(inputUser);
		

		return result;
	}

	@Override
	public int insertCertification(String cnum, String userEmail) {
		
	 int result = dao.updateCertification( userEmail, cnum);
		
		
	// 2) 일치하는 이메일이 없는 경우 -> 처음으로 인증번호 발급받음 -> 삽입(INSERT)
			if(result == 0) {
				result = dao.insertCertification(userEmail,cnum);			
			}
			
		return result;
		
	}

	@Override
	public int checkNumber(String cNumber, String userEmail) {
		return dao.checkNumber(userEmail,cNumber);
	}

	@Override
	public int telDupCheck(String userTel) {
		return dao.telDupCheck( userTel);
	}


	

	

	

	

	

}

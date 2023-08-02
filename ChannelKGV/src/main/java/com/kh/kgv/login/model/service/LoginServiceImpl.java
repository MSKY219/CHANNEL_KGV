package com.kh.kgv.login.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.login.model.dao.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	// 로그인 서비스 구현
	@Override
	public User login(User inputUser) {
		
		
		User loginUser = dao.login(inputUser);
		
		
		if(loginUser != null) { // 일치하는 이메일을 가진 회원 정보가 있을 경우
			
			// 입력된 비밀번호(평문) , 조회된 비밀번호(암호화) 비교 (같으면 true)
							 		//평문                  ,   암호화
			if( bcrypt.matches(  inputUser.getUserPw()   ,  loginUser.getUserPw() ) ) {
				// 비밀번호가 일치할 경우
				
				loginUser.setUserPw(null); // 비교 끝났으면 비밀번호 지우기
				
			} else { // 비밀번호가 일치하지 않은 경우
				loginUser = null; // 로그인을 실패한 형태로 바꿔줌
				
			}
		}
		
		return loginUser;
	}

	// 비밀번호 찾기 checkUser 서비스 구현
	@Override
	public Boolean checkUser(User user) {
		return dao.checkUser(user);
	}
	
	// 인증메일 보내기 서비스 구현
	@Override
	public int insertCertification(String cnum, String userEmail) {
		
		int result = dao.updateCertification( userEmail, cnum);
		
		return result;
	}
	
	// 인증완료 서비스 구현
	@Override
	public int checkNumber(String cNumber, String userEmail) {
		return dao.checkNumber(userEmail,cNumber);
	}
	
	// 비밀번호 재설정 서비스 구현
	@Override
	public int changePw(String userEmail, String userPw) {
		
		String encPw = bcrypt.encode(userPw); 
		
		int result = dao.changePw(userEmail,encPw);
		
		return result;
	}
	
	// 아이디 찾기 서비스 구현
	@Override
	public String findEmail(User user) {
		return dao.findEmail(user);
	}
	

	
	
	
}

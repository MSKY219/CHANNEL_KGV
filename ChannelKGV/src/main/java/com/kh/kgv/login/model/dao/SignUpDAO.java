package com.kh.kgv.login.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.customer.model.vo.User;

@Repository
public class SignUpDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	/** 이메일 중복검사
	 * @param userEmail
	 * @return
	 */
	public int emailDupCheck(String userEmail) {
		
		return sqlSession.selectOne("signupMapper.emailDupCheck",userEmail);
	}



	/** 닉네임 중복검사
	 * @param inputNickname
	 * @return
	 */
	public int nicknameDupCheck(String userNick) {
		return sqlSession.selectOne("signupMapper.nicknameDupCheck", userNick );
	}



	/** 이름 중복검사
	 * @param userName
	 * @return
	 */
	public int nameDupCheck(String userName) {
		return sqlSession.selectOne("signupMapper.nameDupCheck",userName);
	}



	/** 회원가입
	 * @param inputUser
	 * @return
	 */
	public int signUp(User inputUser) {
		
		return sqlSession.insert("signupMapper.signUp",inputUser);
		
	}



	

	




	public int insertCertification(String userEmail, String cnum) {
		 Map<String, Object> params = new HashMap<>();
		    params.put("cnum", cnum);
		    params.put("userEmail", userEmail);

		    return sqlSession.insert("signupMapper.insertCertification", params);
				
	}



	public int checkNumber(String userEmail, String cNumber) {
		
		
		
		 Map<String, Object> params = new HashMap<>();
		  
		    params.put("userEmail", userEmail);
		    params.put("cNumber", cNumber);

		 return   sqlSession.selectOne("signupMapper.checkNumber",params);
		    

		 
	}



	public int updateCertification(String userEmail, String cnum) {
		
		
		 Map<String, Object> params = new HashMap<>();
		    params.put("cnum", cnum);
		    params.put("userEmail", userEmail);

		    return sqlSession.insert("signupMapper.updateCertification", params);
	}



	public int telDupCheck(String userTel) {
		return sqlSession.selectOne("signupMapper.telDupCheck",userTel);
	}



	public User findkakao(HashMap<String, Object> userInfo) {
		
		return sqlSession.selectOne("signupMapper.kakao",userInfo);

	}



	public void kakaoinsert(HashMap<String, Object> userInfo) {
		   sqlSession.insert("signupMapper.kakaoinsert",userInfo);

	}


	public User findNaver(HashMap<String, Object> naverUserInfo) {
		return sqlSession.selectOne("signupMapper.findNaver",naverUserInfo);
	}
	
	public void naverinsert(HashMap<String, Object> naverUserInfo) {
		   sqlSession.insert("signupMapper.naverinsert",naverUserInfo);
	}
	

}

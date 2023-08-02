package com.kh.kgv.login.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.customer.model.vo.User;

@Repository
public class LoginDAO {
	
	@Autowired   // root-context.xml 에서 생성된 SqlSessionTemplate bean을 의존성 주입(DI)
	private SqlSessionTemplate sqlSession;
	

	
	/** 로그인 DAO
	 * @param inputUser
	 * @return
	 */
	public User login(User inputUser) {
		
		
		User loginUser = sqlSession.selectOne("userMapper.login", inputUser ); 
		
		
		return loginUser;
	}

	
	/** 유저 전체 조회 DAO
	 * @return
	 */
	public List<User> selectAll() {
		// selectList() : 여러 행을 조회 -> 리턴 타입이 List
		//	* 조회되는 모든 행을 순차적으로 접근해서 VO에 필드 값을 담은 후 List에 자동 추가			
		return sqlSession.selectList("userMapper.selectAll");
	}


	/** 비밀번호 찾기 checkUser DAO
	 * @param userName
	 * @param userBirth
	 * @param userEmail
	 * @return
	 */
	//
	public Boolean checkUser(User user) {
		
		// 7. boolean으로 실제로 값이 있는 없느지 확인하기
		// Boolean = true, false, null 을 값으로 받는다.
		// boolean = true, false 만 값으로 받는다.
		// -> SQL쿼리문을 실행하면 값이 없을 경우, null로 반환된다. 그러면 그 null을 받아서 처리해야하기 때문에 Boolean을 쓴다.
	    Boolean checkPw = sqlSession.selectOne("userMapper.checkUser", user);
	    
	    //8. 삼항 연산자를 사용해서, SQL쿼리문을 돌려서 나온 값이 NULL인지 True인지 구별.
	    // -> 만약 NULL이 반환되면 false가 리턴되고, 값이 조회되면 true값을 반환한다.
	    return checkPw != null ?checkPw : false;
	}


	/** 아이디에 인증번호 올리기
	 * @param userEmail
	 * @param cnum
	 * @return
	 */
	public int updateCertification(String userEmail, String cnum) {
		Map<String, Object> params = new HashMap<>();
	    params.put("cnum", cnum);
	    params.put("userEmail", userEmail);

	    return sqlSession.insert("userMapper.updateCertification", params);
	}


	/** 인증번호 확인
	 * @param userEmail
	 * @param cNumber
	 * @return
	 */
	public int checkNumber(String userEmail, String cNumber) {
		 Map<String, Object> params = new HashMap<>();
		  
		    params.put("userEmail", userEmail);
		    params.put("cNumber", cNumber);

		 return   sqlSession.selectOne("userMapper.checkNumber",params);
	}


	/** 비밀번호 재설정
	 * @param userEmail
	 * @param encPw
	 * @return
	 */
	public int changePw(String userEmail, String encPw) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("userEmail", userEmail);
		params.put("encPw", encPw);
		
		return sqlSession.update("userMapper.changePw", params);
	}


	/** 아이디 찾기 
	 * @param user
	 * @return
	 */
	public String findEmail(User user) {
		return sqlSession.selectOne("userMapper.findEmail", user);
	}


	



	
	
	
	

}

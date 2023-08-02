package com.kh.kgv.login.model.service;

import java.util.Map;

import com.kh.kgv.customer.model.vo.User;

public interface KakaoService {


	String getAccessToken(String authorize_code);
	User getUserInfo(String access_Token);
	public void kakaoLogout(String access_Token);
	
	



}

package com.kh.kgv.login.model.service;
import java.util.Map;

import com.kh.kgv.customer.model.vo.User;

public interface NaverService {
	String getAccessToken(String authorize_code);

	User getUserInfo(String access_Token);

}

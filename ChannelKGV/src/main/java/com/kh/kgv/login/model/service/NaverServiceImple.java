package com.kh.kgv.login.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.login.model.dao.SignUpDAO;
import com.kh.kgv.management.model.vo.NewApiKeys;




@Service
public class NaverServiceImple implements NaverService {

	@Autowired
	public SignUpDAO dao;

	@Override
	public String getAccessToken(String authorize_code) {

		NewApiKeys apikey = new NewApiKeys();
		
		String cid = apikey.getNaverKey();
		String secr = apikey.getNaverSecret();
		String addr = apikey.getNaverAddress();
		
		String access_token = "";
		String refresh_Token = "";
		String reqURL = "https://nid.naver.com/oauth2.0/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	         conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");    
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id="+cid);
			sb.append("&client_secret="+secr);
			sb.append("&redirect_uri="+addr);
			sb.append("&code="+authorize_code);
			sb.append("&state=url_parameter");
			bw.write(sb.toString());
			bw.flush();


			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();

			if(responseCode==200){
				//요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";


				while ((line = br.readLine()) != null) {
					result += line;
				}
				
				

				//Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);

				access_token = element.getAsJsonObject().get("access_token").getAsString();
				refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
				br.close();
				bw.close();

			}
		} catch (IOException e) {
			e.printStackTrace();
		} 

		return access_token;
	}

	@Override
	public User getUserInfo(String access_Token) {

	      // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	      HashMap<String, Object> naverUserInfo = new HashMap<String, Object>();
	      String reqURL = "https://openapi.naver.com/v1/nid/me";
	      try {
	         URL url = new URL(reqURL);
	         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	         conn.setRequestMethod("GET");

	         // 요청에 필요한 Header에 포함될 내용
	         conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	         int responseCode = conn.getResponseCode();
	         
	         	         
	         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	         String line = "";
	         String result = "";

	         while ((line = br.readLine()) != null) {
	            result += line;
	         }
	         

	         JsonParser parser = new JsonParser();
	         JsonElement element = parser.parse(result);

	         JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject();
	         
	         String email = response.getAsJsonObject().get("email").getAsString();
	         String name = response.getAsJsonObject().get("name").getAsString();
	         String nickname = response.getAsJsonObject().get("nickname").getAsString();
	         String gender = response.getAsJsonObject().get("gender").getAsString();
	         String birthyear = response.getAsJsonObject().get("birthyear").getAsString();
	         String mbirthday = response.getAsJsonObject().get("birthday").getAsString();
	         
	         
	         if ( gender.equals("F")) {
	        	 gender = "W";
	         }else {
	        	 gender = "M";
	         }
	         String birthday = mbirthday.replace("-", "");
	         
	         String birth = birthyear+birthday;

	         naverUserInfo.put("email", email);
	         naverUserInfo.put("name", name);
	         naverUserInfo.put("gender", gender);
	         naverUserInfo.put("nickname", nickname);
	         naverUserInfo.put("birth", birth);
	         
	         
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	      User result = dao.findNaver(naverUserInfo);
	      
	      if(result==null) {
	      // result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
	         dao.naverinsert(naverUserInfo);
	         // 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
	         return dao.findNaver(naverUserInfo);
	         // 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
	         //  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
	      } else {
	         return result;
	         // 정보가 이미 있기 때문에 result를 리턴함.
	      }
	      
	}

	


}

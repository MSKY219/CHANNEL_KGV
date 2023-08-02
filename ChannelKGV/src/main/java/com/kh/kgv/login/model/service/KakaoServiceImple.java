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
public class KakaoServiceImple implements KakaoService {

	   @Autowired
	   public SignUpDAO dao;
		
	   @Override
	   public String getAccessToken(String authorize_code) {
		   
		   NewApiKeys apikey = new NewApiKeys();
			
			String cid = apikey.getKakaoKey();
			String addr = apikey.getKakaoAddress();
			
		   
	      String access_Token = "";
	      String refresh_Token = "";
	      String reqURL = "https://kauth.kakao.com/oauth/token";

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
	         sb.append("&client_id="+cid); //본인이 발급받은 key
	         sb.append("&redirect_uri="+addr);// 본인이 설정한 주소
	         sb.append("&code=" + authorize_code);
	         bw.write(sb.toString());
	         bw.flush();
	         
	            
	         // 결과 코드가 200이라면 성공
	         int responseCode = conn.getResponseCode();
	         
	            
	         // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	         String line = "";
	         String result = "";
	            
	         while ((line = br.readLine()) != null) {
	            result += line;
	         }
	            
	         // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	         JsonParser parser = new JsonParser();
	         JsonElement element = parser.parse(result);
	            
	         access_Token = element.getAsJsonObject().get("access_token").getAsString();
	         refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	            
	         br.close();
	         bw.close();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      return access_Token;
	   }

	   @Override
	   public User getUserInfo(String access_Token) {

	      // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	      HashMap<String, Object> userInfo = new HashMap<String, Object>();
	      String reqURL = "https://kapi.kakao.com/v2/user/me";
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

	         JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	         JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	         String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	         String age_range = kakao_account.getAsJsonObject().get("age_range").getAsString();
	         String email = kakao_account.getAsJsonObject().get("email").getAsString();
	         String gender = kakao_account.getAsJsonObject().get("gender").getAsString();

	         if ( gender.equals("female")) {
	        	 gender = "W";
	         }else {
	        	 gender = "M";
	         }
	         
	         if ( age_range.equals("01~10") || age_range.equals("10~19") ) {
	        	 age_range = "29991231";
	         }else {
	        	 age_range = "19000101";
	         }
	         
	         Random rand = new Random();
	         int i = rand.nextInt(10000) + 1;  // 1 to 1000까지의 난수 생성


	         String randomNick = "새로온손님" + i;
	         

	         userInfo.put("nickname", nickname);
	         userInfo.put("email", email);
	         userInfo.put("gender", gender);
	         userInfo.put("randomNick", randomNick);
	         userInfo.put("age_range", age_range);
	         
	         

	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      User result = dao.findkakao(userInfo);
	      if(result==null) {
	      // result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
	         dao.kakaoinsert(userInfo);
	         // 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
	         return dao.findkakao(userInfo);
	         // 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
	         //  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
	      } else {
	         return result;
	         // 정보가 이미 있기 때문에 result를 리턴함.
	      }
	      
	   
	   }

	   @Override
	   public void kakaoLogout(String access_Token) {
	      String reqURL = "https://kapi.kakao.com/v1/user/logout";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	            conn.setRequestMethod("POST");
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String result = "";
	            String line = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }





	   

	
}

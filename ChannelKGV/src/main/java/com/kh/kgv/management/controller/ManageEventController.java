package com.kh.kgv.management.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.kgv.common.Util;
import com.kh.kgv.management.model.service.ManageEventService;
import com.kh.kgv.management.model.vo.Event;

@Controller
@RequestMapping("/manager/event_add")
@SessionAttributes({ "loginUser" })
public class ManageEventController {

	@Autowired
	private ManageEventService service;

	// 이벤트 등록
	@PostMapping("write_Event")
	@ResponseBody
	public int addEvent(
			@RequestParam("title") String title
			, @RequestParam("start") String start
			, @RequestParam("end") String end
			, @RequestParam("content") String content
			, @RequestParam("movieImg1") String movieImg) {
		Event event = new Event();
		event.setEventTitle(title);
		event.setEventStart(start);
		event.setEventEnd(end);
		event.setEventContent(content);
		event.setEventImg(movieImg);
		
		int result = service.addEvent(event);
		
		return result;
	}

	// 이벤트 등록용 이미지 업로드
	@PostMapping("uploadEventImageFile")
	@ResponseBody
	public String uploadImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

//		  String fileRoot = "C:\\Users\\cropr\\Desktop\\test"; // 외부경로로 저장을 희망할때.

		// 내부경로로 저장
		String webPath = "/resources/images/fileupload/";

		String fileRoot = request.getServletContext().getRealPath(webPath);

        String originalFileName = multipartFile.getOriginalFilename();
//        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
        String savedFileName = Util.fileRename(originalFileName);

		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url", request.getContextPath() + webPath + savedFileName); // contextroot +
																								// resources + 저장할 내부
																								// 폴더명
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		System.out.println("================================================= 이미지 는?? : : " + a);
		return a;
		
			}
				//이벤트 보조 이미지 업로드
		@PostMapping("uploadImage")
		@ResponseBody
		public String movieUploadImageFile(@RequestParam("file") MultipartFile[] multipartFiles, HttpServletRequest request) {
		    JsonArray jsonArray = new JsonArray(); 

		    String webPath = "/resources/images/eventList/";
		    String fileRoot = request.getServletContext().getRealPath(webPath);

		    for (MultipartFile multipartFile : multipartFiles) {
		        JsonObject jsonObject = new JsonObject();

		        String originalFileName = multipartFile.getOriginalFilename();
		        String savedFileName = Util.fileRename(originalFileName);

		        File targetFile = new File(fileRoot + savedFileName);
		        try {
		            InputStream fileStream = multipartFile.getInputStream();
		            FileUtils.copyInputStreamToFile(fileStream, targetFile);
		            jsonObject.addProperty("", request.getContextPath() + webPath + savedFileName);

		        } catch (IOException e) {
		            FileUtils.deleteQuietly(targetFile);
		            jsonObject.addProperty("responseCode", "error");
		            e.printStackTrace();
		        }

		        jsonArray.add(jsonObject);
		    }

		    String jsonResult = jsonArray.toString();
		    System.out.println("이미지: " + jsonResult);
		    return jsonResult;
		}


}

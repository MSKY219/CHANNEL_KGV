package com.kh.kgv.helpDesk.model.service;

import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.helpDesk.model.vo.LostPackage;
import com.kh.kgv.helpDesk.model.vo.Mtm;
import com.kh.kgv.helpDesk.model.vo.Quest;
import com.kh.kgv.management.model.vo.Notice;

public interface HelpDeskService {

	Notice selectNoticeDetail(int noticeNo);
	Notice getPreviousNotice(int noticeNo);
	Notice getNextNotice(int noticeNo);
	
	// MTM 1:1문의
	int selectMtmNo(Mtm mtm);
	Map<String, Object> getMtmList(int cp, int userNo, String userManagerSt);
	Mtm selectmTmDetail(int mtmNo);
	int addmTm(Mtm mtm);
	int getuserMtmListCount(int userNo, String userManagerSt);
	int deleteBoard(int mtmNo);
	int replyDelete(int mtmNo);
	int replyWrite(int mtmNo, String content, String managerNick);

	// Lost_Item 분실물 문의
	int selectLostNo(LostPackage lost);
	Map<String, Object> getLostList(int cp, int userNo, String userManagerSt);
	LostPackage selectLostDetail(int lostNo);
	int addLost(LostPackage lost);
	int getLostListCount(int userNo, String userManagerSt);
	int deleteLost(int mtmNo);
	int replyLostDelete(int lostNo);
	int replyLostWrite(int lostNo, String content, String managerNick);
	
	// 게시물 비밀번호 관련
	int selectmtmPw(int mtmNo);
	int selectUserNo(int mtmNo);
	String checkPasswordAccess(int mtmNo, User loginUser, int cp);
	int selectmtmLostPw(int lostNo);
	int selectLostUserNo(int lostNo);
	String checkLostPasswordAccess(int lostNo, User loginUser, int cp);

	
	// 조회수 관련
	int updateReadCount(int mtmNo);
	int updateLostReadCount(int lostNo);
	
	
	// 음....
	int getcountquestNum(int questNum);

	Map<String, Object> getQuestList(int cp, int questNum);
	Map<String, Object> cinemaList();
	Mtm getforUpdateValue(int mtmNo);
	int updatemTm(Mtm mtm);
	LostPackage getforLostValue(int lostNo);
	int updateLost(LostPackage lost);
	List<Quest> getQuestType();
	
	
	int getCountSelectQeustNo( String keyword);
	Map<String, Object> getSearchQuestList(String keyword, int cp);
	
	
	Map<String, Object> searchcinemaList();
	Map<String, Object> cinemaNameList(String area );
	
	
	int getSearchLostCount(String area, String name, String keyword , int userNo, String userManagerSt );
	Map<String, Object> selectSearchLOST(int cp, String area, String name, String keyword, int userNo, String userManagerSt );
	
	
	int getNoticeListCount();


	
	
	






}

package com.kh.kgv.helpDesk.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.helpDesk.model.dao.HelpDeskDAO;
import com.kh.kgv.helpDesk.model.vo.LostPagenation;
import com.kh.kgv.helpDesk.model.vo.LostPackage;
import com.kh.kgv.helpDesk.model.vo.Mtm;
import com.kh.kgv.helpDesk.model.vo.MtmPagenation;
import com.kh.kgv.helpDesk.model.vo.Quest;
import com.kh.kgv.helpDesk.model.vo.QuestPagenation;
import com.kh.kgv.management.model.dao.ManagerDAO;
import com.kh.kgv.management.model.vo.Cinema;
import com.kh.kgv.management.model.vo.Notice;
import com.kh.kgv.management.model.vo.Pagination;



@Service
public class HelpDeskImpl implements HelpDeskService {

	@Autowired
	private HelpDeskDAO dao;


	//공지사항 세부 접속
	@Override
	public Notice selectNoticeDetail(int noticeNo) {
		return dao.selectNoticeDetail(noticeNo);
	}

	//공지사항 이전번호 조회
	@Override
	public Notice getPreviousNotice(int noticeNo) {
		int prevNoticeNo = noticeNo - 1;

		// 이전 게시물의 정보를 데이터베이스에서 조회
		Notice prevNotice = dao.findPrevNoticeNo(prevNoticeNo);

		return prevNotice;
	}

	// 공지사항 다음번호 조회
	@Override
	public Notice getNextNotice(int noticeNo) {
		int nextNoticeNo = noticeNo + 1;

		// 다음 게시물의 정보를 데이터베이스에서 조회
		Notice nextNotice = dao.findNextNoticeNo(nextNoticeNo);

		return nextNotice;
	}



	// 1:1문의 리스트 조회
	@Override
	public Map<String, Object> getMtmList(int cp, int userNo, String userManagerSt) {

		int userManagerStAsInt = 0;
		if(userManagerSt != null) {
			if(userManagerSt.equals("Y")) {
				userManagerStAsInt = 1;
			}else if (userManagerSt.equals("null")) {
				userManagerStAsInt = 0;
			}
		}

		int mtmlistCount = dao.getMtmListCount(userNo, userManagerStAsInt);
		MtmPagenation pagination = new MtmPagenation(cp, mtmlistCount);
		List<Mtm> mtmLists = dao.getMtmList(pagination, userNo, userManagerStAsInt);

		Map<String, Object> getMtmList = new HashMap<String, Object>();
		getMtmList.put("pagination", pagination);
		getMtmList.put("mtmLists", mtmLists);
		return getMtmList;
	}

	// 1:1문의 세부사항 조회
	@Override
	public Mtm selectmTmDetail(int mtmNo) {
		return dao.selectmTmDetail(mtmNo);
	}

	// 1:1문의 글 갯수 조회
	@Override
	public int getuserMtmListCount(int userNo, String userManagerSt) {
		int userManagerStAsInt = 0;
		if(userManagerSt != null) {
			if(userManagerSt.equals("Y")) {
				userManagerStAsInt = 1;
			}else if (userManagerSt.equals("null")) {
				userManagerStAsInt = 0;
			}
		}
		return dao.getMtmListCount(userNo, userManagerStAsInt);
	}

	// 1:1문의 글 작성
	@Override
	public int addmTm(Mtm mtm) {
		return dao.addmTm(mtm);

	}

	// 1:1문의 게시글번호조회 
	@Override
	public int selectMtmNo(Mtm mtm) {
		return  dao.selectMtmNo(mtm);
	}

	// 1:1문의 글 삭제
	@Override
	public int deleteBoard(int mtmNo) {
		return dao.deleteBoard(mtmNo);
	}

	// 1:1문의 댓글 작성
	@Override
	public int replyWrite(int mtmNo, String content,  String managerNick) {
		return  dao.replyWrite(mtmNo, content, managerNick);
	}

	// 1:1문의 댓글 삭제
	@Override
	public int replyDelete(int mtmNo) {
		return dao.replyDelete(mtmNo);
	}

	// 1:1문의 삭제비밀번호 조회
	@Override
	public int selectmtmPw(int mtmNo) {
		return dao.selectmtmPw(mtmNo);
	}

	// 1:1문의 userNo 조회
	@Override
	public int selectUserNo(int mtmNo) {
		return dao.selectUserNo(mtmNo);
	}

	// 1:1문의 카운트 증가
	@Override
	public int updateReadCount(int mtmNo) {

		return dao.updateReadCount(mtmNo);
	}

	// 1:1문의 맵핑 어드레스 리턴묶음
	@Override
	public String checkPasswordAccess(int mtmNo, User loginUser, int cp) {
		int userNo = 0;
		String userManagerSt = null;

		if(loginUser != null ) {
			userNo = loginUser.getUserNo();
			userManagerSt = loginUser.getUserManagerSt();
		}
		else {
			userManagerSt = "N";
		}



		int mtmPw = selectmtmPw(mtmNo);
		int mtmUserNo = selectUserNo(mtmNo);

		// 비회원이 비밀번호가 입력되어있는 게시물에 접근할 경우
		// >>>>>>> 로그인페이지로 이동시킨다.
		if ( userNo == 0 && mtmPw != 0 ) {
			return "redirect:/user/login";
		} 

		// 로그인은 되어있는데 회원레벨이 관리자일 경우
		// 또는 게시물의 비밀번호가 0일 경우
		// 바로  보내버린다.
		if (userManagerSt.equals("Y") || mtmPw == 0) {
			return "redirect:/helpDesk/mTm_detail/" + mtmNo + "?cp=" + cp;
		} 

		if (userNo == mtmUserNo ) {
			return "redirect:/helpDesk/mTm_detail/" + mtmNo + "?cp=" + cp;
		}

		if (userManagerSt.equals("N") && userNo != 0) {
			return "helpDesk/checkPw";
		}


		return null;
	}



	// 잃어버린물건 리스트 조회
	@Override
	public Map<String, Object> getLostList(int cp, int userNo, String userManagerSt) {

		int userManagerStAsInt = 0;
		if(userManagerSt != null) {
			if(userManagerSt.equals("Y")) {
				userManagerStAsInt = 1;
			}else if (userManagerSt.equals("null")) {
				userManagerStAsInt = 0;
			}
		}

		int lostlistCount = dao.getLostListCount(userNo, userManagerStAsInt);

		LostPagenation pagination = new LostPagenation(cp, lostlistCount);


		List<Mtm> lostLists = dao.lostLists(pagination, userNo, userManagerStAsInt);
		Map<String, Object> getMtmList = new HashMap<String, Object>();
		getMtmList.put("pagination", pagination);
		getMtmList.put("lostLists", lostLists);



		return getMtmList;
	}

	// 분실물 찾기 갯수 조회 ( cp용 )
	@Override
	public int getSearchLostCount(String area, String name, String keyword, int userNo, String userManagerSt) {
		
		int userManagerStAsInt = 0;
		if(userManagerSt != null) {
			if(userManagerSt.equals("Y")) {
				userManagerStAsInt = 1;
			}else if (userManagerSt.equals("null")) {
				userManagerStAsInt = 0;
			}
		}
		
		
		return dao.getSearchLostCount(area, name, keyword, userNo, userManagerStAsInt );
	}

	// 분실물 찾기 리스트 조회
	@Override
	public Map<String, Object> selectSearchLOST(int cp, String area, String name, String keyword, int userNo, String userManagerSt) {
		
		int userManagerStAsInt = 0;
		if(userManagerSt != null) {
			if(userManagerSt.equals("Y")) {
				userManagerStAsInt = 1;
			}else if (userManagerSt.equals("null")) {
				userManagerStAsInt = 0;
			}
		}

		int lostlistCount =  dao.getSearchLostCount(area, name, keyword, userNo, userManagerStAsInt);

		LostPagenation pagination = new LostPagenation(cp, lostlistCount);


		List<Mtm> lostLists = dao.selectSearchLOST(pagination,  area, name, keyword, userNo, userManagerStAsInt);
		Map<String, Object> getMtmList = new HashMap<String, Object>();
		getMtmList.put("pagination", pagination);
		getMtmList.put("lostLists", lostLists);



		return getMtmList;
	}



	// 잃어버린물건 세부사항 조회
	@Override
	public LostPackage selectLostDetail(int lostNo) {
		return dao.selectLostDetail(lostNo);
	}

	// 잃어버린물건 갯수 조회
	@Override
	public int getLostListCount(int userNo, String userManagerSt) {
		int userManagerStAsInt = 0;
		if(userManagerSt != null) {
			if(userManagerSt.equals("Y")) {
				userManagerStAsInt = 1;
			}else if (userManagerSt.equals("null")) {
				userManagerStAsInt = 0;
			}
		}
		return dao.getLostListCount(userNo, userManagerStAsInt);

	}

	// 잃어버린물건 글 작성
	@Override
	public int addLost(LostPackage lost) {
		return dao.addLost(lost);
	}

	// 잃어버린물건 게시글번호 조회
	@Override
	public int selectLostNo(LostPackage lost) {
		return dao.selectLostNo(lost);
	}

	// 잃어버린물건 게시글 삭제
	@Override
	public int deleteLost(int lostNo) {
		return dao.deleteLost(lostNo);
	}

	// 잃어버린물건 댓글 작성
	@Override
	public int replyLostWrite(int lostNo, String content, String managerNick) {
		return  dao.replyLostWrite(lostNo, content, managerNick);
	}

	// 잃어버린물건 댓글 삭제
	@Override
	public int replyLostDelete(int lostNo) {
		return dao.replyLostDelete(lostNo);
	}

	// 잃어버린물건 삭제 비밀번호 조회
	@Override
	public int selectmtmLostPw(int lostNo) {
		return dao.selectmtmLostPw(lostNo);
	}

	// 잃어버린물건 유저번호 조회
	@Override
	public int selectLostUserNo(int lostNo) {
		return dao.selectLostUserNo(lostNo);
	}

	// 잃어버린물건 조회수 증가
	@Override
	public int updateLostReadCount(int lostNo) {
		return dao.updateLostReadCount(lostNo);

	}

	// 잃어버린물건 맵핑 어드레스 리턴묶음
	@Override
	public String checkLostPasswordAccess(int lostNo, User loginUser, int cp) {


		int userNo = 0;
		String userManagerSt = null;

		if(loginUser != null ) {
			userNo = loginUser.getUserNo();
			userManagerSt = loginUser.getUserManagerSt();
		}
		else {
			userManagerSt = "N";
		}

		int lostPw = selectmtmLostPw(lostNo);
		int lostUserNo = selectLostUserNo(lostNo);

		if ( userNo == 0 && lostPw != 0 ) {
			return "redirect:/user/login";
		} 

		if (userManagerSt.equals("Y") || lostPw == 0) {
			return "redirect:/helpDesk/lost_detail/" + lostNo + "?cp=" + cp;
		} 

		if (userNo == lostUserNo ) {
			return "redirect:/helpDesk/lost_detail/" + lostNo + "?cp=" + cp;
		}

		if (userManagerSt.equals("N") && userNo != 0) {
			return "helpDesk/checkLostPw";
		}
		return null;
	}


	@Override
	public int getcountquestNum(int questNum ) {

		return dao.getcountquestNum(questNum );
	}


	@Override
	public Map<String, Object> getQuestList(int cp, int questNum) {

		int questCount = dao.getcountquestNum(questNum);
		QuestPagenation pagination = new QuestPagenation(cp, questCount);

		List<Mtm> questList = dao.getQuestList(pagination, questNum);

		Map<String, Object> getQuestList = new HashMap<String, Object>();
		getQuestList.put("pagination", pagination);
		getQuestList.put("questList", questList);

		return getQuestList;
	}

	@Override
	public int getCountSelectQeustNo(String keyword) {
		return dao.getCountSelectQeustNo( keyword);

	}

	@Override
	public Map<String, Object> getSearchQuestList(String keyword, int cp) {

		int questCount = dao.getCountSelectQeustNo( keyword);

		QuestPagenation pagination = new QuestPagenation(cp, questCount);

		List<Notice> questList = dao.getSearchQuestList(pagination, keyword);

		Map<String, Object> getQuestList = new HashMap<String, Object>();
		getQuestList.put("pagination",pagination);
		getQuestList.put("questList", questList);


		return getQuestList;
	}





	@Override
	public Map<String, Object> cinemaList() {

		List<Cinema> cinemaList = dao.cinemaList();

		Map<String, Object> getcinemaList = new HashMap<String, Object>();

		getcinemaList.put("cinemaList", cinemaList);

		return getcinemaList;
	}

	@Override
	public Mtm getforUpdateValue(int mtmNo) {
		return dao.selectmTmDetail(mtmNo);
	}

	@Override
	public int updatemTm(Mtm mtm) {
		return dao.updatemTm(mtm);
	}

	@Override
	public LostPackage getforLostValue(int lostNo) {
		return dao.selectLostDetail(lostNo);
	}

	@Override
	public int updateLost(LostPackage lost) {
		return dao.updateLost(lost);

	}

	@Override
	public List<Quest> getQuestType() {
		return dao.getQuestType();
	}

	@Override
	public Map<String, Object> searchcinemaList() {

		List<Cinema> dstCinemaList = dao.distinctcinemaList();

		Map<String, Object> cinemaList = new HashMap<String, Object>();

		cinemaList.put("cinemaList", dstCinemaList);


		return cinemaList;
	}

	@Override
	public Map<String, Object> cinemaNameList(String area) {


		List<Cinema> selectcinemaNameList = dao.selectcinemaNameList(area);

		Map<String, Object> cinemaNameList = new HashMap<String, Object>();

		cinemaNameList.put("cinemaNameList", selectcinemaNameList);


		return cinemaNameList;
	}

	@Override
	public int getNoticeListCount() {
		return dao.getNoticeListCount();
	}






















}

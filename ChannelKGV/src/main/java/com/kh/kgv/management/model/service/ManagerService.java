package com.kh.kgv.management.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.helpDesk.model.vo.Mtm;
import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Store;
import com.kh.kgv.management.model.vo.Benefits;
import com.kh.kgv.management.model.vo.CinemaPrice;
import com.kh.kgv.management.model.vo.DailyEnter;
import com.kh.kgv.management.model.vo.DailyWatch;
import com.kh.kgv.management.model.vo.Event;
import com.kh.kgv.management.model.vo.Notice;
import com.kh.kgv.management.model.vo.Search;
import com.kh.kgv.management.model.vo.WeeklyEnter;
import com.kh.kgv.management.model.vo.banner;
import com.kh.kgv.theater.model.vo.Screen;

public interface ManagerService {

	// 관리자 메인 신규 회원 목록 조회
	List<User> getAllUser();

	// 관리자 메인 공지사항 목록 조회
	List<Notice> getAllNotice();
	
	// 관리자 메인 1 : 1 문의 조회
	List<Mtm> getMainMTMList();

	// 회원 목록 조회
	Map<String, Object> selectAll(int cp);

	// 관리자 메인 일일 접속자 수 조회
	List<DailyEnter> getWeeklyEnter(WeeklyEnter we);

	// 회원 관리자 상태 업데이트
	int updateST(User user);

	// 회원 이용제한 업데이트
	int blockST(User user);

	// 영화 등록 서비스
	int MovieAdd(Movie inputMovie);

	// Grade 호출 서비스
	List<String> mgradeList();

	// Gener
	List<String> mgenreList();

	// 영화 목록 조회
	Map<String, Object> movieList(int cp);

	// 영화 수정 조회
	Movie getEditMovieList(Movie movie);

	// 영화 수정 등록
	int MovieEdit(Movie updateMovie);

	// 이벤트 목록 조회
	Map<String, Object> eventList(int cp);

	// 이벤트 수정 조회
	Map<String, Object> getEditEventList(Event event);

	// 이벤트 수정(업데이트)
	int editEvent(Event event);

	// 이벤트 상태 업데이트
	int updateEventST(Event event);

	// 공지사항 등록
	int addNotice(Notice notice);

	// 공지사항 목록 조회
	Map<String, Object> noticeList(int cp);

	// 공지사항 수정 조회
	Map<String, Object> getEditNoticeList(Notice notice);

	// 공지사항 수정(업데이트)
	int editNotice(Notice notice);

	// 공지사항 상태 업데이트
	int updateNoticeST(Notice notice);

	// 영화관 목록 조회
	Map<String, Object> getCinemaMap(int cp);

	// 관리자_극장 가격 목록 이동
	Map<String, Object> getCinemaPriceMap(int cp);

	// 공지사항 갯수 조회
	int getNoticeListCount();

	// 유저 전용 공지사항 조회
	Map<String, Object> userNoticeList(int cp);

	// 영화 상영 상태 업데이트
	int updateMovieST(Movie movie);

	// 상영 중인 영화, 상영 시간표 조회
	Map<String, Object> getPlayMap();

	// 스토어 목록 조회
	Map<String, Object> getStoreMap(int cp);
	
	// 스토어 구매 목록 조회
	Map<String, Object> getStorebuyMap(int cp);

	// 메인 -> 이벤트 이동 시 이벤트
	Map<String, Object> selectEventList();

	// 메인 -> 이벤트 상세 내용
	Event getEventList(Event event);

	// 메인 이벤트 목록 가지고 오기 - 7개
	Map<String, Object> mainEventList();

	// 관리자_배너 등록
	int addBanner(banner banner);

	// 관리자_배너 목록 이동시 목록 조회
	Map<String, Object> getBannerList(int cp);

	// 관리자_배너 상태 업데이트
	int updateBannerST(banner banner);

	// 스토어 수정 조회
	Store getEditStoreList(Store store);

	// 스토어 수정하기
	int StoreEdit(Store updateStore);

	// 관리자_극장 가격 중복 조회
	Boolean checkPrice(CinemaPrice cp);

	// 관리자_극장 가격 등록
	int addCinemaPrice(CinemaPrice cp);

	// 관리자_극장 가격 수정 이동
	Map<String, Object> getEditPriceList(CinemaPrice price);

	// 관리자_극장 가격 수정
	int EditCinemaPrice(CinemaPrice cp);
	
	// 관리자_혜택 목록 조회
	Map<String, Object> getBenefitsList(int cp);

	

	// 관리자_배너 수정 이동
	Map<String, Object> getEditBannerList(banner banner);

	// 관리자_배너 수정
	int editBanner(banner banner);

	// 관리자_1:1 문의 목록
	Map<String, Object> selectMTMList(int cp);
	
	// 관리자_혜택 수정 페이지
	Map<String, Object> getEditBenefitsList(Benefits bene);
	
	// 관리자_혜택 수정 등록
	int editBenefits(Benefits updatebene);

	// 관리자_분실물 목록 조회
	Map<String, Object> selectLostList(int cp);
	
	// 관리자_혜택 상태 업데이트
	int updateBenefitsST(Benefits bene);

	// 스토어 수정 중복검사
	int NameDupChecks(String storeName, String originName);
	
	// 스토어 수정 중복검사
	Store getStoreInfo(int storeNo);

	// 공지사항 count_view update
	int updateNoticeView(int noticeNo);

	// 관리자_혜택 삭제
	int deleteBenefits(int benefitsNo);

	// 관리자 회원 검색 기능
	Map<String, Object> getMemberSearch(Search search, int cp);

	// 관리자 1:1 문의 검색 기능
	Map<String, Object> getAskSearch(Search search, int cp);

	// 관리자 분실물 검색 기능
	Map<String, Object> getLostSearch(Search search, int cp);

	// 관리자 영화 검색 기능
	Map<String, Object> getMovieSearch(Search search, int cp);

	// 관리자 상영중인 영화 검색
	Map<String, Object> getPlaySearch(Search search, int cp);

	// 관리자 상영이 끝난 영화 검색
	Map<String, Object> getPlayEndSearch(Search search, int cp);


	// 관리자 극장목록 검색
	Map<String, Object> getSearchCinemaList(Search search, int cp);
	
	// 관리자 극장 가격 검색
	Map<String, Object> getSearchCinemaPrice(Search search, int cp);

	// 관리자 배너 검색
	Map<String, Object> getSearchBannerList(int cp, Search search);
	
	// 관리자 이벤트 검색
	Map<String, Object> searchEventList(int cp, Search search);

	// 관리자 공지사항 검색
	Map<String, Object> searchNoticeList(int cp, Search search);

	// 고객센터 공지사항 게시판 검색
	Map<String, Object> selectSearchNTC(String keyword, int cp);

	// 공지사항 갯수 조회
	int getSearchListCount(String keyword);

	//관리자_예매 리스트 조회
	Map<String, Object> selectBookList(int cp);

	//관리자 예매 리스트 검색
	Map<String, Object> getBookSearch(Search search, int cp);

	// 관리자 메인 일일 예매 수 조회
	List<DailyWatch> getWeeklyWatch(WeeklyEnter we);

	// 총 접속자 수
	int getTotalEntre();

	// 총 예매 수
	int getTotlaBook();
	




	
	
	


}

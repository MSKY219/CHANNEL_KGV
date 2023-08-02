package com.kh.kgv.management.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kgv.common.Util;
import com.kh.kgv.customer.model.vo.Book;
import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.helpDesk.model.vo.LostPackage;
import com.kh.kgv.helpDesk.model.vo.Mtm;
import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Store;
import com.kh.kgv.items.model.vo.TimeTable;
import com.kh.kgv.management.model.dao.ManagerDAO;
import com.kh.kgv.management.model.vo.Benefits;
import com.kh.kgv.management.model.vo.Cinema;
import com.kh.kgv.management.model.vo.CinemaPrice;
import com.kh.kgv.management.model.vo.DailyEnter;
import com.kh.kgv.management.model.vo.DailyWatch;
import com.kh.kgv.management.model.vo.Event;
import com.kh.kgv.management.model.vo.JoinPlay;
import com.kh.kgv.management.model.vo.Notice;
import com.kh.kgv.management.model.vo.Pagination;
import com.kh.kgv.management.model.vo.Search;
import com.kh.kgv.management.model.vo.WeeklyEnter;
import com.kh.kgv.management.model.vo.banner;
import com.kh.kgv.store.model.vo.StoreOrder;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDAO dao;

	// @Override
	// public List<Movie> movieList(Movie movie) {
	// // TODO Auto-generated method stub
	// return null;
	// }

	// 관리자 메인 신규 회원 목록 조회
	@Override
	public List<User> getAllUser() {
		List<User> getUser = dao.getAllUser();
		return getUser;
	}

	// 관리자 메인 공지사항 목록 조회
	@Override
	public List<Notice> getAllNotice() {
		List<Notice> getNotice = dao.getAllNotice();
		return getNotice;
	}
	

	// 관리자 메인 1 : 1 문의 조회
	@Override
	public List<Mtm> getMainMTMList() {
		List<Mtm> getMTMList = dao.getMainMTMList();
		return getMTMList;
	}
	

	// 관리자 메인 일일 접속자 수 조회
	@Override
	public List<DailyEnter> getWeeklyEnter(WeeklyEnter we) {
		return dao.getWeeklyEnter(we);
	}

	// 회원 목록 조회
	@Override
	public Map<String, Object> selectAll(int cp) {

		// 회원 수 조회
		int listCount = dao.getListCount();

		// 조회한 회원을 pagination 에 담기
		Pagination pagination = new Pagination(cp, listCount);

		// 회원 리스트 조회
		List<User> userList = dao.selectAll(pagination);

		Map<String, Object> getUserList = new HashMap<String, Object>();
		getUserList.put("pagination", pagination);
		getUserList.put("userList", userList);

		return getUserList;
	}

	// 회원 관리자 상태 업데이트
	@Override
	public int updateST(User user) {
		return dao.updateST(user);
	}

	// 회원 이용제한 업데이트
	@Override
	public int blockST(User user) {
		return dao.blockST(user);
	}

	// 영화 등록
	@Override
	public int MovieAdd(Movie inputMovie) {

		int result = dao.MovieAdd(inputMovie);
		System.out.println("serviceImpl result:" + result);
		return result;
	}

	/**
	 * Grade 호출 서비스
	 *
	 */
	@Override
	public List<String> mgradeList() {
		return dao.mgradeList();
	}

	/**
	 * genre 호출 서비스
	 *
	 */
	@Override
	public List<String> mgenreList() {
		return dao.mgenreList();
	}

	// 영화 목록 조회
	@Override
	public Map<String, Object> movieList(int cp) {

		// 영화 수 조회
		int movielistCount = dao.getmovielistCount();

		// 조회한 공지사항 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, movielistCount);

		// 공지사항 리스트 조회
		List<Movie> movielist = dao.movieList(pagination);
		// movielist에서 따온 값 가공하기
		List<Movie> cleanedList = new ArrayList<>();
		for (Movie movie : movielist) {
			Movie cleanedMovie = new Movie();
			cleanedMovie.setMgNo(Util.removeQuotes(movie.getMgNo()));
			cleanedMovie.setGenreName(Util.removeQuotes(movie.getGenreName()));
			cleanedMovie.setMovieNo(movie.getMovieNo());
			cleanedMovie.setMovieRuntime(movie.getMovieRuntime());
			cleanedMovie.setMovieTitle(movie.getMovieTitle());
			cleanedMovie.setMovieNation(movie.getMovieNation());
			cleanedMovie.setMovieOpen(movie.getMovieOpen());
			cleanedMovie.setMovieContent(movie.getMovieContent());
			cleanedMovie.setMovieImg1(movie.getMovieImg1());
			cleanedMovie.setMovieImg2(movie.getMovieImg2());
			cleanedMovie.setMovieImg3(movie.getMovieImg3());
			cleanedMovie.setMovieImg4(movie.getMovieImg4());
			cleanedMovie.setMovieImg5(movie.getMovieImg5());
			cleanedMovie.setMovieImg6(movie.getMovieImg6());
			cleanedMovie.setMovieUploader(movie.getMovieUploader());
			cleanedMovie.setMovieDirector(movie.getMovieDirector());
			cleanedMovie.setMovieCast(movie.getMovieCast());
			cleanedMovie.setMovieRegdate(movie.getMovieRegdate());
			cleanedMovie.setMovieSt(movie.getMovieSt());
    		cleanedMovie.setMoviePlayed(movie.getMoviePlayed());
    		cleanedMovie.setMovieWatched(movie.getMovieWatched());

			cleanedList.add(cleanedMovie);
		}
		Map<String, Object> getMovieList = new HashMap<String, Object>();
		getMovieList.put("pagination", pagination);
		getMovieList.put("cleanedList", cleanedList);

		return getMovieList;
	}

	/**
	 * 영화 수정 페이지 이동
	 */
	@Override
	public Movie getEditMovieList(Movie movie) {
		return dao.getEditMovieList(movie);
	}

	/**
	 * 영화 수정 등록
	 */
	@Override
	public int MovieEdit(Movie updateMovie) {
		int result = dao.MovieEdit(updateMovie);
		return result;
	}

	@Override
	public Map<String, Object> eventList(int cp) {
		// 회원 수 조회
		int eventlistCount = dao.getEventListCount();

		// 조회한 회원을 pagination 에 담기
		Pagination pagination = new Pagination(cp, eventlistCount);

		// 회원 리스트 조회
		List<Event> eventList = dao.eventList(pagination);

		Map<String, Object> getEventList = new HashMap<String, Object>();
		getEventList.put("pagination", pagination);
		getEventList.put("eventList", eventList);

		return getEventList;
	}

	// 이벤트 수정 조회
	@Override
	public Map<String, Object> getEditEventList(Event event) {
		return dao.getEditEventList(event);
	}

	// 이벤트 수정(업데이트)
	@Override
	public int editEvent(Event event) {
		return dao.editEvent(event);
	}

	// 이벤트 상태 업데이트
	@Override
	public int updateEventST(Event event) {
		return dao.updateEventST(event);
	}

	// 공지사항 등록
	@Override
	public int addNotice(Notice notice) {
		return dao.addNotice(notice);
	}

	// 공지사항 목록 조회
	@Override
	public Map<String, Object> noticeList(int cp) {

		// 공지사항 수 조회
		int noticelistCount = dao.getNoticeListCount();

		// 조회한 공지사항 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, noticelistCount);

		// 공지사항 리스트 조회
		List<Notice> noticeLists = dao.noticeList(pagination);

		Map<String, Object> getNoticeList = new HashMap<String, Object>();
		getNoticeList.put("pagination", pagination);
		getNoticeList.put("noticeLists", noticeLists);

		return getNoticeList;
	}

	// 공지사항 수정 조회
	@Override
	public Map<String, Object> getEditNoticeList(Notice notice) {
		return dao.getEditNoticeList(notice);
	}

	// 공지사항 수정(업데이트)
	@Override
	public int editNotice(Notice notice) {
		return dao.editNotice(notice);
	}

	// 공지사항 상태 업데이트
	@Override
	public int updateNoticeST(Notice notice) {
		return dao.updateNoticeST(notice);
	}

	// 영화관 목록 조회
	@Override
	public Map<String, Object> getCinemaMap(int cp) {
		// 영화관 수 조회
		int cinemaCount = dao.getCinemaCount();

		// 조회한 영화관 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, cinemaCount);

		// 영화관 리스트 조회
		List<Cinema> cinemaList = dao.getCinemaList(pagination);

		Map<String, Object> cinemaMap = new HashMap<String, Object>();
		cinemaMap.put("pagination", pagination);
		cinemaMap.put("cinemaList", cinemaList);

		return cinemaMap;

	}

	// 관리자_극장 가격 목록 이동
	@Override
	public Map<String, Object> getCinemaPriceMap(int cp) {
		// 영화관 수 조회
		int cinemaPriceCount = dao.getCinemaPriceCount();

		// 조회한 영화관 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, cinemaPriceCount);

		// 영화관 리스트 조회
		List<CinemaPrice> cinemaPriceList = dao.getCinemaPriceList(pagination);

		Map<String, Object> cinemaMap = new HashMap<String, Object>();
		cinemaMap.put("pagination", pagination);
		cinemaMap.put("cinemaPriceList", cinemaPriceList);

		return cinemaMap;
	}

	// 영화 상영 상태 업데이트
	@Override
	public int updateMovieST(Movie movie) {
		return dao.updateMovieST(movie);
	}

	// 공지사항 리스트 갯수 반환
	@Override
	public int getNoticeListCount() {
		return dao.getNoticeListCount();
	}

	// 유저용 공지사항
	@Override
	public Map<String, Object> userNoticeList(int cp) {
		// 공지사항 수 조회
		int noticelistCount = dao.getNoticeListCount();

		// 조회한 공지사항 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, noticelistCount);

		// 공지사항 리스트 조회
		List<Notice> noticeLists = dao.userNoticeList(pagination);

		Map<String, Object> userNoticeList = new HashMap<String, Object>();
		userNoticeList.put("pagination", pagination);
		userNoticeList.put("noticeLists", noticeLists);

		return userNoticeList;
	}

	// 상영 중인 영화, 상영 시간표
	public Map<String, Object> getPlayMap() {
		List<Movie> playingMovieList = dao.getPlayingMovieList();
		List<TimeTable> timeTableList = dao.getTimeTableList();

		Map<String, Object> playMap = new HashMap<String, Object>();
		playMap.put("playingMovieList", playingMovieList);
		playMap.put("timeTableList", timeTableList);
		return playMap;
	}

	// 스토어 목록 조회
	@Override
	public Map<String, Object> getStoreMap(int cp) {
		//  스토어 수 조회
		int storeCount = dao.getStoreCount();

		// 조회한 스토어 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, storeCount);

		// 스토어 리스트 조회
		List<Store> storeList = dao.getStoreList(pagination);

		Map<String, Object> storeMap = new HashMap<String, Object>();
		storeMap.put("pagination", pagination);
		storeMap.put("storeList", storeList);

		return storeMap;
	}
	
	
	// 스토어 구매 목록 조회
	@Override
	public Map<String, Object> getStorebuyMap(int cp) {
			//  스토어오더 수 조회
			int storeBuyCount = dao.getStoreBuyCount();

			// 조회한 스토어 수를 pagination 에 담기
			Pagination pagination = new Pagination(cp, storeBuyCount);

			// 스토어 리스트 조회
			List<StoreOrder> storeOrderList = dao.getStoreOrderList(pagination);

			Map<String, Object> storebuyMap = new HashMap<String, Object>();
			storebuyMap.put("pagination", pagination);
			storebuyMap.put("storeOrderList", storeOrderList);

			return storebuyMap;
	}
	
	

	// 메인 -> 이벤트 이동 시 이벤트
	@Override
	public Map<String, Object> selectEventList() {

		List<Event> EventList = dao.selectEventList();

		Map<String, Object> getEvnetList = new HashMap<String, Object>();
		getEvnetList.put("getEvnetList", EventList);

		return getEvnetList;
	}

	// 메인 -> 이벤트 상세 내용
	@Override
	public Event getEventList(Event event) {
		return dao.getEventList(event);

	}

	// 메인 이벤트 목록 가지고 오기 - 7개
	@Override
	public Map<String, Object> mainEventList() {
		List<Event> EventList = dao.mainEventList();

		Map<String, Object> getEvnetList = new HashMap<String, Object>();
		getEvnetList.put("getEvnetList", EventList);

		return getEvnetList;
	}

	// 관리자_배너 등록
	@Override
	public int addBanner(banner banner) {
		return dao.addBanner(banner);
	}

	// 관리자_배너 목록 이동시 목록 조회
	@Override
	public Map<String, Object> getBannerList(int cp) {

		int bannerCount = dao.bannerCount();

		// 조회한 영화관 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, bannerCount);

		// 영화관 리스트 조회

		List<banner> BannerList = dao.getBannerList(pagination);

		Map<String, Object> getBannerList = new HashMap<String, Object>();
		getBannerList.put("BannerList", BannerList);

		return getBannerList;
	}

	// 관리자_배너 상태 업데이트
	@Override
	public int updateBannerST(banner banner) {
		return dao.updateBannerST(banner);
	}

	// 스토어 수정 조회
	@Override
	public Store getEditStoreList(Store store) {
		return dao.getEditStoreList(store);
	}

	// 스토어 수정 등록
	@Override
	public int StoreEdit(Store updateStore) {
		int result = dao.StoreEdit(updateStore);
		System.out.println("serviceImpl result:::::" + result);
		return result;
	}

	// 관리자_극장 가격 중복 조회
	@Override
	public Boolean checkPrice(CinemaPrice cp) {
		return dao.checkPrice(cp);
	}

	// 관리자_극장 가격 등록
	@Override
	public int addCinemaPrice(CinemaPrice cp) {
		return dao.addCinemaPrice(cp);
	}

	// 관리자_극장 가격 수정 이동
	@Override
	public Map<String, Object> getEditPriceList(CinemaPrice price) {
		return dao.getEditPriceList(price);
	}

	// 관리자_극장 가격 수정
	@Override
	public int EditCinemaPrice(CinemaPrice cp) {
		return dao.EditCinemaPrice(cp);
	}
	
	// 관리자_혜택 목록 조회
	@Override
	public Map<String, Object> getBenefitsList(int cp) {
		// 혜택 수 조회
		int benefitsCount = dao.getBenefitsCount();

		// 조회한 혜택 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, benefitsCount);

		// 혜택 리스트 조회
		List<Benefits> benefitsList = dao.getBenefitsList(pagination);
		
		Map<String, Object> getBenefitsList = new HashMap<String, Object>();
		getBenefitsList.put("pagination", pagination);
		getBenefitsList.put("benefitsList", benefitsList);
		
		return getBenefitsList;
		
	}

	// 관리자_배너 수정 이동
	@Override
	public Map<String, Object> getEditBannerList(banner banner) {
		return dao.getEditBannerList(banner);
	}

	// 관리자_배너 수정
	@Override
	public int editBanner(banner banner) {
		return dao.editBanner(banner);
	}

	// 관리자_1:1 문의 목록
	@Override
	public Map<String, Object> selectMTMList(int cp) {
		// 1:1 문의 목록 수 조회
		int mtmCount = dao.getMTMCount();

		// 조회한 문의 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, mtmCount);

		// 영화관 리스트 조회
		List<Mtm> getMTMList = dao.getAllMTMList(pagination);

		Map<String, Object> mtmlists = new HashMap<String, Object>();
		mtmlists.put("pagination", pagination);
		mtmlists.put("getMTMList", getMTMList);

		return mtmlists;
	}

	// 스토어 수정 중복검사
		@Override
		public int NameDupChecks(String storeName ,String originName) {
			
			
			return dao.NameDupChecks(storeName ,originName );
		}
				
			
	// 관리자_혜택 수정 페이지
	@Override
	public Map<String, Object> getEditBenefitsList(Benefits bene) {
		return dao.getEditBenefitsList(bene);
	}

	// 관리자_혜택 수정 등록
	@Override
	public int editBenefits(Benefits updatebene) {
		int result = dao.editBenefits(updatebene);
		System.out.println("serviceImpl result:::::" + result);
		return result;
	}

	// 관리자_분실물 목록 
	@Override
	public Map<String, Object> selectLostList(int cp) {
		
		// 분실물 목록 수 조회
		int lostCount = dao.getLostCount();

		// 조회한 문의 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, lostCount);

		// 영화관 리스트 조회
		List<LostPackage> getLostList = dao.getAllLostList(pagination);

		Map<String, Object> lostslists = new HashMap<String, Object>();
		lostslists.put("pagination", pagination);
		lostslists.put("getLostList", getLostList);

		return lostslists;
	}
	
	// 관리자_혜택 상태 업데이트
	@Override
	public int updateBenefitsST(Benefits bene) {
		return dao.updateBenefitsST(bene);
	}

	// 스토어 수정 중복 검사
	@Override
	public Store getStoreInfo(int storeNo) {
		return dao.getStoreInfo(storeNo);
	}


	// 관리자_혜택 삭제
	@Override
	public int deleteBenefits(int benefitsNo) {
		return dao.deleteBenefits(benefitsNo);
	}

	// 공지사항 조회수 증가
	@Override
	public int updateNoticeView(int noticeNo) {
		return dao.updateNoticeView(noticeNo);
	}

	// 관리자 회원 검색 기능
	@Override
	public Map<String, Object> getMemberSearch(Search search, int cp) {
		// 검색 회원 수 조회
		int searchMemberCount = dao.getSearchMemberCount(search);

		// 조회한 회원을 pagination 에 담기
		Pagination pagination = new Pagination(cp, searchMemberCount);

		//  검색 회원 리스트 조회
		List<User> userList = dao.selectSearchMemberList(pagination, search);

		Map<String, Object> getUserList = new HashMap<String, Object>();
		getUserList.put("pagination", pagination);
		getUserList.put("userList", userList);

		return getUserList;
	}
	
	// 관리자 1:1 문의 검색 기능
	@Override
	public Map<String, Object> getAskSearch(Search search, int cp) {
		
		// 검색한 1:1 문의 수 조회
		int searchAskCount = dao.getSearchAskCount(search);

		// 조회한 문의를 pagination 에 담기
		Pagination pagination = new Pagination(cp, searchAskCount);

		// 검색한 1:1 문의 리스트 조회
		List<Mtm> getMTMList = dao.selectSearchAskList(pagination, search);

		Map<String, Object> getMTMLists = new HashMap<String, Object>();
		getMTMLists.put("pagination", pagination);
		getMTMLists.put("getMTMList", getMTMList);

		return getMTMLists;
	}
	
	// 관리자 분실물 검색 기능
	@Override
	public Map<String, Object> getLostSearch(Search search, int cp) {
		// 검색한 분실물 수 조회
		int getLostSearch = dao.getSearchLostCount(search);
		System.out.println("========================================getLostSearch : " + getLostSearch);

		// 조회한 문의를 pagination 에 담기
		Pagination pagination = new Pagination(cp, getLostSearch);

		// 검색한 분실물 리스트 조회
		List<Mtm> getLostList = dao.selectSearchLostList(pagination, search);

		Map<String, Object> getLostLists = new HashMap<String, Object>();
		getLostLists.put("pagination", pagination);
		getLostLists.put("getLostList", getLostList);

		System.out.println("=================================getLostList : " + getLostLists);
		return getLostLists;
	}

	// 관리자 영화 검색 기능
	@Override
	public Map<String, Object> getMovieSearch(Search search, int cp) {
		
				// 영화 수 조회
				int movielistCount = dao.getSearchmovielistCount(search);

				// 조회한 공지사항 수를 pagination 에 담기
				Pagination pagination = new Pagination(cp, movielistCount);

				// 공지사항 리스트 조회
				List<Movie> movielist = dao.searchMovieList(pagination, search);
				// movielist에서 따온 값 가공하기
				List<Movie> cleanedList = new ArrayList<>();
				for (Movie movie : movielist) {
					Movie cleanedMovie = new Movie();
					cleanedMovie.setMgNo(Util.removeQuotes(movie.getMgNo()));
					cleanedMovie.setGenreName(Util.removeQuotes(movie.getGenreName()));
					cleanedMovie.setMovieNo(movie.getMovieNo());
					cleanedMovie.setMovieRuntime(movie.getMovieRuntime());
					cleanedMovie.setMovieTitle(movie.getMovieTitle());
					cleanedMovie.setMovieNation(movie.getMovieNation());
					cleanedMovie.setMovieOpen(movie.getMovieOpen());
					cleanedMovie.setMovieContent(movie.getMovieContent());
					cleanedMovie.setMovieImg1(movie.getMovieImg1());
					cleanedMovie.setMovieImg2(movie.getMovieImg2());
					cleanedMovie.setMovieImg3(movie.getMovieImg3());
					cleanedMovie.setMovieImg4(movie.getMovieImg4());
					cleanedMovie.setMovieImg5(movie.getMovieImg5());
					cleanedMovie.setMovieImg6(movie.getMovieImg6());
					cleanedMovie.setMovieUploader(movie.getMovieUploader());
					cleanedMovie.setMovieDirector(movie.getMovieDirector());
					cleanedMovie.setMovieCast(movie.getMovieCast());
					cleanedMovie.setMovieRegdate(movie.getMovieRegdate());
					cleanedMovie.setMovieSt(movie.getMovieSt());
		    		cleanedMovie.setMoviePlayed(movie.getMoviePlayed());
		    		cleanedMovie.setMovieWatched(movie.getMovieWatched());

					cleanedList.add(cleanedMovie);
				}
				Map<String, Object> getMovieList = new HashMap<String, Object>();
				getMovieList.put("pagination", pagination);
				getMovieList.put("cleanedList", cleanedList);
				
				return getMovieList;
	}
	
	// 관리자 상영중인 영화 검색
	@Override
	public Map<String, Object> getPlaySearch(Search search, int cp) {
		
		// 현재 상영중인 영화 검색 수
		int cinemaCount = dao.getSearchNowPlayCount(search);

		// 조회한 현재 상영중인 영화 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, cinemaCount);

		// 상영중인 영화 검색 리스트
		List<JoinPlay> playMovieList = dao.getSearchPlayList(pagination, search);
		
		Map<String, Object> getMovieList = new HashMap<String, Object>();
		getMovieList.put("pagination", pagination);
		getMovieList.put("playMovieList", playMovieList);
		
		return getMovieList;
	}

	// 관리자 상영이 끝난 영화 검색
	@Override
	public Map<String, Object> getPlayEndSearch(Search search, int cp) {
		// 상영이 끝난 영화 검색 수
		int cinemaCount = dao.getSearchPlayEndCount(search);

		// 조회한 현재 상영중인 영화 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, cinemaCount);

		// 상영이 끝난 영화 검색 리스트
		List<JoinPlay> playMovieList = dao.getSearchPlayEndList(pagination, search);
		
		Map<String, Object> getMovieList = new HashMap<String, Object>();
		getMovieList.put("pagination", pagination);
		getMovieList.put("playMovieList", playMovieList);
		
		return getMovieList;
	}
	
	@Override
	public int getSearchListCount(String keyword) {
		return dao.getNTCSearchListCount(keyword);
	}

	
	// 공지사항 검색기능 구현
	@Override
	public Map<String, Object> selectSearchNTC(String keyword, int cp) {
		
		int ntcCount = dao.getNTCSearchListCount(keyword);
		
		System.out.println(ntcCount);

		// 조회한 현재 상영중인 영화 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, ntcCount);
		
		List<Notice> noticeLists = dao.getSearchNTCList(pagination, keyword);
		
		Map<String, Object> userNoticeList = new HashMap<String, Object>();
		userNoticeList.put("pagination",pagination);
		userNoticeList.put("noticeLists", noticeLists);
		
		return userNoticeList;
	}



	// 관리자 극장목록 검색
	@Override
	public Map<String, Object> getSearchCinemaList(Search search, int cp) {
		// 극장 목록 검색 수
		int cinemaCount = dao.getSearchCinemaCount(search);

		Pagination pagination = new Pagination(cp, cinemaCount);

		// 극장 목록 검색
		List<Cinema> cinemaList = dao.getSearchCinemaList(pagination, search);

		Map<String, Object> cinemaMap = new HashMap<String, Object>();
		cinemaMap.put("pagination", pagination);
		cinemaMap.put("cinemaList", cinemaList);

		return cinemaMap;
	}
	
	// 관리자 극장 가격 검색
	@Override
	public Map<String, Object> getSearchCinemaPrice(Search search, int cp) {
		// 극장 가격 목록 검색 수
		int cinemaPriceCount = dao.getSearchCinemaPriceCount(search);

		Pagination pagination = new Pagination(cp, cinemaPriceCount);

		// 극장 가격 목록 검색
		List<CinemaPrice> cinemaPriceList = dao.getSearchCinemaPriceList(pagination, search);

		Map<String, Object> cinemaMap = new HashMap<String, Object>();
		cinemaMap.put("pagination", pagination);
		cinemaMap.put("cinemaPriceList", cinemaPriceList);

		return cinemaMap;
	}

	// 관리자 배너 검색
	@Override
	public Map<String, Object> getSearchBannerList(int cp, Search search) {
		//  배너 목록 검색 수
		int bannerCount = dao.bannerSearchCount(search);

		Pagination pagination = new Pagination(cp, bannerCount);
		
		//  배너 목록 검색
		List<banner> BannerList = dao.getSearchBannerList(pagination, search);

		Map<String, Object> getBannerList = new HashMap<String, Object>();
		getBannerList.put("BannerList", BannerList);

		return getBannerList;
	}

	// 관리자 이벤트 검색
	@Override
	public Map<String, Object> searchEventList(int cp, Search search) {
				//  이벤트 목록 검색 수
				int eventlistCount = dao.getSearchEventListCount(search);

				// 조회한 회원을 pagination 에 담기
				Pagination pagination = new Pagination(cp, eventlistCount);
				
				//  이벤트 목록 검색 조회
				List<Event> eventList = dao.SearchEventList(pagination, search);
				Map<String, Object> getEventList = new HashMap<String, Object>();
				getEventList.put("pagination", pagination);
				getEventList.put("eventList", eventList);

				return getEventList;
	}
	
	// 관리자 공지사항 검색
	@Override
	public Map<String, Object> searchNoticeList(int cp, Search search) {

		// 검색한 공지사항 수 조회
		int noticelistCount = dao.getSearchNoticeListCount(search);

		// 조회한 검색한 공지사항 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, noticelistCount);

		// 검색한 공지사항 리스트 조회
		List<Notice> noticeLists = dao.searchNoticeList(pagination, search);

		Map<String, Object> getNoticeList = new HashMap<String, Object>();
		getNoticeList.put("pagination", pagination);
		getNoticeList.put("noticeLists", noticeLists);

		return getNoticeList;
	}
	
	//관리자_예매 리스트 조회
	@Override
	public Map<String, Object> selectBookList(int cp) {

		// 예매 리스트 수 조회
		int noticelistCount = dao.selectBookListCount();

		// 조회한 예매 리스트 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, noticelistCount);
		// 예매 리스트 조회
		List<Book> bookLists = dao.getBookList(pagination);
		
		Map<String, Object> getBookList = new HashMap<String, Object>();
		getBookList.put("pagination", pagination);
		getBookList.put("bookLists", bookLists);

		return getBookList;
	}

	//관리자 예매 리스트 검색
	@Override
	public Map<String, Object> getBookSearch(Search search, int cp) {
		// 예매 리스트 검색 수 조회
		int noticelistCount = dao.getSearchBookListCount(search);

		// 조회한 예매 리스트 수를 pagination 에 담기
		Pagination pagination = new Pagination(cp, noticelistCount);
		// 예매 리스트 검색 조회
		List<Book> bookLists = dao.getSearchBookList(pagination, search);
		
		Map<String, Object> getBookList = new HashMap<String, Object>();
		getBookList.put("pagination", pagination);
		getBookList.put("bookLists", bookLists);

		return getBookList;
	}

	// 관리자 메인 일일 예매 수 조회
	@Override
	public List<DailyWatch> getWeeklyWatch(WeeklyEnter we) {
		return dao.getWeeklyWatch(we);
	}

	// 총 접속자 수
	@Override
	public int getTotalEntre() {
		return dao.getTotalEntre();
	}

	// 총 예매 수
	@Override
	public int getTotlaBook() {
		return dao.getTotalBook();
	}

	

	
}

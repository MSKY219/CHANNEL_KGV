package com.kh.kgv.management.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.kgv.customer.model.vo.Book;
import com.kh.kgv.customer.model.vo.User;
import com.kh.kgv.helpDesk.model.vo.LostPackage;
import com.kh.kgv.helpDesk.model.vo.Mtm;
import com.kh.kgv.items.model.vo.Movie;
import com.kh.kgv.items.model.vo.Store;
import com.kh.kgv.items.model.vo.TimeTable;
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
import com.kh.kgv.mypage.controller.MyPageController;
import com.kh.kgv.store.model.vo.StoreOrder;

@Repository
public class ManagerDAO {

	private Logger logger = LoggerFactory.getLogger(MyPageController.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 관리자 메인 신규 회원 목록 조회
	public List<User> getAllUser() {
		return sqlSession.selectList("managerMapper.getAllUser");
	}

	// 관리자 메인 공지사항 목록 조회
	public List<Notice> getAllNotice() {
		return sqlSession.selectList("managerMapper.getAllNotice");
	}

	// 관리자 메인 일일 접속자 수 조회
	public List<DailyEnter> getWeeklyEnter(WeeklyEnter we) {
		return sqlSession.selectList("managerMapper.getDailyEnter", we);
	}
	
	// 관리자 메인 1 : 1 문의 조회
	public List<Mtm> getMainMTMList() {
		return sqlSession.selectList("managerMapper.getMainMTMList");
	}

	/**
	 * 회원 수 조회
	 * 
	 * @return
	 */
	public int getListCount() {
		return sqlSession.selectOne("managerMapper.getListCount");
	}

	/**
	 * 회원 리스트 조회
	 * 
	 * @return
	 */
	public List<User> selectAll(Pagination pagination) {
		// RowBounds 객체 사용.

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.selectAll", null, rowBounds);

	}

	// 회원 관리자 상태 업데이트
	public int updateST(User user) {

		return sqlSession.update("managerMapper.updateST", user);
	}

	// 회원 이용제한 업데이트
	public int blockST(User user) {
		return sqlSession.update("managerMapper.blockST", user);
	}

	/**
	 * 영화 등록 DAO
	 * 
	 * @param inputMovie
	 * @return
	 */
	public int MovieAdd(Movie inputMovie) {
		System.out.println(" ============= 영화 등록 DAO실행");
		return sqlSession.insert("movieMapper.MovieAdd", inputMovie);
	}

	/**
	 * Grade 호출 DAO
	 * 
	 * @return
	 */
	public List<String> mgradeList() {
		System.out.println(" ===== Grade 호출 dao");
		return sqlSession.selectList("movieMapper.mgradeList");
	}

	/**
	 * Genre 호출 DAO
	 * 
	 * @return
	 */
	public List<String> mgenreList() {
		System.out.println(" ===== Genre 호출 dao");
		return sqlSession.selectList("movieMapper.mgenreList");
	}

	/**
	 * 영화 목록 수 조회
	 * 이값이 돌고 movielist에 들어가야 함
	 * 
	 * @return
	 */
	public int getmovielistCount() {
		return sqlSession.selectOne("movieMapper.getmovielistCount");
	}

	/**
	 * 위에서 getmovielistCount값을 받은다음에 실행 됨
	 * 
	 * @param pagination
	 * @return
	 */
	public List<Movie> movieList(Pagination pagination) {
		System.out.println(" ===== MovieListController 호출 dao");

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("movieMapper.movieList", null, rowBounds);
	}

	/**
	 * 영화 수정 페이지 이동
	 * 
	 * @param movieNo
	 * @return
	 */
	public Movie getEditMovieList(Movie movie) {
		return sqlSession.selectOne("movieMapper.getEditMovieList", movie);
	}

	/**
	 * 영화 수정 등록
	 * 
	 * @param updateMovie
	 * @return
	 */
	public int MovieEdit(Movie updateMovie) {
		return sqlSession.update("movieMapper.MovieEdit", updateMovie);
	}

	// 이벤트 목록 수 조회
	public int getEventListCount() {
		return sqlSession.selectOne("managerMapper.getEventListCount");
	}

	//
	public List<Event> eventList(Pagination pagination) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.eventList", null, rowBounds);
	}

	// 이벤트 수정조회
	public Map<String, Object> getEditEventList(Event event) {
		return sqlSession.selectOne("managerMapper.getEditEventList", event);
	}

	// 이벤트 수정(업데이트)
	public int editEvent(Event event) {
		return sqlSession.update("managerMapper.editEvent", event);
	}

	// 이벤트 상태 업데이트
	public int updateEventST(Event event) {
		return sqlSession.update("managerMapper.updateEventST", event);
	}

	// 공지사항 등록
	public int addNotice(Notice notice) {
		return sqlSession.insert("managerMapper.addNotice", notice);
	}

	// 공지사항 수 조회
	public int getNoticeListCount() {
		return sqlSession.selectOne("managerMapper.getNoticeListCount");
	}

	// 공지사항 조회
	public List<Notice> noticeList(Pagination pagination) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.noticeList", null, rowBounds);
	}

	// 공지사항 수정 조회
	public Map<String, Object> getEditNoticeList(Notice notice) {

		return sqlSession.selectOne("managerMapper.getEditNoticeList", notice);
	}

	// 공지사항 수정(업데이트)
	public int editNotice(Notice notice) {
		return sqlSession.update("managerMapper.editNotice", notice);
	}

	// 공지사항 상태 업데이트
	public int updateNoticeST(Notice notice) {
		return sqlSession.update("managerMapper.updateNoticeST", notice);
	}

	// 영화관 수 조회
	public int getCinemaCount() {
		return sqlSession.selectOne("cinemaMapper.getCinemaCount");
	}

	// 극장 가격 수 조회
	public int getCinemaPriceCount() {
		return sqlSession.selectOne("cinemaMapper.getCinemaPriceCount");
	}

	// 극장 가격 수 목록 조회
	public List<CinemaPrice> getCinemaPriceList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("cinemaMapper.getCinemaPriceList", null, rowBounds);
	}

	// 관리자_극장 가격 수정 이동
	public Map<String, Object> getEditPriceList(CinemaPrice price) {
		return sqlSession.selectOne("cinemaMapper.getEditPriceList", price);
	}

	// 유저용 공지사항 조회
	public List<Notice> userNoticeList(Pagination pagination) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.userNoticeList", null, rowBounds);
	}

	// 극장 목록 조회
	public List<Cinema> getCinemaList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("cinemaMapper.getCinemaList", null, rowBounds);
	}

	// 영화 상영 상태 업데이트
	public int updateMovieST(Movie movie) {
		return sqlSession.update("managerMapper.updateMovieST", movie);
	}

	// 상영 중인 영화 리스트 조회
	public List<Movie> getPlayingMovieList() {
		return sqlSession.selectList("playMapper.getPlayingMovieList");
	}

	// 상영 시간표 조회
	public List<TimeTable> getTimeTableList() {
		return sqlSession.selectList("playMapper.getTimeTableList");
	}

	// 스토어 수 조회
	public int getStoreCount() {
		return sqlSession.selectOne("storeMapper.getStoreCount");
	}
	
	// 스토어오더 수 조회 
		public int getStoreBuyCount() {
			return sqlSession.selectOne("storeMapper.getStoreBuyCount");
		}
	
	
	// 스토어 목록 조회
	public List<Store> getStoreList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("storeMapper.getStoreList", null, rowBounds);
	}
	
	// 스토어 구매 목록 조회
	public List<StoreOrder> getStoreOrderList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("storeMapper.getStoreBuyList", null, rowBounds);
	}
	
	

	// 메인 -> 이벤트 이동 시 이벤트
	public List<Event> selectEventList() {
		return sqlSession.selectList("managerMapper.selectEventList");
	}

	// 메인 -> 이벤트 상세 내용
	public Event getEventList(Event event) {
		return sqlSession.selectOne("managerMapper.getEventList", event);
	}

	// 메인 이벤트 목록 가지고 오기 - 7개
	public List<Event> mainEventList() {
		return sqlSession.selectList("managerMapper.mainEventList");
	}

	// 관리자_배너 등록
	public int addBanner(banner banner) {
		return sqlSession.insert("managerMapper.addBanner", banner);
	}

	// 관리자_배너 목록 이동시 배너 수 조회
	public int bannerCount() {
		return sqlSession.selectOne("managerMapper.bannerCount");
	}

	// 관리자_배너 목록 이동시 목록 조회
	public List<banner> getBannerList(Pagination pagination) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("managerMapper.getBannerList", null, rowBounds);
	}

	// 관리자_배너 상태 업데이트
	public int updateBannerST(banner banner) {
		return sqlSession.update("managerMapper.updateBannerST", banner);
	}

	// 스토어_물품 수정
	public Store getEditStoreList(Store store) {
		return sqlSession.selectOne("storeMapper.getEditStoreList", store);
	}

	// 스토어 수정 등록
	public int StoreEdit(Store updateStore) {
		return sqlSession.update("storeMapper.StoreEdit", updateStore);
	}

	// 관리자_극장 가격 중복 조회
	public Boolean checkPrice(CinemaPrice cp) {

		Boolean result = sqlSession.selectOne("managerMapper.checkPrice", cp);

		return result != null ? result : false;
	}

	// 관리자_극장 가격 등록
	public int addCinemaPrice(CinemaPrice cp) {
		return sqlSession.insert("managerMapper.addCinemaPrice", cp);
	}

	// 관리자_극장 가격 수정
	public int EditCinemaPrice(CinemaPrice cp) {
		return sqlSession.update("cinemaMapper.EditCinemaPrice", cp);
	}

	// 관리자_배너 수정 이동
	public Map<String, Object> getEditBannerList(banner banner) {
		return sqlSession.selectOne("managerMapper.getEditBannerList", banner);
	}

	public int editBanner(banner banner) {
		return sqlSession.update("managerMapper.editBanner", banner);
	}

	// 관리자_혜택 수 조회
	public int getBenefitsCount() {
		return sqlSession.selectOne("managerMapper.getBenefitsCount");
	}

	// 관리자_혜택 리스트 조회
	public List<Benefits> getBenefitsList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.benefitsList", null, rowBounds);
	}

	// 1:1 문의 목록 수 조회
	public int getMTMCount() {
		return sqlSession.selectOne("managerMapper.getMTMCount");
	}

	// 1:1 문의 목록 조회
	public List<Mtm> getAllMTMList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.getAllMTMList", null, rowBounds);
	}
	
	// 관리자_혜택 수정 페이지
	public Map<String, Object> getEditBenefitsList(Benefits bene) {
		return sqlSession.selectOne("managerMapper.getEditBenefitsList", bene);
	}
	
	// 관리자_혜택 수정 등록
	public int editBenefits(Benefits updatebene) {
		return sqlSession.update("managerMapper.editBenefits", updatebene);
	}

	// 분실물 목록 수 조회
	public int getLostCount() {
		return sqlSession.selectOne("managerMapper.getLostCount");
	}

	public List<LostPackage> getAllLostList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.getAllLostList", null, rowBounds);
	}
	
	// 관리자_혜택 상태 업데이트
	public int updateBenefitsST(Benefits bene) {
		return sqlSession.update("managerMapper.updateBenefitsST", bene);
	}
	
	
	// 스토어 중복 검사
	public int NameDupChecks(String storeName, String originName) {
		
		Map<String, Object> nameChecks = new HashMap<String, Object>();
		nameChecks.put("storeName", storeName);
		nameChecks.put("originName", originName);

		
	
		return sqlSession.selectOne("storeMapper.NameDupChecks", nameChecks );
	}
	// 스토어 중복 검사
	public Store getStoreInfo(int storeNo) {
		return sqlSession.selectOne("storeMapper.getEditStoreList", storeNo);
	}

	public int updateNoticeView(int noticeNo) {
		return sqlSession.update("managerMapper.updateNoticeView", noticeNo);

	}

	
	// 관리자_혜택 삭제
	public int deleteBenefits(int benefitsNo) {
		return sqlSession.delete("managerMapper.deleteBenefits",benefitsNo);
	}

	// 검색 회원 수 조회
	public int getSearchMemberCount(Search search) {
		return sqlSession.selectOne("managerMapper.getSearchMemberCount", search);
	}
	
	//  검색 회원 리스트 조회
	public List<User> selectSearchMemberList(Pagination pagination, Search search) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.selectSearchMemberList", search, rowBounds);
	}
	
	// 검색한 1:1 문의 수 조회
	public int getSearchAskCount(Search search) {
		return sqlSession.selectOne("managerMapper.getSearchAskCount", search);
	}

	// 검색한 1:1 문의 리스트 조회
	public List<Mtm> selectSearchAskList(Pagination pagination, Search search) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.selectSearchAskList", search, rowBounds);
	}

	// 검색한 분실물 수 조회
	public int getSearchLostCount(Search search) {
		return sqlSession.selectOne("managerMapper.getSearchLostCount", search);
	}

	// 검색한 분실물 리스트 조회
	public List<Mtm> selectSearchLostList(Pagination pagination, Search search) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.selectSearchLostList", search, rowBounds);
	}

	// 검색한 영화 수 조회
	public int getSearchmovielistCount(Search search) {
		return sqlSession.selectOne("managerMapper.getSearchmovielistCount", search);
	}

	// 검색한 영화 리스트 조회
	public List<Movie> searchMovieList(Pagination pagination, Search search) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.searchMovieList", search, rowBounds);
	}

	// 현재 상영중인 영화 검색 수
	public int getSearchNowPlayCount(Search search) {
		return sqlSession.selectOne("managerMapper.getSearchNowPlayCount", search);
	}
	
	// 상영중인 영화 검색 리스트
	public List<JoinPlay> getSearchPlayList(Pagination pagination, Search search) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.getSearchPlayList", search, rowBounds);
	}

	// 상영이 끝난 영화 검색 수
	public int getSearchPlayEndCount(Search search) {
		return sqlSession.selectOne("managerMapper.getSearchPlayEndCount", search);
	}

	// 상영이 끝난 영화 검색 리스트
	public List<JoinPlay> getSearchPlayEndList(Pagination pagination, Search search) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.getSearchPlayEndList", search, rowBounds);
	}

	// 극장 목록 검색 수
	public int getSearchCinemaCount(Search search) {
		return sqlSession.selectOne("managerMapper.getSearchCinemaCount", search);
	}
	
	// 극장 목록 검색
	public List<Cinema> getSearchCinemaList(Pagination pagination, Search search) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.getSearchCinemaList", search, rowBounds);
	}

	// 극장 가격 목록 검색 수
	public int getSearchCinemaPriceCount(Search search) {
		return sqlSession.selectOne("managerMapper.getSearchCinemaPriceCount", search);
	}
	
	// 극장 가격 목록 검색
	public List<CinemaPrice> getSearchCinemaPriceList(Pagination pagination, Search search) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.getSearchCinemaPriceList", search, rowBounds);
	}
	
	//  배너 목록 검색 수
	public int bannerSearchCount(Search search) {
		return sqlSession.selectOne("managerMapper.bannerSearchCount", search);
	}
	
	//  배너 목록 검색
	public List<banner> getSearchBannerList(Pagination pagination, Search search) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.getSearchBannerList", search, rowBounds);
	}

	//  이벤트 목록 검색 수
	public int getSearchEventListCount(Search search) {
		return sqlSession.selectOne("managerMapper.getSearchEventListCount", search);
	}

	//  이벤트 목록 검색 조회
	public List<Event> SearchEventList(Pagination pagination, Search search) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());


		return sqlSession.selectList("managerMapper.SearchEventList", search, rowBounds);
	}

	// 검색한 공지사항 수 조회
	public int getSearchNoticeListCount(Search search) {
		return sqlSession.selectOne("managerMapper.getSearchNoticeListCount", search);
	}
	
	// 검색한 공지사항 리스트 조회
	public List<Notice> searchNoticeList(Pagination pagination, Search search) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.searchNoticeList", search, rowBounds);
	}
	
	// 공지사항 검색 갯수 조회
	public int getNTCSearchListCount(String keyword) {
		
		return sqlSession.selectOne("managerMapper.getNTCSearchListCount", keyword);
		
	}

	// 공지사항 검색 리스트
	public List<Notice> getSearchNTCList(Pagination pagination, String keyword) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.getNTCSearchList", keyword, rowBounds);
	}

	// 예매 리스트 수 조회
	public int selectBookListCount() {
		return sqlSession.selectOne("managerMapper.selectBookListCount");
	}

	// 예매 리스트 조회
	public List<Book> getBookList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.getBookList", null, rowBounds);
	}

	// 예매 리스트 검색 수 조회
	public int getSearchBookListCount(Search search) {
		return sqlSession.selectOne("managerMapper.getSearchBookListCount", search);
	}
	
	// 예매 리스트 검색 조회
	public List<Book> getSearchBookList(Pagination pagination, Search search) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		return sqlSession.selectList("managerMapper.getSearchBookList", search, rowBounds);
	}

	// 관리자 메인 일일 예매 수 조회
	public List<DailyWatch> getWeeklyWatch(WeeklyEnter we) {
		return sqlSession.selectList("managerMapper.getWeeklyWatch", we);
	}

	// 총 접속자 수
	public int getTotalEntre() {
		return sqlSession.selectOne("managerMapper.getTotalEntre");
	}

	// 총 예매 수
	public int getTotalBook() {
		return sqlSession.selectOne("managerMapper.getTotalBook");
	}

	

	

}

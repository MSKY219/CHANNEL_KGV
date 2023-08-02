package com.kh.kgv.common.scheduling;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.kgv.reserve.model.service.ReserveService;

@Component
public class UpdatePlayScheduling {
	
	@Autowired
	private ReserveService service;
	
	Logger logger =LoggerFactory.getLogger(UpdatePlayScheduling.class);
	
	//  예매한 지 3분 넘게 결제 안 한 좌석 없애기
	
	// @Scheduled(cron="0 */3 * * * *") // 매 3분마다
	public void removeSeat() {
		int result = service.removeSeat();
		logger.info("스케줄 결과 : 미결제 예매 " + result + "건이 삭제되었습니다.");
	}
	
	// 영화별 총 관람 인원 수 업데이트하기
	
	// @Scheduled(cron="0 */10 * * * *") // 매 10분마다
	public void updateMovieWatchCount() {
		int result = service.updateMovieWatchCount();
		logger.info("스케줄 결과 : " + result + "건의 상영이 끝났습니다.");
	}
	
	
}

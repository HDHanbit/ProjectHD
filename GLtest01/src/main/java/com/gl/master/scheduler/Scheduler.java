package com.gl.master.scheduler;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gl.master.CustomerController;
import com.gl.master.model.customer.CustomerDaoImp;

@Component
public class Scheduler {

	private static final Logger logger = LoggerFactory
			.getLogger(Scheduler.class);

	@Autowired
	private SchedulerDao schedulerDao;

	/*
	 * 초 분 시 일 월 주(년) 
	 * "0 0 12 * * ?" : 아무 요일, 매월, 매일
	 *  12:00:00 "0 15 10 ? * *" :모든 요일, 매월, 아무 날이나 
	 *  10:15:00 "0 15 10 * * ?" : 아무 요일, 매월, 매일 10:15:00
	 * "0 15 10 * * ? *" : 모든 연도, 아무 요일, 매월, 매일 10:15 
	 * "0 15 10 * * ? : 2005" 2005년 아무 요일이나 매월, 매일 10:15 "0 * 14 * * ?" : 아무 요일, 매월, 매일, 14시 매분 0초
	 * "0 0/5 14 * * ?" : 아무 요일, 매월, 매일, 14시 매 5분마다 0초 "0 0/5 14,18 * * ?" : 아무
	 * 요일, 매월, 매일, 14시, 18시 매 5분마다 0초 "0 0-5 14 * * ?" : 아무 요일, 매월, 매일, 14:00 부터
	 * 매 14:05까지 매 분 0초 "0 10,44 14 ? 3 WED" : 3월의 매 주 수요일, 아무 날짜나 14:10:00,
	 * 14:44:00 "0 15 10 ? * MON-FRI" : 월~금, 매월, 아무 날이나 10:15:00
	 * "0 15 10 15 * ?" : 아무 요일, 매월 15일 10:15:00 "0 15 10 L * ?" : 아무 요일, 매월 마지막
	 * 날 10:15:00 "0 15 10 ? * 6L" : 매월 마지막 금요일 아무 날이나 10:15:00
	 * "0 15 10 ? * 6L 2002-2005" : 2002년부터 2005년까지 매월 마지막 금요일 아무 날이나 10:15:00
	 * "0 15 10 ? * 6#3" : 매월 3번째 금요일 아무 날이나 10:15:00
	 */
	// coupon 모든 년도,아무요일,매월,매일 9:0:0
	@Scheduled(cron = "0 0 9 * * ?")
	public void schedulerDelete() {
		logger.info("Scheduler: 기간이 지난 데이터를 삭제합니다.");
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = dayTime.format(new Date(time - 1000 * 24 * 60 * 60));
		logger.info(sysdate.toString());
		schedulerDao.deleteCUP(sysdate);// 전날 기한이 맞는 쿠폰 삭제
		schedulerDao.deleteCoupon(sysdate);// 전날 기한이 맞는 이벤트 삭제
	}

	// 제한 기간 아무요일, 매월 1일 9:0:0
	@Scheduled(cron = " 0 0 10 1 * ?")
	public void schedulerUpdate() {
		logger.info("Scheduler: 매월 고객의 등급을 update합니다.");
		schedulerDao.updateGrade();
		schedulerDao.insertCoupon();
	}
	// 고객 등급, 쿠폰 입력

}

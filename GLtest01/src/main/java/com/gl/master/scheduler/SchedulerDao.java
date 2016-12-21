package com.gl.master.scheduler;

import javax.xml.ws.soap.Addressing;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.gl.master.model.coupon.CouponVo;

public class SchedulerDao {
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//쿠폰 삭제
	public void deleteCUP(String date) {
		// TODO Auto-generated method stub
		sqlSession.delete("scheduler.deleteCoupon", date);		
	}
	//이벤트 삭제
	public void deleteCoupon(String date) {
		// TODO Auto-generated method stub
		sqlSession.insert("scheduler.deleteEvent", date);		
	}

	//등급 수정
	public void updateGrade() {
		// TODO Auto-generated method stub
		sqlSession.update("scheduler.updateOneGrade");
		sqlSession.update("scheduler.updateTwoGrade");
		sqlSession.update("scheduler.updateThreeGrade");
	}

	//쿠폰 입력
	public void insertCoupon() {
		// TODO Auto-generated method stub
		
		CouponVo bean = new CouponVo("", "[등급 쿠폰] : 10% 할인", 0.1, "흙흙모쏠", "");
		
		sqlSession.insert("scheduler.insertCoupon", bean);//1등급 쿠폰 입력
		
		bean.setCustomid("프로썸러");
		sqlSession.insert("scheduler.insertCoupon", bean);//2등급 쿠폰 입력
		sqlSession.insert("scheduler.insertCoupon", bean);//2개
		
		bean.setCupname("[등급 쿠폰] : 20% 할인");
		bean.setPercent(0.2);
		bean.setCustomid("파워러버");
		sqlSession.insert("scheduler.insertCoupon", bean);//파워러버 쿠폰 입력
		sqlSession.insert("scheduler.insertCoupon", bean);//2개
		
		bean.setCupname("[등급 쿠폰] : 30% 할인");
		bean.setPercent(0.3);
		bean.setCustomid("카사노바");
		sqlSession.insert("scheduler.insertCoupon", bean);//카사노바 쿠폰 입력
		sqlSession.insert("scheduler.insertCoupon", bean);//2개
			
	}
	

}

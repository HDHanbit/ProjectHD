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

	public void updateGrade() {
		// TODO Auto-generated method stub
		sqlSession.update("scheduler.updateOneGrade");
		sqlSession.update("scheduler.updateTwoGrade");
		sqlSession.update("scheduler.updateThreeGrade");
	}

	public void insertCoupon() {
		// TODO Auto-generated method stub
		//sqlSession.
	}
	

}

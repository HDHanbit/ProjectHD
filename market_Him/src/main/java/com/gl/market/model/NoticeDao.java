package com.gl.market.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface NoticeDao {
	
	List<NoticeVo> noticeAll();
	NoticeVo noticePop();
	NoticeVo selectOne(String notid);
	 
	List<QnaVo> qnaAll();
	QnaVo qnaOne(int num);
	
	List<EventVo> eventAll();
	EventVo eventOne(int num);
	
	List<VocVo> listAll(String userid);
	VocVo vocAnswer(String vocid);
	void vocQuestion(HashMap<String, String> map);
	
	BuyVo buypro(String proid);
	List<ProdetailVo> buypro2(String proid2);	
	List<CouponVo> coupon(String id);
	int leaveTk(HashMap<String, String> map);
	int searchtk(HashMap<String, String> map);
	void oder(HashMap<String, Object> map);
	UserJoinVo selmile(String id);
	void usemile(HashMap<String, Object> map);
	void delcoup(String coup);
	int tcash(String userid);
	
	
	
	
	
	
}

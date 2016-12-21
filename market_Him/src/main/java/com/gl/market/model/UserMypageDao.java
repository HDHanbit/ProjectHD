package com.gl.market.model;

import java.util.HashMap;
import java.util.List;

public interface UserMypageDao {

	UserJoinVo userOne(String id);
	UserJoinVo mileCk(String id);
	int copCk(String id);
	List<UserCopVo> copList(HashMap<String,Object> map);
	void userUpdata(UserJoinVo data);
	void userDelete(String id);
	int jumunCk(String id);
	List<UserOrderVo> juList(HashMap<String, Object> map);
	void juCancel(String orderid);
	int cancelCk(String id);
	List<UserOrderVo> cnlList(HashMap<String, Object> map);
	int basketCk(String id);
	List<UserOrderVo> bkList(HashMap<String, Object> map);
	void bkCancel(String basketid);
	
}

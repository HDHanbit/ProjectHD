package com.gl.market.model;

import java.util.List;

public interface UserLoginDao {
	
	int logCheck(UserJoinVo bean);
	UserJoinVo selId(UserJoinVo bean);
	List<UserJoinVo> selPw(UserJoinVo bean);
	List<UserJoinVo> logIn(UserJoinVo bean);
	void PwUp(UserJoinVo bean);
	
}

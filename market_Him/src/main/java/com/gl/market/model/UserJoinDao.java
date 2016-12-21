package com.gl.market.model;

import java.util.List;

public interface UserJoinDao {
	
	int idCheck(String id);
	void userInsert(UserJoinVo bean);
	List<UserJoinVo> userSelOne(String string);
	
}

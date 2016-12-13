package com.gl.master.model;

import java.util.List;

public interface MasterDao {
	
	List selectAll();

	Object selectOne(String id);

	void insertOne(Object bean);

	void updateOne(Object bean);

	void deleteOne(String id);

}

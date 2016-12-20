package com.gl.master.model.event;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gl.master.model.CatVo;
import com.gl.master.model.LocVo;
import com.gl.master.model.MasterDao;
import com.gl.master.model.product.ProductVo;

public class EventDaoImp implements MasterDao {

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	
	@Override
	public List<EventVo> selectAll() {
		List<EventVo> list = sqlSession.selectList("event.selectAll");
		return list;
	}

	@Override
	public EventVo selectOne(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.selectOne", id);
	}

	@Override
	public void insertOne(Object bean) {
		sqlSession.insert("event.insertOne", (EventVo)bean);

	}

	@Override
	public void updateOne(Object bean) {
		sqlSession.update("event.updateOne", (EventVo)bean);

	}

	@Override
	public void deleteOne(String id) {
		sqlSession.delete("event.deleteOne", id);

	}

	
	
}

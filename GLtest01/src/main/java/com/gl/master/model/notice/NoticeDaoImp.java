package com.gl.master.model.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gl.master.model.MasterDao;

public class NoticeDaoImp implements MasterDao {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<NoticeVo> selectAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("notice.selectAll");
	}

	@Override
	public NoticeVo selectOne(String notid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.selectOne", notid);
	}

	@Override
	public void insertOne(Object bean) {
		// TODO Auto-generated method stub
		sqlSession.insert("notice.insertOne", (NoticeVo) bean);
	}

	@Override
	public void updateOne(Object bean) {
		// TODO Auto-generated method stub
		sqlSession.update("notice.updateOne", (NoticeVo) bean);
	}

	@Override
	public void deleteOne(String notid) {
		// TODO Auto-generated method stub
		sqlSession.delete("notice.deleteOne", notid);
	}

}

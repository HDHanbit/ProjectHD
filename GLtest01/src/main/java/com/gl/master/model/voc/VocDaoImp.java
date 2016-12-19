package com.gl.master.model.voc;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gl.master.model.MasterDao;

public class VocDaoImp implements MasterDao {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	public List<VocVo> selectList(String field){
		String sql = "";
		if(field.equals("FAQ")){
			sql = "voc.selectAllFAQ";
		}else if(field.equals("OneQ")){
			sql = "voc.selectAllOneQ";			
		}else{
			sql = "voc.selectAllProQ";						
		}
		return sqlSession.selectList(sql);
	}

	@Override
	public VocVo selectOne(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("voc.selectOne", id);
	}

	@Override
	public void insertOne(Object bean) {
		// TODO Auto-generated method stub
		sqlSession.insert("voc.insertOne", (VocVo) bean);
	}

	@Override
	public void updateOne(Object bean) {
		// TODO Auto-generated method stub
		sqlSession.update("voc.updateOne", (VocVo) bean);
	}

	@Override
	public void deleteOne(String id) {
		// TODO Auto-generated method stub
		sqlSession.delete("voc.deleteOne",id);

	}

}

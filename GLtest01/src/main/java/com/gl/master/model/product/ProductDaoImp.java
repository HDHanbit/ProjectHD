package com.gl.master.model.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gl.master.model.MasterDao;

public class ProductDaoImp implements MasterDao {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ProductVo> selectAll() {
		// TODO Auto-generated method stub

		return sqlSession.selectList("product.selectAll");
	}

	@Override
	public Object selectOne(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertOne(Object bean) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateOne(Object bean) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteOne(String id) {
		// TODO Auto-generated method stub

	}

}

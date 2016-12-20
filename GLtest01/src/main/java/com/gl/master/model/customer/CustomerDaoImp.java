package com.gl.master.model.customer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gl.master.model.CatVo;
import com.gl.master.model.LocVo;
import com.gl.master.model.MasterDao;
import com.gl.master.model.coupon.CouponVo;
import com.gl.master.model.product.ProductVo;

public class CustomerDaoImp implements MasterDao {

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CustomerVo> selectAll() {
		List<CustomerVo> list = sqlSession.selectList("customer.selectAll");
		return list;
	}

	@Override
	public CustomerVo selectOne(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customer.selectOne", id);
	}

	public List<CouponVo> selectCoupon(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("customer.selectCoupon", id);
	}
	
	public void deleteCoupon(String id) {
		sqlSession.delete("customer.deleteCoupon", id);
	}

	@Override
	public void updateOne(Object bean) {
		sqlSession.update("customer.updateOne", (CustomerVo)bean);

	}

	@Override
	public void deleteOne(String id) {
		sqlSession.delete("customer.deleteOne", id);
		sqlSession.delete("customer.deleteOneCou", id);

	}



	@Override
	public void insertOne(Object bean) {
		// TODO Auto-generated method stub
		
	}

	
	
}

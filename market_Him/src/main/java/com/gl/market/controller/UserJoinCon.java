package com.gl.market.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.market.model.UserJoinDao;
import com.gl.market.model.UserJoinVo;

@Controller
public class UserJoinCon {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/gaip")
	public String userIn(){
		return "join/gaip";
	}
	
	@RequestMapping("/joinform")
	public String joinForm(){
		return "join/joinform";
	}
	
	@RequestMapping("/joincheck")
	public void joincheck(@RequestParam("id")String id, Model model, HttpServletResponse resp){
		
		UserJoinDao mapper = sqlSession.getMapper(UserJoinDao.class);
		int cnt = mapper.idCheck(id);
		try {
			PrintWriter out = resp.getWriter();
			out.print(cnt);
		} catch (IOException e) {
			System.out.println("프린트 오류");
		}
		
	}
	
	@RequestMapping("/join")
	public String joinInsert(UserJoinVo bean){
		UserJoinDao mapper = sqlSession.getMapper(UserJoinDao.class);
		mapper.userInsert(bean);
		return "redirect:/";
	}
	
}

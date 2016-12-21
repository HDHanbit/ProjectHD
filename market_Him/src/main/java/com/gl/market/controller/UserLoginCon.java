package com.gl.market.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.market.model.UserJoinVo;
import com.gl.market.model.UserLoginDao;

@Controller
public class UserLoginCon {
	
	@Autowired
	private SqlSession sqlSession;
	HttpSession session;
	
	@RequestMapping("/logform")
	public String logForm(){
		return "login/logfrom";
	}
	
	@RequestMapping("/selidpw")
	public String logout(){
		return "login/IdPwSel";
	}
	
	@RequestMapping("/logcheck")
	public void logCheck(UserJoinVo bean, Model model, HttpServletResponse resp){
		UserLoginDao mapper = sqlSession.getMapper(UserLoginDao.class);
		System.out.println(bean);
		int cnt = mapper.logCheck(bean);
		try {
			PrintWriter out = resp.getWriter();
			out.print(cnt);
		} catch (IOException e) {
			System.out.println("프린트 오류");
		}
	}
	
	@RequestMapping("/login")
	public String login(UserJoinVo bean, Model model, HttpServletRequest req){
		UserLoginDao mapper = sqlSession.getMapper(UserLoginDao.class);
		List<UserJoinVo> list = mapper.logIn(bean);
		String id = list.get(0).getId();
		String name = list.get(0).getName();
		session = req.getSession();
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		
		return "redirect:/";
	}
	
	@RequestMapping("/newpw")
	public String newPw(UserJoinVo bean, Model model, HttpServletRequest req){
		UserLoginDao mapper = sqlSession.getMapper(UserLoginDao.class);
		System.out.println(bean);
		mapper.PwUp(bean);
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(UserJoinVo bean, Model model, HttpServletRequest req){
		session = req.getSession();
		String id = (String)session.getAttribute("id");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/selid")
	public void selId(UserJoinVo data, Model model, HttpServletResponse resp){
		UserLoginDao mapper = sqlSession.getMapper(UserLoginDao.class);
		UserJoinVo bean = mapper.selId(data);
		String id="";
		id=bean.getId();
		try {
			PrintWriter out = resp.getWriter();
			out.print(id);
		} catch (IOException e) {
			System.out.println("프린트 오류");
		}
	}
	
	@RequestMapping("/selpw")
	public void selPW(UserJoinVo bean, Model model, HttpServletResponse resp){
		UserLoginDao mapper = sqlSession.getMapper(UserLoginDao.class);
		List<UserJoinVo> list = mapper.selPw(bean);
		String id="";
		if(list.size()>0){
			id=list.get(0).getId();
		}
		try {
			PrintWriter out = resp.getWriter();
			out.print(id);
		} catch (IOException e) {
			System.out.println("프린트 오류");
		}
	}
	
	
	
	
}

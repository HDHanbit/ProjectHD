package com.gl.market.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;











import javax.print.attribute.Size2DSyntax;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;










import com.gl.market.model.CouponVo;
import com.gl.market.model.NoticeDao;
import com.gl.market.model.OderVO;
import com.gl.market.model.ProdetailVo;
import com.gl.market.model.UserJoinVo;
import com.gl.market.model.VocVo;

@Controller
@RequestMapping("notice/")
public class NoticeController {
	
	@Autowired
	private SqlSession sqlSession;
	HttpSession session;
	
	
	@RequestMapping(value = "/")
	public String home(Model model, HttpServletRequest req) {
		
		session = req.getSession();
		String id = (String) session.getAttribute("id");
		session.setAttribute("id", id);
		return "notice";
	}
	
	@RequestMapping("noticelist/")
	public String noticeList(Model model){
		NoticeDao mapper=sqlSession.getMapper(NoticeDao.class);
		model.addAttribute("pop", mapper.noticePop());
		model.addAttribute("list", mapper.noticeAll());
		return "notice/noticelist";
	}
	@RequestMapping("detail/{idx}")
	public String guestDetail(@PathVariable("idx")String notid,Model model) {
		NoticeDao mapper = sqlSession.getMapper(NoticeDao.class);
		System.out.println(notid);
		model.addAttribute("bean",mapper.selectOne(notid));
		return "notice/noticedetail";
	}
	@RequestMapping("qna/")
	public String qnaList(Model model){
		NoticeDao mapper=sqlSession.getMapper(NoticeDao.class);
		model.addAttribute("list", mapper.qnaAll());
		return "notice/suplist";
	}
	@RequestMapping("qna/detail/{idx}")
	public String qnaDetail(@PathVariable("idx")int num,Model model) {
		NoticeDao mapper = sqlSession.getMapper(NoticeDao.class);
		System.out.println(num);
		model.addAttribute("bean",mapper.qnaOne(num));
		return "notice/supdetail";
	}
	@RequestMapping("event/")
	public String eventList(Model model){
		NoticeDao mapper=sqlSession.getMapper(NoticeDao.class);
		model.addAttribute("list", mapper.eventAll());
		return "notice/eventlist";
	}
	@RequestMapping("event/detail/{idx}")
	public String eventDetail(@PathVariable("idx")int num, Model model){
		NoticeDao mapper = sqlSession.getMapper(NoticeDao.class);
		System.out.println(num);
		model.addAttribute("bean", mapper.eventOne(num));
		return "notice/eveantdetail";
	}
	
	
	@RequestMapping("voc/")
	public String vocList(Model model, HttpServletRequest req){
		session = req.getSession();
		String userid = (String)session.getAttribute("id");
		NoticeDao mapper = sqlSession.getMapper(NoticeDao.class);
		List<VocVo> list = mapper.listAll(userid);
		model.addAttribute("list", list);
		return "notice/voclist";
	}
	
	@RequestMapping("voc/vocanswer/voc")
	public String vocAnswer(@RequestParam("idx") String vocid, Model model){
		NoticeDao mapper = sqlSession.getMapper(NoticeDao.class);
		System.out.println(vocid);
		model.addAttribute("bean", mapper.vocAnswer(vocid));
		return "notice/vocanswer";
	}
	
	@RequestMapping("voc/question")
	public String vocQuestin(){
		return "notice/vocwrite";
	}
	
	@RequestMapping("voc/list")
	public String vocWrite(@RequestParam("title") String voctitle,@RequestParam
			("content") String voccontent, HttpServletRequest req){
		System.out.println(voctitle);
		System.out.println(voccontent);
		session = req.getSession();
		String userid = (String)session.getAttribute("id");
		NoticeDao mapper = sqlSession.getMapper(NoticeDao.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("title", voctitle);
		map.put("content",voccontent);
		map.put("userid", userid);
		mapper.vocQuestion(map);
		return "redirect:/notice/voc/";
	}
	@RequestMapping("buy")
	public String buy(@RequestParam("proid")String proid, @RequestParam("ticket")String ticket
			, @RequestParam("orderticket")String orderticket, Model model, HttpServletRequest req){
		session = req.getSession();
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		NoticeDao mapper = sqlSession.getMapper(NoticeDao.class);
		model.addAttribute("buypro", mapper.buypro(proid));
		List<ProdetailVo> list = mapper.buypro2(proid);
		model.addAttribute("buypro2", list);
		List<CouponVo> coupon = mapper.coupon(id);
		UserJoinVo cash = mapper.selmile(id);
		model.addAttribute("name", name);
		model.addAttribute("coupon", coupon);
		model.addAttribute("ticket", ticket);
		model.addAttribute("orderticket", orderticket);
		model.addAttribute("mile", cash.getCash());
		return "notice/buy";
	}
	@RequestMapping("ticket/")
	public void ticket(@RequestParam("maxp")int maxp,@RequestParam("proid")String proid
			,@RequestParam("startday")String startday,@RequestParam("air")String air, HttpServletResponse resp){
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("proid", proid);
		map.put("startday", startday);
		map.put("air", air);
		NoticeDao mapper = sqlSession.getMapper(NoticeDao.class);
		System.out.println();
		PrintWriter out=null;
			try {
				out = resp.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		int cnt1 = mapper.leaveTk(map);
		if(cnt1==0){
			out.print(maxp);
		}else{
			int cnt2 = mapper.searchtk(map);
			System.out.println(cnt2);
			int tot= maxp-cnt2;
			out.print(tot);
		}
	}
	@RequestMapping("buy/complete")
	public String complete(OderVO vo, @RequestParam("total")String total, @RequestParam("num")int num,
			@RequestParam("start")String start, @RequestParam("air")String air, @RequestParam("proid")String proid,
			@RequestParam("oderid")String oderid,@RequestParam("mile")int mile,@RequestParam("coup")String coup, HttpServletRequest req){
		session = req.getSession();
		String userid = (String) session.getAttribute("id");
		NoticeDao mapper = sqlSession.getMapper(NoticeDao.class);
		int addmile =(int)(Integer.parseInt(total)*0.01);
		int tcash = mapper.tcash(userid);
		System.out.println(tcash);
		tcash+=Integer.parseInt(total);
		mile+=addmile;
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("userid", userid);	
		map.put("oderid", oderid);	
		map.put("proid", proid);
		map.put("total", total);
		map.put("num", num);
		map.put("start", start);
		map.put("air", air);
		map.put("mile", mile);
		map.put("tcash", tcash);
		mapper.oder(map);
		mapper.usemile(map);
		mapper.delcoup(coup);
		return "notice/buysuccess";
	}
}
package com.gl.master;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gl.master.model.CatVo;
import com.gl.master.model.coupon.CouponDaoImp;
import com.gl.master.model.notice.NoticeDaoImp;
import com.gl.master.model.notice.NoticeVo;
import com.gl.master.model.product.ProductVo;

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	// 공지사항, 팝업 컨트롤러

	private static final Logger logger = LoggerFactory
			.getLogger(NoticeController.class);

	@Autowired
	private NoticeDaoImp noticeDaoImp;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String noticeList(Model model) {
		// 쿠폰 등록 페이지 보여주기
		logger.info("notice-index");

		List<NoticeVo> list = noticeDaoImp.selectAll();
		model.addAttribute("nlist", list);
		model.addAttribute("cnt", list.size() + "_"
				+ (char) (Math.random() * 26 + 65));
		return "notice/list";
	}

	// insert
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String noticeInsert(NoticeVo bean, Model model) {
		// 쿠폰 등록 페이지 보여주기
		logger.info("insert-index");
		noticeDaoImp.insertOne(bean);
		return "redirect:/notice/";
	}

	// update
	@RequestMapping(value = "update", method=RequestMethod.POST)
	public String noticeUpdate(NoticeVo bean, Model model,
			HttpServletRequest request) {
		// 쿠폰 등록 페이지 보여주기
		logger.info("update");
		logger.info("fileupload BF : " + bean.toString());
		MultipartFile popFile = bean.getNotF();
		if (popFile != null) {
			String FileName = popFile.getOriginalFilename();
			try {
				FileName = URLDecoder.decode(FileName, "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			bean.setNotfile(FileName);
			String url = request.getRealPath("file") + "/";
			logger.info(url);
			try {
				File file = new File(url + FileName);
				popFile.transferTo(file);

			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		} // if
		logger.info("fileupload AF : " + bean.toString());
		if(bean.getNotcontent()==null){
			bean.setNotcontent(null);
		}else{
			bean.setNotfile(null);
		}
		noticeDaoImp.updateOne(bean);
		return "redirect:/notice/";
	}

	// del
	@RequestMapping(value = "del")
	public String noticeDel(@RequestParam("id") String notid, Model model) {
		// 쿠폰 등록 페이지 보여주기
		logger.info("del");
		noticeDaoImp.deleteOne(notid);
		return "redirect:/notice/";
	}

}

package com.gl.master;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gl.master.model.CatVo;
import com.gl.master.model.notice.NoticeDaoImp;
import com.gl.master.model.notice.NoticeVo;
import com.gl.master.model.product.ProductVo;
import com.gl.master.model.voc.VocDaoImp;
import com.gl.master.model.voc.VocVo;

@Controller
@RequestMapping("/voc/")
public class VocController {

	private static final Logger logger = LoggerFactory
			.getLogger(VocController.class);

	@Autowired
	private VocDaoImp vocDaoImp;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String vocList(@RequestParam("field") String field, Model model) {
		// 쿠폰 등록 페이지 보여주기
		logger.info("voc-index");

		List<VocVo> list = vocDaoImp.selectList(field);
		model.addAttribute("vlist", list);
		return "voc/" + field;
	}

	// FAQ
	@RequestMapping(value = "detailFAQ")
	public String faqDetail(@RequestParam("id") String vocid, Model model) {
		// add:그냥 입력으로 폼 보여주기
		// vocid:값을 가진 입력 폼으로 수정가능하게 보여주기

		if (vocid.equals("add")) {
			logger.info("product-detail/add form");
			model.addAttribute("title", "입력");
			model.addAttribute("url", "insertFAQ");
		} else {
			logger.info("product-detail/parameter ok");

			VocVo bean = vocDaoImp.selectOne(vocid);
			logger.info(bean.toString());
			model.addAttribute("title", "수정");
			model.addAttribute("bean", bean);
			model.addAttribute("url", "updateFAQ");
		}
		return "voc/detailFAQ";
	}

	@RequestMapping(value = "insertFAQ", method = RequestMethod.POST)
	public String insertVocFAQ(VocVo bean, Model model) {
		logger.info("insert");
		bean.setVocid("FAQ_" + (int) (Math.random() * 10) + "_"
				+ (char) (Math.random() * 25 + 65));
		vocDaoImp.insertOne(bean);

		return "redirect:/voc/list?field=FAQ";
	}

	@RequestMapping(value = "updateFAQ", method = RequestMethod.POST)
	public String updateVocFAQ(VocVo bean, Model model) {
		logger.info("update");
		vocDaoImp.updateOne(bean);

		return "redirect:/voc/list?field=FAQ";
	}

	// FAQ

	// OneQ 1:1문의
	@RequestMapping(value = "detail")
	public String oneQdetail(@RequestParam("id") String vocid,
			@RequestParam("field") String field, Model model) {

		VocVo bean = vocDaoImp.selectOne(vocid);
		logger.info(bean.toString());
		model.addAttribute("field", field);
		model.addAttribute("bean", bean);
		return "voc/detailQ";
	}

	@RequestMapping(value = "updateOneQ", method = RequestMethod.POST)
	public String updateVocOneQ(VocVo bean, Model model) {
		logger.info("updateOneQ");
		vocDaoImp.updateOne(bean);

		return "redirect:/voc/list?field=OneQ";
	}

	@RequestMapping(value = "updateProQ", method = RequestMethod.POST)
	public String updateVocProQ(VocVo bean, Model model) {
		logger.info("updateProQ");
		vocDaoImp.updateOne(bean);

		return "redirect:/voc/list?field=ProQ";
	}

	@RequestMapping(value = "del")
	public String vocDelete(@RequestParam("id") String vocid,
			@RequestParam("field") String field) {
		// 항목삭제

		vocDaoImp.deleteOne(vocid);

		return "redirect:/voc/list?field=" + field;
	}

}

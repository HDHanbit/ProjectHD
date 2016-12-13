package com.gl.master;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gl.master.model.MasterDao;

@Controller
public class ProductController {

	private static final Logger logger = LoggerFactory
			.getLogger(ProductController.class);

	
	private MasterDao masterDao;
	public void setMasterDao(MasterDao masterDao) {
		this.masterDao = masterDao;
	}

	@RequestMapping(value = "/list")
	public String productList(Model model) {
		logger.info("productList index");

		model.addAttribute("plist", masterDao.selectAll());
		return "productList";
	}

}

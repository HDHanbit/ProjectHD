package com.gl.master;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.junit.runners.Parameterized.Parameters;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gl.master.model.CatVo;
import com.gl.master.model.LocVo;
import com.gl.master.model.MasterDao;
import com.gl.master.model.event.EventDaoImp;
import com.gl.master.model.event.EventVo;
import com.gl.master.model.product.ProductDaoImp;
import com.gl.master.model.product.ProductVo;

@Controller
@RequestMapping("/event/")
public class EventController {
	// 이벤트 컨트롤러

	private static final Logger logger = LoggerFactory
			.getLogger(EventController.class);

	@Autowired //set대신 사용
	private EventDaoImp eventDaoImp;

	//1. 이벤트 전체리스트 
	@RequestMapping(value = "list")
	public String eventList(Model model) {
		logger.info("eventList index");

		List<EventVo> list = eventDaoImp.selectAll();

		for (EventVo bean : list) {
			logger.info(bean.toString());
		}
		model.addAttribute("elist", list);
		return "event/list";
	}

	//2. 이벤트 디테일 
	@RequestMapping(value = "detail")
	public String eventDetail(@RequestParam("id") String eid, Model model,
			HttpServletRequest request) {
		// add:그냥 입력으로 폼 보여주기
		// eid:값을 가진 입력 폼으로 수정가능하게 보여주기
		
		if (eid.equals("add")) {

			logger.info("event-detail/add form");
			model.addAttribute("title", "입력");
			model.addAttribute("url", "insert");
		} else {
			logger.info("event-detail/parameter ok");
			EventVo bean = eventDaoImp.selectOne(eid);
			logger.info(bean.toString());

			model.addAttribute("title", "수정");
			model.addAttribute("bean", bean);
			model.addAttribute("url", "update");
		}
		return "event/detail";
	}

	//3. 이벤트 삭제 
	@RequestMapping(value = "del")
	public String eventDelete(@RequestParam("id") String eid) {
		// 항목삭제

		eventDaoImp.deleteOne(eid);

		return "redirect:/event/list";
	}

	//4. 이벤트 입력
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	//bean=>getter, setter로!
	public String insertEvent(@Valid EventVo bean, BindingResult result, 
			Model model, HttpServletRequest request) {
		logger.info("vaildation check");
		if (result.hasErrors()) {
			logger.info("vaildation check");
			Map errMsgs = new HashMap<String, String>();
			List<FieldError> errs = result.getFieldErrors();
			for (FieldError err : errs) {
				logger.info(err.getField() + ":" + err.getDefaultMessage());
				errMsgs.put(err.getField(), "has-error");
			}
			model.addAttribute("errs", errMsgs);
			model.addAttribute("bean", bean);
			model.addAttribute("title", "입력");
			model.addAttribute("url", "insert");
			return "event/detail";

		}
		
		logger.info("file upload BE : " + bean.toString());

		MultipartFile eimgFile = bean.getEimgFile();

		if (eimgFile != null) {
			String eimgFileName = eimgFile.getOriginalFilename();
			try {
				eimgFileName = URLDecoder.decode(eimgFileName, "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			bean.setEimg(eimgFileName);
			String url = request.getRealPath("file") + "/";
			logger.info(url);
			try {
				File fileTb = new File(url + eimgFileName);
				eimgFile.transferTo(fileTb);
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		} // if

		String eid =bean.getEduring().toString().substring(8, 10);
		bean.setEid(eid);
		logger.info(bean.getEid());
		logger.info("file upload AF : " + bean.toString());

		eventDaoImp.insertOne(bean);

		return "redirect:/event/list";
	}

	
	// bean=>getter, setter로!
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateEvent(@Valid EventVo bean, BindingResult result,
			Model model, HttpServletRequest request) {
		logger.info("vaildation check");
		if (result.hasErrors()) {
			logger.info("vaildation check");
			Map errMsgs = new HashMap<String, String>();
			List<FieldError> errs = result.getFieldErrors();
			for (FieldError err : errs) {
				logger.info(err.getField() + ":" + err.getDefaultMessage());
				errMsgs.put(err.getField(), "has-error");
			}
			model.addAttribute("errs", errMsgs);
			model.addAttribute("bean", bean);
			model.addAttribute("title", "수정");
			model.addAttribute("url", "update");
			return "event/detail";

		}// end if(validation)
		logger.info("file upload BE : " + bean.toString());

		//파일 수정
		MultipartFile eimgFile = bean.getEimgFile();

		if (eimgFile != null) {
			String eimg = makeFile(eimgFile, bean, request);
			bean.setEimg(eimg);
		} 
		logger.info("file upload AF : " + bean.toString());
		eventDaoImp.updateOne(bean);
		return "redirect:/event/list";
	}

	//파일 업로드 관련 method
	public String makeFile(MultipartFile file, EventVo bean,
			HttpServletRequest request) {
		MultipartFile mFile = file;
		String mFileName = "";

		if (mFile != null) {
			mFileName = mFile.getOriginalFilename();
			try {
				mFileName = URLDecoder.decode(mFileName, "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String url = request.getRealPath("file") + "/";
			logger.info(url);
			try {

				File fileNew = new File(url + mFileName);
				mFile.transferTo(fileNew);
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		}// if
		return mFileName;
	}// makeFile
}

package com.hpe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hpe.po.StuResult;
import com.hpe.po.Student;
import com.hpe.service.StuResultService;
import com.hpe.service.StudentService;

@Controller
@RequestMapping(value="/stuResult")
public class StuResultController {

	@Autowired
	private StuResultService stuResultService;
	
	@RequestMapping(value="/refreshPage")
	public ModelAndView refreshPage(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		List<StuResult> s = stuResultService.getAllStuResult();
		req.getSession().setAttribute("stuResultlist", s);
		mav.setViewName("stuResultQuery");
		return mav;
	}
	
	@RequestMapping(value="/goResultPage")
	public ModelAndView goResultPage(String studentId){
		ModelAndView mav = new ModelAndView();
		List<StuResult> s = stuResultService.getStuResultByStudentId(studentId);
		mav.addObject("stuResultlist", s);
		mav.setViewName("stuResultQuery2");
		return mav;
	}	
}

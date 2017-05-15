package com.hpe.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hpe.po.Lesson;
import com.hpe.po.Shiti;
import com.hpe.po.Taoti;
import com.hpe.service.ShitiService;
import com.hpe.service.TaotiService;

@Controller
@RequestMapping(value="/shiti")
public class ShitiController {

	@Autowired
	private ShitiService shitiService;
	
	@Autowired
	private TaotiService taotiService;
	
	@RequestMapping(value="/refreshPage")
	public ModelAndView refreshPage(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		List<Shiti> s = shitiService.getAllShiti();
		req.getSession().setAttribute("shitilist", s);
		mav.setViewName("manage/shiti");
		return mav;
	}
	
	@RequestMapping(value="/goAddShitiPage")
	public ModelAndView goAddShitiPage(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		List<Lesson> s = taotiService.getAllLesson();
		req.getSession().setAttribute("lessons", s);
		mav.setViewName("manage/shiti_Add2");
		return mav;
	}
	
	@RequestMapping(value="/goModifyPage")
	public ModelAndView goModifyPage(HttpServletRequest req,String id){
		ModelAndView mav = new ModelAndView();
		Shiti s = shitiService.getShitiById(id);
		req.getSession().setAttribute("shiti", s);
		mav.setViewName("manage/shiti_Modify");
		return mav;
	}
		
	@RequestMapping(value="/add")
	public ModelAndView add(HttpServletRequest req,Shiti shiti){
		ModelAndView mav = new ModelAndView();
	
		boolean flag = shitiService.add(shiti);
		if(flag){
			req.setAttribute("para","1");
			mav.setViewName("manage/shiti_ok");
		}else{
			mav.addObject("error","添加套题失败");
			mav.setViewName("manage/error");
		}		
		return mav;
	}
	
	@RequestMapping(value="/modify")
	public ModelAndView modify(Shiti t){
		boolean flag = shitiService.modify(t);
		ModelAndView mav = new ModelAndView();
		if(flag){
			mav.setViewName("forward:../shiti/refreshPage");
		}else{
			mav.addObject("error","修改失败");
			mav.setViewName("manage/error");
		}
		return mav;
	}
	
	@RequestMapping(value="/delete")
	public ModelAndView delete(HttpServletRequest req,String id){
		ModelAndView mav = new ModelAndView();
		boolean flag = shitiService.deleteShiti(id);
		if(flag){
			req.setAttribute("para","2");
			mav.setViewName("manage/shiti_ok");
		}else{
			mav.addObject("error","删除失败");
			mav.setViewName("manage/error");
		}		
		return mav;
	}
	
}

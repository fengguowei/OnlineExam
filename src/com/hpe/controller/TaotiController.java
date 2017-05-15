package com.hpe.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hpe.po.Lesson;
import com.hpe.po.Taoti;
import com.hpe.service.TaotiService;

@Controller
@RequestMapping(value="/taoti")
public class TaotiController {

	@Autowired
	private TaotiService taotiService;
	
	@RequestMapping(value="/refreshPage")
	public ModelAndView refreshPage(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		List<Taoti> s = taotiService.getAllTaoti();
		req.getSession().setAttribute("taotilist", s);
		mav.setViewName("manage/taoTi");
		return mav;
	}
	
	@RequestMapping(value="/getLessons")
	public ModelAndView getLessons(HttpServletRequest req){		
		List<Lesson> lessons = taotiService.getAllLesson();
		req.getSession().setAttribute("lessons", lessons);
		return null;
	}
		
	@RequestMapping(value="/add")
	public ModelAndView add(HttpServletRequest req,String name, String lessonid){
		ModelAndView mav = new ModelAndView();
		Taoti taoti = new Taoti();
		taoti.setCreateTime(new Date());
		taoti.setName(name);
		Lesson l = new Lesson();
		l.setId(lessonid);
		taoti.setLesson(l);
			
		boolean flag = taotiService.add(taoti);
		if(flag){
			req.setAttribute("para","1");
			mav.setViewName("manage/taoti_ok");
		}else{
			mav.addObject("error","添加套题失败");
			mav.setViewName("manage/error");
		}		
		return mav;
	}
	
	@RequestMapping(value="/modify")
	public ModelAndView modify(Taoti t){
		boolean flag = taotiService.modify(t);
		ModelAndView mav = new ModelAndView();
		if(flag){
			mav.setViewName("forward:../taoti/refreshPage");
		}else{
			mav.addObject("error","修改失败");
			mav.setViewName("manage/error");
		}
		return mav;
	}
	
	@RequestMapping(value="/delete")
	public ModelAndView delete(HttpServletRequest req,String id){
		ModelAndView mav = new ModelAndView();
		boolean flag = taotiService.deleteTaoti(id);
		if(flag){
			req.setAttribute("para","2");
			mav.setViewName("manage/taoti_ok");
		}else{
			mav.addObject("error","删除失败");
			mav.setViewName("manage/error");
		}		
		return mav;
	}
	
	@RequestMapping(value="/getTaotiByLessonId")
	public ModelAndView getTaotiByLessonId(String lessonId,HttpServletResponse resp){
		ModelAndView mav = new ModelAndView();
		List<Taoti> taotis = taotiService.getTaotiByLessionId(lessonId);
		mav.addObject("taotis",taotis);
		mav.setViewName("manage/taotiSelect");
		return mav;
	}
	
}

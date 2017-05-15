package com.hpe.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hpe.po.Lesson;
import com.hpe.po.StuResult;
import com.hpe.po.Student;
import com.hpe.service.LessonService;
import com.hpe.service.StuResultService;
import com.hpe.service.StudentService;

@Controller
@RequestMapping(value="/lesson")
public class LessonController {

	@Autowired
	private LessonService lessonService;
	
	@RequestMapping(value="/refreshPage")
	public ModelAndView refreshPage(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		List<Lesson> s = lessonService.getAllLesson();
		req.getSession().setAttribute("lessonlist", s);
		mav.setViewName("manage/lesson");
		return mav;
	}
	
	@RequestMapping(value="/goSelectLessonPage")
	public ModelAndView goSelectLessonPage(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		List<Lesson> s = lessonService.getAllLesson();
		req.getSession().setAttribute("lessons", s);
		mav.setViewName("selectLesson");
		return mav;
	}
	
	@RequestMapping(value="/add")
	public ModelAndView add(HttpServletRequest req,String name){
		ModelAndView mav = new ModelAndView();
		Lesson l = new Lesson();
		l.setName(name);
		l.setCreateTime(new Date());
		boolean flag = lessonService.add(l);
		
		if(flag){
			req.setAttribute("para","1");
			mav.setViewName("manage/lesson_ok");
		}else{
			mav.addObject("error","添加失败");
			mav.setViewName("manage/error");
		}	
		
		return mav;
	}
	
	@RequestMapping(value="/modify")
	public ModelAndView modify(Lesson l){
		l.setCreateTime(new Date());
		boolean flag = lessonService.modify(l);
		ModelAndView mav = new ModelAndView();
		if(flag){
			mav.setViewName("forward:../lesson/refreshPage");
		}else{
			mav.addObject("error","修改失败");
			mav.setViewName("manage/error");
		}
		return mav;
	}
	
	@RequestMapping(value="/delete")
	public ModelAndView deleteLesson(HttpServletRequest req,String id){
		ModelAndView mav = new ModelAndView();
		boolean flag = lessonService.deleteLesson(id);
		if(flag){
			req.setAttribute("para","2");
			mav.setViewName("manage/lesson_ok");
		}else{
			mav.addObject("error","删除失败");
			mav.setViewName("manage/error");
		}		
		return mav;
	}
	
}

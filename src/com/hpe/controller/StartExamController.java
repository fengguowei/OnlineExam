package com.hpe.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hpe.po.ExamPaper;
import com.hpe.po.Shiti;
import com.hpe.po.StuResult;
import com.hpe.po.Student;
import com.hpe.po.Taoti;
import com.hpe.service.ShitiService;
import com.hpe.service.StuResultService;
import com.hpe.service.TaotiService;
import com.hpe.util.ChStr;

@Controller
@RequestMapping(value="/exam")
public class StartExamController {

	@Autowired
	private ShitiService shitiService;
	
	@Autowired
	private StuResultService stuResultService;
	
	@Autowired
	private TaotiService taotiService;
	
	@RequestMapping(value="/ready")
	public ModelAndView refreshPage(HttpServletRequest req,Shiti shiti){
		ModelAndView mav = new ModelAndView();
		mav.addObject("taotiId", shiti.getTaoti().getId());
		mav.setViewName("ready");
		return mav;
	}
	
	@RequestMapping(value="/goExamPaper")
	public ModelAndView goExamPaper(HttpServletRequest req,String taotiId){
		List<Shiti> shitis = shitiService.getShitiByTaotiId(taotiId);
		req.getSession().setAttribute("whichLesson", taotiId);
		double manfen = 0;
		double singlefen = 0;
		double morefen = 0;
		List<Shiti> singleShitis = new ArrayList<Shiti>();
		List<Shiti> moreShitis = new ArrayList<Shiti>();
		for(Shiti shiti : shitis){
			if(shiti.getType().equals("单选题")){
				singleShitis.add(shiti);
				singlefen += shiti.getScore();
			}
			if(shiti.getType().equals("多选题")){
				moreShitis.add(shiti);
				morefen += shiti.getScore();
			}
		}
		manfen = singlefen+morefen;
		req.getSession().setAttribute("manfen", manfen);
		req.getSession().setAttribute("morefen", morefen);
		req.getSession().setAttribute("singlefen", singlefen);
		req.getSession().setAttribute("singleShitis", singleShitis);
		req.getSession().setAttribute("moreShitis", moreShitis);
		req.getSession().setAttribute("startTime", new Date().getTime());

		return null;
	}
	
	@RequestMapping(value="/showStartTime")
	public ModelAndView showStartTime(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		long a=(Long) req.getSession().getAttribute("startTime");
		long b=new Date().getTime();
		int h=(int)Math.abs((b-a)/3600000);
		String hour=ChStr.formatNO(h,2);
		int m=(int)(b-a)%3600000/60000;
		String minute=ChStr.formatNO(m,2);
		int s=(int)((b-a)%3600000)%60000/1000;
		String second=ChStr.formatNO(s,2);
		String time=hour+":"+minute+":"+second;
		mav.addObject("showStartTime",time);
		mav.setViewName("showStartTime");
		return mav;
	}
	
	@RequestMapping(value="/showRemainTime")
	public ModelAndView showRemainTime(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();

		long a=(Long) req.getSession().getAttribute("startTime");
		long b=new java.util.Date().getTime();
		long r=20*60000-(b-a-1000);
		int h=(int)Math.abs(r/3600000);
		String hour=ChStr.formatNO(h,2);
		int m=(int)(r)%3600000/60000;
		String minute=ChStr.formatNO(m,2);
		int s=(int)((r)%3600000)%60000/1000;
		String second=ChStr.formatNO(s,2);
		String time=hour+":"+minute+":"+second;
		mav.addObject("showRemainTime",time);
		mav.setViewName("showRemainTime");
		
		return mav;
	}
	
	@RequestMapping(value="/submitPaper")
	public ModelAndView submitPaper(HttpServletRequest req,ExamPaper examPaple){
		ModelAndView mav = new ModelAndView();
		List<Shiti> singleShiti = examPaple.getSingleshitis();
		List<Shiti> moreShiti = examPaple.getMoreshitis();
		Student stu = (Student) req.getSession().getAttribute("student");
		double ressingle = 0;
		double resmore = 0;
		double restotal = 0;
		if(singleShiti!=null&&!singleShiti.isEmpty()){
			for(Shiti st : singleShiti){
				if(st.getAnswer()!=null){			
					if(st.getAnswer().equals(st.getMyanswer())){
						ressingle+=st.getScore();
					}
				}
			}
		}
		if(moreShiti!=null&&!moreShiti.isEmpty()){
			for(Shiti st : moreShiti){
				if(st.getAnswer()!=null){	
					if(st.getAnswer().equals(st.getMyanswer())){
						resmore+=st.getScore();
					}
				}
			}
		}

		restotal = ressingle + resmore;
		StuResult stuResult = new StuResult();
		stuResult.setJoinTime(new Date());
		stuResult.setResMore(resmore);
		stuResult.setResSingle(ressingle);
		stuResult.setResTotal(restotal);
		stuResult.setStudent(stu);
		String id = (String) req.getSession().getAttribute("whichLesson");
		Taoti taiti = taotiService.getTaotiById(id);
		stuResult.setWhichLesson(taiti.getName());
		
		boolean flag = stuResultService.saveResult(stuResult);
		if(flag){
			mav.addObject("submitTestPaperok","试卷已提交，您本次考试的成绩为："+Math.round(restotal)+"分！");
			mav.setViewName("submitPaperOk");
		}
		return mav;
	}
}

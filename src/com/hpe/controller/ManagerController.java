package com.hpe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hpe.po.Manager;
import com.hpe.service.ManagerService;

@Controller
@RequestMapping(value="/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(HttpServletRequest req,String name, String pwd){
		ModelAndView mav = new ModelAndView();
		Manager manager = managerService.login(name, pwd);
		req.getSession().setAttribute("manager", manager);
		
		List<Manager> list = managerService.getAllManager();
		req.getSession().setAttribute("list", list);
		
		boolean flag = false;
		if(null!=manager){
			flag =  true;
		}
		if(flag){
			mav.setViewName("manage/main");
		}else{
			mav.addObject("errorLogin", "账号或密码错误，登录失败");
			mav.setViewName("manage/login");
		}
		return mav;
	}
	
	@RequestMapping(value="/refreshPage")
	public ModelAndView refreshPage(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		
		List<Manager> list = managerService.getAllManager();
		req.getSession().setAttribute("list", list);
		mav.setViewName("manage/main");
		
		return mav;
	}
	
	
	@RequestMapping(value="/add")
	public ModelAndView addManager(HttpServletRequest req,Manager manager){
		ModelAndView mav = new ModelAndView();
		boolean flag = managerService.addManager(manager);
		if(flag){
			req.setAttribute("para","1");
			mav.setViewName("manage/manager_ok");
		}else{
			mav.addObject("error","注册失败");
			mav.setViewName("manage/error");
		}		
		return mav;
	}
	
	@RequestMapping(value="/delete")
	public ModelAndView deleteManager(HttpServletRequest req,String id){
		ModelAndView mav = new ModelAndView();
		boolean flag = managerService.deleteManager(id);
		if(flag){
			req.setAttribute("para","2");
			mav.setViewName("manage/manager_ok");
		}else{
			mav.addObject("error","删除失败");
			mav.setViewName("manage/error");
		}		
		return mav;
	}
	
	@RequestMapping(value="/modify")
	public ModelAndView modifyManager(HttpServletRequest req,Manager manager){
		ModelAndView mav = new ModelAndView();
		boolean flag = managerService.modifyManager(manager);
		mav.setViewName("manage/main");
		return mav;
	}
	
	
}

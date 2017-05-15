package com.hpe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hpe.po.Student;
import com.hpe.service.StudentService;

@Controller
@RequestMapping(value="/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value="/register")
	public ModelAndView register(Student student){
		String str = studentService.register(student);
		System.out.println("注册的考号是："+str);
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("examNum", str);
		return mav;
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(HttpServletRequest req,String examNum, String pwd){
		ModelAndView mav = new ModelAndView();
		Student stu = studentService.login(examNum, pwd);
		req.getSession().setAttribute("student", stu);
		boolean flag = false;
		if(null!=stu){
			flag =  true;
		}
		if(flag){
			mav.setViewName("default");
		}else{
			mav.addObject("errorLogin", "考号密码错误，登录失败");
			mav.setViewName("index");
		}
		return mav;
	}
	
	@RequestMapping(value="/goModifyStudent")
	public ModelAndView goModifyStudent(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		Student stu = (Student) req.getSession().getAttribute("student");
		mav.addObject("student", stu);
		mav.setViewName("student_Modify");
		return mav;
	}
	
	@RequestMapping(value="/modifyStudent")
	public ModelAndView modifyStudent(String pwd1,Student student){
		ModelAndView mav = new ModelAndView();
		student.setPwd(pwd1);
		if(studentService.modifyStudent(student)){
			mav.setViewName("studentM_ok");
		}
		return mav;
	}
	
	@RequestMapping(value="/seekPwd")
	public ModelAndView seekPwd(String examNum){
		ModelAndView mav = new ModelAndView();
		Student s = studentService.seekPwdByExamNum(examNum);
		if(s==null){
			mav.setViewName("error");
		}else{
			mav.addObject("seekstudent", s);
			mav.setViewName("seekPwd1");
		}
		return mav;
	}
	
	@RequestMapping(value="/seekPwd1")
	public ModelAndView seekPwd1(String examNum, String question, String answer){
		ModelAndView mav = new ModelAndView();
		Student s = studentService.getStuentByExamNumAndQuestionAndAnswer(examNum, question, answer);
		if(s==null){
			mav.setViewName("error");
		}else{
			mav.addObject("seek2student", s);
			mav.setViewName("seekPwd2");
		}
		return mav;
	}
	
	@RequestMapping(value="/refreshPage")
	public ModelAndView refreshPage(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		List<Student> s = studentService.getAllStudent();
		req.getSession().setAttribute("studentlist", s);
//		mav.addObject("studentlist", s);
		mav.setViewName("manage/student");
		return mav;
	}
	
	@RequestMapping(value="/delete")
	public ModelAndView deleteManager(HttpServletRequest req,String id){
		ModelAndView mav = new ModelAndView();
		boolean flag = studentService.deleteStudent(id);
		if(flag){
			mav.setViewName("manage/student_ok");
		}else{
			mav.addObject("error","删除失败");
			mav.setViewName("manage/error");
		}		
		return mav;
	}
}

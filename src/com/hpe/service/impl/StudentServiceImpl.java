package com.hpe.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hpe.dao.StudentDao;
import com.hpe.po.Student;
import com.hpe.service.StudentService;
import com.hpe.util.StringUtils;

@Service("studentService")
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDao studentDao;
	
	@Override
	public String register(Student student) {
		String examNum = "";
		String dateStr=new SimpleDateFormat("yyyyMMdd").format(new Date());//创建时当时间的字符串
		if(StringUtils.isBlank(studentDao.getMaxExamNum())){
			examNum = "CN"+dateStr + "001";
		}else{
			String maxNumStr = (Long.valueOf(studentDao.getMaxExamNum())+1)+"";
			examNum = "CN"+ maxNumStr;
		}
		student.setExamNum(examNum);
		student.setCreateTime(new Date());
		if(studentDao.register(student)){
			return examNum;
		}else{
			return "注册失败，请联系管理员";
		}
	}

	@Override
	public Student login(String examNum, String pwd) {
		return studentDao.getStuentByExamNumAndPwd(examNum, pwd);
		
	}

	@Override
	public boolean modifyStudent(Student student) {
		return studentDao.updateStudent(student);
	}

	@Override
	public Student seekPwdByExamNum(String examNum) {
		return studentDao.getStuentByExamNum(examNum);
	}

	@Override
	public Student getStuentByExamNumAndQuestionAndAnswer(String examNum,
			String question, String answer) {
		return studentDao.getStuentByExamNumAndQuestionAndAnswer(examNum, question, answer);
	}

	@Override
	public List<Student> getAllStudent() {
		return studentDao.getAllStudent();
	}

	@Override
	public boolean deleteStudent(String id) {
		// TODO Auto-generated method stub
		return studentDao.deleteStudentById(id);
	}

}

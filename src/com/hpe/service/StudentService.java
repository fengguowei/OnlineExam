package com.hpe.service;

import java.util.List;

import com.hpe.po.Student;

public interface StudentService {
	
	public String register(Student student);
	
	public Student login(String examNum,String pwd);
	
	public Student seekPwdByExamNum(String examNum);
	
	public boolean modifyStudent(Student student);
	
	public Student getStuentByExamNumAndQuestionAndAnswer(String examNum,String question,String answer);
	
	public List<Student> getAllStudent();

	public boolean deleteStudent(String id);
}

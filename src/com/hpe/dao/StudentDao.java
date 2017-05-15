package com.hpe.dao;

import java.util.List;

import com.hpe.po.Student;

public interface StudentDao {
	
	public boolean register(Student student);//注册用户
	
	public String getMaxExamNum();//获取做大考号
	
	/**
	 * 通过考号和密码查询学生
	 * @param examNum
	 * @param pwd
	 * @return
	 */
	public Student getStuentByExamNumAndPwd(String examNum,String pwd);
	
	/**
	 * 查询考号是否存在
	 * @param examNum
	 * @param pwd
	 * @return
	 */
	public Student getStuentByExamNum(String examNum);
	
	/**
	 * 查询考号密码
	 * @param examNum
	 * @param pwd
	 * @return
	 */
	public Student getStuentByExamNumAndQuestionAndAnswer(String examNum,String question,String answer);
	
	public boolean updateStudent(Student stu);
	
	public List<Student> getAllStudent();
	
	public boolean deleteStudentById(String id);
}

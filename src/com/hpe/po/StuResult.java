package com.hpe.po;

import java.util.Date;

public class StuResult {

	private String id;
	private String whichLesson;//所属课程
	private Double resMore;//多选题分数
	private Double resSingle;//单选题分数
	private Double resTotal;//合计分数
	private Date joinTime;//考试时间
	private Student student;//学生
	
	
	public Double getResTotal() {
		return resTotal;
	}
	public void setResTotal(Double resTotal) {
		this.resTotal = resTotal;
	}
	public Date getJoinTime() {
		return joinTime;
	}
	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}
	public String getWhichLesson() {
		return whichLesson;
	}
	public void setWhichLesson(String whichLesson) {
		this.whichLesson = whichLesson;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Double getResMore() {
		return resMore;
	}
	public void setResMore(Double resMore) {
		this.resMore = resMore;
	}
	public Double getResSingle() {
		return resSingle;
	}
	public void setResSingle(Double resSingle) {
		this.resSingle = resSingle;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}	
}

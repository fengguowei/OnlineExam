package com.hpe.po;

import java.util.Date;
import java.util.Set;

public class Student {
	private String id;//id
	
	private String examNum;//考号
	
	private String name;//考生姓名
	
	private String pwd;//密码
	
	private String sex;//性别
	
	private Date createTime;//创建时间
	
	private String question;//问题
	
	private String answer;//答案
	
	private String profession;//专业
	
	private String cardId;//身份证号码
	
	private Set<StuResult> stuResult;//一个学生对应多个成绩
	
	public Set<StuResult> getStuResult() {
		return stuResult;
	}

	public void setStuResult(Set<StuResult> stuResult) {
		this.stuResult = stuResult;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getExamNum() {
		return examNum;
	}

	public void setExamNum(String examNum) {
		this.examNum = examNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}
	
	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	
	
}

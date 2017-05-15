package com.hpe.po;

public class Shiti {
	private String id;//主键
	
	private String type;//题目的类型
	
	private String question;//题目的问题
	
	private String optionA;//A选项
	private String optionB;//B选项
	private String optionC;//C选项
	private String optionD;//D选项
	
	private String answer;//答案
	
	private Double score;//分值
	
	private String remark;//备注
	
	private Taoti taoti;
	
	
	private String myanswer; //回答的的答案
	
	
	public String getMyanswer() {
		return myanswer;
	}

	public void setMyanswer(String myanswer) {
		this.myanswer = myanswer;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOptionA() {
		return optionA;
	}

	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}

	public String getOptionB() {
		return optionB;
	}

	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}

	public String getOptionC() {
		return optionC;
	}

	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}

	public String getOptionD() {
		return optionD;
	}

	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Taoti getTaoti() {
		return taoti;
	}

	public void setTaoti(Taoti taoti) {
		this.taoti = taoti;
	}
	
	
	
}

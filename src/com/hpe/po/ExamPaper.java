package com.hpe.po;

import java.util.List;

public class ExamPaper {
	public List<Shiti> singleshitis;//单选题
	public List<Shiti> moreshitis;//多选题
	
	public List<Shiti> getSingleshitis() {
		return singleshitis;
	}
	public void setSingleshitis(List<Shiti> singleshitis) {
		this.singleshitis = singleshitis;
	}
	public List<Shiti> getMoreshitis() {
		return moreshitis;
	}
	public void setMoreshitis(List<Shiti> moreshitis) {
		this.moreshitis = moreshitis;
	}
}

package com.hpe.po;

import java.util.Date;
import java.util.Set;

public class Taoti {
	
	private String id;//主键
	
	private String name;//套题的名称
	
	private Date createTime;//创建套题的时间
	
	private Lesson lesson;//套题属于哪门课程
	
	private Set<Shiti> shitis;//这套题下有多个试题

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Lesson getLesson() {
		return lesson;
	}

	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}

	public Set<Shiti> getShitis() {
		return shitis;
	}

	public void setShitis(Set<Shiti> shitis) {
		this.shitis = shitis;
	}
	
	
	
}

package com.hpe.po;

import java.util.Date;
import java.util.Set;

public class Lesson {
	
	private String id;//主键
	
	private String name;//课程的名称
	
	private Date createTime;//创建这门课程时间
	
	private Set<Taoti> taotis;//课程下面包含哪些套题

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

	public Set<Taoti> getTaotis() {
		return taotis;
	}

	public void setTaotis(Set<Taoti> taotis) {
		this.taotis = taotis;
	}
	
	
	
	
}

package com.hpe.dao;

import java.util.List;

import com.hpe.po.StuResult;

public interface StuResultDao {
	
	public List<StuResult> getAllStuResult();

	public boolean save(StuResult stuResult);

	public List<StuResult> getStuResultByStudentId(String studentId);
	
}

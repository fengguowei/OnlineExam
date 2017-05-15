package com.hpe.service;

import java.util.List;

import com.hpe.po.StuResult;

public interface StuResultService {
	
	
	public List<StuResult> getAllStuResult();

	public boolean saveResult(StuResult stuResult);

	public List<StuResult> getStuResultByStudentId(String studentId);

}

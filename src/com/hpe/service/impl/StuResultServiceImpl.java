package com.hpe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hpe.dao.StuResultDao;
import com.hpe.po.StuResult;
import com.hpe.service.StuResultService;

@Service("stuResultService")
public class StuResultServiceImpl implements StuResultService {
	
	@Autowired
	private StuResultDao stuResultDao;

	@Override
	public List<StuResult> getAllStuResult() {
		return stuResultDao.getAllStuResult();
	}

	@Override
	public boolean saveResult(StuResult stuResult) {
		return stuResultDao.save(stuResult);
	}

	@Override
	public List<StuResult> getStuResultByStudentId(String studentId) {
		return stuResultDao.getStuResultByStudentId(studentId);
	}
	
	

	

}

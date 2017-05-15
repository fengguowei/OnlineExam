package com.hpe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hpe.dao.LessonDao;
import com.hpe.dao.StuResultDao;
import com.hpe.po.Lesson;
import com.hpe.po.StuResult;
import com.hpe.service.LessonService;
import com.hpe.service.StuResultService;

@Service("lessonService")
public class LessonServiceImpl implements LessonService {
	
	@Autowired
	private LessonDao lessonDao;

	@Override
	public List<Lesson> getAllLesson() {
		return lessonDao.getAllLesson();
	}

	@Override
	public boolean add(Lesson l) {
		return lessonDao.add(l);
		
	}

	@Override
	public boolean modify(Lesson l) {
		
		return lessonDao.modify(l);
	}

	@Override
	public boolean deleteLesson(String id) {
		return lessonDao.deleteLesson(id);
	}


	
	

	

}

package com.hpe.dao;

import java.util.List;

import com.hpe.po.Lesson;
import com.hpe.po.StuResult;

public interface LessonDao {
	
	public List<Lesson> getAllLesson();
	
	public boolean add(Lesson l);
	
	public boolean modify(Lesson l);
	
	public boolean deleteLesson(String id);

}

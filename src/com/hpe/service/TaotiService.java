package com.hpe.service;

import java.util.List;

import com.hpe.po.Lesson;
import com.hpe.po.StuResult;
import com.hpe.po.Taoti;
import com.hpe.po.TaotiBean;

public interface TaotiService {
	
	
	public List<Taoti> getAllTaoti();
	
	public boolean add(Taoti l);
	
	public boolean modify(Taoti l);
	
	public boolean deleteTaoti(String id);

	public List<Lesson> getAllLesson();
	
	public List<Taoti> getTaotiByLessionId(String id);

	public Taoti getTaotiById(String id);

}

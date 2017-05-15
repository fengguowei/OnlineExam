package com.hpe.dao;

import java.util.List;

import com.hpe.po.Lesson;
import com.hpe.po.StuResult;
import com.hpe.po.Taoti;
import com.hpe.po.TaotiBean;

public interface TaotiDao {
	
	public List<TaotiBean> getAllTaoti();
	
	public List<Taoti> getAllTaotis();
	
	public boolean add(Taoti l);
	
	public boolean modify(Taoti l);
	
	public boolean deleteTaoti(String id);
	
	public Taoti getTaotiById(String id);

	public List<Lesson> getAllLessons();
	
	public List<Taoti> getTaotiByLessionId(String id);

}

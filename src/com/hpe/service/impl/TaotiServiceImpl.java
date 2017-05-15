package com.hpe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hpe.dao.LessonDao;
import com.hpe.dao.StuResultDao;
import com.hpe.dao.TaotiDao;
import com.hpe.po.Lesson;
import com.hpe.po.StuResult;
import com.hpe.po.Taoti;
import com.hpe.po.TaotiBean;
import com.hpe.service.LessonService;
import com.hpe.service.StuResultService;
import com.hpe.service.TaotiService;

@Service("taotiService")
public class TaotiServiceImpl implements TaotiService {
	
	@Autowired
	private TaotiDao taotiDao;

	@Override
	public List<Taoti> getAllTaoti() {
		return taotiDao.getAllTaotis();
	}

	@Override
	public boolean add(Taoti l) {
		return taotiDao.add(l);
	}

	@Override
	public boolean modify(Taoti l) {
		return taotiDao.modify(l);
	}

	@Override
	public boolean deleteTaoti(String id) {
		return taotiDao.deleteTaoti(id);
	}

	@Override
	public List<Lesson> getAllLesson() {
		return taotiDao.getAllLessons();
	}

	@Override
	public List<Taoti> getTaotiByLessionId(String id) {
		return taotiDao.getTaotiByLessionId(id);

	}

	@Override
	public Taoti getTaotiById(String id) {
		return taotiDao.getTaotiById(id);
	}

}

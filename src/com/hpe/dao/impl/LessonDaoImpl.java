package com.hpe.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.hpe.dao.LessonDao;
import com.hpe.po.Lesson;
import com.hpe.po.Taoti;

@Repository("lessonDao")
public class LessonDaoImpl implements LessonDao{
	
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<Lesson> getAllLesson() {
		final String hql = "from Lesson ";
		List<Lesson> result = (List<Lesson>) hibernateTemplate.execute(new HibernateCallback<List<Lesson>>() {
			@Override
			public List<Lesson> doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				return query.list();
			}
		});
		return result;
	}

	@Override
	public boolean add(Lesson l) {
		try {
			hibernateTemplate.saveOrUpdate(l);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean modify(Lesson l) {
		try {
			Lesson lesson = hibernateTemplate.get(Lesson.class, l.getId());
			Set<Taoti> taotis = lesson.getTaotis();
			for(Taoti t:taotis){
				t.getLesson().setName(l.getName());
			}
			
			hibernateTemplate.update(lesson);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteLesson(String id) {
		try {			
			Lesson l = hibernateTemplate.get(Lesson.class, id);
			hibernateTemplate.delete(l);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}

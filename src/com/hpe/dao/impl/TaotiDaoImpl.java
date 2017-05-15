package com.hpe.dao.impl;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.hpe.dao.TaotiDao;
import com.hpe.po.Lesson;
import com.hpe.po.Taoti;
import com.hpe.po.TaotiBean;

@Repository("taotiDao")
public class TaotiDaoImpl implements TaotiDao{
	
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<TaotiBean> getAllTaoti() {
		final String sql = "select t.id,t.lessonId,t.joinTime,t.name,l.name as lessonName from Taoti t left join Lesson l on t.lessonId=l.ID";
		List<TaotiBean> result = (List<TaotiBean>) hibernateTemplate.execute(new HibernateCallback<List<TaotiBean>>() {
			@Override
			public List<TaotiBean> doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createSQLQuery(sql);
				List l = query.list();
				List<TaotiBean> list = new ArrayList<TaotiBean>();
				for(Object o : l){
					Object[] obs = (Object[]) o;
					TaotiBean tb = new TaotiBean();
					tb.setId(obs[0].toString());
					tb.setLessonId(obs[1].toString());
					
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
					Date date = null;
					try {
						date = sdf.parse(obs[2].toString());
					} catch (ParseException e) {
						e.printStackTrace();
					}  
					
					tb.setJoinTime(date);
					tb.setName(obs[3].toString());
					tb.setLessonName(obs[4].toString());
					list.add(tb);
				}
				return list;
			}
		});
		return result;

	}
	


	@Override
	public boolean add(Taoti t) {
		try {
			hibernateTemplate.saveOrUpdate(t);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean modify(Taoti t) {
		try {
			Taoti taoti = hibernateTemplate.get(Taoti.class, t.getId());
			taoti.setName(t.getName());
			hibernateTemplate.update(taoti);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteTaoti(String id) {
		try {
			Taoti t = hibernateTemplate.get(Taoti.class, id);
			t.getLesson().getTaotis().remove(t);
			t.setLesson(null);
			hibernateTemplate.delete(t);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Taoti getTaotiById(String id) {
		Taoti l = hibernateTemplate.get(Taoti.class, id);
		return l;
	}



	@Override
	public List<Taoti> getAllTaotis() {
		final String hql = "from Taoti";
		List<Taoti> result = hibernateTemplate.execute(new HibernateCallback<List<Taoti>>() {
			@Override
			public List<Taoti> doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery(hql).list();
			}			
		});
		return result;
	}



	@Override
	public List<Lesson> getAllLessons() {
		final String hql = "from Lesson";
		List<Lesson> result = hibernateTemplate.execute(new HibernateCallback<List<Lesson>>() {
			@Override
			public List<Lesson> doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery(hql).list();
			}			
		});
		return result;
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<Taoti> getTaotiByLessionId(final String id) {
		final String hql = "from Taoti t where t.lesson.id = ?";		
		List<Taoti> result = hibernateTemplate.execute(new HibernateCallback<List<Taoti>>() {
			@Override
			public List<Taoti> doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery(hql).setString(0, id).list();
			}			
		});
		return result;
	}
	
}

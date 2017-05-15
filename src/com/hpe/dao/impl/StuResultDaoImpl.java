package com.hpe.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.hpe.dao.StuResultDao;
import com.hpe.po.StuResult;
import com.hpe.po.Student;

@Repository("stuResultDao")
public class StuResultDaoImpl implements StuResultDao{
	
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<StuResult> getAllStuResult() {
		final String hql = "from StuResult ";
		List<StuResult> result = (List<StuResult>) hibernateTemplate.execute(new HibernateCallback<List<StuResult>>() {
			@Override
			public List<StuResult> doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				return query.list();
			}
		});
		return result;
	}

	@Override
	public boolean save(StuResult stuResult) {
		try {
			hibernateTemplate.save(stuResult);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<StuResult> getStuResultByStudentId(String studentId) {
		String hql = "from StuResult s where s.student.id = ?";
		return hibernateTemplate.find(hql, studentId);
	}
	
	
}

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

import com.hpe.dao.StudentDao;
import com.hpe.po.Manager;
import com.hpe.po.Student;

@Repository("studentDao")
public class StudentDaoImpl implements StudentDao{
	
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public boolean register(Student student){
		try {
			hibernateTemplate.save(student);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public String getMaxExamNum() {
		final String hql = "select substr(max(examNum),3,11) from Student";
		String result = hibernateTemplate.execute(new HibernateCallback<String>() {
			@Override
			public String doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				return (String) query.uniqueResult();
			}
		});
		return result;
	}

	@Override
	public Student getStuentByExamNumAndPwd(final String examNum, final String pwd) {
		final String hql = "from Student s where s.examNum = ? and s.pwd = ?";
		Student result = hibernateTemplate.execute(new HibernateCallback<Student>() {
			@Override
			public Student doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql).setString(0, examNum).setString(1, pwd);
				return (Student) query.uniqueResult();
			}
		});
		return result;
	}

	@Override
	public boolean updateStudent(Student stu) {
		try {
			hibernateTemplate.update(stu);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return false;	
	}

	@Override
	public Student getStuentByExamNum(final String examNum) {
		final String hql = "from Student s where s.examNum = ? ";
		Student result = hibernateTemplate.execute(new HibernateCallback<Student>() {
			@Override
			public Student doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql).setString(0, examNum);
				return (Student) query.uniqueResult();
			}
		});
		return result;
	}

	@Override
	public Student getStuentByExamNumAndQuestionAndAnswer(final String examNum,
			final String question, final String answer) {
		final String hql = "from Student s where s.examNum = ? and s.question = ? and s.answer = ?";
		Student result = hibernateTemplate.execute(new HibernateCallback<Student>() {
			@Override
			public Student doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql).setString(0, examNum).setString(1, question).setString(2, answer);
				return (Student) query.uniqueResult();
			}
		});
		return result;
	}

	@Override
	public List<Student> getAllStudent() {
		final String hql = "from Student ";
		List<Student> result = (List<Student>) hibernateTemplate.execute(new HibernateCallback<List<Student>>() {
			@Override
			public List<Student> doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				return query.list();
			}
		});
		return result;
	}

	@Override
	public boolean deleteStudentById(String id) {
		try {
			Student s = new Student();
			s.setId(id);
			hibernateTemplate.delete(s);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
}

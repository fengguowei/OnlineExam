package com.hpe.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.hpe.dao.BaseDao;
import com.hpe.dao.ManagerDao;
import com.hpe.po.Manager;

@Repository
public class ManagerDaoImpl extends BaseDao implements ManagerDao {
		
	@Override
	public Manager getManagerByNameAndPwd(String name, String pwd) {
		String hql = "from Manager m where m.name = ? and m.pwd = ?";
		return (Manager) getSession().createQuery(hql)
				.setString(0, name)
				.setString(1, pwd)
				.uniqueResult();
//		return (Manager) getSession().createCriteria(Manager.class)
//		.add(Restrictions.eq("name", name))
//		.add(Restrictions.eq("pwd", pwd))
//		.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Manager> getAllManager() {
		String hql = "from Manager";
		return getSession().createQuery(hql)
				.list();
	}

	@Override
	public boolean saveManager(Manager manager) {
		try {
			getSession().saveOrUpdate(manager);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteManager(String id) {
		try {
			Manager m = new Manager();
			m.setId(id);
			getSession().delete(m);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean updateManager(Manager manager) {
		try {
			getSession().update(manager);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

}

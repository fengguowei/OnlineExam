package com.hpe.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.hpe.dao.ShitiDao;
import com.hpe.po.Shiti;

@Repository("shitiDao")
public class ShitiDaoImpl implements ShitiDao{
	
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<Shiti> getAllShitis() {
		String hql = "from Shiti";
		@SuppressWarnings("unchecked")
		List<Shiti> Shitis = hibernateTemplate.find(hql);
		return Shitis;
	}

	@Override
	public boolean add(Shiti l) {
		try {
			hibernateTemplate.saveOrUpdate(l);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean modify(Shiti l) {
		try {
			hibernateTemplate.update(l);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteShiti(String id) {
		try {
			Shiti shiti = hibernateTemplate.get(Shiti.class, id);
			hibernateTemplate.delete(shiti);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Shiti getShitiById(String id) {
		return hibernateTemplate.get(Shiti.class, id);
	}

	@Override
	public List<Shiti> getShitiByTaotiId(String taotiId) {
		String hql = "from Shiti s where s.taoti.id = ?";
		List<Shiti> list = hibernateTemplate.find(hql, taotiId);
		return list;
	}

	
	
}

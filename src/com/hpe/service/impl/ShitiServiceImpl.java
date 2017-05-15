package com.hpe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hpe.dao.ShitiDao;
import com.hpe.po.Shiti;
import com.hpe.service.ShitiService;

@Service("shitiService")
public class ShitiServiceImpl implements ShitiService {
	
	@Autowired
	private ShitiDao shitiDao;

	@Override
	public List<Shiti> getAllShiti() {
		return shitiDao.getAllShitis();
	}

	@Override
	public boolean add(Shiti l) {
		return shitiDao.add(l);
	}

	@Override
	public boolean modify(Shiti l) {		
		return shitiDao.modify(l);
	}

	@Override
	public boolean deleteShiti(String id) {	
		return shitiDao.deleteShiti(id);
	}

	@Override
	public Shiti getShitiById(String id) {
		return shitiDao.getShitiById(id);
	}

	@Override
	public List<Shiti> getShitiByTaotiId(String taotiId) {
		return shitiDao.getShitiByTaotiId(taotiId);
	}
	
	
}

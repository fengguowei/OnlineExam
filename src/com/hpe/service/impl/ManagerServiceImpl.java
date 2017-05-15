package com.hpe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hpe.dao.ManagerDao;
import com.hpe.po.Manager;
import com.hpe.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
	private ManagerDao managerDao;
	
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}
	
	@Override
	public Manager login(String name, String pwd) {
		return managerDao.getManagerByNameAndPwd(name, pwd);
	}

	@Override
	public List<Manager> getAllManager() {
		return managerDao.getAllManager();
	}

	@Override
	public boolean addManager(Manager manager) {
		return managerDao.saveManager(manager);
	}

	@Override
	public boolean deleteManager(String id) {
		return managerDao.deleteManager(id);
	}

	@Override
	public boolean modifyManager(Manager manager) {
		return managerDao.updateManager(manager);
	}

}
